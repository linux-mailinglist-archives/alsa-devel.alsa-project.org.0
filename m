Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5AE4D7B54
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:10:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0ACC189E;
	Mon, 14 Mar 2022 08:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0ACC189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241852;
	bh=GZUkdZjfoZSejsV1Aw7icFVVTcCndZEiyHTPTkF0Yt4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LHavmA3uWit5DjalDi0FXL/kg8GZtrZ8PtCcuPbfnHeEydFLYKc/Bd5SUqNDB4z8v
	 t6BprYDTRgVxX1Wtm7l2Jr6UL/RHF94/vQxY7t0NwmcAOsvh6dMo+z4xt7He9REjAr
	 7k78NZvfLs6Y4sbRKNm0lQIuHt1kccJ2dalVSshE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D860F8060C;
	Mon, 14 Mar 2022 07:59:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A99C4F80310; Sun, 13 Mar 2022 20:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02olkn0814.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::814])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E8AFF80154
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 20:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E8AFF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="ijsWZ0vO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbNL3yQcR8HMD1uv4PiUCMG7UkoH72lSFd2miqvIguxXdFbdFJXylI9HM4iwCpEjikybMRz5Du5cJJdJLE6ezCvnEwrjORqBN3KvbdFwXq2EUjxOo5iSSmWoadJHlh0HwtUUjNoKPHYDoRfUtCfg0w9AOBdwbNmEuH42iwhq8PGXrywp2cfO0XncwUXcDaXqAk4p0kNZZNsZxIO1aOo4hHsoBHmZYw9c5Hxhpg/MdFz5BcPvOxsxxBYfy7OkRCmZIzR6UXX8xcnU0hRqBQ0+XiY2tVdePjHk6YAxjSoMU2gRKzDQoLfy4XhRD1Klx41PJySkxqUNMiNoa8ssnAkCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+iZWDBIEmbGzsvMU5cvvrQJ+1ANnA1YB96HzM4khDY=;
 b=nSjEYyhgJ6d09aOk6osr8N22IuH1dwEISoqzadiW1oDAqhnEe5GpF10ytk2NSeVvo59X9E7JjP+S4A9Y6Lx+nE7krbpWxCauqZnSae0aswoZyu6hg1x71zOXlueTmlynCk3tGKzE2qyntnvheJCgvhwWsAgHHrZyMuvmGFVay0KZRzjmuSlnmrN8HIaqjlZEuEmXAEjrgTb4h7P0v9zD1zf3pL9hHzhUadAIlmy+/9WkL05bIOw8mIa7ttNwfjpbNG4LA3tMapEyi5I8ueRplunqSJXuld6NOXSFxrmBnMvC4vLBd85AUV9CaOCMKITi6kZvmlTywT4dWHImF6ycvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+iZWDBIEmbGzsvMU5cvvrQJ+1ANnA1YB96HzM4khDY=;
 b=ijsWZ0vOFL21SrVVREvXTI1dQzOogSzFRUQSNJIX0A37uj0joRl6i69hqgglk/q/MmGgD1Fz8tpkD0rLs8wgOHtCVeElyU2HXP1iwvfxwrT1mhX1N1NuF0/f7SUSvTyw6TH+MjRjbI28kPBTDO9xv5SErCVX4wU23w1Ou5JloqDGnwNJIQ5K5TW55s5f7KDMjkeH+4nmCKjlllOiS1iRnCvoM/+X+iPVKC27/b8tSyeQGIqlBD0IRG9xtOX7NVwuyQwOo7m1VClIxK1PLalXTbj1KqSiG2CWwG4slcW70vvpcDsP86JjWDlP6WlS6HSSbwvxTOG03p5BlFy67aEmvQ==
Received: from DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Sun, 13 Mar
 2022 19:56:35 +0000
Received: from DBAPR04MB7366.eurprd04.prod.outlook.com
 ([fe80::cde2:76e6:f208:6d18]) by DBAPR04MB7366.eurprd04.prod.outlook.com
 ([fe80::cde2:76e6:f208:6d18%6]) with mapi id 15.20.5061.026; Sun, 13 Mar 2022
 19:56:35 +0000
From: Jonathan Teh <jonathan.teh@outlook.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: cmipci: Restore aux vol on suspend/resume
Date: Sun, 13 Mar 2022 19:56:17 +0000
Message-ID: <DBAPR04MB7366CB3EA9C8521C35C56E8B920E9@DBAPR04MB7366.eurprd04.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [7MGQUP/ZZEljUcSlNIyPjjki36eaqBG6]
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To DBAPR04MB7366.eurprd04.prod.outlook.com
 (2603:10a6:10:1a0::23)
