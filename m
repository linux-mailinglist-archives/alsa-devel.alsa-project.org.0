Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3479B352
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:00:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F4784B;
	Tue, 12 Sep 2023 01:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F4784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476805;
	bh=yNp2LxkVhN+N667EtR4Kka7aItx4vpddhRWIzUP591E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lElXk+ZVisvbYUQQjyg7zkN+IBmf1lF3riofPI5RwAmD1feM33km8+OmUUfIsMHeJ
	 m0jwlcMOs4n9RuUC6NusbDD+ttPH1z3EkSkKa+QwVKtlReVpXvxACk4pd8+35dSmqL
	 etl1gMfMFYJ9PrpaHc7FzovIKvCJRG98AshI1Lzg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB90F806FA; Tue, 12 Sep 2023 01:52:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78497F806F9;
	Tue, 12 Sep 2023 01:52:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 672DCF8063A; Tue, 12 Sep 2023 01:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E0EF805F0
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E0EF805F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=igCFIGV3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCloqA+FmFvbkjx6i8mJwWE6VrXTWZQz2sr2NBk5HeYKaAT+7mYsXrZBp0Uc49Jt9FgnhS70MsiG/bxz/gf+nGPBoNtCaR/ahuiZk7F54EtGeVEw7seSU+FeVaFr1NFS/IXqi7xom3w8H394tsCy9gXZGM+kE0Yo743vZxcsH/lkQEXbvLQG0QqER5RrUA8ywu21NM59eNiFdhX6wIP8Xp0zs5PqQcC4Ap/EOS2vDHR5KWTiCTnUA6VqqQRgrhIGN9sLg4U1oa8dryjCA7ApCjwllqnQfpMYrF2OwtxdAvRy+L9YRj/rBmWSxfduMkfhM+FwV0vvk9oLczS/C1Weew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVNeOFBwbFABxhmKWbE4RWnAsHU/YQfPs59iIfe7JAU=;
 b=Wxbox63F/7BkbLPYrpqH2CGi0+ie4H+rJKmPHkoCc6tnWJ5svbpBGienn7mS2j45XYi4UGYnMRixnegwjj2tCB+p4YLSjoqopbVCYYExsVh4ipnFWUwwywzip/uXm0RToTvof/zyAIDvwiPSqkMIhYRIrXHCEM0+cke4XI27Qm80jiuOW/Spd75CPkKsBdNvsiqy76cW0oUdJT6Opemr39lk5ROYNQ8E+3N6uROTJqufGCJN6Rm2o+UDbcXVvH1slT6JcPwTAvMMwt7mVVH1fuMlK+kOaoXm3uOClXVQyV995Gcbyyqnz3zq5tUfi/T9qgc+1pFnqaeGipf42ancZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVNeOFBwbFABxhmKWbE4RWnAsHU/YQfPs59iIfe7JAU=;
 b=igCFIGV32fCTiTXP49yvH4Opq83LE6r9zDibRCuKIlMo+0H/nlltn52ssqaOoRzOc/+mTqTsSkj59B5Y3ko2KA2eDx2RD5fyuIBDrAWEI2SL8oSGVZuPDuUDXO+m0t0uTZou7RJQNWgGu/d/8RHpOleRs6CnL8ztQuYpSU1LLJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:57 +0000
