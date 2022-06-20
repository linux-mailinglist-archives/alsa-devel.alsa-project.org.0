Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E3554F35
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55961FCA;
	Wed, 22 Jun 2022 17:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55961FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911698;
	bh=4mMKOa/8N28uUEqbmONS7x/kBrogHRvMZdWylXpP0tA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASjsaUFRcRzUH/RWDfmhwsl3cQkkbS1Pe9Od0rdw6VTY6DBnLS1HXHAjHQR92ctkm
	 9mxJNV9NhUPmtULX9+K1nnItGijkKAS9F4I599ts1TLyzwObfQcWFmxOcKMH8OVR8h
	 TIpj42S1K4ZhiWlzz/TzbU8HHrd49ZDVITAAhazo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67174F805BB;
	Wed, 22 Jun 2022 17:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE60F804E5; Mon, 20 Jun 2022 22:06:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA91CF804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA91CF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A+HDr9UU"
Received: by mail-wm1-x332.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso6194028wmc.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NtcVbwET9acvq+sAYxoy+CjdvzW22WJrtUFi1dmUOo=;
 b=A+HDr9UU7+WRxYQh+og339fpLCReWCpP3YFgyupAlmxOcZBf7A6aFnN8naHelyc52s
 wQK8Fy9G6v6mTrGSQG4iRbkz5YauYi4iPPwJMQ1JvKJvozZ8vtLRWwHh4bZf1gWdX2JC
 dbwqJKti3GJ9HNo1vXGhcyksOzCb4wnGEGjB9WKXRA8144i5ltsXiu2qsbBUMRpGeiKM
 foGh+rMJtGnYFLs3jAHQB2MuzI/dNK6UnFensNutj1IivbApMFbM7lKCQeTK27rVsLY0
 i4E+b9E7gLbrO8WdSQ5sENJyJXaP1cu0PzOoAW96YwnClCEE3EdUU+uTD9Lm7PL5cykC
 bC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NtcVbwET9acvq+sAYxoy+CjdvzW22WJrtUFi1dmUOo=;
 b=m+jF09Fnh+6uApf0X/0tHmfbaQ7M0xhVUwVIvNIP0c/7jtYE2PvpNLsxW/RT1S+FWB
 AdS4j7Ib5hetApjGHw5nFIyGaBrO4Br7p8RO0yHffnxHOhTt+Rd3Gc+YZ2F7BPdUmAvr
 zB0VRqg6hsxRm+XGbMy6LYpG7hEFTVW+Xa8oUFt0sLmGtQlPPtdbzj9fCLHDgv/Uk9CX
 7vPjBaPpi7OBM9YMws/8epixrUjTFK2IJqaHd2Gs+b2GARnyleqXqQCQAAxMRJ4oQNtE
 aFi0XlecAuYDT5cWVVdo1bzCdv2dGr2lxmGJAjPjQEnmy3Q5vaLvoKUfdKgi2xWrYxTE
 Eq2w==
X-Gm-Message-State: AJIora87Aph2DT5NXyzxUWJdEidlE3MLrmeVLfFw+dmLnkVSxnlkjyyJ
 zHRdAPe824j5hVAzSLzydq8=
X-Google-Smtp-Source: AGRyM1uQGdQ7m3OGY9UqaMyRP6uDRepmxOPNYfAd9XL91yLtMli/B6mx4CKZxfd/noc8TeLSorNR9Q==
X-Received: by 2002:a05:600c:1547:b0:39c:804c:dc23 with SMTP id
 f7-20020a05600c154700b0039c804cdc23mr26538403wmg.23.1655755596798; 
 Mon, 20 Jun 2022 13:06:36 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c2ccf00b003974a00697esm20182858wmc.38.2022.06.20.13.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:36 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 14/49] regmap-irq: Do not use regmap_irq_update_bits() for
 wake regs
Date: Mon, 20 Jun 2022 21:06:09 +0100
Message-Id: <20220620200644.1961936-15-aidanmacdonald.0x0@gmail.com>
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

regmap_irq_update_bits() is misnamed and should only be used for
updating mask registers, since it checks the mask_writeonly flag.
As there are no users of mask_writeonly, it is safe to replace
the wake register updates with regmap_update_bits().

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index b24818ad36e6..dd22d13c54c8 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -157,11 +157,11 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		reg = sub_irq_reg(d, d->chip->wake_base, i);
 		if (d->wake_buf) {
 			if (d->chip->wake_invert)
-				ret = regmap_irq_update_bits(d, reg,
+				ret = regmap_update_bits(d->map, reg,
 							 d->mask_buf_def[i],
 							 ~d->wake_buf[i]);
 			else
-				ret = regmap_irq_update_bits(d, reg,
+				ret = regmap_update_bits(d->map, reg,
 							 d->mask_buf_def[i],
 							 d->wake_buf[i]);
 			if (ret != 0)
@@ -823,11 +823,11 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			reg = sub_irq_reg(d, d->chip->wake_base, i);
 
 			if (chip->wake_invert)
-				ret = regmap_irq_update_bits(d, reg,
+				ret = regmap_update_bits(d->map, reg,
 							 d->mask_buf_def[i],
 							 0);
 			else
-				ret = regmap_irq_update_bits(d, reg,
+				ret = regmap_update_bits(d->map, reg,
 							 d->mask_buf_def[i],
 							 d->wake_buf[i]);
 			if (ret != 0) {
-- 
2.35.1