X-Microsoft-Original-Message-ID: <20220313195617.14219-1-jonathan.teh@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 461c1772-b7af-4859-7b3a-08da052b941a
X-MS-Exchange-SLBlob-MailProps: tBYDyRQCPclfnH/0UAfOFg3VcfzM92AUHbdadi4OlnR1YU2OD2Ye6F1VBrSx5jmPXiXTo6EzZzvDHEDwNpyVMe3HawtHwyUOUhoUK4TEQp8gGThJyJtuZXfQ/4dGEa4eHrk1duqBCe4GUufvBE3FUNpwG7keAiFPWL9Wmqsm4A76pSjY6aN17WtdNQWBu7ztTfYaHoomYneoIOYQNvsVOMKOivO0KfoAYY9PJj7gMj+dz6mcd1v8tK+v5Nh+fUpFbG4zn+ab2bH0dQ5lYTI5h5qwNLh1fxyausS2QSZ0yuQeGh9zRsnnr1brKMsYnZrGpyGV9eOp1jiN03f34ABnMBtU/fqVKnat0mn0wmjppGePCNv8yoZ2v1SnvkmY+P9h3LcRTOaUkJIbNKi+P6t9Q5bEQskj8/Bz/qjSkvnES107FUMrCwozcKaLC+1Ruj8bsFgyVSCyHQd6P6mfjT4D0vJrWRMZeCF7MfGOX6PNYcnR/fHJq5xQhgEeSU32PD/zewVWsOvcz2b/QyTfXqACPo6rOBMxz3cx4EcJyI9UedNnXGYIojt6DRHqSXaKCKy/BGsQCwedJLjMkjlvTSuvPCXjB95NnDQ3wJoCbxhRgK5O5BO6a5PYJmHXRpyHTw4SOZHjvJa/HZNEbw25D2D9+cOXoplmRYLBrsgSWuV7HuYlERmIaiPX6lmg10Q3HtiLlxcH9zimUyU79x9uuhiLkQN4Lcd+ZGZD1UNx2wP0uqg187d7YX739ZmIukKH+8loHho0GlTpyJM=
X-MS-TrafficTypeDiagnostic: PA4PR04MB8030:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/rCu4TKKcx2/tf6yBPYbVhOzllL2cMn7UHYN5hbK7vIzAgIe+cnIpZrYb/f6TVgAC6VdcL8VAYc1fYUyb9hX3fQcFPpRSyvb1eYkZVW4fm16yC8XXQfnyy8Aag/wjn3/E0YcDXqdgungbjwlVja3VdHUKyBlkQZ3ZCy8dMRwMHSMR1/NCDGCn3w3nOn3fJUIiBOrDsY/eUoHYECjOciAjKhSJzSflSa3hcntOfX1u8EDCKTusSlxNukvJ+onyN5BSqv+f5XStd5AakojoTEjbCRrhnHzIrmb41NtmTSSdqIYQkiSK4grSC1UJSg0D08osfc7Z1AXHuxktSeiOQcUMz6N/c3gLg23euM4yXlxcroCS5UczLPaKA9nsPIEKjz9RXUs6lMpJgM5cfHFIh5Mx1r7CX43QYX5QhiY3ZcoYmQbCVTyb/BHk2QxHfE8PM7jJjYsLZxPgcNcl90Rnbp5Emkd9jiOgnLNnuWESQujVg+fe2FHhFYyvhGo73I9cEMx9ME/B4Oc4RdFYMxwtqXCQAh2ECK3PlW9rwotLxt5Tm9f0NuTcV6NiadbGthbUyWfYAPS+QX8wkbUzwzv+VVUA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8arXScrXxweySp7rE+YLCwDRETr7vNuXc0BbSPrcgl5vBYovByaWnyNiOOhL?=
 =?us-ascii?Q?QYCJgZfg76/bngVm5bd7QPKu1Mil9jEvMFGybXXHQLhxUQMvF4SNImkueDf9?=
 =?us-ascii?Q?UjUPWFe8YEMupTbG+cJ6bQZVW3qpk5DN+cvw/G+TPhrVWtsEFjQjfIbUn44b?=
 =?us-ascii?Q?jEVDM3dEhYOYop2dnXbesNC/Jt7ML/0u1xEe4Xq6Mmyo3VVTlLHVYBYDFeRE?=
 =?us-ascii?Q?3tOj0Q3lS3K5JQcA/tyofOqoS5x+VBpfKdgC5asRUHRamHdyLt31luTh3Fui?=
 =?us-ascii?Q?IK78CKVImgTN95emZelNE4yaHoLZkk21bfjgsM7mQcYF7NseNs7rop99oqF1?=
 =?us-ascii?Q?V4NuQNa5nPwBdehkU6Cp5huGijW7nFpQi3pMwOOCtw/r0wir/boNS09KHE5r?=
 =?us-ascii?Q?aFCdycoc54H9yrvT69OYTKZkeo42yJkmcIU4uwTPr429GdAaEmeymoU7Patq?=
 =?us-ascii?Q?1dyzK7MBgV6S6Rga+1bl1AY6xh+VkngLRtfvzg+NVB25yZoAlKdmhoN8JNF0?=
 =?us-ascii?Q?XV8Hd/jBbN2l96IFV6VjLM6U33cErGYgssBAVfxnf4q3oPjdQK/Gwi6YU9m0?=
 =?us-ascii?Q?6QCOP0NiOXwIIrCgPVhvsdLiJTpSPw78/MsC+okP3Y3rNey+Mb62W5Q/IXic?=
 =?us-ascii?Q?J1y9fluPkYxcLleTM0B1RysIWP980C6o/sd7R2sCHvQjidP1cqjaXGs8ConY?=
 =?us-ascii?Q?8/vRA0h+J520OLoNy8QkbAoM/3iYLqvZCONWD9Zlen4NUkAexgeW4Hdbk5CC?=
 =?us-ascii?Q?qbR4H3UoDExPdn71z9vO2/PI0urRSSb2LJZnSg90KvNyfVBEereZyQ7MKF5s?=
 =?us-ascii?Q?m5Z2iYeDWEoL5L1xWE+B/2RegrYC0Shhpj+/Oz6RzYtXX91TKXF8Vg6vdlsg?=
 =?us-ascii?Q?0I69cHEB+53qKgHaaxYU8mV8kEpkleicHhbZJpmNb+vqe+FxiHFSafiaHfEZ?=
 =?us-ascii?Q?QC3huRKunVJlxmOliiyramwfeTd9j62BBRP2QJ/Em2sHNpr0oIt5zKFKnPOU?=
 =?us-ascii?Q?Z8iZFusgjG1tQ8rCsas98FdlSioxFGbuFzJi7Sd+wrpmvTcpfA7fDxbPD1dQ?=
 =?us-ascii?Q?W9vToWPLgG62Ieh6U/pvZbcgwvZxQg7fr7bAOqDQhu0txJjEPGGevBilNVOw?=
 =?us-ascii?Q?mSVOkerkqVKtaIVrXW0hJjyVhWgeJuou/w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461c1772-b7af-4859-7b3a-08da052b941a
