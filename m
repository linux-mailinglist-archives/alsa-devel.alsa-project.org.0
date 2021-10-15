Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3142EA2B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 09:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BE4168F;
	Fri, 15 Oct 2021 09:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BE4168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634282967;
	bh=cMd+BHcMF0euai2/0Z/Qx+fkXk/9KJoAIgE5akHdvGY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ouxng23sMQEYuRNLIhxZtaqxTH7lUh+IgFKi+tL+e6zTgnClLB/GQ0Cl5WaOYZRCr
	 bTInioLAzIrhhm4mPnFB/DBLZhVU0heA/bNi8Avel/TsEqMLTruzu1omU0uoFI0Gdw
	 SEeoLH1Bz8mgTTWN0hjk4Ic4Y9OLht9nzTYM/x3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 107EAF80430;
	Fri, 15 Oct 2021 09:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA63F8016C; Fri, 15 Oct 2021 09:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2103.outbound.protection.outlook.com [40.107.237.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68502F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 09:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68502F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="iNt2xwrW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgccOvuVObDixOM82+NynZH6N9NSZLghds6F/kZ2v9Wvf6d8UhImDkI+TlL2YBo1B24uOSm8Oy8R3UOcPe62bhNSu3ch+TJ4/sBWP+s0aviGoktrVG9xutHwjRVV+b4pI/7nlZy6gXDjmJH5sngOVyIh3vvFJzbJnQQmPzcM5h/R7XaEHryVuGv32stV1Cp6wKy/TYwn/pa2WaYhpcVYSiXwL9L1m4+m6uIusa+sOdM7z53uup+oZj5HZ4IxvcyBER9v5/EWahUBp+McSZ4984W8Pn2zuqPAVbmHdGm9YAj7i60X7aI7b5pgtinV0qJf50Q5iCnbItbHe06eH/KyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1WRlMhA8sQweMGnn94cfGbbTK73cH5FpqO44Njrpy8=;
 b=k8l5Da4U5ydPPvZdg8+wHoFv/XdfC2SOhAg7K2y6ZXop8hiCHlJNp1NatSeI2Dka0D2goFiGdK0WWdiGWir1x4L9IZ2U0T1PFkQ31/XqrfJC+KvCOEx9UGXG1f7LZx/80yCxR8PB/Db49hWZxG526JfcOCcDiCtTg98xox8NG/UcRP0iIJrxQLy1ZQ2vZMeMj5lU1xEfKZcwV9rt2AWnJMegSB2qwtw00HM6SI1hLIDjR3ZrRKpLp4pcvenIVHThLCLzziopGGDjUTO1CFFu7xzs2Ssq0AsT1wSFmxParc+WGGgfseN0dIOX8IypjqF/2KfwaMWyCT6JzijzCxp9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1WRlMhA8sQweMGnn94cfGbbTK73cH5FpqO44Njrpy8=;
 b=iNt2xwrWVu3R7FW+NUP6WRpJHzyjLBzc9Phb7NtTch2OEa+LwXSGjHaU6xQNs++RXgPFfXb4/QOyG2rT0rmo/pvXUb3yFY6UcW9f1HPvHZFIcrzrJv3BEoti5DjjS42NQ9fx5TnBwN3bpWY8eVCsJffWp8tUfinNTGl4DhBE3DY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Fri, 15 Oct
 2021 07:27:34 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.016; Fri, 15 Oct 2021
 07:27:34 +0000
From: George Song <george.song@maximintegrated.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [v2 2/2] ASoC: max98520: modified alignment and blank
Date: Fri, 15 Oct 2021 16:27:09 +0900
Message-Id: <20211015072709.3167-2-george.song@maximintegrated.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015072709.3167-1-george.song@maximintegrated.com>
References: <20211015072709.3167-1-george.song@maximintegrated.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0052.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:19::14) To BYAPR11MB3671.namprd11.prod.outlook.com
 (2603:10b6:a03:b3::15)
