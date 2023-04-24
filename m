Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51C6D0AA6
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 18:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9084B6C0;
	Thu, 30 Mar 2023 18:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9084B6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680192461;
	bh=mOGiNDWe3jmTokxzQ/ChGf3fEw1r3TCQLdUkdHgqAU4=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=N4UMoS3W9cPCvYOQtG/8kTxW3lz9aPDFyvQXYeKX+slsChC3lY+r5tr/0e0xddZm4
	 2zXBNUVYbL3btj5Wqgxplf4O7YGsjB5TXzJoJlKF1DRBiMXm0ixrvkbwF9Oqxbk0Vq
	 DsQfsHeiICgBstIL6RqbwDVy+OcmzXDugPCS/Wis=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA3BF8052D;
	Thu, 30 Mar 2023 18:06:35 +0200 (CEST)
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_sai: Use physical format width
Date: Thu, 30 Mar 2023 08:30:55 +0000
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Thu, 30 Mar 2023 16:06:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWTQ3CVP52EZOTW74PUFW5TKEBGYTBSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168019239506.26.13518757920586712702@mailman-core.alsa-project.org>
From: Emil Abildgaard Svendsen via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Cc: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8AFF80272; Thu, 30 Mar 2023 10:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F2FF80249
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 10:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F2FF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.a=rsa-sha256 header.s=selector1 header.b=gqtf6oPq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuWg3+mLVG2PQfTt2Y3bgo92sCCRoZQ8IShQdjH9HaOyGtajeLcbvPkHaRl3kLUbyOcIY6aOOyjhJpgDBZW+McTJhmVbmAJUW//5YpVVpN+ACF3g4YGAxXSWoFSGfrEnmCzj1P8lGHKLp9hkD9ZSPcHWmNFeuiSqQh8z9D2YFjfhuMUhrSBNO3WkEMaBpeZcCZ+VJD0nVbBtn8nE45MvDau3I5VgTVc7j8kyD11iqns5haRo3faPqopD3Cip8+ou4skcf/zmBkIbyoocdRyDIi6BH+0tibnxNG0I0EFsRE1E22AjjHouvqr/RmWC+Idld6rSmqpbEKgpe6KmVVxEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHAEYUL/rpZv5FHCIF9VwuuXDJRfgpLZz2YhR1kSJ/4=;
 b=jAMakljOkuhZhNn6mRMVQpYS1Ur8pKbYN6BVWovyzAVl70yriaxTQKCoBe2Nc5yWuFck9IOW+607vKI+YQ0++jrL0R/m/kOXmxh61mewNQs3SuqgYt2E6aSS5ACsUyedEt8Kn0sjzinFR8q0RU9VA7OzmXrY+zzyimw4oz2s3mQcOuT/0uY20h7Y8s74VQLNkywKXaz3W6Ydbu/Y3/JUple7uOOXy2w/KZnT0iKdR4mGrL0fVvQO5PttlexUkEZGFcuMsYNFNGPHVJu9FsE3hJfZHU4N5U/ZGebqhGaB8TAnTI/odoKD3I79EVcuEk60sGmcqCfx565Sh14Apyq75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHAEYUL/rpZv5FHCIF9VwuuXDJRfgpLZz2YhR1kSJ/4=;
 b=gqtf6oPqrDUgVEtVuM4jbYGkAXKiGNRKY1KjQeOy4DsbHdYpgMTX3GSpOrGL2vcJfM4wJoU/kPigfpympCqNbKkXa/clpC2Jits3qW+FGC0fUp8jeU6Bp/OxDW6WuhqvuNgcF2jgkdIv/JHWvC1FoPdgT0jWkPDndjxPHtGFat0=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PAWPR03MB9739.eurprd03.prod.outlook.com (2603:10a6:102:2f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.31; Thu, 30 Mar
 2023 08:30:56 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871%3]) with mapi id 15.20.6254.021; Thu, 30 Mar 2023
 08:30:55 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_sai: Use physical format width