X-MS-Exchange-CrossTenant-AuthSource: DBAPR04MB7366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 19:56:35.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
Cc: Takashi Iwai <tiwai@suse.com>, Jonathan Teh <jonathan.teh@outlook.com>
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

Save and restore CM_REG_AUX_VOL instead of register 0x24 twice on
suspend/resume.

Tested on CMI8738LX.

Fixes: cb60e5f5b2b1 ("[ALSA] cmipci - Add PM support")
Signed-off-by: Jonathan Teh <jonathan.teh@outlook.com>
---
 sound/pci/cmipci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 9a678b5cf285..dab801d9d3b4 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -298,7 +298,6 @@ MODULE_PARM_DESC(joystick_port, "Joystick port address.");
 #define CM_MICGAINZ		0x01	/* mic boost */
 #define CM_MICGAINZ_SHIFT	0
 
-#define CM_REG_MIXER3		0x24
 #define CM_REG_AUX_VOL		0x26
 #define CM_VAUXL_MASK		0xf0
 #define CM_VAUXR_MASK		0x0f
@@ -3265,7 +3264,7 @@ static int snd_cmipci_probe(struct pci_dev *pci,
  */
 static const unsigned char saved_regs[] = {
 	CM_REG_FUNCTRL1, CM_REG_CHFORMAT, CM_REG_LEGACY_CTRL, CM_REG_MISC_CTRL,
-	CM_REG_MIXER0, CM_REG_MIXER1, CM_REG_MIXER2, CM_REG_MIXER3, CM_REG_PLL,
+	CM_REG_MIXER0, CM_REG_MIXER1, CM_REG_MIXER2, CM_REG_AUX_VOL, CM_REG_PLL,
 	CM_REG_CH0_FRAME1, CM_REG_CH0_FRAME2,
 	CM_REG_CH1_FRAME1, CM_REG_CH1_FRAME2, CM_REG_EXT_MISC,
 	CM_REG_INT_STATUS, CM_REG_INT_HLDCLR, CM_REG_FUNCTRL0,
-- 
2.35.1

