Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0F977986B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5B3950;
	Fri, 11 Aug 2023 22:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5B3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691785031;
	bh=rCB5UZmPyBYgYHxvNl3rMWz09DbhN20vUmDjiBpqxnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hrjDug2CJ0iQVM5n56RF7iTmQWR3pkxOfmO2vxm6MsNacAn46ieNzY00KdEUpdSIV
	 nKOLAwcJI9nHxwcSycs3B17OTrUx7cy06+cSgbvqhQ7/LmeL8rBo+YtYrRKGfsm5o8
	 moClxC3W7mKJ/2iiC3z+vyJ+ZNKgR5lHdrTt0qLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AE1AF805B5; Fri, 11 Aug 2023 22:15:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 701B5F805B1;
	Fri, 11 Aug 2023 22:15:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8D7F805B4; Fri, 11 Aug 2023 22:15:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-89.mta1.migadu.com (out-89.mta1.migadu.com
 [IPv6:2001:41d0:203:375::59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8705FF805B3
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8705FF805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=LToGtkDr
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QeLKekQPGIWeXPPUTKz0UKXYLZ76J8hy48F28uG+rX0=;
	b=LToGtkDrOCSOVpZih3iIpGEia0EWeKKZmc8sXDwvIDst79QFhcJMmKPTrN3sDyjY1Wy2V+
	6d5pHC5gzuuL+DV3YeuRE4CYWcZnwxcupNJ3tJ80rEWDQ6JfN4SLY7DiGJYwKfqWtUjjJo
	hlQ3qR7G7/W+ktYvQSU1ELwD75mHRMwo2GrfLValj+Rr+pHqoyjnO1uKCyC4tQbuSZ0b23
	oJrlGZFLUvH42hPAC5gr/y6pY7gbYWeaM2Q7ApnKbPjjkWEH2BueC6PRj0KLdKAGt0IrlZ
	4qb39dtKKzPT7NmuAjpPVfonV6xd//g4n3/p05BnPMSkG5/Ihe01O7RRs5AdGw==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/7] ASoC: sunxi: sun4i-i2s: Detect TDM slots based on
 channel slots
Date: Sat, 12 Aug 2023 06:14:04 +1000
Message-ID: <20230811201406.4096210-6-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: V6Q3AEKJX6MQKNSFSG76WMB3B4EARL4T
X-Message-ID-Hash: V6Q3AEKJX6MQKNSFSG76WMB3B4EARL4T
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6Q3AEKJX6MQKNSFSG76WMB3B4EARL4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current controller code assumes a 1:1 relationship between audio
channel and TDM slot. This may not be the case when slots are set
explicitly. Instead figure out how many slots we need based on the
number of slots used in the channel map.

This allows the case of reading multiple data pins on a single slot.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 019a4856c90b..6347aaaed016 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -271,6 +271,7 @@ static int sun4i_i2s_read_channel_slots(struct device *dev, struct sun4i_i2s *i2
 {
 	struct device_node *np = dev->of_node;
 	int max_channels = ARRAY_SIZE(i2s->channel_dins);
+	int slot_max;
 	int ret;
 
 	/* Use a 1:1 mapping by default */
@@ -290,6 +291,16 @@ static int sun4i_i2s_read_channel_slots(struct device *dev, struct sun4i_i2s *i2
 	if (ret < 0)
 		return ret;
 
+	for (int i = 0; i < ret; ++i) {
+		int slot = i2s->channel_slots[i];
+
+		if (slot_max < slot)
+			slot_max = slot;
+	}
+
+	/* Add 1 to be inclusive of slot 0 */
+	i2s->slots = slot_max + 1;
+
 	return 0;
 }
 
-- 
2.41.0