MIME-Version: 1.0
Received: from SEL-LT-028891.maxim-ic.internal (223.62.163.157) by
 SL2P216CA0052.KORP216.PROD.OUTLOOK.COM (2603:1096:100:19::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 07:27:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ed33291-1ff7-4493-98b3-08d98fad4145
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR11MB272683BB7421E3878420B9CFF4B99@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vTHzr6shch3dQLO/o+Ekj1os6kfkHkUGVz4xTR7ThchXuOcaD1mhcai5jMohMv/g8BDANezx70izaZSYWwKw4MlauV8mbAviYSCgEIPADA0en1Rg7AttjDZzyMn5RMwNHlz4CB2sf8gKgBFBaDOnb04YLoPV2huHtZCswCwfqoCClo2XwSXQm0iazlqx8izDqEWCCzIUh2RusJo1yni4ryC9TUHruMPkAOfIwbot5R3zvuMt2CpmHGsdioMa79KcCjO3LySMvixjpuLRAhDRTWuxvdIjcxQIavCbs/8opvdSHBpP03H/IDcagTCBaiiEno+z9wr4qQZnt/NZngDtZZNgFno0R6w3QniDP65CfaFz0oTe51Zv6MQ/ZAl9X+wXkgNcPVwguFEsN23TZM/KAGvzKSfkmjad5iZRRP0HLUxpTML9S9hB7JYBxlv0cUWI5PNQeDcIzETiX95GmfGq3/B/8MRtdsHeRF8uvz2CCJDbE9m/HaqrIJ8DEUCp0UK8WsgZRZLPrI8nAx3Ncp47BimEyk4GNmkPRXWauk7Tn/dOusB64uTPxiOyELAIREqprTiRan4OvGbDAduXPKZinNa6xUStjFM/4l2EIlRBxhd92+cZsYwkIDgXnhBcwyF3rIK0OYEfkJKAe5WpPD8Wi6gRPpR0C7Dyomh9Ny82bNKysf4zuARAhLj5ZtLTqtQbeZHTFhS62NHHFb0GSc1nUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(1076003)(8676002)(186003)(6666004)(6486002)(30864003)(26005)(956004)(8936002)(6512007)(2616005)(508600001)(86362001)(5660300002)(38100700002)(107886003)(4326008)(6506007)(44832011)(316002)(66556008)(66476007)(83380400001)(66946007)(2906002)(38350700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MNOZsgER3XqvnKySVYMScAdcz+rJgxjBwhVYJjNiiDcOK1hfHuzpJukbnv12?=
 =?us-ascii?Q?8aBsuH18C1Li9nxcbnLmtwKdr1zRdpnJTzxtx+doyeoL5JmlMHZGBAB6hRgX?=
 =?us-ascii?Q?l6BcoUc3lrr7lprnK2VUkWC077f4e4SN9EFj16MhQ9Tsk7Yju4c9JoBfqoRA?=
 =?us-ascii?Q?ujdooWBAi+K1FfI05RiUHCGcjPVDNHGrhoNrrPEYIfomqOj6UIbuEuY8KunJ?=
 =?us-ascii?Q?CC4TzEF9/RjOibFTiw7U8ILoiHplO1QbkgtkX41n7eptGb9tTEOaUH8PvS8Y?=
 =?us-ascii?Q?ggAbygWmV1gPaDlykVlUl5ICM+Im2yXpGNbGtvKe6jIULAN51mp5+2LXUzGB?=
 =?us-ascii?Q?G+KQoxNX5E1VuwLlGHIoEh4J/0hooFnCyqjhM02/0x+581Mk4KrDZXy6+RaD?=
 =?us-ascii?Q?CKnDouXpfQ+ClSgLV8254gLqguPQLsTfJERuDxOlSJ5S1vs3/43A4B//XNv5?=
 =?us-ascii?Q?opAcZaVKz5amIgSuKvfl1DjT8XQxjvKPQK0DTrqHbNF/o4DOjWd8U4T0cnzc?=
 =?us-ascii?Q?nJZ2/+8gZW4/UFK5C6Kh09v3UOQlAhkAO6DXSMzQgskOuJ5X1MqMcRLLD43m?=
 =?us-ascii?Q?BE7s1zMIPsr5LMIxgUnbhLbmm0QKLFvZxQp8c070g0UK199KAARHwFNPrBu5?=
 =?us-ascii?Q?p650sJmF/5rNOGmoqfdN+mf9wVsKG/nrSrRhfne0jSuw1u/iMG+csx3EMt0f?=
 =?us-ascii?Q?f6xfbpEuzFbA+ljECBGS6kHDxfeMkfqcwhEZAu3txaqMPIDq3dI+PoYBSel7?=
 =?us-ascii?Q?eW+mUtikDgWoWRHv5ZMqaQyLW2FGP1FgF/K+YZRpdLvSd+hDqO82MnxuLbC9?=
 =?us-ascii?Q?ATSY+4iC6uib/I3e4w2oAn9TTjhtrG98bzSHI2Z4WDfsMZ2yibrwHlOX/uVs?=
 =?us-ascii?Q?LSuPFsRTdi2Z8AC7KtmYP0CfwR6eQhT7aEo597XYI88Bb2ppYHSGgD8AkBTC?=
 =?us-ascii?Q?9cSN/NXNaAdN6TK8Ii35YV6L35rpm1PBYGC3orVBo1FAX/QSlZhZeAFq1/yT?=
 =?us-ascii?Q?fADutuXXRP0a+iZC7LHmUWWiPlpZHKcClLa9RJVtZFzn0XkkpVFkVNHuf3xa?=
 =?us-ascii?Q?I1Z9YI6uAmtECOWpu/WW1pwf+LgZtIoQ+6/TZoQnoVJ6U/aNZywQoauq3PQY?=
 =?us-ascii?Q?zH0Hvpvz2eypQkNM0+BG8XXp5uPtoyGa3c59qlpB/f/i0U4wPBHZJBiQdkl5?=
 =?us-ascii?Q?5NqBWKh+l74AbCITA+90SFdJssT6zRvjLOIv8q5v0TOktsR2Kk+34/orQAgO?=
 =?us-ascii?Q?1FvrChw1rA0qnfHmFf7T3qGnHnxpIqk+soM0+82B8vja1c1wOPk8rP3KVFvn?=
 =?us-ascii?Q?B3jypiu3d4vFSvA02xiam1Tz?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed33291-1ff7-4493-98b3-08d98fad4145
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 07:27:33.8938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2ak0QCNGz16CwIgotEyxpwg5y5Fd2rZrSVn+SX5p8sqfQ9R+013COw/zcPJU90NyFCJ/g9kn61MLrQDRRfjJWvu9lt7DCdT7oWWluB+Lb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, linux-kernel@vger.kernel.org,
 George Song <george.song@maximintegrated.com>
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

fixed all CHECK and WARNING for checkpatch --strict result
removed MODULE_AUTHOR to make one maintainer.

Signed-off-by: George Song <george.song@maximintegrated.com>
---
 sound/soc/codecs/Kconfig    |   7 +++
 sound/soc/codecs/max98520.c | 121 +++++++++++++++++-------------------
 2 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 86b121d2f381..e8817029c671 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -926,6 +926,13 @@ config SND_SOC_MAX98927
 config SND_SOC_MAX98520
 	tristate "Maxim Integrated MAX98520 Speaker Amplifier"
 	depends on I2C
+	help
+	  Enable support for Maxim Integrated MAX98520 audio
+	  amplifier, which implements a tripler charge pump
+	  based boost converter and support sample rates of
+	  8KHz to 192KHz.
+
+	  To compile this driver as a module, choose M here.
 
 config SND_SOC_MAX98373
 	tristate
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 1a5e0ceae362..163cc0f106af 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -90,9 +90,9 @@ static int max98520_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	}
 
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2041_PCM_CLK_SETUP,
-						MAX98520_PCM_MODE_CFG_PCM_BCLKEDGE,
-						invert);
+			   MAX98520_R2041_PCM_CLK_SETUP,
+			   MAX98520_PCM_MODE_CFG_PCM_BCLKEDGE,
+			   invert);
 
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -113,9 +113,9 @@ static int max98520_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	}
 
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2040_PCM_MODE_CFG,
-						MAX98520_PCM_MODE_CFG_FORMAT_MASK,
-						format << MAX98520_PCM_MODE_CFG_FORMAT_SHIFT);
+			   MAX98520_R2040_PCM_MODE_CFG,
+			   MAX98520_PCM_MODE_CFG_FORMAT_MASK,
+			   format << MAX98520_PCM_MODE_CFG_FORMAT_SHIFT);
 
 	return 0;
 }
