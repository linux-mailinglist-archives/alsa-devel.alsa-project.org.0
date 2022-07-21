Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE757C8E5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB7F717C1;
	Thu, 21 Jul 2022 12:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB7F717C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658399190;
	bh=/v4JuBa2l55jmeFpnvtOTtVPoVHNXHtXEpINh/16zaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtJoXiEO7tdUuD4nziNyB1hqMevH0oKWkpCXoTTK/5FSQq3z50hFjLt4jDp1tXerf
	 Axcd6Gc3npFcSDceTMUp/eZKI9xDpd1ZlmxvjD25YYGPmJ8ahXYwqcgKrhI4qVQwOD
	 DOlxo6iw+xCWyQAZ1cIHQ5/F4gGg/+DlnsoF4sZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E411F80166;
	Thu, 21 Jul 2022 12:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66320F8047C; Thu, 21 Jul 2022 12:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98CFCF80169
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98CFCF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EM1Fkaou"
Received: by mail-ed1-x536.google.com with SMTP id z22so1567713edd.6
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnjcUJZ0kP3zLVkI00AAytAat4+SP0QD4gn/D4v+BD0=;
 b=EM1FkaouTqByZK/MLu7Gh8P+yVBOtMGiUCl9XnlpiY9BYdL9D17dk4fgt7jHA689FC
 8hVvNiHElxWiFBkrxZzxr9j9Ew6eqS1+dnIVwKz0ZfUMsxbTtRFLKO4oJJT9TRHHQFEd
 U8woqsMio5/pgULp2gqs1Fx+AdA1lIY/XpheRDCa6QoYQu3xSnTLtnGz8PV2o4hidVLK
 15fQsJNR4BB9Xclu74BJfA6J3sUeLwss1SNkEbwhx5CxxC6nogpBzn0wJzt4leORq0lX
 4/QL69AQXYk2QIDCZnxx37rnItIvp1T+jnQSFfgFc8if27fyjzxa/1pO/7jqjxsdjn6j
 vFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnjcUJZ0kP3zLVkI00AAytAat4+SP0QD4gn/D4v+BD0=;
 b=uCGdvExFkw+gBXGIbl90jF6zTgZ491BoGKZw1bxp7YUTyyG1yAqmYRbTEuHIL/Xfw8
 VnhyYB/pUbEZq8BQDuVMRiI16WdzUg0yWrNpSe+FE8brC9BGC1O9RsxkCosfuIAl0NFV
 RS3gs49tFn85zxPs2Se2jRSI5qmPHlu0A4IGsyPF824LGpIO0ibIw5vrKNj+PcGEMucd
 fXmk19mqrdvFH1YsXdkZBiiRPGFUbG95U4Tck/4Ku+1h8s/Sni2xzlHhmQ2OBP4cC9XJ
 c47rdpH5o+K/Xvqe4GcYsQbOHwRoPIfDfbwXl76TNDhgUU5z6+PCaBjYXWwzMJkFiROx
 r1zA==
X-Gm-Message-State: AJIora+997Jo4q8sQCAulyX5Dkb8pv36CD96l5UNlqkNMTIX43e7qHgN
 kMC33gGg5pG0y3XQcynjgoU=
X-Google-Smtp-Source: AGRyM1sjm77tFldslhTTtKG6r/nB5ftOMbBvPBn0I5SNviJAxfO6zmsuOVFu8GtH/lDpkb2LWoMdlg==
X-Received: by 2002:a05:6402:11c9:b0:43b:b905:cb88 with SMTP id
 j9-20020a05640211c900b0043bb905cb88mr8429851edw.102.1658399092334; 
 Thu, 21 Jul 2022 03:24:52 -0700 (PDT)
Received: from localhost (92.40.202.7.threembb.co.uk. [92.40.202.7])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a17090630d500b0072aa1313f5csm652000ejb.201.2022.07.21.03.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 03:24:51 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
Subject: [PATCH -next 1/2] sound: soc: codecs: wcd9335: Convert irq chip to
 config regs
Date: Thu, 21 Jul 2022 11:25:57 +0100
Message-Id: <20220721102558.25457-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
References: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Type registers in regmap-irq have been deprecated in favor of config
registers, which are more general. Chips using type_base can switch
over to a single config base register and a standard ->set_irq_type()
callback provided by regmap-irq, which uses the type info associated
with each 'struct regmap_irq' to update type registers in the same
way as the old code did.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 3cb7a3eab8c7..81678c85ff7b 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5031,16 +5031,22 @@ static const struct regmap_irq wcd9335_codec_irqs[] = {
 	},
 };
 
+static const unsigned int wcd9335_config_regs[] = {
+	WCD9335_INTR_LEVEL0,
+};
+
 static const struct regmap_irq_chip wcd9335_regmap_irq1_chip = {
 	.name = "wcd9335_pin1_irq",
 	.status_base = WCD9335_INTR_PIN1_STATUS0,
 	.mask_base = WCD9335_INTR_PIN1_MASK0,
 	.ack_base = WCD9335_INTR_PIN1_CLEAR0,
-	.type_base = WCD9335_INTR_LEVEL0,
-	.num_type_reg = 4,
 	.num_regs = 4,
 	.irqs = wcd9335_codec_irqs,
 	.num_irqs = ARRAY_SIZE(wcd9335_codec_irqs),
+	.config_base = wcd9335_config_regs,
+	.num_config_bases = ARRAY_SIZE(wcd9335_config_regs),
+	.num_config_regs = 4,
+	.set_type_config = regmap_irq_set_type_config_simple,
 };
 
 static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
-- 
2.35.1

