Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06518777633
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BBF283E;
	Thu, 10 Aug 2023 12:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BBF283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664534;
	bh=6rCNOPL7i52Q9kr2IUPyCrdXXgEmaRdZeC63IK1f1VE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vrWgFRfjI4eSjTp7hogYfnMHUPo3Q38IZHdgJ5sUVb4UPsOm9TIrybH5dnphim8n7
	 Ion+8XsUb8XYHoaGBIRlEjPbaYawC1O+dGUkFEj35tQuJX9C1a60QmXWEnau05Xfm7
	 Z+lsP3y+bnbE2ovPP13WkQUKm/hgnEr1IxCRThNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C121AF80552; Thu, 10 Aug 2023 12:48:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0160CF8016E;
	Thu, 10 Aug 2023 12:48:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 284AAF801EB; Thu, 10 Aug 2023 12:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3318F800EE
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3318F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=G6pHUHno
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5237365f3a6so961382a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664473; x=1692269273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cL5UPVfVDvTPeQFgxKATIKznitcWyNXilLQp5uC80cI=;
        b=G6pHUHnoTRweCuka8lUSPfAXJhMF537/JJNKPyOuyVHJBy5UR0uOeLt8TW7dwXa4JD
         BEBO2xt/mITqpaAYcQ65ixrn/FU1/rF5Uo2CChXWuk6wBuA0iR1sT0O4SYChe32G/E9x
         2nV5gCCrVFq/EamTv7i9wU21Fs+zGTJWa/uPofqynaQLcuik19lqLog8NruRcQLUmRvp
         ZhPLwqEOmjw0yPYz8dSNNq957zC/gjOaH2cIpxW8F0j0tkGBbbzdykd2D6tbKd9B4k3W
         BXrzxJRZ78QSdp1HmG0pQX8ee0aNP460OnyCEwER3ENS5EBe7eOPBxLEYZ/CRizp28b8
         F6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664473; x=1692269273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL5UPVfVDvTPeQFgxKATIKznitcWyNXilLQp5uC80cI=;
        b=HYhivuQfTtB1WlG9t2EiXebmH5XhaoKl8ecq3ih+gjD5MR4shUsY7IUrQlENgNkH48
         H4pAPMSclVf7/yDhRtz104TSzoOyw2V1Nc0w0ZI+I25DLLPB0F2GRVmdGn0errN5gz3s
         +yj4FNyGUjtGw4TEecp0gud09sUlG0SfofA+AoOZiJn0J385B/D1GC2mzYLTgmw2EO+4
         JaFVWVUnzs+qrEmOBtplXBYM/eUInPNZDCnMsVnjd3Ws/9+0U8Wa/PRS4NzszFyQbWai
         M1BeydZ08uWR+5zLKPpFvHAtcM9nICoK5m0gaRFEK/tIq283GtMRMuMZoFjPGrnZ0Kvz
         3D5Q==
X-Gm-Message-State: AOJu0YxY3By884wB+z9e51bHKBp2IMasPmuerheL4HZ/C16sVtzxm9zF
	wDRhkU8Litb23eFwZBa56WOGuA==
X-Google-Smtp-Source: 
 AGHT+IGXS1aQfmfAEnnnicUw9UC/MVRyaVegshXzkv6MrwG7ZgOG9nfvxHajlaARube88C1uKtE0IA==
X-Received: by 2002:a05:6402:28a:b0:523:406a:5f6 with SMTP id
 l10-20020a056402028a00b00523406a05f6mr1588660edv.12.1691664472836;
        Thu, 10 Aug 2023 03:47:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of
 aw88261_reg_update()
Date: Thu, 10 Aug 2023 12:47:43 +0200
Message-Id: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6Z7SQRZUPP4JFXSSPV5ZTALFLCKSNC4
X-Message-ID-Hash: Q6Z7SQRZUPP4JFXSSPV5ZTALFLCKSNC4
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6Z7SQRZUPP4JFXSSPV5ZTALFLCKSNC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a branch in if() clause where aw88261_reg_update() could return
uninitialized value.  Pounted out by W=1 clang build:

  sound/soc/codecs/aw88261.c:651:7: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
                if (aw_dev->prof_cur != aw_dev->prof_index) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
        return ret;
               ^~~
  sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its condition is always true
                if (aw_dev->prof_cur != aw_dev->prof_index) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/aw88261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 82923b454dd4..fddba2f2de41 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -636,7 +636,7 @@ static int aw88261_dev_stop(struct aw_device *aw_dev)
 static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
-	int ret;
+	int ret = 0;
 
 	if (force) {
 		ret = regmap_write(aw_dev->regmap,
-- 
2.34.1