@@ -137,7 +137,7 @@ static int max98520_get_bclk_sel(int bclk)
 }
 
 static int max98520_set_clock(struct snd_soc_component *component,
-	struct snd_pcm_hw_params *params)
+			      struct snd_pcm_hw_params *params)
 {
 	struct max98520_priv *max98520 =
 		snd_soc_component_get_drvdata(component);
@@ -155,17 +155,17 @@ static int max98520_set_clock(struct snd_soc_component *component,
 		}
 
 		regmap_update_bits(max98520->regmap,
-							MAX98520_R2041_PCM_CLK_SETUP,
-							MAX98520_PCM_CLK_SETUP_BSEL_MASK,
-							value);
+				   MAX98520_R2041_PCM_CLK_SETUP,
+				   MAX98520_PCM_CLK_SETUP_BSEL_MASK,
+				   value);
 	}
 	dev_dbg(component->dev, "%s tdm_mode:%d out\n", __func__, max98520->tdm_mode);
 	return 0;
 }
 
 static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params,
-	struct snd_soc_dai *dai)
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98520_priv *max98520 =
@@ -193,8 +193,8 @@ static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
 	max98520->ch_size = snd_pcm_format_width(params_format(params));
 
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2040_PCM_MODE_CFG,
-						MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+			   MAX98520_R2040_PCM_MODE_CFG,
+			   MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
 
 	dev_dbg(component->dev, "format supported %d",
 		params_format(params));
