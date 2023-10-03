Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299C7B74F1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 01:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A71682B;
	Wed,  4 Oct 2023 01:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A71682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696375808;
	bh=6X+YStEd0LKlaV0dQ/+jU63am+Tg/LnFddxaxahC+bw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VEBHF+Io4dJfwvOR5TyDy4LeD8r+6wQnTKHQLc/7G+PW+mmnMw/CuHO5Wo++y9NAK
	 mZ/x0YA5QWKDi3qV2tJZdDZsiDfgk0GCIHoMsuTo3y/FpIy8mcu6AL1ofh0qYgsXZc
	 iWSP9AkmrnjWfRQdLYp12vzZ98DJCZTRYV104nWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BF0AF80557; Wed,  4 Oct 2023 01:29:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C746DF80310;
	Wed,  4 Oct 2023 01:29:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DEFDF8047D; Wed,  4 Oct 2023 01:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E386DF80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 01:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E386DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ZN0T1fKZ
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c60cec8041so10711395ad.3
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375737; x=1696980537;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mewr2b70zj+E+PpMtuqRQXYpLvw4Y2kPAtz8L71vU0I=;
        b=ZN0T1fKZEygosOwF0DijgWeV3j1Cu1zrGu2hIp5GQknCmw9wOrf33igzQeLQnntA5k
         aeaI2wlV48jDX/D6wUnjc3R4KWBM8WOR4nkySQ6szhSRGyPnPP2axO36fLo4UjuF1ncX
         mglaF+srKcnNihctTTritoRPxcaej+g1rVPVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375737; x=1696980537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mewr2b70zj+E+PpMtuqRQXYpLvw4Y2kPAtz8L71vU0I=;
        b=swTusI9o1ymgzzB+gUdANYELT2dniSqfstHI+ZDRPJncD2/8rs1Ja2BtpqO3ubFNyo
         0qMLZxdEWE5BYOqNbfxOCxPpWtgq3BqzZ1A6yXZVV1RCXVibt6ISfqBmoml+z8OwGAwd
         7kIRV9EnOgRQa+4V799d67FHUWgq/rwHacJ7PgLkVFlPcFE0wChv/q0VQL6aE1nYf1mH
         kemnETBs9bgp13mJhr+x83lmNYjvd0WqNLRA24OXISeJradHqAk/lhOfF1JWgIs7xs1K
         QyXZbEOQHh1KZcXyUAzteYnoOvvQwCP00G2PW3+GpjC35QUBKfPVeOW/+BaoAovV5Blm
         lQsg==
X-Gm-Message-State: AOJu0YxGOevkihfCv6lYAMn9mF5WRq1EyItAfub5mHDJOtD78xP58OC7
	3NCgL7IHQRc1npSzR5Ml2dxUnV1PM/oB1PLGO2Q=
X-Google-Smtp-Source: 
 AGHT+IE9+0pmjc2CqAJFQTA1BUgWoTDOaeHCQ2RtQhFPP3SatP2ZRDf6Q59SkUDovbfYKbDPKVBYdQ==
X-Received: by 2002:a17:903:24c:b0:1c7:4f87:3dbe with SMTP id
 j12-20020a170903024c00b001c74f873dbemr1177087plh.31.1696375736870;
        Tue, 03 Oct 2023 16:28:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 s16-20020a170902ea1000b001bbd1562e75sm2201487plg.55.2023.10.03.16.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:28:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ASoC: soc-dapm: Annotate struct snd_soc_dapm_widget_list with
 __counted_by
Date: Tue,  3 Oct 2023 16:28:53 -0700
Message-Id: <20231003232852.work.257-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049; i=keescook@chromium.org;
 h=from:subject:message-id; bh=6X+YStEd0LKlaV0dQ/+jU63am+Tg/LnFddxaxahC+bw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKO1gHu4l9h8ToOMvkOmkto8cSVU/vIIIfRBe
 GeN6y35pSWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyjtQAKCRCJcvTf3G3A
 JgNjD/4q5gV6j+9dUNB2OWkREBYsVc6X++ugjnovyEuKGMIO5OVnXc9jH79Kp+y27z4flA8uzzb
 +/r402rgPMkNPLC5GCQr12BvpEC1X8LALA79ist2DeSe1oktOoVS3aMe+/Xy6TqdcMeDeIZoo/7
 T1Rn6zkPYXU/8vtFSebH5zH51EeajceKubb+yEJ8rmen79X1C7Gyeb7Ijc3HWazoUS0FKasUx5A
 cOnmPn+ui24LfU1Qa7V7TdcR9rfRZ8updCADmqZ6QM5DHxxwuvgir/CGTN4izQGV1OUxMJgJS4l
 +wodJb5c0SRHeF+7+yAT6WO4qsuBQQwFXdnsw2ywzFe2rTOZ22M/mAcK22lbc28oAaVPrL6tWj1
 MT6VpE1AqFevzjlgTxDde83nlltZhG2Vveh6cPfzFBtn53tVWK1kaPFTw5cr4Ku6TnJswmeRLtJ
 sxEuDhD/KSvpRx1PhGEU8jGsnOjuSnT9E79xugfNmv/2wjEIJSha6UeyebKRB3HpoAqL5eXJBDb
 37rBp22xYP5M/W7HQmIFzZ+iR3s7UV+UW+3JYpQusIFADZzQH0yUHk/DoV7EVgBxMtYXwAs0xOn
 vxcomU0K+gw5b+cB6mxXslxsu7jQ5DVxyatycmhvSOz7GUbXtQlraWBOe+LhgFI/Y8J7Mupz2q9
 aPyj3M0 Mg5yrwWA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZMRUSANGQLYD5QC5OEB7IQJ6LWH65HO6
X-Message-ID-Hash: ZMRUSANGQLYD5QC5OEB7IQJ6LWH65HO6
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMRUSANGQLYD5QC5OEB7IQJ6LWH65HO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct snd_soc_dapm_widget_list.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-dapm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index d2faec9a323e..51516c93916e 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -717,7 +717,7 @@ struct snd_soc_dapm_context {
 /* A list of widgets associated with an object, typically a snd_kcontrol */
 struct snd_soc_dapm_widget_list {
 	int num_widgets;
-	struct snd_soc_dapm_widget *widgets[];
+	struct snd_soc_dapm_widget *widgets[] __counted_by(num_widgets);
 };
 
 #define for_each_dapm_widgets(list, i, widget)				\
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2512aadf95f7..2e3df47c9cf3 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -497,8 +497,8 @@ static int dapm_kcontrol_add_widget(struct snd_kcontrol *kcontrol,
 	if (!new_wlist)
 		return -ENOMEM;
 
-	new_wlist->widgets[n - 1] = widget;
 	new_wlist->num_widgets = n;
+	new_wlist->widgets[n - 1] = widget;
 
 	data->wlist = new_wlist;
 
-- 
2.34.1

