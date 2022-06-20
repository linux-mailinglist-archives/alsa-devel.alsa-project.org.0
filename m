Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18A554F30
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183C41FBD;
	Wed, 22 Jun 2022 17:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183C41FBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911666;
	bh=N6oB4qPbpYOk6Do0f3cS+xDSyLYwiCMQhcR835EoURs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SpBkgOjwE1a9TmbrVA/XBcta5JfQtvDA/N/ugrZCOLNELzJOgEEU/TzkBKeAx229i
	 oOQ5NDHQJumw/3F1i66FyIM11Gd9BD41gnPgVv+sjXxIzsed31QFj98EwciM2Wa2al
	 Bd8gcYg1YDRUOzBq5LCbwKvpECwvj2YaXqWS0znA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31DC2F805B0;
	Wed, 22 Jun 2022 17:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC8E7F804E5; Mon, 20 Jun 2022 22:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10073F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10073F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gfHGkEQo"
Received: by mail-wr1-x42c.google.com with SMTP id q9so16079355wrd.8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYKul7O4rkuRHadVgAD9GkF5EF0/tHVMEgyPNxDHsC8=;
 b=gfHGkEQotdDXzonMB5rbM3c8h6BVBrRvbtHhDjj8TB7PUfzKOirNkdHY6GRUcU3QOh
 pN3K3EMybUVH+S6paaWqW87mojZHxKV/KVv6mbG0MfLyFrJiMUS8aEEqAvLcWCbt6l/P
 Hzm7Ul+OYaXZyv/zNw15FgCOHKUCC7ntnW4BdzAX7j1i0rwhvAYiIhbdm+UfaPQ12HgW
 /Ba3wUF9pXtUbhcj50Zvj7lQx6eqKf5c0AarPVaEOvSYvWp73IjYJvOHQOtJ9XQF3QAI
 uc7N5zEeDGCklg2w1zbzB14CeQdszSSXX0bBBbgpTOXk4/oeMs384ZrqD+jYJS8NiWaQ
 MGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYKul7O4rkuRHadVgAD9GkF5EF0/tHVMEgyPNxDHsC8=;
 b=e+m0QsFO499N37ukuf9LQLoFX8c3S1KMXZEidJE/cFds1wg2YpqiZu/Ufwl/0aVcm5
 18xrm4BedFmWYZmVfVt4ryNLHY5GxqhMhiaMAXz+2JXsFyvLNfJ+LpKOgpzgxlYttFU/
 efZoc2o9GHwHvVW00GpNK7f5/yuJjiapHbkbuhaBW1FZqX5kqvoA9K2q4f2xUjBHY9s9
 l3JoiOp9x/f9eEAiB6xeLtF/swD7K9adgL2ummom/jdM3nKCXl3FUJJZg2K73OQPIqej
 mWV6bc+sgGawY2gJvIsdqqdSn3B6pJyyFsX5dHmXsxsfW9jo3d1Xv3bO5mYKPw2MkkbI
 wujA==
X-Gm-Message-State: AJIora+BF9y/aSP1RJX3BJZZidtvEOE/tlAy+p2VBaX/4gifUXfnrLBQ
 FBwE98klbzu4ppiy0OLURuw=
X-Google-Smtp-Source: AGRyM1syc7S1LTS1FFXH6QNulnGOQO1vhdeYnisKeurGdpZwcIyfiJ171d1MMzBPPFFYg3HyKCPoOw==
X-Received: by 2002:a5d:410a:0:b0:21b:9549:e151 with SMTP id
 l10-20020a5d410a000000b0021b9549e151mr2036808wrp.702.1655755598450; 
 Mon, 20 Jun 2022 13:06:38 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1c4602000000b0039db60fa340sm19508415wma.33.2022.06.20.13.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:37 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
Date: Mon, 20 Jun 2022 21:06:10 +0100
Message-Id: <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

No drivers currently use mask_writeonly, and in its current form
it seems a bit misleading. When set, mask registers will be
updated with regmap_write_bits() instead of regmap_update_bits(),
but regmap_write_bits() still does a read-modify-write under the
hood. It's not a write-only operation.

Performing a simple regmap_write() is probably more useful, since
it can be used for chips that have separate set & clear registers
for controlling mask bits. Such registers are normally volatile
and read as 0, so avoiding a register read minimizes bus traffic.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index dd22d13c54c8..4c0d7f7aa544 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -84,7 +84,7 @@ static int regmap_irq_update_bits(struct regmap_irq_chip_data *d,
 				  unsigned int val)
 {
 	if (d->chip->mask_writeonly)
-		return regmap_write_bits(d->map, reg, mask, val);
+		return regmap_write(d->map, reg, val & mask);
 	else
 		return regmap_update_bits(d->map, reg, mask, val);
 }
-- 
2.35.1