@@ -250,9 +250,9 @@ static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
 		snd_pcm_format_width(params_format(params)), params_rate(params));
 	/* set DAI_SR to correct LRCLK frequency */
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2042_PCM_SR_SETUP,
-						MAX98520_PCM_SR_MASK,
-						sampling_rate);
+			   MAX98520_R2042_PCM_SR_SETUP,
+			   MAX98520_PCM_SR_MASK,
+			   sampling_rate);
 
 	return max98520_set_clock(component, params);
 err:
@@ -261,8 +261,8 @@ static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
-	unsigned int tx_mask, unsigned int rx_mask,
-	int slots, int slot_width)
+				 unsigned int tx_mask, unsigned int rx_mask,
+				 int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
 	struct max98520_priv *max98520 =
@@ -284,9 +284,9 @@ static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
 	}
 
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2041_PCM_CLK_SETUP,
-						MAX98520_PCM_CLK_SETUP_BSEL_MASK,
-						bsel);
+			   MAX98520_R2041_PCM_CLK_SETUP,
+			   MAX98520_PCM_CLK_SETUP_BSEL_MASK,
+			   bsel);
 
 	/* Channel size configuration */
 	switch (slot_width) {
@@ -306,18 +306,18 @@ static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
 	}
 
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2040_PCM_MODE_CFG,
-						MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+			   MAX98520_R2040_PCM_MODE_CFG,
+			   MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
 
 	/* Rx slot configuration */
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2044_PCM_RX_SRC2,
-						MAX98520_PCM_DMIX_CH0_SRC_MASK,
-						rx_mask);
+			   MAX98520_R2044_PCM_RX_SRC2,
+			   MAX98520_PCM_DMIX_CH0_SRC_MASK,
+			   rx_mask);
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2044_PCM_RX_SRC2,
-						MAX98520_PCM_DMIX_CH1_SRC_MASK,
-						rx_mask << MAX98520_PCM_DMIX_CH1_SHIFT);
+			   MAX98520_R2044_PCM_RX_SRC2,
+			   MAX98520_PCM_DMIX_CH1_SRC_MASK,
+			   rx_mask << MAX98520_PCM_DMIX_CH1_SHIFT);
 
 	return 0;
 }
@@ -334,14 +334,13 @@ static const struct snd_soc_dai_ops max98520_dai_ops = {
 };
 
 static int max98520_dac_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+			      struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct max98520_priv *max98520 =
 		snd_soc_component_get_drvdata(component);
 
-
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		dev_dbg(component->dev, " AMP ON\n");
@@ -367,14 +366,14 @@ static const char * const max98520_switch_text[] = {
 
 static const struct soc_enum dai_sel_enum =
 	SOC_ENUM_SINGLE(MAX98520_R2043_PCM_RX_SRC1,
-		0, 3, max98520_switch_text);
+			0, 3, max98520_switch_text);
 
 static const struct snd_kcontrol_new max98520_dai_controls =
 	SOC_DAPM_ENUM("DAI Sel", dai_sel_enum);
 
 static const struct snd_soc_dapm_widget max98520_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
-	MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,
+			   MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,
 	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,	&max98520_dai_controls),
 	SND_SOC_DAPM_OUTPUT("BE_OUT"),
