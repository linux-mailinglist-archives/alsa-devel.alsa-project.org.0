Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF16D8B92
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 02:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F35DC3E7;
	Thu,  6 Apr 2023 02:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F35DC3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680740240;
	bh=GEUdF9JsMfSOLFAnhalNoSjqblqXpNVqiKG9YQ2+qOs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ph5Vot3RcgCXxsp/UQaqL571O2kehUNTRfTNg1PF8mv1HJQjb6hMRclrFUL4eO4Qz
	 svCf/dPOe1UJFYAYMdvUJYzyf4E0vSP9OXgAajM5s//qYqWjfEXa6hNaGI/wgJPZa0
	 AwZRGkTObGLGAIPCqMYi2WKsV9GqMW2SQj2oqj4M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DA7F8026A;
	Thu,  6 Apr 2023 02:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0FCF80524; Thu,  6 Apr 2023 02:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D07AEF80448
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 02:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07AEF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=l/8RIlKT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezSb9W3JkJaRGxhOTuwyzE6RpVSsPvFN8pkWupnN5GlY691zHUYHimZ4a8e4gznzVfZCqreUwEzfBjG8WlMmkzpSklxN6Ow/w9hjQb6xDXYPrgaeLHhgKyHpYyNY4X//50top4FaGTr/6tr81ENHYAxWP2eRUpoC9VGxL/gpinefaUWKcWSH4/iT9hChkM2dtfF/9wSaUAz9t8VYwIgGCZJw/73NABtlIyJddDC8MvymkSR3DX3amPAr1ahffUWu+hy39Qs/MQjq8qyQVw9Ab/Bf+Oqa+aRnQnMHyR3cG+aoZ1jRtJaD7D6i4FEh3O+bUZRKSzuUADQ079QpNZUUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+RsXLhX5apQtwR1gnZ0I9hKnwPXJ32PFXFN1MbLkcA=;
 b=UOToKTi2H2QaXyuxoyUYXSPBsz/APNe+6+iZ+jBlJzRcjgGcjVood/MCQ4QSwU9iKJPbWMiliEv4X+gwCdsijpUS9wbS79InevwvP8CSoZ9w+DDmQbqNQ/Rei1Qo9aXa9pNTIVVkwNxBBjuT9opJeyTrnT0fwlpN7OrO8MPmHWpGsQqnhYpZOIfqi07omn+JjaVz4InUH+XXKhPGpeJMOnwzNSiy/oN9pvWHageMG55P6HPIxx8IYW1Ja65VDlVrtRV1OHYZLx12WYMliTHa96W1vzJvaDJvU4Q2oR1cZ2745eNdX7sjIIdo76SZtpCgLqYFwD8AoLDf2SR65AhLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+RsXLhX5apQtwR1gnZ0I9hKnwPXJ32PFXFN1MbLkcA=;
 b=l/8RIlKT2feLV8vEU09y595/iRXjxWmVZ29Oo3OsaKISVjENd7d007HeUitNfVHIsV2sVcbB9ljcmNKr3WJ2GBLMQjee5iDHWh/xsnVVUgNrDHYd1noziaPEuUX/6cVTVyff9nCcRFGcrmGlGjkH3tO3141GXQK1vWy5Hq9FJYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10905.jpnprd01.prod.outlook.com (2603:1096:400:3b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37; Thu, 6 Apr
 2023 00:16:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 00:16:11 +0000
Message-ID: <87bkk1x3ud.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
References: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: expand snd_soc_dpcm_mutex_lock/unlock()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Apr 2023 00:16:10 +0000
X-ClientProxiedBy: TY2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:404:42::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10905:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ae41e1-bf4f-455e-ac28-08db36342037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WxX3iBaFccP1Xg1iFKBLNBuJl9D99ikF9vb9O1Itva9vgv0DhWRmFTkbptZdRrGqcWFwU20bpOkh6w3Ytsai8750nrpzfiCBd1/4n+hlj1dT6UkCDoo60oxsoMhrrtKFrkcp6VIar3+97pnHG1UAZhKCeYTh8UQmU9iAMEpPzRLS3I/IMzVHJZL86mwJUXHKJ48UewuZ+iWVjJpVc5H9muik0ywMQAVap2s+V4PWOjnNQ2CLAQuFJ9GU0k5o6Hu9chKMib9LYNHs4wrq+iQAJHqOE0MbRP8Lv6FW83iXxhvqGGaYKzU8A3GRREzruui1AnBEV+BFQBdyOHI9/nScsrrOt2MIclAMYewH1uWPvflSM200s7OqLyIJBpt3AKAlpTaxcK5O9i+1wxSAKfyb3OQ842DPUr74scFU2oZ9IQaz6Plc8SNHLijFQcq9W0vNVhn6yK/wgCKPeHt1REmJZu3v6u6g5ODbtiGtzXvlrNU8MzQfn5likQfN7nfl73bP+yMWHXLOVAd05fnYM2Y4KbMBUNCXMks7yFCWvdnVAou7kqiwc5zh4qSVvISB/1IyRYPfMm+ljS9Jx10JHH3sZzjHAE4cKA0UDa78euKJH8a8z1SCA46Gbpjw6o7f/ePpOQbg4vUG/fKl9F/onRLW9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(38350700002)(38100700002)(36756003)(5660300002)(2906002)(30864003)(8936002)(66476007)(66556008)(66946007)(8676002)(4326008)(6916009)(41300700001)(86362001)(6486002)(2616005)(83380400001)(186003)(6512007)(6506007)(26005)(478600001)(316002)(52116002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DvArpzqKXD9ataZMlHJvouYPIVYnEgdHeRvbfDTdYSUPmBZPSZOrE74K8/8p?=
 =?us-ascii?Q?pVJpqFFHZRdzYBJTVVERMlHhNChSZR56OF/obsuOhVoVw+OHTiNt94FqF/NN?=
 =?us-ascii?Q?/nQAwwtxk330UdTnkvqpNRyxHkUMGN57aXmoySUjczOrvyxFmf4yfRb5VdMB?=
 =?us-ascii?Q?ZkIw2nW4TZ46H/yiROSCS4YMZ3wWvm8cJ7CC94W6+SmDgF2m9zTmDhDOvE/3?=
 =?us-ascii?Q?6nbkleENIDPBAgrj12/LSkQYUJcAwBL4upEcMnec2/Z0WdIbeUJVKcHNulx6?=
 =?us-ascii?Q?oHQZ2yzqVguuCIDzwlSwb4FqTyjicqov2KsXVHfOCsfN8h1mFsCKH1d8hZwn?=
 =?us-ascii?Q?YQmFckQMl8+6N1E631au18mD8ljomqG7RQOTPcGW/1XxfwCCM0GNKE/sD+iz?=
 =?us-ascii?Q?r2jLNXpruDGmyMcrzY3gxn0+ZXPP2B7mUKL7FZ5HVIyg5I6klpt1ZZKN6p01?=
 =?us-ascii?Q?ZuxiV0bYhUImNtP5i3P2b8gAuC6ehpjZ+6P2u0yMnDnO+ktvnGAIqHsLLuaL?=
 =?us-ascii?Q?vgRLeQYfLWnwVLdVbNO0ygc9QHinYgBnZ9wt6ariuSHjzjmbao4nx+Sjc2nN?=
 =?us-ascii?Q?jqpU8nW6wP6XYlhWyHVXA7q7ejhoQZpEnlbkhTw+XKlbRKWwVYghqYxg0b5E?=
 =?us-ascii?Q?Grefcb/OSIX5rLp45izaHjn1IqMGBM5NYD02gTJERk86SP1Zb+VE7fb46SK/?=
 =?us-ascii?Q?NAAdOZPAPhE6tT/sVCg931J2I29ahFUEQiePKMsvzk6kh3DfX9Ljatma4Fwl?=
 =?us-ascii?Q?kwM1fNbv6YLMja0KDBSbO2CM0Fxo5cve917Df6sQB87/yW06zc5kwN3cZLKa?=
 =?us-ascii?Q?OsAcJXBw/SD7SXIv0dLRnYLdpAA3TDHQGk0l4VbHCQAyOLv1IuvKSVfjF60S?=
 =?us-ascii?Q?3W5XkyPT/hHC6caOVACAlU93valhp+iMEHVk/mpwN1prKy3wZmcEPNpXm/oi?=
 =?us-ascii?Q?4Jc7looMKGYUMw22s1HkagxQUyttXajYYZQ6voLowiuNJ9A4mEIkaMfwELBL?=
 =?us-ascii?Q?AngpMfiHTL9nqTel/MkJKWfnBF20Q18kiGiufJrGtH2YCkDBp9luOpYLa5EQ?=
 =?us-ascii?Q?p6gxa618ZeIpmQoQCP2uAhQMtZDh5/pS14rzI5RfdwSNt5pvGyTiVN5cHxd8?=
 =?us-ascii?Q?Kp3my39drPexVEXWk6UwMpedh9iknOMSPMuAkt6XKM98VqsJSBtzYHWKlCs0?=
 =?us-ascii?Q?hNebPwFImmNDv6kpWBivvj/r56M6EQ0eNGM2EdGiOz6igWeWey01X/XY73o5?=
 =?us-ascii?Q?v+T9fu9AHzNA91iacqU4/+bU/6TKjQDSELdtsIjWt9dbBOYR3x+7/6kmuLJo?=
 =?us-ascii?Q?FkQb4gSAJ4Y2i35o1r/RklZ5laAXhTU6sz4JQbyjK3BPygTW6j3fp7irl4bk?=
 =?us-ascii?Q?25i3/0Q+xQYY9wVdbpU+Mrzz0TC+DlEXsvMJcWc2it0wDgfKrku7WUu3XYTh?=
 =?us-ascii?Q?AkvoOU0JYnheKRhOnnjxYwL7WD83Fn4TpnfGZOzX8dCaFfrnK4daiABxZ0Ur?=
 =?us-ascii?Q?EK+XkbW3TQpam7iki7KE39QOX5wH/S+yNSor1X6k7oUk7l9WAAcehI8A7atE?=
 =?us-ascii?Q?s6Ax6HqG8F24Zpf3AGRaLdBGnGdDukkhAJ8AXo48AwU40Cb5h06GykTKBkcQ?=
 =?us-ascii?Q?fGMwH2uYIyRcd5Gx+lJpYPU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 90ae41e1-bf4f-455e-ac28-08db36342037
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 00:16:11.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fc+BbqJLdpRoowHKIROikQhxRCNLAWPTvGH+FKioeIXKHuv66aj0k2ZHg3LHLalxFvPUUF7AmmhDpNjnXR85D9o6GoBDYvRKlOQrR7i+/Ba0KeSJpmHjZKFl18/7rc8s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10905
Message-ID-Hash: 2H2L2GMUWFJX665PAH65Q6YXBEEKQI5C
X-Message-ID-Hash: 2H2L2GMUWFJX665PAH65Q6YXBEEKQI5C
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2H2L2GMUWFJX665PAH65Q6YXBEEKQI5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-pcm.c has snd_soc_dpcm_mutex_lock/unlock(),
but other files can't use it because it is static function.

It requests snd_soc_pcm_runtime as parameter (A), but sometimes we
want to use it by snd_soc_card (B).

(A)	static inline void snd_soc_dpcm_mutex_lock(struct snd_soc_pcm_runtime *rtd)
	{
		mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
	}			   ^^^^^^^^^

(B)	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
			   ^^^^

We want to use it with both "rtd" and "card" for dapm lock/unlock.
To enable it, this patch uses _Generic macro.

This patch makes snd_soc_dpcm_mutex_{un}lock() global function, and use it on
each files.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h       | 45 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-component.c | 12 +++++------
 sound/soc/soc-compress.c  | 42 ++++++++++++++++++------------------
 sound/soc/soc-core.c      |  4 ++--
 sound/soc/soc-pcm.c       | 17 ++-------------
 5 files changed, 76 insertions(+), 44 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0e17e3230c7a..05004c048dd5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1425,6 +1425,51 @@ static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm_context
 	struct snd_soc_card * :		_snd_soc_dapm_mutex_assert_held_c, \
 	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_assert_held_d)(x)
 
+/*
+ *	PCM helper functions
+ */
+static inline void _snd_soc_dpcm_mutex_lock_c(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
+}
+
+static inline void _snd_soc_dpcm_mutex_unlock_c(struct snd_soc_card *card)
+{
+	mutex_unlock(&card->pcm_mutex);
+}
+
+static inline void _snd_soc_dpcm_mutex_assert_held_c(struct snd_soc_card *card)
+{
+	lockdep_assert_held(&card->pcm_mutex);
+}
+
+static inline void _snd_soc_dpcm_mutex_lock_r(struct snd_soc_pcm_runtime *rtd)
+{
+	_snd_soc_dpcm_mutex_lock_c(rtd->card);
+}
+
+static inline void _snd_soc_dpcm_mutex_unlock_r(struct snd_soc_pcm_runtime *rtd)
+{
+	_snd_soc_dpcm_mutex_unlock_c(rtd->card);
+}
+
+static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_runtime *rtd)
+{
+	_snd_soc_dpcm_mutex_assert_held_c(rtd->card);
+}
+
+#define snd_soc_dpcm_mutex_lock(x) _Generic((x),			\
+	 struct snd_soc_card * :	_snd_soc_dpcm_mutex_lock_c,	\
+	 struct snd_soc_pcm_runtime * :	_snd_soc_dpcm_mutex_lock_r)(x)
+
+#define snd_soc_dpcm_mutex_unlock(x) _Generic((x),			\
+	 struct snd_soc_card * :	_snd_soc_dpcm_mutex_unlock_c,	\
+	 struct snd_soc_pcm_runtime * :	_snd_soc_dpcm_mutex_unlock_r)(x)
+
+#define snd_soc_dpcm_mutex_assert_held(x) _Generic((x),		\
+	struct snd_soc_card * :		_snd_soc_dpcm_mutex_assert_held_c, \
+	struct snd_soc_pcm_runtime * :	_snd_soc_dpcm_mutex_assert_held_r)(x)
+
 #include <sound/soc-component.h>
 #include <sound/soc-card.h>
 #include <sound/soc-jack.h>
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 3cd6952212e1..ff25718ff2e8 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -550,7 +550,7 @@ int snd_soc_component_compr_get_caps(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->compress_ops &&
@@ -561,7 +561,7 @@ int snd_soc_component_compr_get_caps(struct snd_compr_stream *cstream,
 		}
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	return soc_component_ret(component, ret);
 }
