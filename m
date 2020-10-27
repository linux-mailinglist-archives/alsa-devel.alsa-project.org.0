Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A229CEDA
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:10:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169811689;
	Wed, 28 Oct 2020 09:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169811689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872641;
	bh=CiWhblgtT4b0E2W12ySvUpj+JDLAVS2wpUB4YdK+OlI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ay7MlSfc9ts1RkVoQRJZZ1t9tC21Sg99PSECv8tpfffAcuplQn5ywpYWR0eextip8
	 N1k6s6C/ydWK+Rl6X9U4RL3f4heyanGzrqiUUtmH4Xk1/rlP5UkCfS6nrYyIMmNiGh
	 Hf83t97aUT6HF5opK/fTQ48pioHR+Q/kyCzdK9B8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CBA0F804E5;
	Wed, 28 Oct 2020 09:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76840F801D8; Tue, 27 Oct 2020 13:17:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CF67F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 13:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF67F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="XHOIZDPF"
Received: by mail-wr1-x442.google.com with SMTP id y12so1641806wrp.6
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ajG2eJaPSZ0bX/1WDeWm0EaqfEJqxAhsr1ZG8pJATY=;
 b=XHOIZDPFdLQqYweDS35MDqPOY+CIlpJefK0zBWfY0YBTimhWcawEQs8dTrakE90RO7
 AfsytdKycv6sjHXN2trxR/+eOiuM7wcXVt5IB8qtwwAQMxE4BkNW/+a/GHnw+CWx2wsB
 hGq7TZ6iovNwqijODvBmZWQde1pIjIB5HPsJl/6X5swnxCmi/14lryrQsGpQHt5jA5cY
 IH9hXgKEdIPUw1YcA/W+R9L29LSTdk7ImHzGZaTNpbL+xJ2ChLwLclaOJCS3Z4u/Bf9u
 JVbkgQtqzawUBytpFhmYgsiop5B0mx4A7abqvzrfSU90qALU5F3Ra0TXyhHJ+ZhCt7b5
 VUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ajG2eJaPSZ0bX/1WDeWm0EaqfEJqxAhsr1ZG8pJATY=;
 b=iHL7YIvI26DEpnHunB2StTOrULnnL9Yx9Wr08kXnhf+VHDG+BXLiRBwoyEoAynYK3N
 qZf3CGEY0s0LD9j3E1r9n/a00LPYKxxiwd1BUvyZoAV6J28LnRmTHXDiDWteMXAPT9VJ
 dX9eR6jOVxG/BYjjnRm5/Y/ayYAzQvvhhdPkmZnLtXHrNAwJXJ02xKSNNbm3YzwWMuvb
 udgWFXcPVCzX4DZrdwnrocE8v8G+Z86XEpYSSEE6afseYgQHpNafa/snmZnPQAOidUOo
 mePSC8NWK04KgYlYsO0XE8XzTDeWiS3IrY9Byh6sAfzE0oH5d95FE8vNQn6rUOFlAwxP
 WrsQ==
X-Gm-Message-State: AOAM531qsdmJujDXIuYYbyqCgRkP3CpjACBc8kNXDYwZDGpi/RdqqKmB
 7lcyJcIhNBTQflkuEOGEHrBFZg==
X-Google-Smtp-Source: ABdhPJxi+QacVHd5+AE8Jqv2dW1ZUW5QhwXfI6u/s0dk/pyhkeRg2gSWT3PEaZdn2SLI49Q2m9AoSg==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr2494500wrs.303.1603801068178; 
 Tue, 27 Oct 2020 05:17:48 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:47 -0700 (PDT)
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
Subject: [PATCH 6/8] drm: atomic: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:23 +0100
Message-Id: <20201027121725.24660-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
References: <20201027121725.24660-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:30 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
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

