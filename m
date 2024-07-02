Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69E92BEBD
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873CBB6A;
	Tue,  9 Jul 2024 17:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873CBB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540156;
	bh=g77ovSQ6miv4V8Y2/KK0rlQf539EJlRxT4BkAGWRZ3Q=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GbpkGoifRpAvmENfanlcutfoqffws2/isX+KsusUhuDu0XfV4QsQXJk8wW3esDnqh
	 /iMGuZ7fKGbzPokQBSvdfWJeTE3xVG9e0T99qzcvYkxwdzKXhY/MC4WG1/lh0b8sgM
	 wuHxoBsg2gOCahqqJ/PSlrVxT98UDa5t/vAAlYOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AEBDF80508; Tue,  9 Jul 2024 17:47:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3A9F8064F;
	Tue,  9 Jul 2024 17:47:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFF5FF8025E; Tue,  2 Jul 2024 04:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.kaechele.ca (mail.kaechele.ca
 [IPv6:2607:5300:60:7a38::25:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76427F8013D
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 04:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76427F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256
 header.s=201907 header.b=D0JldWqW
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84207C005F;
	Mon,  1 Jul 2024 22:49:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1719888560; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=luv03lpnws4T7wkh4T7ewdycKUTmRCEz59nTd46EVRI=;
	b=D0JldWqWJh68EQ5jMmZSdriteHRCmoABj65ZDptpX933WkfmYnswH4ZioQCFjYKr0dQnPl
	0833ponbKUYzCUJtwGrCt3Pape/3AMCTmlK+7X0wBRT7ddRPaNHYIldBxdAV/hvvzi9TiW
	heOvfA3QMeNKxR/PMADgirnCJGZspys=
From: Felix Kaechele <felix@kaechele.ca>
To: Daniel Beer <daniel.beer@igorinstitute.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas5805m: demystify DSP volume control coefficients
Date: Mon,  1 Jul 2024 22:46:54 -0400
Message-ID: <20240702024709.626009-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: felix@kaechele.ca
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6RNLO4DQ6F5WJQB5JRTONEM5P47WXICT
X-Message-ID-Hash: 6RNLO4DQ6F5WJQB5JRTONEM5P47WXICT
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:46:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RNLO4DQ6F5WJQB5JRTONEM5P47WXICT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The original manufacturer sample driver code uses direct DSP register
writes to control digital volume on this amplifier without further
context as to why it's not using the documented DIG_VOL_CTRL register.
A thread in the manufacturer's forums [1] suggests this might have been
done to work around volume ramping being used when controlling the volume
through the DIG_VOL_CTRL register. When volume is controlled through
this register, reading and/or writing any register is blocked until the
volume ramping has concluded and the setpoint is reached.

Additionally, the sample code uses a lookup table to map decibel values
to 9.23 formatted coefficients. For posterity, add references to where
this is documented and why a lookup table may be used.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>

[1]: https://e2e.ti.com/support/audio-group/audio/f/audio-forum/1165952/tas5805m-linux-driver-for-tas58xx-family
---
 sound/soc/codecs/tas5805m.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index 3b53eba38a0b..59536c8b8e38 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -67,6 +67,14 @@ static const uint8_t dsp_cfg_preboot[] = {
 	0x00, 0x00, 0x7f, 0x00, 0x03, 0x02,
 };
 
+/*
+ * Lookup table for DSP volume coefficients.
+ * The formula uses floating point math, so a lookup table is used
+ * instead of computing values on the fly.
+ * Formula: round(10^(volume in dB/20)*2^23)
+ * The 9.23 format used here is documented in
+ *   SLAA894 - "General Tuning Guide for TAS58xx Family"
+ */
 static const uint32_t tas5805m_volume[] = {
 	0x0000001B, /*   0, -110dB */ 0x0000001E, /*   1, -109dB */
 	0x00000021, /*   2, -108dB */ 0x00000025, /*   3, -107dB */
@@ -196,9 +204,13 @@ static void tas5805m_refresh(struct tas5805m_priv *tas5805m)
 	regmap_write(rm, REG_BOOK, 0x8c);
 	regmap_write(rm, REG_PAGE, 0x2a);
 
-	/* Refresh volume. The actual volume control documented in the
-	 * datasheet doesn't seem to work correctly. This is a pair of
-	 * DSP registers which are *not* documented in the datasheet.
+	/* Refresh volume. This writes the volume coefficients from
+	 * the lookup table directly into the DSP registers.
+	 * Digital volume control on this chip involves ramping which
+	 * blocks register reads and writes until the desired setpoint
+	 * is reached.
+	 * The DSP memory maps are documented in
+	 *   SLOA263A - "TAS5805M, TAS5806M and TAS5806MD Process Flows"
 	 */
 	set_dsp_scale(rm, 0x24, tas5805m->vol[0]);
 	set_dsp_scale(rm, 0x28, tas5805m->vol[1]);

base-commit: 9fa5527b19b21848dfb09928ee66af1aac4a5700
-- 
2.45.2