Message-ID: <87wmwwp8v3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 39/54] ASoC: codec: cs47lxx: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:57 +0000
X-ClientProxiedBy: TYAPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: e952d1a4-dd3e-4ca2-519e-08dbb321f1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1k1OSmMm//J2BYAl9vwnuqCSYYTWJzbUYeGWRl09P4T0rD+BSFdcJjxJA/uK0Km+PPAK9oCKTDuKpPaP4kcCgavVj3k5wyogIB9jLxP93CzBT4aSh7bWST35a7X0FcrGsmPLw6h0n4ujrE4blG3Rb+avRapYV0pB3pJaibjThjI0q+6faT4zK1/7atcZx5erRjZUP8rZ/iy+EJJ99av9oOoaUObwe2U9UoHx5cN80sXraDP6p6r2zjVg+hgy0xQ1WCuHhsKHcrrH5xGcFu79+I6F2oPvEUQWm2K9T6fxsUW1C6CMVd7WSAguLVbIOk++MmA6s4ZALjFbovYTGmLhPbveuP5K4t6cqK6Sbo32ffHcV2nbUn5G8so2IojtN+YI97IVTsH80uEkRBSEL9+zzOBkPaeVTu/Nf9Q46ibpCAwljYitM3JblGNd4Ub4BSOVWBN8Q3gprMLmXnbbDqJBU0ajtlin4cbW/9lihJQoP9h/gpIxL1ZowiTics5NpZXNPQRXyoFV0USsmvpJm3QL9tXA4dajtWisWUNTFbRclvRWh3D+y0JFDmu9+Ur7q/M4OjQ7AzC8ww4hs0YgablTius2CvaalQnDIj8wYCL2kQFzjbr5jRwQTMQ6Qn7bTzbqq+jQa4dEy7Fu7gyYZAqkYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FnaZBEWGZfU1YRM8u72rObmNQXWu/AVARObhgynPVvOWFhxVQo00bJU7LEan?=
 =?us-ascii?Q?Es4RSSPLzid015R7vdse+kWSjsOZtZyejaw/SiGw7aZLLhjZY71rgaDjcyUM?=
 =?us-ascii?Q?4f4fLpDI+qg9FXcXiQqACv0DH9amW7v3YVvQnn7Lpc+Qy7bF0ijKrepvCAZv?=
 =?us-ascii?Q?ZkbOfB9lTsrwCewh5jDQhgpMi32gkhrtzSEyfxbkv2RRavfkOomcM1nYPa4B?=
 =?us-ascii?Q?oqpYgS3T1alFCc52+5ld/TbOEVbKCiFKyOrRANyZkYHtFJkKuzPjeSp2uejX?=
 =?us-ascii?Q?GaAahYWfH3PNXIldYnAPvRvyQTFz7uKqmPchlt64LjmuqkWolJomV+TykKAK?=
 =?us-ascii?Q?RJ2DC5xHYwLirCPG9o+oP8HZv45GTksufIa5LJOLB1wbQWjfJpQVRHgC0/BA?=
 =?us-ascii?Q?1XBCF1yTxSz+y8rj7M6iywhVX2PUQYT2N01MdAjTBfPVky+xZ0n5yY0T08kr?=
 =?us-ascii?Q?Vbttzsc2qTIFT1VqYSQvBzyQjXSf7ZD1SSuDB7Xxp46KG69i+dt3uMgwko/4?=
 =?us-ascii?Q?QeohGqIhgp+wrb/QvSid/87JYZbZZIGqbEn/xcPsUYsUejU2e3vRwpQOXbes?=
 =?us-ascii?Q?+aTnpFuqg79g+WagajqacYSKp/RrrfGm/o30yeYWs1iKltGQnB6qkm82ory4?=
 =?us-ascii?Q?IXef3Icezdxz2vKJ7KQaPTwZrqSK4pH6IqNYA+kidYo6iqcQrERcdXB2+598?=
 =?us-ascii?Q?H6sQiJbNo/eDBxaiR5Y9MbSPtTIwMDoWPHH12a5lf6P3wt4WzLRT1qtCQuRe?=
 =?us-ascii?Q?BmH3wcIZIsuKUq7FC/jEklvatg8zWrI51vDCc1dCvXi5o/g5HeeUcJgnMc5y?=
 =?us-ascii?Q?q3J+PnAwkk1JV8RXkUoQ6OuK+gdI6PR9Vdf0oswKFPBgAmXab3q4osTg9bYT?=
 =?us-ascii?Q?1Xd35T+1KW67XflJqhVQTTcylLRgWaPRDsHKycnsLwW4SkjcZbDbIx0NRiRk?=
 =?us-ascii?Q?PgcTAQFpsCh/sNcMLsmN4khxC2ZoF1sRLlud8IuakfoZGqPGa5EQk0ncv8Ki?=
 =?us-ascii?Q?mZg/K02ggBjOWX61RpCLIuTmWXNh9VCy2UaJ/DhojWrQpeyrVEglqMAnWrk2?=
 =?us-ascii?Q?5cfvCeH4jcY4RwjcwnBB0rOpTmepqga2Vshl4fmLYHrZS7L2n88/kgEhEey6?=
 =?us-ascii?Q?L5sqAq3Wy2+46H3/f/JF8bn/byr2PwOL9GAEyD4rg58pbxM2djuUW5i5OYPL?=
 =?us-ascii?Q?kkQmtPmT492CwVfQ4rWZIpW6HOm0BGpstEcwuB/rpvZMDX6X0Agj7+EECz7c?=
 =?us-ascii?Q?zYMD8PkPT4UJCHdQXoX6eigNowWKanTfuwwkoFIqKiqISTanA442SzM8mkR4?=
 =?us-ascii?Q?NfU28MTK5Mn0tOyAr7ZLCPxfiPGxrBUoq8k3DRLEfriuNC2z8d2IeDuNrlts?=
 =?us-ascii?Q?BxvCRbmCIQaecM6WUARbvuRzoh6peh20S7lugfa8PyVLqh2HE9Duc+1hWdoQ?=
 =?us-ascii?Q?COZIx9brPq/n2ZvmVCXrEmA2NDxb9RBzBESRP7RJpSyU/0Muhh1uaS1oHlfL?=
 =?us-ascii?Q?DyPqTUKS4LWAs/RiinUqHsp6PQscqLnqovASlVaDMMnyHVj8ti87V/ppbQDS?=
 =?us-ascii?Q?qotnmd7Lf+0pLAzjJtbP+tq9jg3HiPQz2n7wZFuiwHKs+8Itc+zBgrVOaIE4?=
 =?us-ascii?Q?qX8EUdpJjNE6JtWR2UqU40I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e952d1a4-dd3e-4ca2-519e-08dbb321f1c7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:57.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 86CyFGwrMoSf3mxjoorh6PJOVtU9YZM1TfsbQwpue60+WwhRRkdlFpzN2eQ19EGExzzEiuPg9frHRepI5LVRBVScGjQiH4snEpwiY58zZGZfTucZMxWJUTM3fD+DBEHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: UG47FFR3F5FVIMKG4EKJAU6BHPLTKD5B
