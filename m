Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 355FE83F593
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 14:24:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E46E85D;
	Sun, 28 Jan 2024 14:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E46E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706448277;
	bh=4cDjDPkjedHuoh/97wY65WiJBcvxlTWmSF1jcwGfocI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ELaCWRt33pL5FME+HjjHH427xfnIzWHefGD2WZ2vHTKgoA2WtPbl4wnAltOJsWiIu
	 QEHPRAFE36ipYaZk8l2Vgg6LwWKXL9uyYPjPn2bBhdr2WIsgnIQez4zepb43mdRFoI
	 jMNCSUe+B7o3hImbtLo8l+MH+wZy+mq93oqHwuHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3724FF80588; Sun, 28 Jan 2024 14:24:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 824A5F804DA;
	Sun, 28 Jan 2024 14:23:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E861F80310; Sun, 28 Jan 2024 14:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64F63F80053
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 14:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64F63F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=FhWxVo28
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9odu2UuyiYdN2bxzL3xwVBJdoiSV6uBztzA/9+PP5GE=; b=FhWxVo28zS+1TKo2CJ7t1/JIvH
	7NEgqD748M+HJg3Shsb/a4QhL+oWSmism4JArFHFCAu6nfFzxvJhO2NC4zqnOKbrKMwxufbQygeia
	hwdlvd+ZAeYOvf7XIoV5wPQ+Vmqw08B/Kh8Gy5Qkao1chspMW2QCeI5NpxMBAyHwqsS0=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rU58X-00000000B6Q-0siz;
	Sun, 28 Jan 2024 16:23:49 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: usb-audio: Skip setting clock selector for
 single connections"
Date: Sun, 28 Jan 2024 16:23:38 +0300
Message-ID: <20240128132338.819273-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru
Message-ID-Hash: WY72NBW3VRUDOIUIG6NAZOKPY6XIXZLI
X-Message-ID-Hash: WY72NBW3VRUDOIUIG6NAZOKPY6XIXZLI
X-MailFrom: puleglot@puleglot.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WY72NBW3VRUDOIUIG6NAZOKPY6XIXZLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit 67794f882adca00d043899ac248bc002751da9f6.

We need to explicitly set up the clock selector to workaround a problem
with the Behringer mixers. This was originally done in d2e8f641257d
("ALSA: usb-audio: Explicitly set up the clock selector")

The problem with MOTU M Series mentioned in commit message was fixed in
a different way by checking control capabilities of clock selectors.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 7b259641adb5..a8204c6d6fac 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -344,7 +344,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		if (ret > 0) {
 			/* Skip setting clock selector again for some devices */
 			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR ||
-			    pins == 1 || !writeable)
+			    !writeable)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
-- 
2.43.0

