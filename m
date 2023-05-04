Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD36F6732
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 10:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E4B18F5;
	Thu,  4 May 2023 10:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E4B18F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683188620;
	bh=TXLB6fjKJqDX8DC0N9BkUsCrQoPOMMk12YFPBZ4Nijs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l0Pj5ZctSo9vcDJk0naXADNLtPVrqkKfipzLDBe+7TSseztINrI5aereWcSV9afDU
	 oDftB0LLgvy0pF2e1ZpQY9793lQmDFwXthT9+HeJ5u+tTvMxwciUnEDj415ssVlODB
	 SPaskxOIr9be1gfs2l/8W2nExK/hf0J/f5WB2aQA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D22A3F80529;
	Thu,  4 May 2023 10:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3DE8F8052D; Thu,  4 May 2023 10:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 401ACF804B1
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 10:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 401ACF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=UWSahIDl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3ik0bMG+UJa+qoANOEZ/UOt1OtotuxaJaQsdYVXnreVCS0CrKn/0c8PUSOYKuZwLruPozRtjKFi92MYyEQ6T5AoDIudJrvrNGucgZzltg6JJxboeZmEoY3DgwAZEK7QsUra4PD5B8b25WGP/RiaHiFcbEwPQO/JUgUrOZ27EI+27YItN0Jjw6qA5fCW0HiYW+wCS+13txeVvqHdfJ2UoqFao+0vGP6StDLNkLoWSCpWyJ8Ck8JsEhWH4kx9St5hAIZDMNQuaMNNtc8VeeYw0EoN++1S3gtO66YkLciljKmO4SmFLKKBiPB+0d2QYS8zgNO19uttzarFx43Vb2Qnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2M5JdK2Hv4ihfBOGAso4Pb/eoIu55qXS50tgRpHtzE=;
 b=BHCM+DkSmtX95e8EIeLfoyMgbrKJx+SUriILASgrVQXRNOhC7oDURArtiqT4RNthpQOFRlwils5NrsdEJckyNycjx7BgYHKPTWhsBzDkTTNjpmb+DaklMMLnZxyx4JKllxvDh2kRrlSAXsmeXJLW6vTCBm/w5jNFMbS2G14xouV+8qHWfn67Ed7l46PSJKnI0O9di5Y8L/tW5LEkcBUDDX5y6oNeEQzMfBSVlEQpLDwtexXCjoANzNnIE9IEGnJix0EWptX5B2TbwY7q6bdkyS/G/2u7XowfIrg9Cnn8lYn/+Dmd8Y0tMR4/KqjeXQNb/TWXAZ+oz7xqm19+dmwlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2M5JdK2Hv4ihfBOGAso4Pb/eoIu55qXS50tgRpHtzE=;
 b=UWSahIDl2bMPjYPECR1//0VPS8KmPyVD2Vshv2tZmNg+w9jNyBs0HPyiqFlVTDkRJUmcTKqVmTrYARiyIM3bBAQQHIyjwng/TUuXhxY9JfR/IoImY7CcrIsC2IzqH9fBhGeG7BBEA9P9i5fPuGpBHw7pdJ5qoFHGCuGixcl6bT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TY3PR01MB11610.jpnprd01.prod.outlook.com (2603:1096:400:372::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 08:22:34 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6363.025; Thu, 4 May 2023
 08:22:34 +0000
