Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE87406FC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 01:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF40B1EF;
	Wed, 28 Jun 2023 01:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF40B1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687910116;
	bh=FkP958FUPduMYVL43AeFsQvNf3op3XAxaRasfftbmig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wpu1ARXCTi6fbYG7HWOJtiWsl4d1Ei7YbpYbHO+UY+n1MlgwRRabqGATeZKOGjvUl
	 P54LMYZP2LUUFpYJIqOKjdK1WUZTyTC18kelh/yIe63ITa5UUTJEJkARh3GHL15KHh
	 21+QlOG1QoIRU8U3jiRpWDUm/zmW0t+ORT2EyZeo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 447D0F80431; Wed, 28 Jun 2023 01:54:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2405F80212;
	Wed, 28 Jun 2023 01:54:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C13FF80246; Wed, 28 Jun 2023 01:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A74C4F80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 01:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A74C4F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=ZHHZ+ClN;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EEsXm7Dx
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 784383200910;
	Tue, 27 Jun 2023 19:54:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 27 Jun 2023 19:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687910053; x=1687996453; bh=+i
	LJcVYMKcSARNmROzcHiP4o7l8X4P/BgNXF/nQNUQc=; b=ZHHZ+ClNQUMqBz9yWM
	53QtSS78riNAEPRY4aBgOdWNLrPdodVCsk8D0ZaJ0KJCaB2BLx8aq9/zFXnVyjXS
	+7N4jvAxuScGH/bOQY3a3LorAQVg5AJhDRdM0Waq4/Tvgenxr7nXENrHLS6HmJP7
	sqThSY1m+5iYyzlGYzEKe4fRlrG3AMT2c/bpTO//o5D5A8DaAlEKzH8bneAdU+8n
	nqMdU9wdVF/yRVOdFJBl866defTR1BAYUSa053WsxBkViO8OQ1SQI6cV7JwDj6oe
	/Gbe+yASL9GquNzpNnWDONe5zAc9bpSxb7tMGJF35KoBb8KuNbZvm1UUfEVJBhVX
	/E6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687910053; x=1687996453; bh=+iLJcVYMKcSAR
	NmROzcHiP4o7l8X4P/BgNXF/nQNUQc=; b=EEsXm7DxADhLKQ+bvD96I4IE9MljB
	+6aJC87uBFJEeFJLxuMo88OUN3FWpasimnvW7DDZnpwIoiAZODk0WIamObdTCXAO
	jPEehl8aFW46YHKPuNeIICuBJiklTfJgYfHNGTkCr6aTa+4pc+BKx8QLpjeFtT01
	9rGfktTRe+U536B0ToaVSzW71essO31gbV1pxVYcz/cXiqjTSZzkAGVkMJWpOIWv
	fRSyVmRPTx6Fi8G9zDVk7Ftqz76MlyodGVXne5P86AbwFqgs6xuYmjnsxLcFAmHi
	A5uu3QsiwaDa5dNmCRMl0YHr0epp//XpKRWWoEeHHJDyCntuEU5vAyT8Q==
X-ME-Sender: <xms:pHabZJ-ZE_7xv0lQLjitn5Byrw_4F9SEje5sGyNPEgDTw_2w5ETKng>
    <xme:pHabZNte55IxBT7Xdgxd4BS8N7coFDPXjjoYkitR1UXamFcfeLwncFPgPUiofjosq
    4y1mhv3UeK6GnhlfcI>
X-ME-Received: 
 <xmr:pHabZHB9AL-q-vP7DszuGzRvAc8rDrMGtykiD4ToJPT2VErjN-ZqIzFVvp7e2vc2CzGUPrBkWLI6NK3ur9WVNarK9xyAfcdIN6B3qld_a8dNbA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtddugddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
    duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
    grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:pHabZNd0C8xctbn0JlKWNPqXeXbXW53CoxxoD5jxTck-m4D3ItAsRQ>
    <xmx:pHabZOOtUZCB5zYmg2hs-ekUSaTZHSUmGeqBLpToC7FyqyH7tDENdA>
    <xmx:pHabZPmXK30bnUBGF2ZAugfFHpTBQ9dHoxboFtG75dfGQ8ufhyY2Zw>
    <xmx:pXabZIXYdcZavBQ759BfgXgwdMRnx_zmTUGy_WJkvkcDGEbCDh7Ciw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jun 2023 19:54:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: fireface: make read-only const array for model names
 static
Date: Wed, 28 Jun 2023 08:54:06 +0900
Message-Id: <20230627235406.289970-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GSI6PALXGRQF5SOIYICEZCMLI2HM7EL3
X-Message-ID-Hash: GSI6PALXGRQF5SOIYICEZCMLI2HM7EL3
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSI6PALXGRQF5SOIYICEZCMLI2HM7EL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is preferable not to populate the constant array for constant strings
on the stack.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index 82241058ea14..6e84e4787259 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -16,7 +16,7 @@ MODULE_LICENSE("GPL");
 static void name_card(struct snd_ff *ff)
 {
 	struct fw_device *fw_dev = fw_parent_device(ff->unit);
-	const char *const names[] = {
+	static const char *const names[] = {
 		[SND_FF_UNIT_VERSION_FF800]	= "Fireface800",
 		[SND_FF_UNIT_VERSION_FF400]	= "Fireface400",
 		[SND_FF_UNIT_VERSION_UFX]	= "FirefaceUFX",
-- 
2.39.2

