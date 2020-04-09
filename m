Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D41A2FED
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 09:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D831607;
	Thu,  9 Apr 2020 09:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D831607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586416906;
	bh=1SqvJsHkj2J39rZI7JHaA6eWLobvpgewP8z7DTmnuJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYTXDmKYw7qXZWD0yTj2JtHtSERvXwzq/aM77JTnmFQECGz/6G0UZ3X51U04a7Tn9
	 Vl92WXPhz4vhyVuiSLVhNabWK7M9puKdXWDCex/3hUXhEEqyYRNZ89lvJfwHIPWPBX
	 r2knCg6gPhYL9Dw0PpplYeqaTjd7inbtcjFPY1JQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 198E0F80107;
	Thu,  9 Apr 2020 09:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 483F8F801F9; Thu,  9 Apr 2020 09:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 604D4F801DA
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 09:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 604D4F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Sb5wfT5U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lduLM4wxc4oO+9qk0k45V8bfBwibPcYIXValTvefU2hDaDpOxTkMrWeFJyZhZVF1emgwczowQohi2SImaFFb4nvsZg7TD/uRbgZcJ5qv2wn0yPtTpClhahiucPgbtmpF3eoNFAoftYo9P9p475t0HjLEe/i3aV7I40lVyd01YlWUHEDbNxFSw1BXkko7rr+Ups/8yFVCCImNKPmFlmgg4ClFhuFPG0A1acvbB7Q24PiS8K324fWGfm5mb00eqt/+vcaRDLRaoUWGU4Cmg5wPUBcrO/qCFpQJYEqiKAALZWmZWItc8mDqSvnHKYtwiPSUa29S292x3HenTncRKKXmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++OtcWilPPsm11NwVtWS0svHT/RCstzQWDVHKBKadxY=;
 b=DblJX6dDnokAX5bvATqL52gpgYwChq6TvrYkjOKzWbA5fAXM2QdaPx80X1oY/jC/VzJrKO0fOesmJmr2u4ewehzNJqe696b15LaZoYvFG8AeK4EbeXVn5egJw7YMIySeo6PLfcJRN/4Vwsz07w4RzryWCi6OGUmo0x8JtB/mzJ9wrr1bCsLi2mCcBid264eruLZaFgO4Yjf2anvF48iqbLuElHdd6sOYAk2vRdDW7MZULvurIv4NAqs9gmUa+i7d+Sd/c22pk+oAwafo03TNSB1SnIeErlLa4axLWVNFGp6PNFRGx4EzPYW+M01OnMZC3gi12GjC1aqKVuqFMwggQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++OtcWilPPsm11NwVtWS0svHT/RCstzQWDVHKBKadxY=;
 b=Sb5wfT5Uz1+AVilSrELbGEvjZrrpD/Bbdw2EkCDRzNwxsdDxlO0eNsRBpUAguJwooIkfU5T0sulVnpxPzuCDqxnM8w7pPjiNCzsgZsat9XrPBcXMr0AI0drkNN17ycCVIgbcnny80oJVfqpKd/i8PwcjcLnKsKf62vovKzWKNYg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com (2603:10a6:8:3::30)
 by DB3PR0402MB3756.eurprd04.prod.outlook.com (2603:10a6:8:12::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 9 Apr
 2020 07:18:51 +0000
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c]) by DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c%7]) with mapi id 15.20.2878.023; Thu, 9 Apr 2020
 07:18:51 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 2/5] ASoC: SOF: imx: fix undefined reference issue
Date: Thu,  9 Apr 2020 10:18:29 +0300
Message-Id: <20200409071832.2039-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
References: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::12) To DB3PR0402MB3835.eurprd04.prod.outlook.com
 (2603:10a6:8:3::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 07:18:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b54a01e6-667b-4ffc-3923-08d7dc5640cd
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3756:|DB3PR0402MB3756:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB375686852B05DA9066E20CD9B8C10@DB3PR0402MB3756.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0402MB3835.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(4326008)(5660300002)(478600001)(316002)(26005)(1076003)(66476007)(6512007)(81156014)(81166007)(66556008)(6506007)(2906002)(66946007)(52116002)(956004)(2616005)(8936002)(6916009)(6486002)(8676002)(86362001)(6666004)(186003)(16526019)(44832011);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoibPeBKYQXBe0JRUgiedhrABlARbDeVFOLVlBhpE0JDt8QnKR7MLMFvGBeJLNDjHN/YmL+uirjOvTqCqpEwAHRiqlAN+xjVh9YMTjqUggPszBeWiEf/AKeW9QUY+GEHd8bFmL48MHbOCCmO9FwWA0V7+q3ghCz7MKxyH2JothMNTXhPR1hUc92lZMKMsOlSvGUoMTv0m6WR2zkqcscKFWseN9XP+c6cjdSVmv8F3/hPa4YmxasPCQeSTvKDdzfKd2esYeE+VLSgFwjcnNhQZAj4dJaS9em0Jdi1JpOIyPzt19krlgiqh7R2ZDDz1kwaqBI6T0m7Mqb2BfFGXlXvXSuxr9h2424pN3OkUBOSq2GcEN42rxmNs5PfvBpJj+WMzqgnUzaUsMicgzq4sT4QKtdpHRJcLYT2YFb8ncGDGsCQI8cLn3tkACmhIOsIOQ9I
X-MS-Exchange-AntiSpam-MessageData: m7xFsl7EFQvA5ANlag2u+MyO8BygMybNnWIeMsbrviAM07KZwzZJBftdt9AO2mBEI3ewwd/DxCKD5rXTfpKaaAfd1gti2CnKGAc/Mdifsx+a5rAoyIOCY2u6+FBfvvGPTXJPzNdG16+Tj/TYc7uNhA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54a01e6-667b-4ffc-3923-08d7dc5640cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:18:51.0772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIv/cdTRy+GLozPt8lD2kH8WAHLt4THHGRQbo2m5Kn7ZZFRpoAHxKuWnjhUazWlgdbs0YThm6OoyyEz/Jp6RQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3756
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 shengjiu.wang@nxp.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-imx@nxp.com, festevam@gmail.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

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