@@ -574,7 +574,7 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->compress_ops &&
@@ -585,7 +585,7 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 		}
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	return soc_component_ret(component, ret);
 }
@@ -638,7 +638,7 @@ int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->compress_ops &&
@@ -649,7 +649,7 @@ int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 		}
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	return soc_component_ret(component, ret);
 }
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 6e74a6c48986..661e9d70994f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -62,7 +62,7 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	if (!rollback)
 		snd_soc_runtime_deactivate(rtd, stream);
@@ -84,7 +84,7 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	if (!rollback)
 		snd_soc_dapm_stream_stop(rtd, stream);
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	snd_soc_pcm_component_pm_runtime_put(rtd, cstream, rollback);
 
@@ -107,7 +107,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto err_no_lock;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_startup(cpu_dai, cstream);
 	if (ret < 0)
@@ -123,7 +123,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 
 	snd_soc_runtime_activate(rtd, stream);
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 err_no_lock:
 	if (ret < 0)
 		soc_compr_clean(cstream, 1);
@@ -146,7 +146,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto be_err;
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(fe);
 
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_process_paths(fe, stream, &list, 1);
@@ -182,7 +182,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
 	snd_soc_runtime_activate(fe, stream);
-	mutex_unlock(&fe->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(fe);
 
 	mutex_unlock(&fe->card->mutex);
 
@@ -209,7 +209,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(fe);
 	snd_soc_runtime_deactivate(fe, stream);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
@@ -229,7 +229,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	dpcm_be_disconnect(fe, stream);
 
-	mutex_unlock(&fe->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(fe);
 
 	snd_soc_link_compr_shutdown(cstream, 0);
 
@@ -249,7 +249,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_component_compr_trigger(cstream, cmd);
 	if (ret < 0)
@@ -269,7 +269,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	}
 
 out:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -327,7 +327,7 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	/*
 	 * First we call set_params for the CPU DAI, then the component
@@ -352,14 +352,14 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 
 	/* cancel any delayed stream shutdown that is pending */
 	rtd->pop_wait = 0;
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	cancel_delayed_work_sync(&rtd->delayed_work);
 
 	return 0;
 
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -404,9 +404,9 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	ret = snd_soc_link_compr_set_params(cstream);
 	if (ret < 0)
 		goto out;
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(fe);
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
-	mutex_unlock(&fe->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(fe);
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 
 out:
@@ -422,7 +422,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_get_params(cpu_dai, cstream, params);
 	if (ret < 0)
@@ -430,7 +430,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 
 	ret = snd_soc_component_compr_get_params(cstream, params);
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -440,7 +440,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_ack(cpu_dai, cstream, bytes);
 	if (ret < 0)
@@ -448,7 +448,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 
 	ret = snd_soc_component_compr_ack(cstream, bytes);
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -459,7 +459,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	int ret;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_pointer(cpu_dai, cstream, tstamp);
 	if (ret < 0)
@@ -467,7 +467,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 
 	ret = snd_soc_component_compr_pointer(cstream, tstamp);
 out:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9bbcff492c1e..4594505cdae2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -348,7 +348,7 @@ void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int playback = SNDRV_PCM_STREAM_PLAYBACK;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	dev_dbg(rtd->dev,
 		"ASoC: pop wq checking: %s status: %s waiting: %s\n",
@@ -364,7 +364,7 @@ void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 }
 EXPORT_SYMBOL_GPL(snd_soc_close_delayed_work);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1d0c3d57f66d..7247f44faa1c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,19 +49,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
-static inline void snd_soc_dpcm_mutex_lock(struct snd_soc_pcm_runtime *rtd)
-{
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
-}
-
-static inline void snd_soc_dpcm_mutex_unlock(struct snd_soc_pcm_runtime *rtd)
-{
-	mutex_unlock(&rtd->card->pcm_mutex);
-}
-
-#define snd_soc_dpcm_mutex_assert_held(rtd) \
-	lockdep_assert_held(&(rtd)->card->pcm_mutex)
-
 static inline void snd_soc_dpcm_stream_lock_irq(struct snd_soc_pcm_runtime *rtd,
 						int stream)
 {
@@ -2664,7 +2651,7 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *fe;
 	int ret = 0;
 
-	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(card);
 	/* shutdown all old paths first */
 	for_each_card_rtds(card, fe) {
 		ret = soc_dpcm_fe_runtime_update(fe, 0);
@@ -2680,7 +2667,7 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
 	}
 
 out:
-	mutex_unlock(&card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(card);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
-- 
2.25.1