From: David Rau <David.Rau.opensource@dm.renesas.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: da7219: Add Jack insertion detection polarity selection
Date: Thu,  4 May 2023 08:22:18 +0000
Message-Id: <20230504082218.24059-1-David.Rau.opensource@dm.renesas.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To OS3PR01MB6641.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6641:EE_|TY3PR01MB11610:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae75a3e-fcdf-4335-c70d-08db4c78b68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VXjyjoWwsauI9pBDgySi6SLV50aZVuXE5Iry1DE1nIrH/noSPiC29fmShhcux/AbspfdtvT/Py7XhiOR8SMgvaXFTLyhxU4sm1K8phLvSVVjDbDqYQRXbE7VaPHvjQI5AU5LX9TjmRukcAvdF9MxSa16VySVAMggFbQw7nsBO9sbC6xoS4HK93SRaWT2LVnh7Ot6s1A6T39TuR5nPG691DVj+HwUBAibnxVOgmxzqmTh0Ui7dgRoYNSh1yXd7zBjCM3tTPg2mpc/UVRrRgPOAiWjwMXmv7aIKt6Vv2WQyALOto83wL2t3B58gPgz2cc9CDz2Ffmqqw5SalRQXo4VfN/VJMR5eIX/2Ys3gR1sU5ctcAwWCZkAT86u3JJymLfl60W7U6NYzqsQYSZaCdl6CpRC2of3b+oxD+xUvl/7NiV7XhaJVfRcs6AkiGc2fAj5Nv/iL9FLq7S3jI3uAOMS1oF4K9L9ALdrBNmyM676KBMJkM2mB3uIlOhRWRYclY6qSYJIhQHnCf29QZV+AsWvygIz7EuUfSSgFT1ESP+GHvr/SUzReMgPBb7AuKd9ZCEcSHTUGNwToEBxBeX0JS65JuHxzQqVyB7XXA3Yel7wqe/aeFhhtNtqALAlpXh+gzWJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(52116002)(6486002)(6666004)(83380400001)(6512007)(2616005)(186003)(38350700002)(38100700002)(86362001)(103116003)(107886003)(6506007)(26005)(1076003)(2906002)(66476007)(66556008)(4326008)(6916009)(8676002)(66946007)(316002)(8936002)(478600001)(41300700001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XtLayPiadU28yMlLjq169ZzLz8DGJq0LvbmErDkG9cbDGRNJ5+kKNwYaK8Is?=
 =?us-ascii?Q?c4RgYfVDY0+v9vsCWVLuASsUj6GnfbK8yh+/bR6WAnzVl3nqYl+Cn1RrzeLO?=
 =?us-ascii?Q?CYnTowv8wjf9o+x/7wILTmiaWiYBcdVThscHXs5OJJ6sPxjsyIl922V24sh8?=
 =?us-ascii?Q?+CGUY6tO/9UftGzyDT/sT8NxY/geKNV6VL9kL2i/bmrCwbcQ1RnMbkaPZaEh?=
 =?us-ascii?Q?7p5CBM6nkd/nhZ0+2kP4bZ6vyfNJcPgxAgud1XfWfCMgPKo6N+WloQs35bK4?=
 =?us-ascii?Q?PgbzvxHPMmtrqRk9JATU0I1ZiCzY8C6Q+pa4/B+tkHrfx6yo+ttIg9MwYJj5?=
 =?us-ascii?Q?ZU0w++7MmnVWIDFhc0Rvjw6IzWZZLDfqct5oirHGvn1q5NoIBq9iq0poLrYG?=
 =?us-ascii?Q?ny2ciivZdrMyeYTH3cSHVeKQHyYzuIAxSmXfA133d2inZGgIq1zaGxx2H4JZ?=
 =?us-ascii?Q?OtM2YFHDrh+pGcV6xDVU9Cbc9VS4bBlbWLAdqM74o0g75p06/KbJ1wOGL4Sj?=
 =?us-ascii?Q?kitILw921anCaxwGf8Dvp7m5gXNE3Y9sOgtTmEZ7SOTjCtQVW9l1bApWxFXv?=
 =?us-ascii?Q?uInLzjGc4L2+E//8fdb+NG5G3MAaJDH/icerPtO38qFgmEsgU+s5tnbEmzqv?=
 =?us-ascii?Q?IF55AoQ6fgn7sTVvIPdAHvvgGEgRHbKCeDKTFZD6NoO6fbna6V3spJfml5Kb?=
 =?us-ascii?Q?apNA7RD8PT4I35ZheJYXF1/xrFe3aaPhO7WR3wbDWb2CeM+sR7OhTjf9zX6g?=
 =?us-ascii?Q?RATrLRlTvW24sJ6zvEcWE5ZRZ5jfzyhxalB2C2G98Q/7mZS01SuSX4uOtyg/?=
 =?us-ascii?Q?eTWVqYhiDwCey78nRraACzdp0BGGjHHyNm8IkXAIn7kYzUum68MH4ID4104w?=
 =?us-ascii?Q?LgOTq23d4FPWNalkdE+PDJLSU98wLQV/0VV7Prp258K3wJSlcTy9KCICqu1s?=
 =?us-ascii?Q?Nr+MlOHaG1PR+gzjATtSqPsrdIEynyGvyXIDGO9r6T5FbEzzlexyaXi4PsH+?=
 =?us-ascii?Q?OWXTRlIjppYR/9PhupT/ZLy7HotFkpSYAGByUedlpXmeTbnW8Er4WN3tGb7f?=
 =?us-ascii?Q?zCp9tQHs0OmToU0HhtSrPSt1/1B+mXlCi1j1nxJDk65VFl2xKWB+qrrFKRlj?=
 =?us-ascii?Q?Jtde0YtLieqMnjcu5Hv7r5RCVczyKFezEKDo7Jdns6D2OvzUJhi+8C0XENCU?=
 =?us-ascii?Q?oegUW7L8dkAzRsoZsD526cp9c3ufqLgrYFKC+wYGDZTYQVKcg2b2BOMjZ5KJ?=
 =?us-ascii?Q?wkwmYrqxhansSUzpD85vE7sTyq/CtGu8Cxxw2zyKOCwamab93NaFUUPh1K9N?=
 =?us-ascii?Q?zRKWgUhYe7hfOSrdZH5opH0HqA4t5jY6Y6aVG9VHYaSo8fKgL1d15N/9KDsq?=
 =?us-ascii?Q?vOL2hvees7fR+S3BzwHkwQRjr0tQ6pYXFPAsP52SnxBAmKK1W4GNQfQLBWxW?=
 =?us-ascii?Q?PVcLuZ95QjetWilYGxjIH5Jn1l730EW3t2g0khjwy+bNmTtT7F87Z39Pp6Ly?=
 =?us-ascii?Q?KNQAh1uU/G28qM5dA8PRJBdnJhKehBn/cs6ZchUD3vhulcWAK0lmoCR2PEEK?=
 =?us-ascii?Q?fGB8m0tac/Nw73fZlS6ts25TMEeGFJI/9uMMR7wqQvtlJhsZhxZpfsF4A9/7?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ae75a3e-fcdf-4335-c70d-08db4c78b68b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:22:34.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5Xp/6PDFewjdVSPFAX/i8ZWpIbBEs7o8pHYHxd1xet2siD1Uu3CTQXZFrJsFhev1PiCauSnSzoJmmhAbjzzFIu0TtpDrg/oVcZahnKuCjkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11610
Message-ID-Hash: 3WQFNMFG2YEDYJTNEPFST4TOM3O7DWVT
X-Message-ID-Hash: 3WQFNMFG2YEDYJTNEPFST4TOM3O7DWVT
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 David Rau <David.Rau.opensource@dm.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WQFNMFG2YEDYJTNEPFST4TOM3O7DWVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the selection of DA7219 Jack insertion detection polarity
- Default polarity (Low)
- Inverted polarity (High)

Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
---
 sound/soc/codecs/Kconfig      | 24 +++++++++++++++++++++++-
 sound/soc/codecs/da7219-aad.c | 16 ++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 79d2362ad055..96f934ad52e7 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -967,9 +967,31 @@ config SND_SOC_DA7218
 	depends on I2C
 
 config SND_SOC_DA7219
-	tristate
+	tristate "Dialog DA7219 CODEC"
 	depends on I2C
 
+if SND_SOC_DA7219
+
+choice
+	bool "DA7219 Jack insertion detection polarity selection"
+	default DA7219_DEFAULT_JACK_INSERTION_POLARITY if (SND_SOC_DA7219)
+
+config DA7219_DEFAULT_JACK_INSERTION_POLARITY
+    bool "Default polarity"
+	depends on SND_SOC_DA7219
+    help
+	  Select this option if your DA7219 codec with default Jack insertion detection polarity (Low).
+
+config DA7219_INVERTED_JACK_INSERTION_POLARITY
+    bool "Inverted polarity"
+	depends on SND_SOC_DA7219
+    help
+	  Select this option if your DA7219 codec with inverted Jack insertion detection polarity (High).
+
+endchoice
+
+endif # SND_SOC_DA7219
+
 config SND_SOC_DA732X
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 993a0d00bc48..9d16112cff6b 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -879,6 +879,18 @@ static void da7219_aad_handle_gnd_switch_time(struct snd_soc_component *componen
 	}
 }
 
+static void da7219_aad_handle_polarity(struct snd_soc_component *component)
+{
+	snd_soc_component_write(component, 0xF0, 0x8B);
+
+	if (IS_ENABLED(CONFIG_DA7219_DEFAULT_JACK_INSERTION_POLARITY))
+		snd_soc_component_write(component, 0x75, 0x80);
+	else if (IS_ENABLED(CONFIG_DA7219_INVERTED_JACK_INSERTION_POLARITY))
+		snd_soc_component_write(component, 0x75, 0x00);
+
+	snd_soc_component_write(component, 0xF0, 0x00);
+}
+
 /*
  * Suspend/Resume
  */
@@ -955,8 +967,12 @@ int da7219_aad_init(struct snd_soc_component *component)
 	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
 			    DA7219_BUTTON_CONFIG_MASK, 0);
 
+	/* Handle the default ground switch delay time */
 	da7219_aad_handle_gnd_switch_time(component);
 
+	/* Handle the Jack insertion detection polarity */
+	da7219_aad_handle_polarity(component);
+
 	da7219_aad->aad_wq = create_singlethread_workqueue("da7219-aad");
 	if (!da7219_aad->aad_wq) {
 		dev_err(component->dev, "Failed to create aad workqueue\n");
-- 
2.17.1

