Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D07AB86F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 19:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 314D9DF4;
	Fri, 22 Sep 2023 19:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 314D9DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695405220;
	bh=j4yqmKRzUCzvjLbfaqNFg/RfKie7KU/QXR2i1mhhyZg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qOyW4bNQ9zKzbB4qJPGnRMEME03OgYhvQSplPKTtvP91qUQVRHvjday0VjlRCeDo3
	 d7DZuXUBlmBAbzQrZfHSK6jCrkgcxkcul4VqlRRINJU1O5MDItipr8/DoKC2RRpG5P
	 AiHEZx3itektx5OEvl3RQ8A3OUUmJcbtxiOjka6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0834BF80570; Fri, 22 Sep 2023 19:52:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 882A9F80558;
	Fri, 22 Sep 2023 19:52:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9513CF801F5; Fri, 22 Sep 2023 19:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9549DF80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 19:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9549DF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XunYiyK+
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690d25b1dbdso2240207b3a.2
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Sep 2023 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405052; x=1696009852;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oEkxAEP7bGPEZ+qBOxMzwux9ypcm6j3kmlQze2cxoU=;
        b=XunYiyK+37CwBBVOuXlQx5NiE3OgfyB1orm0/kFGPL4IsKwyy9SqyHMR7IOZYmwaT7
         eK++uFRAM0YGJJil2kcjMOepWx6hDPKJS6v1kvi745g4DpZt2oCBfzQwfM/5Q18QgbpW
         wiIir8XWnIVmKBe1zloomLMd/VrpH5UZU+DNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405052; x=1696009852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oEkxAEP7bGPEZ+qBOxMzwux9ypcm6j3kmlQze2cxoU=;
        b=AH5TVjNQUyJr9bspEWzPHneawshLls/xsOHQxdrodkC96Xz5ZZDomWYuOIfTe+XdE1
         ZDVvUm4E8MZszTjn9lVh3+7rpF5ApovrrcVL/qvzrdcrq/IcCJBGBy8IWzzhiiKmd+wH
         6PfXBRLqSY74+1i4Krnq8/2Zg2eULwl7zFtzyPjaMmWzvlSAmUFOCaTiSt3PQnUsbvF+
         wi3YSCiisBof9+YgvcKEqdmQrlsDOni7Z66k0s5Uuct8MtyC8K9rKpcnnTdcLNIbq3w2
         Gx7vjQndZy1PX+KF6AmnBjB9iJe5HllM/xD2TvDsBk554GlPpb+VkLUEGQPutbr/y4Xu
         2uXA==
X-Gm-Message-State: AOJu0YwTykYamlPyVCS4C9od7my20a/mgUcNtCKMlJQFMThYWEnBLsAd
	vMfiep16Z9RJwv1kISMoVR/slekXlujVei+Mk1w=
X-Google-Smtp-Source: 
 AGHT+IEjIxVG8g4i5F7jtY8rsnOQ8bukvGhYoHuCsgCOuo++tH0bwxcSf5hGt6Xn7RmONgTG1ZnFfA==
X-Received: by 2002:a05:6a00:2d0b:b0:68e:2d9d:b0cc with SMTP id
 fa11-20020a056a002d0b00b0068e2d9db0ccmr170192pfb.6.1695405052057;
        Fri, 22 Sep 2023 10:50:52 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 x18-20020a62fb12000000b0068fe6ad4e18sm3484364pfm.157.2023.09.22.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:51 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Kees Cook <keescook@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ASoC: apple: mca: Annotate struct mca_data with __counted_by
Date: Fri, 22 Sep 2023 10:50:50 -0700
Message-Id: <20230922175050.work.819-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=keescook@chromium.org;
 h=from:subject:message-id; bh=j4yqmKRzUCzvjLbfaqNFg/RfKie7KU/QXR2i1mhhyZg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdP657tnli5eAN/8roOFU78C7eb8FJ8g94j9+
 W70ZL/MvxiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T+gAKCRCJcvTf3G3A
 JhkwEACoXPDQbe9ClOALZy20QDUufFBZZdIyVDd7vsffjD0NADca1ZAdJibsqdbv0WoKOHbe7dg
 F8Qn9PbceKIap9s4b67hMoSvLv/sRH+NJCuoMirhWdpYRQguwiegMtsMUFcYpoZbJxhsugsZe9t
 DK+ZzfTvFpFasQA9noJDlpzCnqoAk40oyu7hfxITKafl8jzz2KF54cvC9Ou9KHC06x/dfuyUh3Z
 +cmap5XZ3PqL5al8/8bcWjwRep86fpLPje6ZowtIA8Xz6rF7RHkhB8rzFhH6PM2GYovTHn0sJpI
 +pM58i4vueNt/36/5tWQf7yEhHUKyebeEHhEMsMRopJ0EYttF2K4LrdNc0UD/GHQZfvXr3pJ3TB
 vspNBhikEwP/27a3H+GMjqo6WIjzMyesedSKO1UvQRx/Sb9Z06KQfe3crNNJQS6alyp2TzjbfQy
 5gN8LH2Zy5ftPZWfWKFD/E4LWcSC+j6ATdxgH6xHRu/HZYAYHNAriuf8cp5wbT2hhPy36aGjuBq
 Qpw2w7PeKkGdpUHShbLmHqpy7JVnuKcdJ2I7b7BjXcQxlx0jahM77cytS0CSOqHHMpQRiVYQ+W8
 0zmAS/02v7hvny2scuMrpPhpW1fuR7xhIcXejJX0R3d1NNsYsRZ8qVoiJEvRSdm53xxORkZWxEE
 +bzZBeY tCA1uhOQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4BPEFEJ3TU5IA3KUAFLBRWGVLFDFENF2
X-Message-ID-Hash: 4BPEFEJ3TU5IA3KUAFLBRWGVLFDFENF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BPEFEJ3TU5IA3KUAFLBRWGVLFDFENF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mca_data.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: "Martin Povišer" <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/soc/apple/mca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index ce77934f3eef..99e547ef95e6 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -161,7 +161,7 @@ struct mca_data {
 	struct mutex port_mutex;
 
 	int nclusters;
-	struct mca_cluster clusters[];
+	struct mca_cluster clusters[] __counted_by(nclusters);
 };
 
 static void mca_modify(struct mca_cluster *cl, int regoffset, u32 mask, u32 val)
-- 
2.34.1