@@ -472,14 +471,14 @@ static bool max98520_volatile_reg(struct device *dev, unsigned int reg)
 static const struct snd_kcontrol_new max98520_snd_controls[] = {
 /* Volume */
 SOC_SINGLE_TLV("Digital Volume", MAX98520_R2090_AMP_VOL_CTRL,
-	0, 0x7F, 1, max98520_digital_tlv),
+	       0, 0x7F, 1, max98520_digital_tlv),
 SOC_SINGLE_TLV("Speaker Volume", MAX98520_R2091_AMP_PATH_GAIN,
-	0, 0x5, 0, max98520_spk_tlv),
+	       0, 0x5, 0, max98520_spk_tlv),
 /* Volume Ramp Up/Down Enable*/
 SOC_SINGLE("Ramp Up Switch", MAX98520_R2092_AMP_DSP_CFG,
-	MAX98520_DSP_SPK_VOL_RMPUP_SHIFT, 1, 0),
+	   MAX98520_DSP_SPK_VOL_RMPUP_SHIFT, 1, 0),
 SOC_SINGLE("Ramp Down Switch", MAX98520_R2092_AMP_DSP_CFG,
-	MAX98520_DSP_SPK_VOL_RMPDN_SHIFT, 1, 0),
+	   MAX98520_DSP_SPK_VOL_RMPDN_SHIFT, 1, 0),
 /* Clock Monitor Enable */
 SOC_SINGLE("CLK Monitor Switch", MAX98520_R2037_ERR_MON_CTRL,
 	   MAX98520_CTRL_CMON_EN_SHIFT, 1, 0),
@@ -507,27 +506,25 @@ SOC_SINGLE("Speaker Mode Switch", MAX98520_R2095_AMP_CFG,
 /* Dynamic Headroom Tracking */
 SOC_SINGLE("DHT Switch", MAX98520_R20D8_DHT_EN, 0, 1, 0),
 SOC_SINGLE("DHT Limiter Mode", MAX98520_R20D2_LIMITER_CFG2,
-	MAX98520_DHT_LIMITER_MODE_SHIFT, 1, 0),
+	   MAX98520_DHT_LIMITER_MODE_SHIFT, 1, 0),
 SOC_SINGLE("DHT Hysteresis Switch", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
-	MAX98520_DHT_HYSTERESIS_SWITCH_SHIFT, 1, 0),
+	   MAX98520_DHT_HYSTERESIS_SWITCH_SHIFT, 1, 0),
 SOC_SINGLE_TLV("DHT Rot Pnt", MAX98520_R20D0_DHT_CFG1,
-	MAX98520_DHT_VROT_PNT_SHIFT, 10, 1, max98520_dht_rotation_point_tlv),
+	       MAX98520_DHT_VROT_PNT_SHIFT, 10, 1, max98520_dht_rotation_point_tlv),
 SOC_SINGLE_TLV("DHT Supply Headroom", MAX98520_R20D1_LIMITER_CFG1,
-	MAX98520_DHT_SUPPLY_HR_SHIFT, 16, 0, max98520_dht_supply_hr_tlv),
+	       MAX98520_DHT_SUPPLY_HR_SHIFT, 16, 0, max98520_dht_supply_hr_tlv),
 SOC_SINGLE_TLV("DHT Limiter Threshold", MAX98520_R20D2_LIMITER_CFG2,
-	MAX98520_DHT_LIMITER_THRESHOLD_SHIFT, 0xF, 1, max98520_dht_lim_thresh_tlv),
+	       MAX98520_DHT_LIMITER_THRESHOLD_SHIFT, 0xF, 1, max98520_dht_lim_thresh_tlv),
 SOC_SINGLE_TLV("DHT Max Attenuation", MAX98520_R20D3_DHT_CFG2,
-	MAX98520_DHT_MAX_ATTEN_SHIFT, 20, 1, max98520_dht_max_atten_tlv),
+	       MAX98520_DHT_MAX_ATTEN_SHIFT, 20, 1, max98520_dht_max_atten_tlv),
 SOC_SINGLE_TLV("DHT Hysteresis", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
-	MAX98520_DHT_HYSTERESIS_SHIFT, 0x7, 0, max98520_dht_hysteresis_tlv),
+	       MAX98520_DHT_HYSTERESIS_SHIFT, 0x7, 0, max98520_dht_hysteresis_tlv),
 SOC_ENUM("DHT Attack Rate", max98520_dht_attack_rate_enum),
 SOC_ENUM("DHT Release Rate", max98520_dht_release_rate_enum),
 /* ADC configuration */
 SOC_SINGLE("ADC PVDD CH Switch", MAX98520_R20CF_MEAS_ADC_CFG, 0, 1, 0),