X-Message-ID-Hash: UG47FFR3F5FVIMKG4EKJAU6BHPLTKD5B
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UG47FFR3F5FVIMKG4EKJAU6BHPLTKD5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs47l15.c | 4 ++--
 sound/soc/codecs/cs47l24.c | 6 +++---
 sound/soc/codecs/cs47l35.c | 6 +++---
 sound/soc/codecs/cs47l85.c | 6 +++---
 sound/soc/codecs/cs47l90.c | 6 +++---
 sound/soc/codecs/cs47l92.c | 4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index 1245e1a4f2a57..ab6e7cd99733b 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1246,12 +1246,12 @@ static int cs47l15_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l15-dsp-trace") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l15-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index cfa1d34f6ebd8..ec405ef66a8e2 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1080,14 +1080,14 @@ static int cs47l24_open(struct snd_soc_component *component,
 	struct arizona *arizona = priv->core.arizona;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-trace") == 0) {
 		n_adsp = 1;
 	} else {
 		dev_err(arizona->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a953f2ede1eed..0d7ee7ea6257d 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1510,14 +1510,14 @@ static int cs47l35_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 8276854818595..2dfb867e6eddb 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2452,14 +2452,14 @@ static int cs47l85_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-voicectrl") == 0) {
 		n_adsp = 5;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 2c9a5372cf51b..2549cb1fc121d 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2371,14 +2371,14 @@ static int cs47l90_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-voicectrl") == 0) {
 		n_adsp = 5;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 352deeaff1ca9..0c05ae0b09fb2 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1850,12 +1850,12 @@ static int cs47l92_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l92-dsp-trace") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l92-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
-- 
2.25.1

