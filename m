Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6518C0D8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFF217A7;
	Thu, 19 Mar 2020 20:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFF217A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584647626;
	bh=iz8YN3ZOs6Rak0UPDVgUraXT91WNI2Q0Xvliv4/VlGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtylQQLYLOLsEQcfS2u31gysWeIG5h4wfeWwGP4L4g2r16WixfTekOHwdQx3A1z/u
	 TY6fSEKqLgIRRAWCDpn2enJC2auwYkCxDdlYdazr3FDHqnQw1OycC7o6l+fQ+74yXT
	 nEa1HvvffEndNUZeqi28ZH4HOZLPrsgxGf0Zlx+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 835A4F800DD;
	Thu, 19 Mar 2020 20:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91451F80217; Thu, 19 Mar 2020 20:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B619F80217;
 Thu, 19 Mar 2020 20:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B619F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="e49anRXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni5ktaZi01JxaQqHnu9Thd2Sd4Ln880Q2v5JnByqyso4VirLQPeSzaSch5z0pseeKqACNwc1qOWCXJFfowsANNY6O8bIK+xB6TDK9LhoDqBccMeDVBHQbRGQAaa7Jbgqjfae4geiK+X6HV81SWLd8duhWfTf0ysrthZ83Cj5khQUh6bER1XCNnOr1xCM5fGCmCBlMTHBZic7UwJGcRtiaC87mWMKPWXvzNlts5aT4oBIQeCdcosjvP8IZXp6tSpQMyZKfgxkzwPKskYHbxsIYfIOdf0kse02pWc+7Cgiz7ORhJA7mTkqc5cwm3AukLBrMtPxtjUMVyI7xaRcqr6rZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n50d34UAFoD31TdOb/UenHzu6OWlJmOwhnhtBlo5j5c=;
 b=aQ7wOpMAKSppJMfD4Sw76UPSN8utueUb73sg7oqI+Xyi866fSvs8lj9LPDJI900e9YXyzi1GT9tI2ja3PikzmgF1lb5GO4v5T0+W5Hjh0dPnLPhreRQIAoThrt6epksLgY13RtO+TMSh0QN4gCIxMB8TDXUlaO1rEXdMzbPwnacGnaAqeqcd1qx16sR2n8Tcu469f1INb5cMsENQ1rCUsvneppsF26h8XS1rfk7dc2ZM/80v1CVmR4BJaCacw3/tLZINwgobCycJED4O44fDhA68cZJgYjHSNCQVwwBMlISZ1W2svYo0jPQOCHwIi/PaKG3f+ke9dfTwvj1OS3TSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n50d34UAFoD31TdOb/UenHzu6OWlJmOwhnhtBlo5j5c=;
 b=e49anRXzTBKqN6ztwelhcYsRyMjA9sEaZS4EA3dW7Fr0No0TUBE5LEoQ/4Se/QfK0igQhItTI7uMk0RPstqZWLur+SrJHAjJQD/P7D8yJxdURdP3ZHQUMsYKahraGZyPbdN8fMlrg8IjT5TaWxI4JsshvTiBh81WBGVZCH71a58=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3486.eurprd04.prod.outlook.com (52.134.4.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Thu, 19 Mar 2020 19:51:44 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 19:51:44 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: SOF: imx8: Fix randbuild error
Date: Thu, 19 Mar 2020 21:49:53 +0200
Message-Id: <20200319194957.9569-2-daniel.baluta@oss.nxp.com>
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
 15.20.2835.12 via Frontend Transport; Thu, 19 Mar 2020 19:51:42 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f957147d-3441-440c-a2ba-08d7cc3ef384
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3486:|VI1PR0402MB3486:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34868FAD67FD17A51BBA8B10B8F40@VI1PR0402MB3486.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
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
X-Microsoft-Antispam-Message-Info: UFyBHcu9dd4CiE72t3GNwG7fJ/6VFokN6nqxMxwEneEXZTvQt1gmGyz46/FD9FSg9fYTOy0T7nPYCYAisgSHF/wC2cbaGnKA2jMeKcxCXC3+K+5BGQmLwRPyuY1O8pbjFV/+yzDunU0yaVr0t2ObYAAzLqsBAbvxubAh94slTNztjQJB5mzwYrhM4GbMeosubNKsaUrIplxb9OOFnktgw+KXnzYCRWgbj84/hbUsDRWdDJD3/3Jo3i+bifNTD66thlzgwW9SBLJsptPdUVi4UcfS/8x02iJQMMtPDxjsw+p+md0Ck4G3zkfGu++mx6dHrzzyQgJKrwXbONSYH9oRT5XCZzd1YftXrXAKfqKIykzfoKniDEl347L7pumxv+rGC4P61R/gdO7YnD4r8qQHymSKCfut7o5OaW1FDynqFfRYXE1E3XVa9fvCuRS1cfaT
X-MS-Exchange-AntiSpam-MessageData: vi7EBYL36xqYDDDACuuTJlu+6OsSXOuZS22cgQmxRtgA68QAcFhdCGApyKzQpxaa1FA6FGqpLYRhMRK/rJMmwET38Abda7OxPNfS08+VRxwHKEglxIGAnEhbhExoPJ63vFN8y994309ptQigcZ6Xfg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f957147d-3441-440c-a2ba-08d7cc3ef384
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 19:51:44.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kK4AyjF2d1B91MX/pRAfUA4zh65uiCBg5vX12VWfUbo4re8CH3+0OcAtMJV/sN+xfEm8azOC/cQf+AD4fM36XQ==
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

From: YueHaibing <yuehaibing@huawei.com>

when do randconfig like this:
CONFIG_SND_SOC_SOF_IMX8_SUPPORT=y
CONFIG_SND_SOC_SOF_IMX8=y
CONFIG_SND_SOC_SOF_OF=y
CONFIG_IMX_DSP=m
CONFIG_IMX_SCU=y

there is a link error:

sound/soc/sof/imx/imx8.o: In function 'imx8_send_msg':
imx8.c:(.text+0x380): undefined reference to 'imx_dsp_ring_doorbell'

Select IMX_DSP in SND_SOC_SOF_IMX8_SUPPORT to fix this

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF dependency")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index bae4f7bf5f75..812749064ca8 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -14,7 +14,7 @@ if SND_SOC_SOF_IMX_TOPLEVEL
 config SND_SOC_SOF_IMX8_SUPPORT
 	bool "SOF support for i.MX8"
 	depends on IMX_SCU
-	depends on IMX_DSP
+	select IMX_DSP
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8 platforms
 	  Say Y if you have such a device.
-- 
2.17.1

