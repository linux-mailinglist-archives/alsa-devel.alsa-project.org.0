Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AA52A2BE
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 15:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13711635;
	Tue, 17 May 2022 15:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13711635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652792959;
	bh=TbRf81T5rfz1+baxTJJVfjZ2ju4z9RiFvHyBIY7mooQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vvAMXqKNmppTl5P2R6Z/VeitRbZMH0ptCbJJt2Lg1PvMvHIePH+yVpTdv/e6fh4wS
	 c7QOxTV2NACRB34sEOX0V9gVDe1i2rN1xLkuQjPVMNw2XdBf63FNdIyRCa7ryjnCvC
	 TjA8ntpp1stU5vaPPgbiKisGpbnh0BXgTFcDZkyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A271BF80527;
	Tue, 17 May 2022 15:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32F89F802DB; Tue, 17 May 2022 05:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A0C2F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 05:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A0C2F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=vivo0.onmicrosoft.com
 header.i=@vivo0.onmicrosoft.com header.b="EBS/39+u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGYK6ee/CntVVRvm/S0Us92+SpJXksIIJPEPEHzhwU/v1sTRkfI0qC9jUX5KhwOdgU8a9333WhXjCEm1lx6wQIjducTG+BqzE8recVqXikp2fMTe9i/9PnMYQSPElP30Vak7Lx4uGaw63et1KZoK8VePBzm0aBvt7azBVjbSy2MSlus90P3pCerDkxNCB51KWF/6XjxAtSR3Yfb9VfCvdCLMI3IS+oMxHGUtAf9xa0+BLvV4eo/3XTxO0fTfgsv3r/Hm9y0eGxEaGAPWztgG5X0r4YCBNAiyT8LS4QvMnx08XoLxs9dMXt7MKqinVNF5IpBL1OiGGRO55mcMEYSNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afo3c/BYnmkgO/U/12SSwKTnPYNqMqToZb7L44j/fw8=;
 b=TUMdPu/XggBMyB7wA420f1n+3BUS5lJZFRsuBrvNfy6bd4LK6ZrOlpJ7NlgjRBEIiV5xLtASVYov3DfwfRBeSkWrAsA63NikAssF6nvVu88xfQhLkwcKpxFX/8KPQAVmOr23sHf2UzwGxfmou+YoOlgX14aDoUwXWqFFfC8gwmQJjKBjofzpgyF7jY9103+FbvR5RXoPhufNqYKB/Tpo30O4plSMQI+psK0t63d6t/TLj777fgwlzf246H9wKD6gy7O0tLDZPspl4IneydAGDq+C9dNFv0XRawNVMhX9cCFRuxtbhBNepKEn8GRmiCtxCyGq5lBk7O3WVfuBQt/P5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afo3c/BYnmkgO/U/12SSwKTnPYNqMqToZb7L44j/fw8=;
 b=EBS/39+uxF25/mOtmCouGPdRJdqAgYz0MJQTj+lZavMt1ZJPYoo1yHZHOCGzYRwnEfT1wmLJ+XxXMOZ4QVQqtcQMinuZDI096WRDctqfNGc6HvmHYYrDVRxs4VdPOsarEI0A2erdzgY6WRfWElJS3mdmnCsCflH4mWVXHs4f0DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by SG2PR06MB3821.apcprd06.prod.outlook.com (2603:1096:4:df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 03:31:04 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 03:31:04 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yihao Han <hanyihao@vivo.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ux500: mop500: Check before clk_put() not needed
Date: Mon, 16 May 2022 20:30:46 -0700
Message-Id: <20220517033050.5191-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0162.apcprd02.prod.outlook.com
 (2603:1096:201:1f::22) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77236cc2-f41b-481b-2e1f-08da37b5abff
X-MS-TrafficTypeDiagnostic: SG2PR06MB3821:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB3821E8E47FC036D1D1DF4D4DA2CE9@SG2PR06MB3821.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUhvodbILcLURahuCccwZ9gMiLqPr2i+9mPfrJMeKBDpC2EsTPJQHcmSG3ECyPjymASrW/ly8e2uer1c8c1CXnGvEpJZKxjZngxClm1n1Coxtev4wqgJOeGza5llu1I0UAGm1Z6BoxM5RI8h1tV2nTa4hDEOg75udKD+yMTutEO8nQHbk3LKtCcM1XmxXTcsznEmuTqryCBO1wxFHee/9enT0JgjZHDNOTBmgMHmlMxDJptJbhd5KlDsf0KY/fxPeI+PzIppk08OdWNotDIq7h/wf9hELe7kxDKfOObOGwC/CIm16pzBdMek1ctcsb9FTBETyHbT01Wf7jiD/a38KhozY8Y6fyX5reodhroN8oatoX+YgvYMoabbvkAyAO5038CQzv8tBJMKMlBTZHHJ2OZwfDTxEGWVB865khe35+jiFVfx/Jjw+MSPt2g0KMkccjZ7q1foxjR3F/MOh5QbG7sUNjfsD30YFddSHvcKFAbCb4zdjOKWOUhhYOTjV0kSJvcvZhk/8HdsSiXTOC5fimog4ZLw+s3i2SW0fPZD8evDyqUuV41ObSV/6TpKMCkt6XpZ7h/SE70GmBS/4DD7vXn/CwSw/BBg0gE3QSX7dAe+NfA0K2+l5NieSjb7caVoW1tWyR9RJRV9Aq08oh6o/NpX0XkHbZ2IvIwD3TjstXFt7RdSpdUSF9mt4uNGOsESUEjWiGJ0H5xW/paIYQMUrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(186003)(52116002)(1076003)(316002)(83380400001)(4744005)(38100700002)(38350700002)(5660300002)(6486002)(26005)(8936002)(6506007)(508600001)(66476007)(66556008)(66946007)(110136005)(36756003)(8676002)(2906002)(2616005)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?efRKXXNIoHqGC4SkdPgw38O9sdCT5ZG78N5gP00Z1ZEuoJxcf8G3c+GNO/v9?=
 =?us-ascii?Q?64BwaZgPMHdQr/tk2M6tF8onXUIm49r+7PvpOZqPjkJZKS2dSc/CYQod0lWF?=
 =?us-ascii?Q?3/qGbCpJHY82XvfrAbbx6vHOb6pXBWyHNa+Eho/OadKO5Z7k/iX26G97IreY?=
 =?us-ascii?Q?9eh5xxvDviR4jbWeD+NucoHPkjaMuBugJk25GdCKtTc0BObV0f7Ch1Z++YB5?=
 =?us-ascii?Q?HSc+QFGNThRbsY72ss8eUikMuX9xQFzFjAhpEhHZt6CUYFEggJL7Hqm2NHy7?=
 =?us-ascii?Q?oe/q4UrN5N1dNFDexEFIicZHBJR3ZuaRvhLVM+0DkGKURDBJDheYat/2MUYp?=
 =?us-ascii?Q?WURmU04PtKxxiRWxsRmE6lXXNTPIozMEBn1jxPitRqH7LXFA1+RvQVSEzYdT?=
 =?us-ascii?Q?/dkxGdms4d1+yL5949OmXm50QAY9X+s8vAUXObW6tXuuv3QgjqQQYLQKApl+?=
 =?us-ascii?Q?3K5MSdHljdgbTtZ4+djW4eZtX5w8W67QxbSbmDD9LjfUWWX0msmNRNZsM8VY?=
 =?us-ascii?Q?K6CQvkknxQCIdzim3zfwQ3RuVFXv7PAcXoNSblOCX4RDxaM8c+v4ziF7f4V2?=
 =?us-ascii?Q?/P/r2YMWol9OEFh8OtytJGGW2ino2D6R0YSUA57BkFawHVYpsaDuar28I69o?=
 =?us-ascii?Q?aIKQXJz5PjUXFX/6oCVVbDI/H9gjfuMGNBz1ilFSfEuH0h1W5MHxuMuP28Ej?=
 =?us-ascii?Q?AjPKQF59bUpiMdHnV07YytDtSLGsvvV7airTsD5Li+/XTkzNS0GzE9l1j8I+?=
 =?us-ascii?Q?vOs/nce17w0nPgNgWwf81haVgBOX11vZmSoDywoqoF9GznNm9U4nCJqzo65P?=
 =?us-ascii?Q?w7Rh3p3VsfMPmfNAVMGcBRv5QIc62SsTko5jonxAI90MHNTGPJzh90m2Wibl?=
 =?us-ascii?Q?h4sWIEbdzU4YetyjSi9ZG5mLaf4Zi2gfsESEMx5kLu6jo5XPoXRjbqpXYyq2?=
 =?us-ascii?Q?/BoiTDGFcutXm583qcvZINz7AfswmR4+aNK3DaV768eCKO3Elrv+YvLc3DGE?=
 =?us-ascii?Q?iFopvJ2sJ3Zezy2FTl6XLFY2UZMuH5R8NifuSLF6INUj7MrpQ4+Zk/dYkyip?=
 =?us-ascii?Q?5qsMiUGEqJAhDA+Vh8SqV8tmhOlACVSAmrB8QmtmeF9aySe1yiJumMHfPSZL?=
 =?us-ascii?Q?lA+Ow/OkGFuW/TWjwARFrkmz//LJRRaIFg41UIDfF/26DnGamJPvNDOxly/g?=
 =?us-ascii?Q?ZEZTMaW8Nfw/3P4nwGZn81cmP7we6UkzRAi6LZLcgsDbm8040TLTUkyJ7EsH?=
 =?us-ascii?Q?SiM6TJ2DAyAhRKv1QlBbBqLzK1b3sYpqcQbqWLYAsqLwB8tY9RLTp9DwmSJF?=
 =?us-ascii?Q?vPjUQDu1TwIRyyiSsUD7abtecZz9ejR3XMOLpTP/bDqJxDk/AX0tbmZ9jScO?=
 =?us-ascii?Q?ZYHdAJ+SpFDgTdbp8kdv+UHqYaG8oF7LyoRRLBiRNx2kDp+qQPXoXVxzHnIL?=
 =?us-ascii?Q?MGeu6oFGwnn5SE9JqW4NfxoSfUCDv5ali7eGR3wehAnWMsTSiotc+4NVFcVw?=
 =?us-ascii?Q?peYczXA7ijBG0XC4sDRCXKuQYBv8mYUPSMqxAID+R6WneyrFGi3glzXwPn8x?=
 =?us-ascii?Q?mzvdSKftwuRWqI6PtyU6LAuu7SamtxXLjapuCJdhpzN/7yhIlOnXpLsb/i1i?=
 =?us-ascii?Q?yToUZwVc77CBRiifmFqwq5KgBMiVPxDHcYaHnmAbkLajJ4raH+qNcYMgHtuP?=
 =?us-ascii?Q?TIsf6wFFP6Dqv+rPOH9r00iA03DsZy0RDBJtt468a2wjhNqLOtTqTbR2KPF2?=
 =?us-ascii?Q?/Q/oUvNnkA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77236cc2-f41b-481b-2e1f-08da37b5abff
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 03:31:04.2301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxdrz0bwx+nvxOAciIG76tFrD+On596bY5QMJaUGTDM+E7mJyyxk7RPT0j40tklpIFu+vECc6XlMAVNCzFBkmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3821
X-Mailman-Approved-At: Tue, 17 May 2022 15:07:02 +0200
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

clk_put() already checks the clk ptr using !clk and IS_ERR()
so there is no need to check it again before calling it.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 sound/soc/ux500/mop500_ab8500.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 3e654e708f78..1ea1729984a9 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -433,12 +433,9 @@ void mop500_ab8500_remove(struct snd_soc_card *card)
 {
 	struct mop500_ab8500_drvdata *drvdata = snd_soc_card_get_drvdata(card);
 
-	if (drvdata->clk_ptr_sysclk != NULL)
-		clk_put(drvdata->clk_ptr_sysclk);
-	if (drvdata->clk_ptr_ulpclk != NULL)
-		clk_put(drvdata->clk_ptr_ulpclk);
-	if (drvdata->clk_ptr_intclk != NULL)
-		clk_put(drvdata->clk_ptr_intclk);
+	clk_put(drvdata->clk_ptr_sysclk);
+	clk_put(drvdata->clk_ptr_ulpclk);
+	clk_put(drvdata->clk_ptr_intclk);
 
 	snd_soc_card_set_drvdata(card, drvdata);
 }
-- 
2.17.1

