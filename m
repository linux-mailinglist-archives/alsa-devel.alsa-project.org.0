Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34A18C0E3
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:56:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A9317AB;
	Thu, 19 Mar 2020 20:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A9317AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584647786;
	bh=230QbDVBIRP7Fb5pPHb2FcdX7LzQnZIczaEJuEAkxMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N82dlBB86aJXAtjQRNHu1M8qpBgHFqYHIlDc4eI446aGO8f0kSTkFdfc31ZDWbqJn
	 R1Ch0AcCaR8iQR1ith83RreuNTFGIZcIY1O2lxyJuVLhr3ByztGD/4VHp2Crbe0CYH
	 OgRqcVKrbmmbiuH0+NwfajDtNV8lCSxoflclFyf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF2F7F802E3;
	Thu, 19 Mar 2020 20:52:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B5F2F800DD; Thu, 19 Mar 2020 20:52:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC2CF800C0;
 Thu, 19 Mar 2020 20:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC2CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="J66WMwut"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdq4KvwqiTTXBKwC9WxWS8Rou5mj6CrLQLp0JAkey0oWhzyV3dYU4WLLj5YSCiNA4qfvMu2z7qCsDwCk7WPJnvN0y0su1QFLkpjC9b+XuPl2qk7lQzKIhfUXE/yLP2ewUmnHXijuE1+OguwOrDvdWDwSmT0Q+eZ/pZfPxjCUPHdKx/JkKh53UXwjyRZyBZotQP2vcFKmi/4rkAQnR0mPeqhmWt0C2PiW0kWezjUFTwUur4iUGHD0kFEpPsWCILwEt+dCabKXLVgDgPiOktRTydOowMc6sjXaxSMzogyDsMv0XBXqq1DAuJ7+OLRTnl2YLq2rP64FdYZ0oQv4fyL4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/75uZVJuRyvM42nUIlOOHDEUg2Md3mX+iZHM+ujtfQ=;
 b=JhKKVUUqh2/sIQYpITtC63poOqMwv8efiF6BhbmboVzF4n9vZXxSQKg0t0wqgoRvRj56dRQqDjQRtEOHyvm+/uWPkpMVOmdzKRh+cQlX6vIutRBJMuRhFOihakxjFcQDchzK2oK4Yt3WYeJunIVBgUBc8vCZBN+s1FPXXCn6I3mAaLeHF/cuzsTn6TcfONz1AV0VUvBnHipitduUVlwhkfqh2Ff9yYIsTOmrM5LD+M8MquF/JSKSIZGm9my+NO7GjiRFwwpFewwUaqOU3ehlUhC7meiaxD7sq/Dm4frj5tSzvfcX6ffvFgMVT8Tc31viWgnepGepIDocCK5qEcWLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/75uZVJuRyvM42nUIlOOHDEUg2Md3mX+iZHM+ujtfQ=;
 b=J66WMwut34NMTsIwkteEEUFXidhWRuScTJOy7fcnlHMd5VuJedrRwlr65D3DOVkck/ADo2Y4Zvnh0YW0/lFHON4mjvaamhi7U+5PYzKNxWMTcbU6u2Ct43e6bbb9YhF8nW0sjrIGds4qZN6v4SQETs7hKF3O/EqUtzi9RNpWk7o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3486.eurprd04.prod.outlook.com (52.134.4.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Thu, 19 Mar 2020 19:51:50 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 19:51:50 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/5] ASoC: SOF: Add i.MX8MP device descriptor
Date: Thu, 19 Mar 2020 21:49:56 +0200
Message-Id: <20200319194957.9569-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
References: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.12 via Frontend Transport; Thu, 19 Mar 2020 19:51:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f374b3b5-be6c-4323-3c06-08d7cc3ef74e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3486:|VI1PR0402MB3486:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3486A83A7564C2ECA39E0A88B8F40@VI1PR0402MB3486.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(199004)(81156014)(8676002)(8936002)(1076003)(81166006)(186003)(26005)(956004)(4326008)(16526019)(2616005)(478600001)(6506007)(316002)(6666004)(2906002)(44832011)(86362001)(66946007)(7416002)(66476007)(6486002)(52116002)(66556008)(6512007)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3486;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydbNr1GqnNyw/mzjEcO7ESQUrNQOqMA/34cccjmzwNVqX3ZPfK/Uc6LryEPcfUVjcXXJz6uq6ugorBYbxXM7JyHNuINNaZ6IJh10M5lOKUbeRwem2odtNMHBf1+O1E4NiCuApp+qKZO3so3dOnNuHRVTXJwWSM4vFTaIIJd9IqtFRl/nYMUe6MsEXnLeJyrHyWtLRp6WZApSKlfu1FvcXZ1Q6wGGowhM8djDhTNrm2GBFvXDGoR/Pwbe+vAUD/T1orLohd6pslbNJ8I/mv0L8qQehKJxb7Zzh4mma2tghm0XM6+4lsV3peoXjFotbl/ilvjevmspEGPQEPkVwDG3LhfA1i2HBX01gepCOl/ewlXSI2wLZo8/VhCBRwerYrAPUcpW4h3qjuQcMoo3LjidIQlW34WBQz+LpWjdpZH9T0a2rbPkAG8wmCYjNd4VZmI3
X-MS-Exchange-AntiSpam-MessageData: VPX9toB1uHA9bX12D/Ga145LNDAls+O5sCMWdoojTNDMq2ni7qaAQNoRA0EktVsYK4mxIlUVyu38ftr8EyMIgetHZpBmL7pYuGWBgQyLZrr30MApJylImN0ys+rJubH7prn6x5DKP7U/xjwNX7s/jg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f374b3b5-be6c-4323-3c06-08d7cc3ef74e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 19:51:50.7541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6vgqcO/TYQwqfOZJYZpye4Y4htln9KfsPQGp8HUz01/on0og1PW/L0H+XNR8s8gpHrc6qjqFho7Y4ku7YGVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3486
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 daniel.baluta@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>,
 kai.vehmanen@linux.intel.com, festevam@gmail.com, s.hauer@pengutronix.de,
 yuehaibing@huawei.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 ranjani.sridharan@linux.intel.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, alsa-devel@alsa-project.org, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Add SOF device and DT descriptor for i.MX8MP platform.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-of-dev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 16e49f2ee629..c6167597d6fe 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -14,6 +14,7 @@
 
 extern struct snd_sof_dsp_ops sof_imx8_ops;
 extern struct snd_sof_dsp_ops sof_imx8x_ops;
+extern struct snd_sof_dsp_ops sof_imx8m_ops;
 
 /* platform specific devices */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
@@ -34,6 +35,16 @@ static struct sof_dev_desc sof_of_imx8qm_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
+static struct sof_dev_desc sof_of_imx8mp_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8m.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8m_ops,
+};
+#endif
+
 static const struct dev_pm_ops sof_of_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
@@ -113,6 +124,9 @@ static const struct of_device_id sof_of_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
 	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
 	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
+	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
 #endif
 	{ }
 };
-- 
2.17.1

