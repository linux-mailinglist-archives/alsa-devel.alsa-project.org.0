Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7A745760
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1056783E;
	Mon,  3 Jul 2023 10:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1056783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688373256;
	bh=d1TV3UMh6xoeemuKnST1bo2dXdckO3q+r8QUrL0X6V0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mV8eBs/oclMI4mL5OB9eRD4J7xjpc9ChrppIeodDyt+1N6egbITzqESpL+TN65n0E
	 dsoFAQE9PAKc3CUOFhZAu2t+KkTWpNXgP43+dARuWtnI8czr/0qr9ATNErslrz7FZ2
	 PK2w6P+OuNJy24+VNgecgZemLkf+ONOeJqMU8UaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55533F80580; Mon,  3 Jul 2023 10:32:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0494F80578;
	Mon,  3 Jul 2023 10:32:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4535AF8027B; Fri, 30 Jun 2023 16:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4947F80431
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4947F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jcldJ0KI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4615E61717;
	Fri, 30 Jun 2023 14:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB857C433C8;
	Fri, 30 Jun 2023 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688135238;
	bh=d1TV3UMh6xoeemuKnST1bo2dXdckO3q+r8QUrL0X6V0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcldJ0KIiGOHCLdh9VVbIIOMTDdsd6uLObALf9+N/4QXztMgUhpnzo07D6JSEprGM
	 ysVwMdU2PImvgsB5pqYjIvXZMsmeeULwOILdMeIoJXSwnjfIErW6dM4eX1nbNAAJXY
	 V9JcWcfAE4AfzWdwEc1M4M77rRKpZVqIQwUz3MiMlfa2v7hLL3SFBbvGoiSa+xN5H5
	 OfzWVaRpKNjExA124iP9Ph2a1ewcq91hqNWwCiKAMNmSwWeO7QJdoOU5wS78uBPvXy
	 fzqKb+BQ2096laCMex5jcQuh3ulVn45f94C2JgpZgoQgM6iNWghg5jSYM2fyJqS3/W
	 W3WQTNgRXUdWg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qFF5p-0001OU-GP; Fri, 30 Jun 2023 16:27:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/5] ASoC: codecs: wcd934x: demote impedance printk
Date: Fri, 30 Jun 2023 16:27:16 +0200
Message-Id: <20230630142717.5314-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230630142717.5314-1-johan+linaro@kernel.org>
References: <20230630142717.5314-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NB57CH5SKOXF2JJFCPHTAHCZGEUGARZ3
X-Message-ID-Hash: NB57CH5SKOXF2JJFCPHTAHCZGEUGARZ3
X-Mailman-Approved-At: Mon, 03 Jul 2023 08:32:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NB57CH5SKOXF2JJFCPHTAHCZGEUGARZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Demote the MBHC impedance measurement printk, which is only needed
for development and debugging, to debug level.

While at it, fix the capitalisation of "ohm" and add the missing space
before the opening parenthesis.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index c0d1fa36d841..9d724b5710f7 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2683,7 +2683,7 @@ static inline void wcd934x_mbhc_get_result_params(struct wcd934x_codec *wcd934x,
 	else if (x1 < minCode_param[noff])
 		*zdet = WCD934X_ZDET_FLOATING_IMPEDANCE;
 
-	dev_info(wcd934x->dev, "%s: d1=%d, c1=%d, x1=0x%x, z_val=%d(milliOhm)\n",
+	dev_dbg(wcd934x->dev, "%s: d1=%d, c1=%d, x1=0x%x, z_val=%di (milliohm)\n",
 		__func__, d1, c1, x1, *zdet);
 ramp_down:
 	i = 0;
-- 
2.39.3

