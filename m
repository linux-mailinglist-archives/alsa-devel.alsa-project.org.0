Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7592A3E14
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:54:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980D017CA;
	Tue,  3 Nov 2020 08:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980D017CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390064;
	bh=Fof5JbIO5d7I8NnKabR1C3pYfIHOZZJIubp2Ov9jNLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CW0faYy/hUydmxNw26BN1Cn2pyNokOfa/HqwnU+veaLHQohwVOqzUK0CTMdEvEoPK
	 rF2F3HLDyIVUlLBRUkMB/T46EP27iwfrmJlfA5QzpWUHM+t77XaZFR9GAajEwp92im
	 Yqk5mwHzxQZcpr3Mw9PoEBTpOrvQoj5siy/wppOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DBC7F80551;
	Tue,  3 Nov 2020 08:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F407F80256; Mon,  2 Nov 2020 16:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04B2CF80259
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04B2CF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="1SSGYQiV"
Received: by mail-wm1-x344.google.com with SMTP id p22so9767348wmg.3
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
 b=1SSGYQiV02UgtOHtJSH9FJfR85Ha4HUObVTcAB4GRJTGZaZIhzSrXM0vHFpOEKMzpy
 9AVGovKSH1wVLrXkWnMIzOHSW4wOPIS5fZx3b8ig/WoV5AMjTLszIAqy59pnDVv14w/l
 IYbEa1NUeZDKQoqe1O1eFKcs7UR1ERcou6uj5vI9B+71gx66QuxqtHDKWi7rH8IfdwOh
 yw48kSM/sVpl+pp3eua+NGFFDAf41lVgMyri3bmmaOjyWJ1HxXj6Xh4yzVYGP94elkAY
 ex0gQu47xGOfITLoiNnuoXnMesEvAqtWgstdC5/DubydCuhho06kgzvLJIxv7Zdk+/Mc
 9hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
 b=O819XofmiJflluLo12bMLcrrypwz83jp+OgixlYpJ2TU90VQGxozOnb1IlWHM5MyaZ
 +hrb085Uaff6IqMeYshHvCdnqq5M+AtmkKCL9rG5wwETJIdrQXMejxcX+dZHFXXf752P
 VUWviuWyCo9nEhEcwIxc5FOxJiScFdKYhihTcyZJkqaJgz6rmyHezhKlxsLNZBnMP0p4
 y9MCdmqdXxFLUUyrg9VUlwu7MaWYbiD2q7u/76RxD7FGHQ2ib226eynUitbQrofT/hLW
 Dy5fH5h2QciqDBsq5B15TjbnKUT4e17kfhlsxbAuGAj3MdnM2clg28hyJJjVoSZ4Tl8Z
 NJwg==
X-Gm-Message-State: AOAM533pBpSuJwJde1WGmzWnmgQLYPtH9pB65cvxTXpAjiGELbXKDHwe
 eXbXLAPKqcAHHunnPthHNgiO3Q==
X-Google-Smtp-Source: ABdhPJwOKpBOX0BSWWvVIHmaQ9Otc3dpDKHkytegGJ3V2bSQroVjGauUhivRRvqIF6S2knMM749pFQ==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr11705984wmb.45.1604330451271; 
 Mon, 02 Nov 2020 07:20:51 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:50 -0800 (PST)
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
Subject: [PATCH v2 5/8] edac: ghes: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:34 +0100
Message-Id: <20201102152037.963-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
Cc: alsa-devel@alsa-project.org, Borislav Petkov <bp@suse.de>,
 kvm@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
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
Acked-by: Borislav Petkov <bp@suse.de>
---
 drivers/edac/ghes_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index a918ca93e4f7..6d1ddecbf0da 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -207,8 +207,8 @@ static void enumerate_dimms(const struct dmi_header *dh, void *arg)
 	if (!hw->num_dimms || !(hw->num_dimms % 16)) {
 		struct dimm_info *new;
 
-		new = krealloc(hw->dimms, (hw->num_dimms + 16) * sizeof(struct dimm_info),
-			        GFP_KERNEL);
+		new = krealloc_array(hw->dimms, hw->num_dimms + 16,
+				     sizeof(struct dimm_info), GFP_KERNEL);
 		if (!new) {
 			WARN_ON_ONCE(1);
 			return;
-- 
2.29.1

