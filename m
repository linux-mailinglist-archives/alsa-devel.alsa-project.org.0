Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B228B7502
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 13:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A92584A;
	Tue, 30 Apr 2024 13:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A92584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478273;
	bh=a+ld2ZZvv7tLr1Bh9lNHFCONf/H70v3VGrtqOfYridg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=osTY083OqsTlqCECigab4/Q4Gan4NlUZZnvAAI4512DjUWz4RUIgi7ZKNFPQES/Sk
	 3AvyMQmfrIxkMYQdRQ/2CEd7GyAdwDR0HLvhE0kwTeKUH8jsJFdvifpo7+WTZgzrfC
	 JNabEtvFHypENDk2yseq51JGIpv8J0FhIS2eeNzo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AE6AF805B1; Tue, 30 Apr 2024 13:57:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6C8F805AA;
	Tue, 30 Apr 2024 13:57:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77EFEF8057A; Tue, 30 Apr 2024 13:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63E6BF80266
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 13:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E6BF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=DDY01gGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1NBwNIfTuCbQxkbHSRkHt/W+DlGXOXdraPP5tuRqp/M=; b=DDY01g
	GnhLWFUXavuTA87BFe2JQ2/EvQD2kgvTuQe4GQbFTiEyE/V2L7+o+ISIpvnOK8Ub
	B2enIIQxRPo8xZ9UdZbRRTLfAKpOUod5o/54v8zJitvaTNP71hVMUhzUJP9SnYhP
	+HNT2CPwCIQ/mo6JqwaoVOAhu0pu8T6So5A4E9kjCBhj1z5xmbJXWKhJWMVbOr7B
	bKitY6wV1yIo+BJQUcAqgmTNDtXux0a6O7yanJxKsfBRX46ihUEfx7hhf7R0YK9U
	gg1Ks7SHQ6FCrJamfNPH4b1u2+hksh4d3GOQVYfI518xTWRsAOS0Q5jUl20m6juB
	KEAA042pvMKbfZ1w==
Received: (qmail 2621585 invoked from network); 30 Apr 2024 13:54:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 13:54:41 +0200
X-UD-Smtp-Session: l3s3148p1@VbX6CE8X7I9ehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wm8994: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 13:54:36 +0200
Message-ID: <20240430115438.29134-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RYE646AG5KJZ4WEJ5CGDEBYYHVVPQ2ZW
X-Message-ID-Hash: RYE646AG5KJZ4WEJ5CGDEBYYHVVPQ2ZW
X-MailFrom: wsa+renesas@sang-engineering.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYE646AG5KJZ4WEJ5CGDEBYYHVVPQ2ZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/soc/codecs/wm8994.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9894975a1d..a99908582a50 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2210,7 +2210,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	int reg_offset, ret;
 	struct fll_div fll;
 	u16 reg, clk1, aif_reg, aif_src;
-	unsigned long timeout;
+	unsigned long time_left;
 	bool was_enabled;
 	struct clk *mclk;
 
@@ -2403,9 +2403,9 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 				    WM8994_FLL1_FRAC, reg);
 
 		if (wm8994->fll_locked_irq) {
-			timeout = wait_for_completion_timeout(&wm8994->fll_locked[id],
-							      msecs_to_jiffies(10));
-			if (timeout == 0)
+			time_left = wait_for_completion_timeout(&wm8994->fll_locked[id],
+								msecs_to_jiffies(10));
+			if (time_left == 0)
 				dev_warn(component->dev,
 					 "Timed out waiting for FLL lock\n");
 		} else {
-- 
2.43.0

