Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C796C5A59D5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 05:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9A71650;
	Tue, 30 Aug 2022 05:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9A71650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661829529;
	bh=/pOikL2FKUj3DZC8GskxtDXr1KyWw+aDQf53hQ/sdB4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQLmrx6UGytaj4xK+1WLih3WD9Ms63kV3KlqxEvd/2IS2FuDlmk0OMdXKO6+mmyff
	 gCAaH+cmuqtt4eZg+5htgTgan4mgyrFRvZLqFMBjTF4sLnOQFyxDfWo9Ckz/IKgypE
	 12L1kUjMm4pVdtj1fOXu7/Ru2dsfF8T0SxaIrouY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A13E0F80529;
	Tue, 30 Aug 2022 05:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC74F800AA; Tue, 30 Aug 2022 05:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C414DF8032B
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 05:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C414DF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="QNN4PTyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMIbjUaZuZIkdu8V8qMcFpHy7rz/Fn3xpps4uoXmzq4war/PRliHaFiSQ5GbHu/4ZaQwUnro35hlKTt+/rAveQq554lxvHgksijtWlyKy90hJxQctb/l4Oul3uIFSkzxxu/O5gi/TBjbhcdydZkwJKOQ6Nr78/lkCiBA2totnowxGqD4zpRAwSWKTtad4ztqhMqeeOSr4RIDLtLI4RZdS/PyY4mKwf5x4TLDnMnxnEKc36cQGCcxWJ3QXtdrhO7u2N9qP++wM+AEdndyUtad1GYeUZ1VWlLCe904iCrgy/fjxGpHr/CJ34iaFKrrzWBrxkg6/18QOOvj8/Oed+gHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39st0QExPCWhLME0ZCSTa2G4blapb3pxgqVeEiUnvOc=;
 b=nXy7WmnTYzEF/lDdWWWUanGWBioSRAkTsybqcJhGYxF6bIjoZD3ZZcNCci4oaBO2Hja7C3ZSxkkiFXt9ya6hnJXeueu7tYWahJZZdO+sBKL3xR5GaoWSCNmTGZNcJBeBnK9k1rq44nyPkWRtmwE2bmx9K8E7l2wA3/slQiiaJbb3yjf3yK36zNtRLiDv9roZLLSg3mOTztbmUKE/BKhbP3FqamabkARUnBfZsKuf05dZ9UwBtJOhfshewLsUdZH1i4a4Fb1IkzR0UyUYR4whhA4pSbTOxPCJbhca5e9AIwyJfxXBeNScaDkxpI03+w8h7kAei3cGT+3x8TowLwfxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39st0QExPCWhLME0ZCSTa2G4blapb3pxgqVeEiUnvOc=;
 b=QNN4PTyCQrLRP7uCujGROd6NXf9m54qsmQRjvnmdmIWkvIOUjzQQR1WuzNIbCr9qq7qFmJ+3CqBDFdontC8Q6cDa5/1txlQaoLF39ElJFFnZzFdxyqD8xC4kPlwghBri11OvecQL6HvY0WREr09nUy1DPx+zbcWNO4CRUDRzLWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB2675.jpnprd01.prod.outlook.com (2603:1096:604:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 03:17:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 03:17:12 +0000
Message-ID: <87r10y4dzb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: soc-pcm.c: add soc_pcm_ret()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Aug 2022 03:17:12 +0000
X-ClientProxiedBy: TYAPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aafbda3c-9a77-4f5c-22c3-08da8a3621c9
X-MS-TrafficTypeDiagnostic: OSAPR01MB2675:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qewnl2IxevVlOr44lSJYI2sFIi1zmm452gP9jpLleT++BZkhBNrPVzP15INrQGue8ejevGPqIZ4fYju9FIJjDWjOgrhviR3Ue9mzyr1HDN9M/UgVhj8vRoqEaJ4DbkueEcOAEMoMdcbNhEXArkoECUXmyqQ38OA9RkXhYrZSh82CprS+ASih5fIcXQwHMcJeg+hyKHfZkvik8Izg02w3y8H097JPPu9iVrkZLNDuCCFci2sMrnxpWMmM0jWw+A66uv7F+39uBDFVzh4t1PVfkAO7DIPsPz+muyTDXUMrYI8g56GPfMpvi32fHwbjQanyugtgOb0qRCUHt/oP4jy3oIQJp1k1e5VuCW0Qf+POalRcWuZj7mYI9V9diuI7tE+9TI4K/GGPZUkIN0fDkA5wiglXWIAY7oXGHLsokpSa+Hq2Poz+IrEb3Uq0hTF22zI2frJDrxCssRyFpr6yFw6fJSVJQN3Wkgm5Z/q4Rd7OHc2F/8814zc5dpnHEcNJqmpTtzIOZmkoHLWO1OD6KODHtSQ9L7/C4BS08WgKEO5dRB3iQxYlWGVUC2orDv73lcGz47yPfT+owe0pgeP5sCY7elHG7nLCay5+/gWmf+ch0/A2jNFg/HumL8BWaef083lXS9QXTGwCUCoeTyl3t74f+iw2BBaDNIHc+30plHYF4tHWJj3tn28NalM4ZBugHQkC84uWYhT1i+edH1IoFseVKNiPu2nV5ZquQrDj9/Zziyn5lSjqEbo0ed1MrZ9jhvb2q/BJUlJv1OWVvyr5RdKfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(316002)(38100700002)(38350700002)(6512007)(26005)(8936002)(41300700001)(5660300002)(478600001)(86362001)(4326008)(8676002)(2906002)(66946007)(52116002)(6486002)(6506007)(66556008)(66476007)(2616005)(83380400001)(186003)(36756003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nTfMMZ5i4RGK0XIs4JeTT6Z1zYenp6xMnGNVlxn83R0dYVdfL8u2gPpjBuTv?=
 =?us-ascii?Q?WyHj7xGGBFyMBQYejnT2uYPBaTYUTN9D2F62JGaByAqcsAcr5tpv+G9/CJjH?=
 =?us-ascii?Q?ntq/Xx8Bz4G+Ii7IqTia4kqGp4swu1vB1Jliy6slpHY8bjblh15U1ISyuQz2?=
 =?us-ascii?Q?mCFfOFVKicXD73NZYMvYBhjKQHe0ZZgJlfVw7amjJbhLQvKPm+3Ieby/xTlY?=
 =?us-ascii?Q?TkPALr307oKbHvn56CAj2QW6ZULMoH+TsP0jhD0J8aDIfLqNeY1idZ/hzJe4?=
 =?us-ascii?Q?MwGTviX32521yTEC/oqOfxpShvYDmPuqhI8PyOmiFKM6ZtJQXXqHortizZ1S?=
 =?us-ascii?Q?OVhUgvO2gg71Tw/u9Dci7WGCuQtt6YH5/pd2FuXzraydUhZO9UXoEgGAeCQu?=
 =?us-ascii?Q?SlMB1Sjz7UwgA0mevwucK9ORy2Kh1SEin1YJ/dAS58MA2+vD4U9RB0fuQBre?=
 =?us-ascii?Q?x/k06zKJmuoeSqyI8becxJOkVcy8mCdbNghsBkMmwNERh/dy75e8MO/nc290?=
 =?us-ascii?Q?1cZaMvPY4IyT9dRYRMSC06OceVTdmhsXDLdCUKZR3m9myAplTKzSFBxdb/aS?=
 =?us-ascii?Q?ccX/26icX9f9r2zn59M5r6eEyKz8A/CF7le7aiqRrOTSUbNm/7r4b+H8AeoG?=
 =?us-ascii?Q?lyVuLavmkUqB5NIpIjtlsnjxBSczCXlLocCSfYixgAcF0nAzJfEcfRg5bvD4?=
 =?us-ascii?Q?/r1iC8iVDkXPRkoq1YaGxzIgaotnuZ8T4ZMcMKxeEP5C2ixwN0l74K7jN82W?=
 =?us-ascii?Q?WXpo3pDK9aYslxhb9awqEhKUBVVmfByIY9BxJK/7ScHVmCJhyr6n7KH864r7?=
 =?us-ascii?Q?B0a0sgcGPJJS78L0yGqy/28ZWsWL+LAbjfX50vyVQDn1IOUux+PqXlH4JjrV?=
 =?us-ascii?Q?bAR9l7dFaulAPjWCO3YkiUQTMOGY8tsxnjHCR9qT2pixuQM7YHtI23KEuT6D?=
 =?us-ascii?Q?XEtnfwiha1gIOO5MbLdBCMexl9PSBJs8x9cc1ZhvX6wzTYSX9TsHwysnjOq6?=
 =?us-ascii?Q?kTTOMgxt5zuE5XcMipk36P6UUgP6YKSmljADyhHHdxP4r4bjHmCxMmprFKCL?=
 =?us-ascii?Q?b9d83/WjmK88+Gq4ZcdJe0Tf+zE/wrDxUSsngGxWM7o9hZaCwItE+W+ohLR4?=
 =?us-ascii?Q?grBPpj0wlZDI0UpfC/FXo7Ibd/rOsDJRX0u3OjrrmjszRvNErY+3WDHz9BR7?=
 =?us-ascii?Q?rZC3VnnONGxw0EuLk2eyKkQvVc7mFFD932y7TCLvLojCAtQnUivccB20IRVY?=
 =?us-ascii?Q?nr74Ci16Mk5oAFv0XMyg8DdvNqfKoCQrYSHFT17iBDUvzinRDNZNSnGOf3PG?=
 =?us-ascii?Q?iV2ze4aV7+VSfckutiE2dlXz8iag/I/ZXDINSur6INWeo9HuAzJ5xZGKrIgG?=
 =?us-ascii?Q?bZHaKwCyuouPgvbFKndDBemg1U52dAO8/3IpJMQwygPhukDX0XvEmtVomF8B?=
 =?us-ascii?Q?lmvIKGnRz67j1EvCDCR/Jl6l7TLdvcP4jocVfd4O3rAXmQXmKbJSOuILqIdr?=
 =?us-ascii?Q?2r4WeF9CodmY5NQFAQKKRKySYVE2QEKm/vcruBZXOGl27n27zXaYP6le+HDJ?=
 =?us-ascii?Q?o//VJfW6sHj2X1BYGKktwdOgulkIWn0Mi+w/EgrHP9itZHUYT78Q2sPatqV8?=
 =?us-ascii?Q?2b5r53mhDoWG3eJf02clAMw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafbda3c-9a77-4f5c-22c3-08da8a3621c9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 03:17:12.7449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrZJfBy+JmmlDetEyIRIt/+8U3A+h/1zIKJFATw8a+kNWs95A6AspDeMTJ7SKfJ46OI9qeiF+py849DCOjv4RXM3Wvlm7r+vsl/Dk58p1G6JQovtuDJuKFV23n+WpFq0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2675
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current soc-pcm.c has many similar code for error case.
This patch adds soc_pcm_ret() and share the code and error message.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 84 +++++++++++++++++++--------------------------
 1 file changed, 36 insertions(+), 48 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index cbb3db53321d..1f55f8d40d5e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -27,6 +27,28 @@
 #include <sound/soc-link.h>
 #include <sound/initval.h>
 
+#define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
+static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
+			       const char *func, int ret)
+{
+	/* Positive, Zero values are not errors */
+	if (ret >= 0)
+		return ret;
+
+	/* Negative values might be errors */
+	switch (ret) {
+	case -EPROBE_DEFER:
+	case -ENOTSUPP:
+		break;
+	default:
+		dev_err(rtd->dev,
+			"ASoC: error at %s on %s: %d\n",
+			func, rtd->dai_link->name, ret);
+	}
+
+	return ret;
+}
+
 static inline void snd_soc_dpcm_mutex_lock(struct snd_soc_pcm_runtime *rtd)
 {
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -832,12 +854,10 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 	snd_soc_runtime_activate(rtd, substream->stream);
 	ret = 0;
 err:
-	if (ret < 0) {
+	if (ret < 0)
 		soc_pcm_clean(rtd, substream, 1);
-		dev_err(rtd->dev, "%s() failed (%d)", __func__, ret);
-	}
 
-	return ret;
+	return soc_pcm_ret(rtd, ret);
 }
 
 /* PCM open ops for non-DPCM streams */
@@ -891,10 +911,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 		snd_soc_dai_digital_mute(dai, 0, substream->stream);
 
 out:
-	if (ret < 0)
-		dev_err(rtd->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
-
-	return ret;
+	return soc_pcm_ret(rtd, ret);
 }
 
 /* PCM prepare ops for non-DPCM streams */
@@ -1060,12 +1077,10 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	ret = snd_soc_pcm_component_hw_params(substream, params);
 out:
-	if (ret < 0) {
+	if (ret < 0)
 		soc_pcm_hw_clean(rtd, substream, 1);
-		dev_err(rtd->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
-	}
 
-	return ret;
+	return soc_pcm_ret(rtd, ret);
 }
 
 /* hw_params PCM ops for non-DPCM streams */
@@ -1627,10 +1642,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 unwind:
 	dpcm_be_dai_startup_rollback(fe, stream, dpcm);
 
-	dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
-		__func__, be->dai_link->name, err);
-
-	return err;
+	return soc_pcm_ret(fe, err);
 }
 
 static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
