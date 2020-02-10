Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF915724E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 11:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093AC166C;
	Mon, 10 Feb 2020 11:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093AC166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581328915;
	bh=PmT123PxHbVTiRXnEiES7j9wemZKQFxGfD77P1MqWvM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZNl4HtZ+R5FWy7U+vf33/2Nj7DqK3lh1J/URFTnt5bRXD8wkknElhfzvvC5xf1pq
	 LBumd+mGwbPdxsssBoXnAusUXuTTrtFCnNcpca2N+81CyXo1MhDj06oamy9E9XxmWX
	 I0Kweo1TvWWqxHtuWHGIX/HA95hUxwrlnbGf0zEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7C0F8027D;
	Mon, 10 Feb 2020 10:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8E4BF80234; Mon, 10 Feb 2020 10:58:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00083.outbound.protection.outlook.com [40.107.0.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B703F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 10:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B703F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="I49wEzPX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bmwu32VoCxpw/Czss3TBdrZ+W4ElOS/D16O0cKQYRqTqVkWZnvEHTaqwSwTI7QQ+uBaSLFxQggCnjT8ApKrS43NTo+IPK+8YOv14DrGNjI96drK92Z7cVo+vgn1tTIfKuF5eY8i9cH3BsrphGBPn5VIgKl3TUetHI+5IhHoe6D5eG0RG5B8uVGJLyeDGknNdraRirtiKzyyyvZDteXvKENe+bK8IQaaq8XWvzXiS8i4WVUP5aOhE/zKyEV8pUnSq3EcuECBBpwZHWQJIkaqmpAMi5xeHaT4dmFcrRpgiaYwOcTd5qK3gR1DwMkD025LLu01e/nKhDYIV80kDAvgM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk5aSXldoBA6Dmbqi+P3GJLYDMEhaKWnKDqTtsKsr14=;
 b=GSI5kjYR3jWjrCipQwY33Uyw2DgsSM5TJXFQnHChcce0hmwZpKYY0XwzRmUL8xS5A+qmyOYn6PTRyVKHtgJxEM35XMCocnD2nNdHuzAigHRgkSQq0sp3j8aEROjRxdg6Pe6QDEChNSlP0pWnS3zBGsaGt/NkpRd6V6eFGEsMS7LOb2tgPF5pG1seH69TsxRc+VXq+l0utvgWAguZVxl6VKAMeDQedt539wpwv6iv9GtKgU+gz+22SS5xnqdQ+u2hLQBV2l6sR8Qb2As0mo/f7P7YDEMABMIibQY0yY9MN/BDKqkboiswrjJdxkvgkhyuk4/j4G4ZF1WI6xQgpP68kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk5aSXldoBA6Dmbqi+P3GJLYDMEhaKWnKDqTtsKsr14=;
 b=I49wEzPX9X5icoum+susrdL7uxf4XiprUcYa9w5YX0CF/VLxyugqe2X2wz58PsFKkpoB6tFa/r8MU3INYapz+gV2sJDmIfPo6QAb6sAo3P9uRmz/HQbZSVLy7u3GtlfrQ/qWAS8cRssKcLeLU/dGfwAz0NOi7evwRZ/htfHOxuI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3599.eurprd04.prod.outlook.com (52.134.1.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Mon, 10 Feb 2020 09:58:35 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 09:58:35 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	robh+dt@kernel.org
Date: Mon, 10 Feb 2020 11:58:15 +0200
Message-Id: <20200210095817.13226-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
References: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0076.eurprd07.prod.outlook.com
 (2603:10a6:207:4::34) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM3PR07CA0076.eurprd07.prod.outlook.com (2603:10a6:207:4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.9 via Frontend Transport; Mon, 10 Feb 2020 09:58:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 615838ba-005c-4a10-ae04-08d7ae0fcb3b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3599:|VI1PR0402MB3599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3599D8646437E2A565126BEFB8190@VI1PR0402MB3599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(199004)(189003)(956004)(2616005)(54906003)(16526019)(44832011)(6506007)(186003)(26005)(6486002)(66556008)(66946007)(66476007)(86362001)(4326008)(2906002)(478600001)(6512007)(81156014)(81166006)(8676002)(8936002)(316002)(1076003)(5660300002)(6666004)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3599;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kvql0d+ExIOOU94mJSoG+ePGZUob3ZXPDAUJWApCeSW/LvFVB/alEJHwUYSC9BmC5uhvd8Mk3MuDm9v+z+SqbKhuPKkkyryI1xwFB1yws3jkLMEjJX3CP/i5n0QG8Yp1WEW+plrQKohiUEm/bXhs/5D1Pv/i9afO3UCW+4EaWmPs6iDml5zRNsOs5qTly9bWM5yXSn46LAulkrTUiaNWpwatTdi/5UukdCaW0q6AcCivkiqFVHNUVrnlK4/5JtoIQCG+z3a2NSZwTZ5eIDq7p3Xm6I/j9XettNN2fEuHDKYCQ5mCg3RJfft12Nq56p0jUvva0ukBz5ZRXbsNCmhMCBvXiBXTJb57AObWdf2+QrRTVDMPIycq6SG3US3t6zt5ltdkaaRwOCtO+H0S7GdPJY/gUdN7KFs7jBcCOYzFO/R4IpR7EFz/TUNmO4vfveXj
X-MS-Exchange-AntiSpam-MessageData: iNNsffAAITf2kN4NXbYMW9uXzdkOypNmsnA6e8Zj+P6NhUInwErP1M9xMgYEUDngRqZSoVBoiVfcivrAClI0e8yJeW9UPg9g0PAGfigETfOORO0VocHSpC10Kzk4O9mE8gZoTHomj6pn60gssaAWfw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615838ba-005c-4a10-ae04-08d7ae0fcb3b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 09:58:35.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uCV5XKGmhY1HLdmEtPhttTTVo7sPuzDG36VtnaPasLf3cSJEwFgysSFiyHAsthztD3dVMXhZEKz/NPQpHP5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3599
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 Paul Olaru <paul.olaru@nxp.com>, linux-imx@nxp.com, festevam@gmail.com
Subject: [alsa-devel] [RESEND 2/4] ASoC: SOF: imx8: Add ops for i.MX8QM
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Paul Olaru <paul.olaru@nxp.com>

i.MX8QM and i.MX8QXP are mostly identical platforms with minor hardware
differences. One of these differences affects the firmware boot process,
requiring the run operation to differ. All other ops are reused.

Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 9ffc2a955e4f..b692752b2178 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -178,6 +178,24 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int imx8_run(struct snd_sof_dev *sdev)
+{
+	struct imx8_priv *dsp_priv = (struct imx8_priv *)sdev->private;
+	int ret;
+
+	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+				      IMX_SC_C_OFS_SEL, 0);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error system address offset source select\n");
+		return ret;
+	}
+
+	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
+			    RESET_VECTOR_VADDR);
+
+	return 0;
+}
+
 static int imx8_probe(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev =
@@ -360,6 +378,39 @@ static struct snd_soc_dai_driver imx8_dai[] = {
 },
 };
 
+/* i.MX8 ops */
+struct snd_sof_dsp_ops sof_imx8_ops = {
+	/* probe and remove */
+	.probe		= imx8_probe,
+	.remove		= imx8_remove,
+	/* DSP core boot */
+	.run		= imx8_run,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* ipc */
+	.send_msg	= imx8_send_msg,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset	= imx8_get_mailbox_offset,
+	.get_window_offset	= imx8_get_window_offset,
+
+	.ipc_msg_data	= imx8_ipc_msg_data,
+	.ipc_pcm_params	= imx8_ipc_pcm_params,
+
+	/* module loading */
+	.load_module	= snd_sof_parse_module_memcpy,
+	.get_bar_index	= imx8_get_bar_index,
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
+	/* DAI drivers */
+	.drv = imx8_dai,
+	.num_drv = 1, /* we have only 1 ESAI interface on i.MX8 */
+};
+EXPORT_SYMBOL(sof_imx8_ops);
+
 /* i.MX8X ops */
 struct snd_sof_dsp_ops sof_imx8x_ops = {
 	/* probe and remove */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
