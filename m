Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2683CDE1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 21:55:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7024D828;
	Thu, 25 Jan 2024 21:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7024D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706216150;
	bh=xYJVIJL2ocLD3M3GJdlapKVvrCU/7qNN3oE7Yr2gQS4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lzwJkEEl0kNniKcVDOvPT39ZYH0KB9JjbOrljbReL5b9kCNl7dZklaY17lzv4gM0U
	 ZGKtOjjoi3uCgQMqGwPy6vUKY3iSNjtpOr9hWpyLfOhOnAb1zNq7rg/fH0sPcVne+t
	 /dL86K540T5JGKhbaLEpRRxwJHT6wbBmiafP4GEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29876F8057B; Thu, 25 Jan 2024 21:55:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C11F80149;
	Thu, 25 Jan 2024 21:55:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DB23F8028D; Thu, 25 Jan 2024 21:55:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4982EF800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 21:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4982EF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=qXVCG/AR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IiSfffQQUFr9J5T+WnBjM0E4k0dpvmpjFIYfPhZ/few=; b=qXVCG/ARQgXh3t7se7BAQrWyC1
	9JCwAh1UBWhrB+U2plM5p2MeWCyxKGif7nvmQ3Sk7eeFjsmtgEulQckpIJGd8yyi1HfA2t13Ddlfe
	UgqOkasobRRKorBBStGW9WwfMSC+lK8iVCDPX6iiCI9om2JfRSFyHvqtGqU+RC2kDwP0=;
Received: from [2a00:1370:819a:c53:3baa:da0a:1172:ed3d] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rT6ke-00000002ELf-08WP;
	Thu, 25 Jan 2024 23:55:08 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Support read-only clock selector control
Date: Thu, 25 Jan 2024 23:54:57 +0300
Message-ID: <20240125205457.28258-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru
Message-ID-Hash: KBCBRBZ25CTD6CCCJHFKYHVISS4CCM4J
X-Message-ID-Hash: KBCBRBZ25CTD6CCCJHFKYHVISS4CCM4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBCBRBZ25CTD6CCCJHFKYHVISS4CCM4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clock selector control might be read-only. Add corresponding checks
to prevent sending control requests that would fail.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 94e4aaeafe58..7b259641adb5 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -261,6 +261,8 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	int ret, i, cur, err, pins, clock_id;
 	const u8 *sources;
 	int proto = fmt->protocol;
+	bool readable, writeable;
+	u32 bmControls;
 
 	entity_id &= 0xff;
 
@@ -292,11 +294,27 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		sources = GET_VAL(selector, proto, baCSourceID);
 		cur = 0;
 
+		if (proto == UAC_VERSION_3)
+			bmControls = le32_to_cpu(*(__le32 *)(&selector->v3.baCSourceID[0] + pins));
+		else
+			bmControls = *(__u8 *)(&selector->v2.baCSourceID[0] + pins);
+
+		readable = uac_v2v3_control_is_readable(bmControls,
+							UAC2_CX_CLOCK_SELECTOR);
+		writeable = uac_v2v3_control_is_writeable(bmControls,
+							  UAC2_CX_CLOCK_SELECTOR);
+
 		if (pins == 1) {
 			ret = 1;
 			goto find_source;
 		}
 
+		/* for now just warn about buggy device */
+		if (!readable)
+			usb_audio_warn(chip,
+				"%s(): clock selector control is not readable, id %d\n",
+				__func__, clock_id);
+
 		/* the entity ID we are looking at is a selector.
 		 * find out what it currently selects */
 		ret = uac_clock_selector_get_val(chip, clock_id);
@@ -326,7 +344,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		if (ret > 0) {
 			/* Skip setting clock selector again for some devices */
 			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR ||
-			    pins == 1)
+			    pins == 1 || !writeable)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
@@ -337,6 +355,9 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 			return ret;
 
 	find_others:
+		if (!writeable)
+			return -ENXIO;
+
 		/* The current clock source is invalid, try others. */
 		for (i = 1; i <= pins; i++) {
 			if (i == cur)
-- 
2.43.0