@@ -1830,10 +1842,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		}
 	}
 error:
-	if (err < 0)
-		dev_err(fe->dev, "ASoC: %s failed (%d)\n", __func__, err);
-
-	return err;
+	return soc_pcm_ret(fe, err);
 }
 
 static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
@@ -1870,10 +1879,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 be_err:
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 
-	if (ret < 0)
-		dev_err(fe->dev, "%s() failed (%d)\n", __func__, ret);
-
-	return ret;
+	return soc_pcm_ret(fe, ret);
 }
 
 static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
@@ -2072,10 +2078,7 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 	snd_soc_dpcm_mutex_unlock(fe);
 
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: %s failed (%d)\n", __func__, ret);
-
-	return ret;
+	return soc_pcm_ret(fe, ret);
 }
 
 int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
@@ -2244,10 +2247,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		if (ret)
 			break;
 	}
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
-			__func__, be->dai_link->name, ret);
-	return ret;
+	return soc_pcm_ret(fe, ret);
 }
 EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
 
@@ -2418,10 +2418,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 	}
 
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
-
-	return ret;
+	return soc_pcm_ret(fe, ret);
 }
 
 static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
@@ -2458,10 +2455,7 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 	snd_soc_dpcm_mutex_unlock(fe);
 
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
-
-	return ret;
+	return soc_pcm_ret(fe, ret);
 }
 
 static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
@@ -2494,10 +2488,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 	/* run the stream event for each BE */
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_NOP);
 
-	if (err < 0)
-		dev_err(fe->dev, "ASoC: %s() failed (%d)\n", __func__, err);
-
-	return err;
+	return soc_pcm_ret(fe, err);
 }
 
 static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
@@ -2587,10 +2578,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 				dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 	}
 
-	if (ret < 0)
-		dev_err(fe->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
-
-	return ret;
+	return soc_pcm_ret(fe, ret);
 }
 
 static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
-- 
2.25.1