Thread-Topic: [PATCH] ASoC: fsl_sai: Use physical format width
Thread-Index: AQHZYuHxlyQcfrXAUkmKoqNtMdKqsw==
Date: Thu, 30 Mar 2023 08:30:55 +0000
Message-ID: <20230330083040.77085-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PAWPR03MB9739:EE_
x-ms-office365-filtering-correlation-id: 3b23a0ea-8f6a-4cca-b80d-08db30f9146b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VTDmMJE/phbAgl3t3hv2E0w6PKfzxknXO59csdUyKRXpSGojdVwpX/GRfo91a6Bro0o1VaIvwkb78hphvR3A7+nYWqDTm8kUiHZ0WuqnbqC2Cd9HKF8hYRYa3RkU6aCQIJt22zYbswHhfQ14TLQ2do2d6M+v+u9f7ofkun75sg0m43hU3vLtXskKXdS1ORnKJv9pl9Z+4E+DZZ2BmY5pqHZW3xZg+bJmTbL3+5L/UtBE/SBtxf4f7I6nppMHlPBxSEfUweYBM4ekSqhvm8a5dewS/CsiGWLCCQkJVBcn3VoN2Pfz1Yi8eUwg5k2nVQPLw3ZYK1Vpwa2GvScv4Ym0itsgGHTazxr5dP0XyOeDLkk0NKt5c8z5LnMshakmTo0gHbOZJhRI5rPCuzIkW8YgngD3MF0k0aZfEiYngTcUx6ybQQeyIfQ03teGdWdOhv96jPs4h57dyWbT4ql8WnlKf0ZbAUNamqGXZT8OSRCgTpcfBK3/fbZ7BHWADGKHFcoiz5WnKgFF6X2WVOGl1VnEB4u4BRli1fE1wYIttUQXmDwKMcw7lGPVy+L55BIIfGOk4MsWZ0e09XfLuNSEh5yrZ2+AnQAS64D28JIrSGvI5hTQdO0wSNzi8jnYc2+mbuKr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(122000001)(7416002)(71200400001)(8936002)(2616005)(8976002)(5660300002)(1076003)(6512007)(26005)(186003)(6506007)(36756003)(2906002)(86362001)(83380400001)(6486002)(38070700005)(91956017)(64756008)(66476007)(8676002)(66446008)(54906003)(41300700001)(76116006)(66946007)(478600001)(110136005)(38100700002)(4326008)(316002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tp1nnqza4uTxg2vONHRcNf5AmfGNHp+41wwH0jaVPQm6iJsGtoMraqu/ae?=
 =?iso-8859-1?Q?E9OgyHjM1urrxkqG0HN+c0tpw7aNjEdgsB0AUJ0jtndMtcVK6qf3ChSAX1?=
 =?iso-8859-1?Q?c6eH4RLQ5m41MyYodPUszbstw24HBHzR0g03WiSAqpW02ovuCE9OO5dsUU?=
 =?iso-8859-1?Q?FaN3O4Qwj4LlLtNKGGfTDObGwSqP0rRfbYsxsz+NiRrFSYLmcrZ4TUqwaP?=
 =?iso-8859-1?Q?StQow2dNQ5icL19dYofgWnyuc79GnXiY/MxG+6eqHlUeoFz6qW1W2x7Zyj?=
 =?iso-8859-1?Q?pDDjdEUk9p203Dri6Gyql7LKWLsKu/tm0wNMF8QLvno+n8kcvVbbqaEqmA?=
 =?iso-8859-1?Q?BefmBpuhLICI3ZZdTfEom58GQHOVhi3X1ZBGzxqRNbcz2sfYmKU776UV2S?=
 =?iso-8859-1?Q?sBVKMHagNebq9+FNcAX0/jDZ6sp4vbaq1q4AwaD9T6RB2nopxixo68r66k?=
 =?iso-8859-1?Q?No39QP6nUPPbwSdiPacd/aYWXetRy2qWvxFfMs5Y9BABqqFLGA63zQH2ek?=
 =?iso-8859-1?Q?NwJLhk+wGmQtnjjdulr6xCdGOgieTCjFHisBpIWlLoWasnRFgNyBmaOpna?=
 =?iso-8859-1?Q?cUaLtPuB+GWVDPOqJl+9Sn5RchNdtgaIktQlac5yrgy3lc8ZHvcPjRTGwb?=
 =?iso-8859-1?Q?XwHWEhtfpD6Ya72MjNCiUK8+a41JszAET9n42xNAMVQD+QUWQfvbU/+720?=
 =?iso-8859-1?Q?DcWbbQwA4ByzZRtgYNr7QGO89Mh2UKVt5dn1TvLiWZIotPXbuAw2hNgFHC?=
 =?iso-8859-1?Q?8CzBi+0qcy0RcCrnDhCBIogLY31GawCV0P9plfoEb8iu/JsDApheKF1foc?=
 =?iso-8859-1?Q?yihGSlt2Ilkq5xpOcTQeEthi8JOnKNrmOhuEexUDwOBQUO7ZpzOYRNqs1g?=
 =?iso-8859-1?Q?SZJxAKOHBLrm+Pd5b8AE5IiuPZm189F3pK1qgRvAqXqSbmiLDJNwr+C6VZ?=
 =?iso-8859-1?Q?P/bkWHVLv8eStZr3DYxpI+u7ctGlEO+Lo7p4SCo5G8x6Xv+NsJQyZuDQ4p?=
 =?iso-8859-1?Q?6OPJMHpIS7Ceg8ZNqCWbzpI0/1G+x02Ht7PjFpsIw1Y+iiI8wZwuWPthIl?=
 =?iso-8859-1?Q?MR3GcQ7rSznZqxN3re3ZcsRf05X3B460KwZ1O3zG1Ka+h7cn58+Y3+CAuC?=
 =?iso-8859-1?Q?KejDuYAJMg8ws4cT53ZgwQ3s87rxoDFRh9XdAywN7DMdOoc3eQYX4OU1Eh?=
 =?iso-8859-1?Q?Bm4/EYnENHk/tVFpyIKTsOG5tgygtjJbNdhjOaBZGY4CA5nAJZsDuZHdXG?=
 =?iso-8859-1?Q?ErOc0eudO0lcZdJfPs9A2DVUqIXNmgxgH99A6j068kdmMwTek7+J+JdaNQ?=
 =?iso-8859-1?Q?6QEZ4Kyr5+hiCs7g0rtI2U3o7sYKDuYZXyCg3kln+hXbsvn+7Sokhmwm3d?=
 =?iso-8859-1?Q?95OM1MbnOrVLDZEUAScAOLbKlcXaRAjfqKFz/sKy5OdR7PHkGVUmKlOeUI?=
 =?iso-8859-1?Q?ujf9BDrQgN+Jg9GWnYGGCBvGJjedkg/O5bWlx+OXBlcoHJi8S3M2pt1gJ/?=
 =?iso-8859-1?Q?ygfihya4EoCvngST9ln+9KakCYXii/wn6Yr8XiFPWpgUGfenhE3eG7zj9V?=
 =?iso-8859-1?Q?jaRkUm6KlJNR8d5EjHvHrD3nHIk8zCK1apD1dR1AudC4Lz88WwHryxMOcF?=
 =?iso-8859-1?Q?ljfkAdGmLMj0faFxd4HhOwEyRogJ/xp2dyZz9kQSdFtMuNu9ZYMxcbYA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b23a0ea-8f6a-4cca-b80d-08db30f9146b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 08:30:55.0489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xKNGC+xAEB06mueZ5V3e8HaUHGo3k7HQxZhCu16gToJYOTaj5LvwQ77cBfPjNZd7u9UyWhbBA+htV+1YkVQdiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9739
X-MailFrom: EMAS@bang-olufsen.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CWTQ3CVP52EZOTW74PUFW5TKEBGYTBSO
X-Message-ID-Hash: CWTQ3CVP52EZOTW74PUFW5TKEBGYTBSO
X-Mailman-Approved-At: Thu, 30 Mar 2023 16:06:32 +0000
CC: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWTQ3CVP52EZOTW74PUFW5TKEBGYTBSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Slot width should follow the physical width of the format instead of the
data width.

This is needed for formats like SNDRV_PCM_FMTBIT_S24_LE where physical
width is 32 and data width is 24. By using the physical width, data
won't get misaligned.

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 939c6bdd22c4..213e2d462076 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -519,13 +519,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream=
 *substream,
 	unsigned int channels =3D params_channels(params);
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	struct fsl_sai_dl_cfg *dl_cfg =3D sai->dl_cfg;
+	u32 slot_width =3D params_physical_width(params);
 	u32 word_width =3D params_width(params);
 	int trce_mask =3D 0, dl_cfg_idx =3D 0;
 	int dl_cfg_cnt =3D sai->dl_cfg_cnt;
 	u32 dl_type =3D FSL_SAI_DL_I2S;
 	u32 val_cr4 =3D 0, val_cr5 =3D 0;
 	u32 slots =3D (channels =3D=3D 1) ? 2 : channels;
-	u32 slot_width =3D word_width;
 	int adir =3D tx ? RX : TX;
 	u32 pins, bclk;
 	u32 watermark;
--=20
2.34.1
