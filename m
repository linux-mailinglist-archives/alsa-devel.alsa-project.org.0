Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023F2AD37F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE81C1726;
	Tue, 10 Nov 2020 11:19:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE81C1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003593;
	bh=5R/l6xMNAmD9ia5C0SOM8rWxVPhJrekNME3vFbMG/PI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sicfNChovmU8V13RuubMI4qGAb7ZtRJke/hERcvIIlaNLGOlVDeR+JIAcEgDcPy4P
	 3MVH2Kk5rR9TMkEmpmDr2AO+QEKwsjWtxG9BP1L1kO97kO7Z/xZ/zUg3mkug7/fDqT
	 FSj06YLz1Hc0UeknfTnG3bRLaiukewAhFB2pa+FI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CDE0F804F3;
	Tue, 10 Nov 2020 11:15:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73E26F80271; Mon,  9 Nov 2020 12:07:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6AAF80257
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6AAF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="tjfVVqU7"
Received: by mail-wm1-x341.google.com with SMTP id c16so7534085wmd.2
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=tjfVVqU7R8IyKW2OW0hqxniG20DAxuXL1U31YiQAfRN+BbUoTlDF20ez4aqC9/5uW0
 00hwc/b1caGHmtDgwFtcQTeA95vSaxFPG5Dn4I4WT//9X1vHXDHfVZSv7b68b2Gk+Ggo
 GuV/WPBhQvweB/8nzh+JOIGU28BaLQQxoW0Qew8uhVen2qKctk4tkH6Xe9kG6J+foPfc
 erqT54DF3qf5z2lmzDigmhC40Lmu2CCaR3SODiQR0zsXHTxRNzgzEn46xeTAsbTqzkbP
 1FKBEQcVgIDxKxzGBxNluYDKXrOoCH+3ipKaqLWCZx68VW0e53YAPO8nIb1YuhtZ+35J
 7AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=s87buRInhgceL7dFVmwgZxs8eXKyOIHBFz9+SoL/N/DllGs7IqYzTupm7xByP8eIrw
 aVlYwcRvtVAFbYWQvGQSosuBMiHt7aeyrptB90YAmBpc5Umz0jEhlO6SF739Eys1U3No
 9gpXIYC0QzzbY8fIWH+UPr3+O249TWUkOlCTAEypw6fxjOOBeOE0YneuE7fU/SU2dwNQ
 sA2DfAK5A2bjEm0CHCqz1Y8JQmgiaXSpYJXGKE39HQsKDbnUUn6GjW8rRGQiDs19o+mf
 78ve8mNZnhOVoEcJHq88FSWSFAxG6OKH82ilgSdru/0VJT7lVtccpA+fP+l6ByAhbjsD
 pX1Q==
X-Gm-Message-State: AOAM533DGfPgyL5zvU7oSaUIbjKy8M1pXAuGGdyKTznt9loVuDJ9R6L6
 /0qCEq4UL7uGaSBNvqT3FmlmgA==
X-Google-Smtp-Source: ABdhPJwkOvrpUKfB7tFd6Uj/97bXlddiGlW4tIGfcvqVJ2uUup2j5kk7Nqp7LIVYpPQ8tPEEkocJmw==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr7223842wmb.132.1604920031725; 
 Mon, 09 Nov 2020 03:07:11 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:11 -0800 (PST)
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
Subject: [PATCH v3 7/9] drm: atomic: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:52 +0100
Message-Id: <20201109110654.12547-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:56 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-media@vger.kernel.org,
 linux-edac@vger.kernel.org
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
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..09ad6a2ec17b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -960,7 +960,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		struct __drm_connnectors_state *c;
 		int alloc = max(index + 1, config->num_connector);
 
-		c = krealloc(state->connectors, alloc * sizeof(*state->connectors), GFP_KERNEL);
+		c = krealloc_array(state->connectors, alloc,
+				   sizeof(*state->connectors), GFP_KERNEL);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
-- 
2.29.1

