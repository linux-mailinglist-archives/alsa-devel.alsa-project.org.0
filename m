Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A67104D1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D881FE;
	Thu, 25 May 2023 06:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D881FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990599;
	bh=jVO+YGsbwRnAzy9jREUYpNMZuswwebg6ihl8fGfpDtQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T94a7piP4mVUUyJd8xvVT7aiKni6lnLcPhnmyyQXtdy05a9e9mRLyDmsA8qZKJiVM
	 M2SCEZs/rdK9Jat7oNQsFu+OfovxoYUxKjZ/Q7BGjJWLcrjB99cEhSimecO57CagzD
	 sJRBhIn3E/lueHqBmbq2ktmKfc6eUAMPSAn0d5zI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8944F805C7; Thu, 25 May 2023 03:18:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA91F805C7;
	Thu, 25 May 2023 03:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D597FF805D4; Thu, 25 May 2023 03:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7C87F805C7
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7C87F805C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y+fXljOz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzGAfcZINUNNi9U/e2LDQbJhsuGp3Wm9+QSYlZrT5lCah0h7i6A71w8KU29ESOvJzRlXEluOlgYnxUh6jHLkT8dtaUzYumjrUSyu2duR5/PvRuE5cpz92Z1xcZeANj7H6BZ5EVqBHArI2ogcaSD09DAy9AxwDV3VG3O+NEd2VSLt3lef3vcI/ABlJ7DrV5QCFtkvuZFKQo6eTXoKsgs3hDvbgZNgqmVGrbGwXAE2rMbQg/toxDWXBzS+djQQzo84BTwGdxvwq1mt7uaK2n/YZBXgaFhiYBGlPdZIoXQSivyMLBsvQ7qmavAo7BRMheKzJzFte/5FRf0NiUhVO0m0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmQ6mb3JrwoxbGRKGzZ43ikrzMM7iiARHn29Pvf66OE=;
 b=IG4HXbDy3nciU+ufUjxSOi043XXQffXIEJ2YE9uDMJ2J5NQ/0P4shZmZUMkkIU+gp5ubGEsw+Y7xArPS8fvWaICIusG+9YKEijC+5B30oQn5YenShbq1mY7nFdctL4VsZYzhpxRISUj35rVBZmvYYM2/ZgQaIoUJyInv9Gk9CG5Bklrki3k/sEg9hjcDr3CCRdelFOeumKRc7Lxbwx9riaxiLkFw5128Sdg+Y4RHo8cqKvKb0oKkiDTIUyfIf1J7Vg9c3B7rYrEq4drQFQ93hsoaB/8Tbm8IhJ6IbmdnvFkTWlVbRwMvETFbin1Tab1QjuKgL+4geJrI7jTGGO0Bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmQ6mb3JrwoxbGRKGzZ43ikrzMM7iiARHn29Pvf66OE=;
 b=Y+fXljOznIxbfcTTAIjmIajgEEaifshfFOK3NwEVHr//8n+jqwT3UNUFhNFDJBFCmmHsg0l/kRln1P0lLtPolp5bcFD5z+bTuusG6ytlAG3MFnpJSEgyg3EFi+TOc0CzAzXnYY7Rcm1fiLm3yXHPYjBTqj1PiW8rdOdZqk7+Ch4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:18:03 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:18:03 +0000
