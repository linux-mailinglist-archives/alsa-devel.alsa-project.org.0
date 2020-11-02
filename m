Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F32A3E13
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB724178A;
	Tue,  3 Nov 2020 08:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB724178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390031;
	bh=5R/l6xMNAmD9ia5C0SOM8rWxVPhJrekNME3vFbMG/PI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWcXmXB4o9ssNkdZb6LWqpV2eZftGo5M5WXFGMP4SKYJJAJOle9SEphb26LqPcxNx
	 dyZ8OiNqmCsTiFIs7bf/8vdGA4GuvjVU/2Ymjj4UVlxcghUZV0oxSQAic3twdUBTF8
	 INHQw/XFbhrNhcWKS7fZwH6sTkPyuZUToxFmIow0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A4A1F80542;
	Tue,  3 Nov 2020 08:45:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1076CF804AF; Mon,  2 Nov 2020 16:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B71CEF80256
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B71CEF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="e5kjyidW"
Received: by mail-wm1-x341.google.com with SMTP id p22so9767458wmg.3
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=e5kjyidWL8cmpiZH3KN4gbQ7mPV2yzGx2nkYanw2be0opJ+Vz0F/h7+cASkSpyPvft
 Cq/QKHKgAn39kkunAelTRvo6+t//6O8sFAxBBIWVN/D/sXHLN0TcApD154vCBfBKfHLt
 cLayxxCVPglJdryRP0qymWqoSldB8VezR3ze+ww/h6mL64irtmyW1Iv/4QeMsHgFEmU1
 EnCxPQadIxfRrkqDHNb0AWnJ/TDZd1tbaPxP67i/kRiJU0AadmF8tkFzS5SiBFs65eHd
 s2porevmNAwd7EJUylR58be5iKdfMpI6Ofog3Lr78MGsAlfmarg/IAiyvFrSdsneofbm
 aJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=aucvcXDDg6MXjgeUK7wzXoM/yBwV2ERBSGwkLf/8hRd9PrIUX4NAnT5+5vFauUKzqA
 KPPNmqGn+r8bfhTGIE80duaz/ZvLwt2DNDqzrRmE1gRMA2/iihUZDHX+n8Mmo7m2fd6M
 TddfAcsRsevMrZch5wa/dIUomHki+P0J9jWPUVR0kHrW1HEYpwRScpakOVL+lka40aSL
 IXZaZGCunzDf4noeTSb0DohTVmaZa3mUmB+VG2gYvdMpTEpfpiSQL44PPEvAGshXyX2P
 atr+6iKi3newLaQGWaPqVUznuKpJt6gW92HPY9IMYtCgqPrfHXy8STxTUORqNHJJ0QCx
 hwYA==
X-Gm-Message-State: AOAM530NJq9womqXOF8KH+gwM7iC9t/kUb4tVGFxYWM1jNNSRE4ZoHEo
 bjcn7oDIMBRdCgsG3GqlvzeTlw==
X-Google-Smtp-Source: ABdhPJwLl/Yb+dmot3Qj9GobH6d2VSIEqfIwMoXbr9WYE4ZivqBC7akLVHb/L/C2gNGglG2Ytc/IgQ==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr17871137wmz.87.1604330453311;
 Mon, 02 Nov 2020 07:20:53 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:52 -0800 (PST)
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
Subject: [PATCH v2 6/8] drm: atomic: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:35 +0100
Message-Id: <20201102152037.963-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
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

