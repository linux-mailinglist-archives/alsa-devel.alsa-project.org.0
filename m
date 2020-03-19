Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EF118C0DB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:55:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7F117A3;
	Thu, 19 Mar 2020 20:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7F117A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584647709;
	bh=Hx2TMLMjbNc/5FTY2zJ3uakTijXkBLXcSNJgNU7vZQI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYBpgma1ZKmyCUToa03WDg18zdnSIbILI88qUdMx4l4ElnPh/bOc8tB2iuv6N73q+
	 ahB7JCMfxFiX1kS1vs5Wn9uZQTIWGGZ4uK2Kkr4cA/j8Pu0RvoVFPAbc8srGW+1CeY
	 n/Tpvu0RXXeU8Ve0jyw/tkt/0OwVQBuLfUzafw6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF84F8028F;
	Thu, 19 Mar 2020 20:52:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE905F8024A; Thu, 19 Mar 2020 20:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F04FBF800C0;
 Thu, 19 Mar 2020 20:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04FBF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="mckwreSi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9D9wYq9Eub2KplHkUla7283hJLpW6bijlrX6hL5doTVQc45KAMLIg15bkOE+1JMeywnr2UpRN7XW+9XeTViCqLNXUpHj+oyCtK1M+z/MLi/IGmaPzBWMT4ew1yTb1yEsd85zTf3bosIwSGRJ2u2Z40YwidM85rx0oJg5zm697kAZ/t43xlRKWQgbzF8BS0ch4rnUz9VnlOYK2ZR/NXrb3BPucAQxIRlEyPawvMyUjXkyNHXuZD6sELHFx7NBlnec/yql1kmovvwZJlv+g/M/fBXlnu8lvxn5u0Ltpq/ioTA4HYMSEWJQCOsDMM7n1AuU7gyj58ekRfKH6MBEVfImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0QTYR+zBU/gPa+yJ0Tvr7AOSy44w97Zi5bWKxRvmcM=;
 b=nMAOdU+obZMnRpTEhVzUWND78XuSO92T4uVdgnNI3r5UsQM8df7S6NrFyptqgKmoNPBs0Lj7/wgmOClDyeJvXR1TJ3tl+bMZgnyxJ/ZcJ0FxiR3JqE4cZWG5tfFdJDQp3EM6FYIIThBL5pGR2Mb6BhGZm+YqHgpE23qnHo7L0AtxA+reX4GLnhcXJU3/iStkrUtccWzPQlzDwj0R6aGGTI56Fw1xPhCIPiHpdg8nCAHQrjezoyGMHWgQhY5ba3yGu4IRu+st322+OuFjUexDIhtv7oZN1og1tA4/rL4CTjhprpWivEkPKcqNVjVzjdQh6avZi5nwtTIjX8ImjaazLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0QTYR+zBU/gPa+yJ0Tvr7AOSy44w97Zi5bWKxRvmcM=;
 b=mckwreSivnBDYNQztOZJKanuSCLzdbbv1J6pcLaSpSTrNd2WE01AIoWG3CybpLnPsi+aLA6513w949ASv1Zqodbc5VQ2wFjCIfrGEXhsOW6Udeg5cqy4GmKRhnsk+3rwzf7PNUMCXCur80T1QevnAhtLBhKCc6UQgUJhNKL8VCA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3486.eurprd04.prod.outlook.com (52.134.4.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Thu, 19 Mar 2020 19:51:46 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 19:51:46 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/5] ASoC: SOF: imx: fix undefined reference issue
Date: Thu, 19 Mar 2020 21:49:54 +0200
Message-Id: <20200319194957.9569-3-daniel.baluta@oss.nxp.com>
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
 15.20.2835.12 via Frontend Transport; Thu, 19 Mar 2020 19:51:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 229774bf-87d2-417a-5de8-08d7cc3ef4b1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3486:|VI1PR0402MB3486:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3486EC278CF9DE7DEC95A62DB8F40@VI1PR0402MB3486.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
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
X-Microsoft-Antispam-Message-Info: 0x3/0y1zVptZ5VA9qcroBbaXRyP/N+MR8+m6i6ByKNImlKPgcYXLSDF472WnW5+4OVM5iafvlHpUF0YIIGI39nPi+coh8cVBQqK0vse5iGKOppUMLsSg5TO+ZZi6k9XbwEcnjf95v2X7eQzUXyaQWjK5S73KgdrB9PQvPmPn0yCea7jVIGRsh96xMflOXPtd3DtSqK80yBHWiEfWlUNBsvhIUrQRv/qB81n/nE29pgFJItUeJPUsMGSuOrZGbopBXJGeN4T+bw/+7K9rjPbAz3fUbjQDTsXoGD6ryXhiDaZ3VARr9rjOSzlVClum00nmy0iyxFq6TGvl+CWMtyqlJyHwxN/t19wBFwxfCBnBVboAQORId3UM74+vNvdOpzPBOgO6r0TIP2ZMoCEWDd8r8zhmiWjDHguCMRR+cV+i/V7SOjN1QdRXNqlZJlGsPngy
X-MS-Exchange-AntiSpam-MessageData: Aui9wGuY8UX14msPUG1ryqGFXXv6DtS5q6rZz/3SZifeGc2OZqwDR6U32XtQScuEYCaUc12a3CCgoZlS+zAWrPWH8sB1yM8ixZQEQcP1k0BadrmsuTcBRce3g52lUHpQg+XyJlPjcJyJmV0Y1v+uqw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229774bf-87d2-417a-5de8-08d7cc3ef4b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 19:51:46.3326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2APgmY5nfmseak7H65WNXth67KgSbWLI5AIWJoT5QJZnVwT/YHjiFRxepYdKtlccDiCqsT3D9UthU7IQlV+WDg==
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

make.cross ARCH=mips allyesconfig fails with the following error:

sound/soc/sof/sof-of-dev.o:(.data.sof_of_imx8qxp_desc+0x40): undefined
reference to `sof_imx8x_ops'.

This seems to be a Makefile order issue, solve by using the same
structure as for Intel platforms.

Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF
dependency")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/Kconfig | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 812749064ca8..9586635cf8ab 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -11,17 +11,26 @@ config SND_SOC_SOF_IMX_TOPLEVEL
 
 if SND_SOC_SOF_IMX_TOPLEVEL
 
+config SND_SOC_SOF_IMX_OF
+	def_tristate SND_SOC_SOF_OF
+	select SND_SOC_SOF_IMX8 if SND_SOC_SOF_IMX8_SUPPORT
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 config SND_SOC_SOF_IMX8_SUPPORT
 	bool "SOF support for i.MX8"
-	depends on IMX_SCU
-	select IMX_DSP
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8 platforms
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
 config SND_SOC_SOF_IMX8
-	def_tristate SND_SOC_SOF_OF
-	depends on SND_SOC_SOF_IMX8_SUPPORT
+	tristate
+	depends on IMX_SCU
+	select IMX_DSP
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
 
 endif ## SND_SOC_SOF_IMX_IMX_TOPLEVEL
-- 
2.17.1

