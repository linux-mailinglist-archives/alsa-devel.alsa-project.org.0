Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3968FBF7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 01:27:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707A982A;
	Thu,  9 Feb 2023 01:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707A982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675902430;
	bh=I4zfv741cOHBtsvZ8z0o90h6DQRRji59RKvdy2xQ7S4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hse1FVMMFr1gmzkfFOaF5KO3oRMb1psUB0ZivW/hRxOCPEaYMVpLII0mM38Lmt+Q/
	 LyXTSOyVqnCs+Mr0tT4IhQu8fCf2C7msMvS9lvZQ8BuDvnuveT9gw/xN02HNqsLvhE
	 MdgTCo3WEXp+zLsOOZ5Nr4ZpWEbMaveD+7+eyPKI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BECA0F800B8;
	Thu,  9 Feb 2023 01:26:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A36F800E4; Thu,  9 Feb 2023 01:26:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 096C4F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 01:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 096C4F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=ayYPRFRF;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=JAcstYwf
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CBE605C01C7;
	Wed,  8 Feb 2023 19:25:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 08 Feb 2023 19:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1675902354; x=1675988754; bh=IS
	ylmDo1PvzbcG0O/hloppgEbrUHpBMoX+L9zeXLvYY=; b=ayYPRFRFQ3O6tqUwHW
	NoKdoFNG4g+jNwC8QtxiPqBP/vXCcxLONZVsRSGIEq3mljGsA7Y9/YykC05E7gSH
	/aCqDL+S4B7Er5sDY46+HBeGYOl+F6gUgrxAP4sgLtJJaZVl/Rm2TkVozN69PNd0
	iUTdcl/Snm8m+Tgh15EiTgVa9azxgvGPXx0016Jfrgmdq9EOkahEaN4T3nDRBQdF
	+M9eLylXPWV6a6m4d4R9w8aeHmu7FmstQfQkck6yenv9hMNAwRwbc8WnbDWd1CrJ
	oVVPv4Irk3eEDMdaVMRfwiDiGDe8yOe7MbaF3ypt1+tu/6vPzIEVe30M7nx6TVCW
	YqiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1675902354; x=1675988754; bh=ISylmDo1Pvzbc
	G0O/hloppgEbrUHpBMoX+L9zeXLvYY=; b=JAcstYwfD4mu4OiJT5w9gl+l0Zpcb
	icbmqhfV2Ct0bDzF5KU5WndzmQ/IiQzku1y+bA+3W0nxW5BmXTHJO145V5YlWjkw
	g+VMVCcXKcowPAvnjh4uIIeuZKGA50Y8bQuovyEdOL2hdaQC69ukeHOHVGRwd+gq
	q/HcviQonYjVj9979L8Cpd93iKwrHvkz4JfcB8LFlbVdQjJ3HUuyz3RfeTFPjIOw
	YTMVe0kKxt8+LojUoKdp6QuLell/DjKpPuOukDQDYhOItMSiven60x0M6s0Ze2mS
	kv7chrbSMVDQ3SJUVe/NJUuYlT94l+/nGqvFz1VDzrBmV9/TvtRaFnU1g==
X-ME-Sender: <xms:kT3kY_VlDhhLgUBZPPF7j2UGOpDyGmdPB-U3mfZj44gM9GnvQl_7Ug>
    <xme:kT3kY3mjjenGwVc8mCW_DGb7ZdYTdKhUkUrEjDDy1njq9PjC-rhkwrUjzxgcOItMm
    mRvLhTc2E2JqUHwsqY>
X-ME-Received: 
 <xmr:kT3kY7aoGUvqdkaAbnNIbYwg-MWAjiMP5xp3gklE2VfFQmeE3tOLd4cAIB3P4RB2WcLdySh_KxQ-3JOLh3u-NgAa31DPEkZ5mabUGHsP9gO5N77-AQDRCQw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtke
    ertdertdejnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpefffeefle
    eivdejffeltdekjeejgfdvjeegieffjeejieeijeeitdeljeejveeijeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kT3kY6XFK6hbc7X_H3SvMbMc3hrQMO6UaJKReU5GVbgmovN28E7KKw>
    <xmx:kT3kY5kplXRctn8q8Ip375Ko6hWGGiVUZys1po60uis0FNxMv8bXyA>
    <xmx:kT3kY3fI1C4l_pg7tFw6na2GS2pkl3urDumOhNcWuThPT62xkGRuHA>
    <xmx:kj3kY-xw-HJGM2WTvGdy8OIuo3zUFWAS4B-TPds-IZBdI-IKM6RK-g>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 19:25:52 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: ppc: fix unused function local variable
Date: Thu,  9 Feb 2023 09:25:48 +0900
Message-Id: <20230209002548.94496-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2632G6CDZRGKO5OQMBKMD5O22PFFPSD2
X-Message-ID-Hash: 2632G6CDZRGKO5OQMBKMD5O22PFFPSD2
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2632G6CDZRGKO5OQMBKMD5O22PFFPSD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The function local variable is not used anymore, while it is left.

This commit deletes it.

Fixes: 25a5a77ae0bc ("ALSA: core: Make snd_card_free() return void")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20230209104823.45899e76@canb.auug.org.au/
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/ppc/snd_ps3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 8d349231205e..a6cff2c46ac7 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -1046,7 +1046,6 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 /* called when module removal */
 static void snd_ps3_driver_remove(struct ps3_system_bus_device *dev)
 {
-	int ret;
 	pr_info("%s:start id=%d\n", __func__,  dev->match_id);
 
 	/*
-- 
2.37.2