Message-ID: <87pm6pgqet.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/21] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
 error
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:18:03 +0000
X-ClientProxiedBy: TYXPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:403:a::15) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 86db84e0-91c4-49d3-f85e-08db5cbde31e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3FWh4iWDNS1wmFYeHDURfC2UDvGoFxcWLo+JVtIsz/70SQM7SiMqHUPUMgDUXKCj1v/RJ5Tip3QTB5cfk6NPJn2g0Hzq/SlAjx9axtfViiC9j1whka575uNme+RAASdYIOOoEWrWgLLVwmUV9gpxoGO3TJ27/Eq27HjKtm5RwA47XakM9tGPz2hN5AZwharFHJktQHlVD1jCD6A1oG7Je59hDn1m8q0nMk8pjazlml0CKLLAhJ0w9jjTMytO/4gDYjcU0Y28xIhbpAJ3ggSat5RXVkixvzwMrCxKpgCER9DoTxLJIIjxm1TBRlqRh7ZZmF01zP7yYnAMGcHhblskGbJd2YJ2YKU+eY78huUqzlxCPldnntL7LSnaaTqYVANsGJJMn85/85e83PLXnSvqIh+Vl7b1aONdP8SmhVhoTJ0cBjMFsYUq1Hq91S44EYTKNGAKwTl4/yKSKKoGxA6wtMCU9Cj3aacPIhgzSMjy9S5Sxe41jqVtmlIMY0R1d91U24xgGoENmG49JWO/Xf8Ak0Cy3xHXAdLEByO9tvPKvrfxjSON70Kd6oIjLMvIQTxzh97bwGI6dV+40ezrQC0XZu9Qai2sU9pS1DGCR4mmECsUDQiYicmpihc/xVtTDa/Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?66BFLKZUa8c4ARn42qqMnRTdHtcyzxApe8ldCuTtqve79m5lPYgJVM93m9?=
 =?iso-8859-2?Q?nIs9CKl9H3YXWS0Fc1afkebuy3PFJJwJr0YKiyDx8dX3R7ybB6G68sdSqa?=
 =?iso-8859-2?Q?+2pmidO1+s7vfvFuNer3eu9VayNfvre5YPfYBtWr+NTkxvEPnH6kMzdUpM?=
 =?iso-8859-2?Q?wJinqvsSr/MeCsq8hn/GYwYEqpmbkBsar2coq5rpwxOIHMZPCaEIduc358?=
 =?iso-8859-2?Q?E+yuvcsYNLfVzwKLs5lV4JsTw8PISuaURRz8VW0bDTR8rXRt1pabhkIFrJ?=
 =?iso-8859-2?Q?FtfMhkZkivFGT9tVYKt6xG6vuE4p0rtFvRq+EwLZjHkFaTFqLp+D4xKWJV?=
 =?iso-8859-2?Q?xFbDXDXztEuHjXEdl7JKubpES9r9VnjCUCMRnNEqwC6WQekTCAZ8HkIE9B?=
 =?iso-8859-2?Q?YcZUrqVRNB8DuRTJ5LWqPNgVR8tHlkDzKCBidw9Riw3CA2VR8XpBHQ6vSZ?=
 =?iso-8859-2?Q?cB/8ZvQUfyCoCa6q6ClQWj+5VT6eoTUAnguK2dwlLH540fa2PW42fWOsel?=
 =?iso-8859-2?Q?MevoJo8VTmviPz6v7+KJXJGuF0w6pkd3vtkmRj9iMLp69hGihZY0H1qgt+?=
 =?iso-8859-2?Q?kcMVoLtGwhTNtwD/4mDwULdFElzwmKOVusKuYOq/Pb6Yo9oERRS4xnYSqY?=
 =?iso-8859-2?Q?t/FbVD8o+R7cUdy+vzZ7nDrsCSDSFXeDNoGu+XHutHyRdmzaqLF4lyFRgo?=
 =?iso-8859-2?Q?p71STfArhm1QYyYNOOpIn32eOn42SXfBnieAloCbJDDF4IeiWY8x9MK0iN?=
 =?iso-8859-2?Q?jSJ2wu2ga8pAk3Yl932P9eESkEq7SXxuNazkksAwZElmCN/4lT+1k5f0T0?=
 =?iso-8859-2?Q?IUzRU/K2aFZ4iNjk5DlG543as/IqBxbfncM/nfmZ7d/Wj4592f+1clWz0F?=
 =?iso-8859-2?Q?Xy81zqDztlAkwkM8aIrjUTXmOIe7hBnMaT6WCK19I4QD2bIE/65dczgUY1?=
 =?iso-8859-2?Q?V9nCPqP7AFEXw5cuYGkdX4g4F5+LXDhPK2NNoGHuT/3IN9d9cuik7MXu/G?=
 =?iso-8859-2?Q?ysrn2wFefr0ogpB3J/p/OiXbPxfFl6TZyueUY/e1Dzf0E7rC9ebXEzbzdp?=
 =?iso-8859-2?Q?WY08RuWAmNLFskciV5jAqRY0GFiUEtukRKkRnskw9hiCtFUSdvWsI4BBos?=
 =?iso-8859-2?Q?eo9ssJLLYziaHhJfwfdbky0k+DFMLsOqVLRBnf6V2/wAYw+Md3fk/wXV4s?=
 =?iso-8859-2?Q?EnEtoaE0eUD5ZMNDo+Lxi6KPhhALpNdSnmz8G27PdhqbnWagIywOIiZiFf?=
 =?iso-8859-2?Q?Am+Wpp8Qx2GAZE52L+hEkh/3AX25KmW9T4p3JeLn/df5UZe5ikcZ+p04Vg?=
 =?iso-8859-2?Q?cSuwUUR7wAfg06+VS6MJYmRBmqP/lS5ibi0YNNehgjHEoyxy4wS1qOI6Xm?=
 =?iso-8859-2?Q?DHby5vQfEGpPAKpkVoQ6/bJnts/NP/A+N6+m61EWRtpezSreA0wxaYVOYq?=
 =?iso-8859-2?Q?/fA/fOXfTBaiTWEWYzYI6MXnPKUaUIHZdhW8lGG29xnCfgaFkrp5Qw9dLU?=
 =?iso-8859-2?Q?6tVOQ8sWvnwWkHfO7DLJxJDqL5sahcTHmnXV/B6caVHkFBNIFi7zeblidR?=
 =?iso-8859-2?Q?H4UioXUbtsfRL6n851b9yaaoCT1QKlL4T6n7wnkDapR8ppY7alWwoH0+3/?=
 =?iso-8859-2?Q?Z2TXi9nNOrpWf8czn249JPH1JJ3JzKhTcc7ea/+sofVMVbjj+ZtC72wG0K?=
 =?iso-8859-2?Q?6y2nfZ/MkNpJRYkYrBw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86db84e0-91c4-49d3-f85e-08db5cbde31e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:18:03.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8u277nOZN8cAmgQR3ZjWlitKookZH7BUVCf9MLQx/1GZezwxs7EFsKDW/IhXoUtCGiCWiBLwu9+9LsCReMf+VffQPvudR4JaPaiQJScPzcICykY15mEhbF1+pgXW8PFI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: AVOR5ESNTMLKTFOLC5OTMPCRSKMEFAB4
X-Message-ID-Hash: AVOR5ESNTMLKTFOLC5OTMPCRSKMEFAB4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVOR5ESNTMLKTFOLC5OTMPCRSKMEFAB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) checks dai_link status, and indicate error
if it was not matching (B).

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic && dai_link->num_cpus > 1) {
 |			dev_err(rtd->dev,
(B)				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 |			return -EINVAL;
 v		}
		...
	}

We can use 100 char for 1 line today. This patch cleanup error code line.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index db3fbe1af2ce..47da3be0ff46 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2736,8 +2736,7 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 	int i;
=20
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
-		dev_err(rtd->dev,
-			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
+		dev_err(rtd->dev, "DPCM doesn't support Multi CPU for Front-Ends yet\n")=
;
 		return -EINVAL;
 	}
=20
--=20
2.25.1

