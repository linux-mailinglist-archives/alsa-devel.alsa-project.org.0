Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 046722AD367
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:19:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6E0171C;
	Tue, 10 Nov 2020 11:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6E0171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003556;
	bh=XvdE3pWpPWmf/vwEEtXCmsvkhoiH487iTsB/krT5ouU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q50eSThdLk16tEb9DNRbCY4zmDP8KRtFRU9KF+DvhhpqR+cucUspuj0ZpnWSgeCYT
	 srQZC+ml1Q1TvkHR/wOBCF5rv+m8aEdj51OogxoV9Nwy0eWAoclur5B5i558l7xoQT
	 29ap4HWJ/TNqAHrodpoNUJGszh9vEjmLOMxWNJ9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E599F804F2;
	Tue, 10 Nov 2020 11:15:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C997F800BA; Mon,  9 Nov 2020 12:07:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9CA9F80059
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9CA9F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="bV0WOhcj"
Received: by mail-wr1-x442.google.com with SMTP id w1so8229538wrm.4
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1txfIvaUE40Ou/j75EYKcgw6u17F5C6+DdlKPQ0ay3M=;
 b=bV0WOhcjc6Y2rIR+7HT+QGO/LnwlTLaGqiH/bueGYgN1eqaiyqgBu630Wi1/Fe4Izr
 My6WbzMB2G0+0Jww/tXr7Bv9T9tCSh7nAf3FDc9HnmXqm0/SZK/yuCq88k07niiSIbdE
 Kni1bJikZg3lnovvS5+pSl6sF1scmJC1eailBHWvAIqLxr8aFY7ZvU8r5E11qXi2Th71
 zhnarT2xZ1wCpMgNr9yCr/3M5lq5u3cCkFTpjL9pfSKNowIMNdFSn0mY3iQlibP5Tto4
 Lgmzc95ZSUUq1X+Al8zvn1+ubttScKkHoe5x6HV2U03u2h9rIhdyiJw4IDWSPdJhmDMn
 +W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1txfIvaUE40Ou/j75EYKcgw6u17F5C6+DdlKPQ0ay3M=;
 b=mbtmCQh33jmPq8+pVZTaw5RKECTg39xASUHLQwa4RbY7FMYWLKIjRqgKIdt2reQxpa
 Y94PWSHSVq/xb/YapRhggS06aH4TjbwBiwA61RXv9dNaU5uMlkSPkWkvvOhYsKUGRMBO
 kTBEnCcNcuMJDcVzAnWWrmPzupy0FQA9cDQPAKFuXLtHDR4sV7d6n3JMCE4DOqdNTDZ1
 BFwUbbtvl69lbKXTNZaCCkHREwOWA2clCianQpQJtj5tn/Ejtyzf5Z+Co1j1g5VbG97U
 LzYihcze/VTgcRpoqWlOgsik8tlAy0h27R30O7RSZI0rxJbAxfHBS5q3rqJIqtnskApx
 yWMQ==
X-Gm-Message-State: AOAM532awHgR6F/ukXD6lZe6dgFpqamvBia9zQfH5z48jKOz9GdImei9
 EX6OLf7HzVLfsE59cBIBGozYwQ==
X-Google-Smtp-Source: ABdhPJzHXOuOWGraTd+tlh1Rh/Cikbums2QDN+ELEwiirpKRCwDTD+P/KjLkxHpoeG3VOPOYn45WFQ==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr11725240wrr.303.1604920024684; 
 Mon, 09 Nov 2020 03:07:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:04 -0800 (PST)
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
Subject: [PATCH v3 3/9] ALSA: pcm: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:48 +0100
Message-Id: <20201109110654.12547-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:56 +0100
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
index bda3514c7b2d..b7e3d8f44511 100644
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