-SOC_SINGLE("ADC PVDD FLT Switch", MAX98520_R20B2_ADC_PVDD0_CFG,
-	MAX98520_FLT_EN_SHIFT, 1, 0),
-SOC_SINGLE("ADC TEMP FLT Switch", MAX98520_R20B3_ADC_THERMAL_CFG,
-	MAX98520_FLT_EN_SHIFT, 1, 0),
+SOC_SINGLE("ADC PVDD FLT Switch", MAX98520_R20B2_ADC_PVDD0_CFG,	MAX98520_FLT_EN_SHIFT, 1, 0),
+SOC_SINGLE("ADC TEMP FLT Switch", MAX98520_R20B3_ADC_THERMAL_CFG, MAX98520_FLT_EN_SHIFT, 1, 0),
 SOC_SINGLE("ADC PVDD MSB", MAX98520_R20B6_ADC_PVDD_READBACK_MSB, 0, 0xFF, 0),
 SOC_SINGLE("ADC PVDD LSB", MAX98520_R20B7_ADC_PVDD_READBACK_LSB, 0, 0x01, 0),
 SOC_SINGLE("ADC TEMP MSB", MAX98520_R20B8_ADC_TEMP_READBACK_MSB, 0, 0xFF, 0),
@@ -597,7 +594,7 @@ static int max98520_probe(struct snd_soc_component *component)
 	regmap_update_bits(max98520->regmap, MAX98520_R2092_AMP_DSP_CFG, 1, 1);
 	/* Disable Speaker Safe Mode */
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);
+			   MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);
 	/* Enable Clock Monitor Auto-restart */
 	regmap_write(max98520->regmap, MAX98520_R2030_CLK_MON_CTRL, 0x1);
 
@@ -609,8 +606,9 @@ static int max98520_probe(struct snd_soc_component *component)
 
 	/* set Rx Enable */
 	regmap_update_bits(max98520->regmap,
-						MAX98520_R204F_PCM_RX_EN,
-						MAX98520_PCM_RX_EN_MASK, 1);
+			   MAX98520_R204F_PCM_RX_EN,
+			   MAX98520_PCM_RX_EN_MASK,
+			   1);
 
 	return 0;
 }
@@ -624,6 +622,7 @@ static int max98520_suspend(struct device *dev)
 	regcache_mark_dirty(max98520->regmap);
 	return 0;
 }
+
 static int max98520_resume(struct device *dev)
 {
 	struct max98520_priv *max98520 = dev_get_drvdata(dev);
@@ -664,18 +663,14 @@ static const struct regmap_config max98520_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static int max98520_i2c_probe(struct i2c_client *i2c,
-	const struct i2c_device_id *id)
+static int max98520_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 {
-
 	int ret = 0;
 	int reg = 0;
 	struct max98520_priv *max98520 = NULL;
 	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
 
-	ret = i2c_check_functionality(adapter,
-		I2C_FUNC_SMBUS_BYTE
-		| I2C_FUNC_SMBUS_BYTE_DATA);
+	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
 	if (!ret) {
 		dev_err(&i2c->dev, "I2C check functionality failed\n");
 		return -ENXIO;
@@ -690,8 +685,8 @@ static int max98520_i2c_probe(struct i2c_client *i2c,
 	i2c_set_clientdata(i2c, max98520);
 
 	/* regmap initialization */
-	max98520->regmap
-		= devm_regmap_init_i2c(i2c, &max98520_regmap);
+	max98520->regmap =
+		devm_regmap_init_i2c(i2c, &max98520_regmap);
 	if (IS_ERR(max98520->regmap)) {
 		ret = PTR_ERR(max98520->regmap);
 		dev_err(&i2c->dev,
@@ -715,8 +710,7 @@ static int max98520_i2c_probe(struct i2c_client *i2c,
 	}
 
 	/* Check Revision ID */
-	ret = regmap_read(max98520->regmap,
-		MAX98520_R21FF_REVISION_ID, &reg);
+	ret = regmap_read(max98520->regmap, MAX98520_R21FF_REVISION_ID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c->dev,
 			"Failed to read: 0x%02X\n", MAX98520_R21FF_REVISION_ID);
@@ -771,7 +765,6 @@ static struct i2c_driver max98520_i2c_driver = {
 module_i2c_driver(max98520_i2c_driver)
 
 MODULE_DESCRIPTION("ALSA SoC MAX98520 driver");
-MODULE_AUTHOR("Ryan Lee <ryans.lee@analog.com>");
-MODULE_AUTHOR("George Song <george.song@analog.com>");
+MODULE_AUTHOR("George Song <george.song@maximintegrated.com>");
 MODULE_LICENSE("GPL");
 
-- 
2.25.1

