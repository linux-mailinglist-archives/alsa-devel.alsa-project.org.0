Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C632A3E10
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A78FC17B9;
	Tue,  3 Nov 2020 08:52:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A78FC17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390018;
	bh=05gPeTBLyrOUBEkrv+iWgHG2vKifXLjVhevBPQv6pX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o7GENhVIYH9TdiP9BMYB3l10G6Q8oAhsfkjdL4dsvunwOb2VUmmVa/QWGUtKv5hEm
	 nWJlOIn/vUdcchVUB0brwfAWBnChIvmFm0yCmdrzqNGEhax85sQ08t27vBGSBrTlGG
	 gEf3TJM85dxE7Qre2ae5Eja30N/l87oZELnUCLK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF371F80538;
	Tue,  3 Nov 2020 08:45:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E85BF804B4; Mon,  2 Nov 2020 16:20:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA146F80229
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA146F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="HmtPp910"
Received: by mail-wr1-x443.google.com with SMTP id b8so15092644wrn.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsoLpTPvbfDjEd3BTKWBJg3n1+l4gj6JVB0+8bMwSMU=;
 b=HmtPp910xThA01pL3B9QJDzM6myxOQbI+Gxv1vc6oac7iOA0ZXJQlHuq/+mHtde0X+
 OfcMSK5kznkjMW2e37tU9WeWtUF/ehvgMx77Hvy2j/YhuAWr2JWWTq+2rF5jNonVIGbD
 cCSqCJ03TKw0ntRupzKEmRuIb7vqNrbM7ZjMJ1dyUUTFAq7QYOcoPlQY6BSvbU5ivx1u
 2ja7v3leUJx7kGjq4+D8hYbHBwnlqSZkHzw7OQggIsENJu2wboHE39wVaYvHlfopqTaz
 gmSuc/NRG00fKNAAatDeqOG57nb8eBHuWtuyK6Mk/YJvrj1Yz6MBIwM8xHmW9fbnRR1V
 p5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsoLpTPvbfDjEd3BTKWBJg3n1+l4gj6JVB0+8bMwSMU=;
 b=LOISF1McuuxtfuHHGC3nZcQ2dDds5ZpAx8VGm/J6AB28sbV8PYD7Y6ceXfRDSuQTYP
 nUKdcpmfbvaKBBdbxUHXmsDGZXQV0YkQ5HtLIi96QQX30Y1IOMvxu1tQAcxP16Tc/UMl
 lEbZNbBYpiQCbYFPrEZz+9M3K1znk0INJIvIq25ml16lbyyXYFqvtNMEUqlMPNdTmEK4
 BnbO/v+tfzag6rCKXaSH1IKFwpbbxXzLxHT1BkXUu6CZnwZwyXc4OfsmQik8mt9s7WFu
 dmbvvL/392SSnXSnQCP3YjG+q0qmBqzOcoFu814Q7iF1dnS0ogAbHp8hgD2powD+dIuf
 j/mQ==
X-Gm-Message-State: AOAM532ArSoWAiL0JYn7VntmWALCqztp31fp9gyjmIGqVIbXaMW5/lpl
 QXggRbdSPHML3bA7ZKa8VEiPZw==
X-Google-Smtp-Source: ABdhPJwlFwfWfCpdDsl2PScT66d3xFr7tIJPKogPvk6kP2iU+Xbqm7qx9Peryv+18kqHISpx03BO0g==
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr22117429wrp.207.1604330445459; 
 Mon, 02 Nov 2020 07:20:45 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/8] ALSA: pcm: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:31 +0100
Message-Id: <20201102152037.963-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 Takashi Iwai <tiwai@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-media@vger.kernel.org, linux-edac@vger.kernel.org
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

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d531e1bc2b81..c6f8f9e252e0 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1129,8 +1129,8 @@ int snd_pcm_hw_rule_add(struct snd_pcm_runtime *runtime, unsigned int cond,
 	if (constrs->rules_num >= constrs->rules_all) {
 		struct snd_pcm_hw_rule *new;
 		unsigned int new_rules = constrs->rules_all + 16;
-		new = krealloc(constrs->rules, new_rules * sizeof(*c),
-			       GFP_KERNEL);
+		new = krealloc_array(constrs->rules, new_rules,
+				     sizeof(*c), GFP_KERNEL);
 		if (!new) {
 			va_end(args);
 			return -ENOMEM;
-- 
2.29.1

