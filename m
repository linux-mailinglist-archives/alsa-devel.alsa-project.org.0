Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A182B4F20CA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B4C1700;
	Tue,  5 Apr 2022 04:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B4C1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124520;
	bh=BDGVfy/7bbVK1x4CHW5xpcdkIqvJg9JDAjv3RAEOYyw=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsWv4O2wUCvwbn0UnmE378xNYPOg948MBXvECFAsYvuyV3bBMFP+fetkIymHHfx7D
	 pF9UZiXLZBDUUk1nnxBmk5vb/XrReNlsjCE6epCZs/Fmlb6RpfIh8t5zUUZ4PmeUzd
	 t7uM1h8ViGilMXzJY3jtmNpWLTQprmViyU98hxJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0597BF800D2;
	Tue,  5 Apr 2022 04:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4987F804AA; Tue,  5 Apr 2022 04:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13E2CF80526
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E2CF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="eEeXxxYt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoOrszCU59ldyafA5duweDqJcp7gtBzwSY0W7yacXxCb2Go6J1JpywT5L4DZ041gIdSARRVSHx3ApG76OvOrg4Z+ZisopGJ9+V2jD+UmxOhGbKsdlAtaCK7v2OQgF4uJNlZZKHy37aOaCsMcT4lK+A+svoqZC3TckJhtfIuWgIcuBBTFpx2T9WJFlC0239S7/adCc1OJ5oX0dBw/NUcS04IWI+JGzUnBPq0Q6yA4fxGAdRyQW3y5tW5LsIv5+olmB+FYuqRp5acRbm3U0pHRxxSVn1TfbC1SzQaOmjfJyIxxvJtIXyVkNMoESKNmG11PNh14prP0SoljBF8Ci4hkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V0hIt148PSHMO9I75I3AdXHUuS06mdxsktn1PrN4r4=;
 b=JQMDD+CX6qK+XeSZIMfRKF6SQsanM/gAMQBr+kQZNKP0UhTRIkbtKXLASm2swZQ8csT3KDkEYBaMY+egxr2qGPkWbZ7eiCmrGN2Q2OVQSxcNOWxpgAtI/3jv8ixrHejWiuurpjPdLXPHKA28lg43TqbQ4MJf+SBE8ykx1SVa0Hf482S6xPQqddF0BPuBkUKD3G6IhOEwi3SI/qLwPBVPM2XvZk0g9PZds9UwgeCddNAdzZXuuP74PYCm7Rge/1e403ZcFL7LliZ0SC6xGY8Eu8/5pBg0po2kplQnBZ1qRBvkTNcyxDcWa3TmsFAtGHIY5U7JzbwMtNj4p/MtaICl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V0hIt148PSHMO9I75I3AdXHUuS06mdxsktn1PrN4r4=;
 b=eEeXxxYtP+XDnUpgIqRzY7xRGIJgvlaO4I/QzkPV9PIEc2IopBccAss5oMc4NMMsCaIpUDoGu3xiPP6S0irqQznpwUu190jgflzr5zcIPVmRxiuCTjkOYrwiNkiq4BuflpyqL0G9ON50bCPgT5RoyQNKUxz+SK26tsvt/ZRIop0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB5095.jpnprd01.prod.outlook.com (2603:1096:604:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:06:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:06:45 +0000
Message-ID: <87a6d0p9l7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: ak4613: rename constraint to constraint_rates
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:06:44 +0000
X-ClientProxiedBy: TYBP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33794c05-cd5a-43f5-a7ce-08da16a8ef3f
X-MS-TrafficTypeDiagnostic: OSBPR01MB5095:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB50952C95554AEFCEB5E48364D4E49@OSBPR01MB5095.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opod5VFKBh59ZA8jdGOhA8iZInpqULhahdLigsXiJtIwtAiGaXjMbKlViNauc793C3lFb5qrKurGFNBPjR4RH+LomaECXB702ePl2bLKyHIGjFMFd8QPO8d+TVghRG6KREPR/PUCw5Ek0GV1UJHu/16mrGkbXZx1iW5AhbeWKvvgcqDrJGZfRgj2SJrB86uu2aEVscUkY3UOh/o6v/asxLjTjLRWNXiKIDxISXOA5AR/++CONqAPeYeAaM83ync3G+fMMEvGVDAIcZ6UZq20kA2i0ucToKxaNOWc5NFV7oWlmUf/gr7LTXbZPUDyUSomzJUtgrY/wUEUjRrXBrDUJqU0mVxLeUtJNmkQP2TcYY715+sPuT0/0Uo54foZRTOVqsyHGbavOb0prvp595J2/JQZuBWfr1TOx1DcZ7CQtpnBFPVM+WQ9Y5/spzkycCg8xWS4ursmv+ixbzQ4puKCAlH0OR9dxUUjpAPifURH00Ah5UxbzHSr1KQHRomCoCi+vVN+zZZ9fu4voKdIW0VM2rTUEhwIoCv7Jle2M6nNU7nxOg690PaVC3RySvc1CXvIl/uYq5BS4MCSGHnPO493EBVotSSw/a0OEu0p+QR7hqmvEWaAR7GoxvGfOETbFPXWvTSdBICJRW2L4KCvgTWMUU22yek10a0jCOpd2xSyZ8PdT7QA/+qMnEJcoUNq6Bms4+9fstnfKbF6VHikS8x3UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(4326008)(38350700002)(66946007)(66556008)(66476007)(8676002)(83380400001)(36756003)(316002)(2906002)(38100700002)(508600001)(6512007)(86362001)(6486002)(8936002)(2616005)(52116002)(5660300002)(26005)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cYjMAYuL4SGlKTwLDExHV2K1X5AEpf/8jwFtLeeu50G5IhRmfwoZHTKxPW2I?=
 =?us-ascii?Q?+P8l0o/Ghsdh1hTlTsxsNo+u8l2/t+tzbCcITJjFx6YvhBwguFuIwAjWSvT3?=
 =?us-ascii?Q?Ay9+7S6fr5rpkHAX6PIIAaCmWeRE9NfT/FF1Q8sEeeoYFn5VlC9faCcny4r+?=
 =?us-ascii?Q?oFFlPJDiTL8rjshXLIUNr435gcUJ/wWn9VzE7Yx3HIANguUB/VXy4ym9CQ/F?=
 =?us-ascii?Q?PC3BDBWpQrHy1tQyHr8sHLayQJWaUkwqrWCGqle77BrYSMNFtNFq6K2KEssZ?=
 =?us-ascii?Q?2A0VyI4vkIXn0G48Zm7kYBwnYRgIdINj4gz3gplqbVl9wgNpAW3/FqMKqFkA?=
 =?us-ascii?Q?8P9KkjjDkxEOgh8jkq23yL+8G4Sc+6C66vxqxMrFGybfzUUTxR4L1TQuSicD?=
 =?us-ascii?Q?F2J8oelY8rm0YV/yrO4/lPAh0VFWaqzvE+8lVO5E7vpPiYapfdb5Zcflc8Hl?=
 =?us-ascii?Q?N7ElUS4OXkiCILxGb8ZqOlJrww9sSw1en6ISZKzj85+H/gcemslo41Hi8YJX?=
 =?us-ascii?Q?4MueE5RLXItzg5gMp6B0C3cZgY+A2b9VMFggZ+X0AZzvmmY4Q7oa5OZMfEbN?=
 =?us-ascii?Q?ID9pIMTS+uKl5kMLaZmm6bY6lm6KJfEdhBTnPF4h/QLSTPgGTJFNxvt6SjUD?=
 =?us-ascii?Q?nTDynnYqPzU1PK6t1G02u/TOGQbBeceOQmdBUFw6wSZY7jrxK9b/800DmmSl?=
 =?us-ascii?Q?vJ6vWKk+TcYLWG/sX8mCQA6b129ONmC73Sa4QN8+TaQj2Py5ss+8aEMi563f?=
 =?us-ascii?Q?8dpaOWS2dSYiocvX/efMgznKyslCYHhJZpOy10n4CIAxBz9O+mYpaRIoI7+C?=
 =?us-ascii?Q?+osBLoBexxpPERdgkom/nk5dei5hFocExofMmHKu4YKq4b3r9gvR6E2de5DH?=
 =?us-ascii?Q?tpWttE4wJdaqCQ28dIXf6wcD7E8ZjngofiqyMTw6ykin9WXSKVnqBOY18uII?=
 =?us-ascii?Q?/tjUYXwVID3yp57yscrBaj2tWmu+dDwd+pyJS5FXQ59xTvOd70lfd5mX1y4S?=
 =?us-ascii?Q?yeGxmp9yZi31Y6Aq1UrB1DPi5Eio6wHjF3GOyVlzXJe7GJwIUnJYr6GFl9Fp?=
 =?us-ascii?Q?9BjDJdsWz+/20whxW9LGIIjgULSxKeltueQ25ikczDe68/qpXwxcz9IpDgZt?=
 =?us-ascii?Q?szVlftTYMq317EUdSLcAYuRYIvqW25JiksHVciolWdu13osxpqn3V8eGb56O?=
 =?us-ascii?Q?3FupoY1AwVmcB83cgCgRadid24VfSEjLcu0jBJEaifF/R+QzHS1AdgwarB59?=
 =?us-ascii?Q?Yf9wJ5Hog4jgUspEuyAeEV/beTiKNhqTCulF4aDwi8XGi+ewfKzfXjwooVFp?=
 =?us-ascii?Q?8ezwYeKwQ4IFqiqNI1scL/WGP12Sh0Nn40RrwxcsAC6o1Yc3PzB9Om5rapKh?=
 =?us-ascii?Q?SpGU5GhCqNbJPV21EwtGRlLgJ5yG1+lAFeYqqz6DQtpBTT18eMENHGbIuGPv?=
 =?us-ascii?Q?XTigFOP32OI/uTABa0TCIeViJv3+Mr9jgp9NEjoga2fUDx+imTxyA5gSQ7He?=
 =?us-ascii?Q?gNMiCQNYrD6y+BcWr9OGslH+A/F9V6dc5Vlx2CqZWjmVDRt1RWEHbT3NNHnb?=
 =?us-ascii?Q?dPEHiRRawt4Sv84xv3A3pFHzUFDCB27TTXnqMQJl5m7P2FSK8lNKjNR+1I8K?=
 =?us-ascii?Q?NbSRLckkH3thPb5LFPdsv/XD2Pdz7tdIJSk0+oSF4ovlCmdbjtWTGd/fXSmo?=
 =?us-ascii?Q?mYCRacHB/HLQS3w2uYqVnSNVSU6popFw9QbOClVR0UCgsJV//jjAmtDGzR0l?=
 =?us-ascii?Q?5jhhp+lq8+XrlfOgXHR1YCeBFe4zRlqPfsC2BDLkVKw6rA9NJIel?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33794c05-cd5a-43f5-a7ce-08da16a8ef3f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:06:45.1526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: su79vpqPvYoTW6IHtash/tG5qfyZdYTVHrCt5fz6cUWchtOZ/+xeWwJdYmhtGMVleR+JiaGS5ZTcuG1BPFwwBX15uQkX7C9JLuGrqNBRVy3vTNXnVWzNDtriugBj9/QH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5095
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

TDM support needs to use constraint_channels.
This patch renames current constraint to constraint_rates for it.
This is prepare for TDM support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 73fae6ffe92b..2ec6313e823d 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -86,7 +86,7 @@ struct ak4613_interface {
 
 struct ak4613_priv {
 	struct mutex lock;
-	struct snd_pcm_hw_constraint_list constraint;
+	struct snd_pcm_hw_constraint_list constraint_rates;
 	struct work_struct dummy_write_work;
 	struct snd_soc_component *component;
 	unsigned int rate;
@@ -272,10 +272,11 @@ static void ak4613_hw_constraints(struct ak4613_priv *priv,
 		176400,
 		192000,
 	};
-	struct snd_pcm_hw_constraint_list *constraint = &priv->constraint;
+	struct snd_pcm_hw_constraint_list *constraint;
 	unsigned int fs;
 	int i;
 
+	constraint		= &priv->constraint_rates;
 	constraint->list	= ak4613_rates;
 	constraint->mask	= 0;
 	constraint->count	= 0;
-- 
2.25.1

