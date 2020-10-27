Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15F29CED9
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BF91692;
	Wed, 28 Oct 2020 09:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BF91692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872604;
	bh=sXf0UC6t1IcOIKl3k92QvyeglUBf6I0tI92y3Z9d4Qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmbME7TaDsHD4jkqetMGI6qEe3wz+ODwDN/7bA+91l5moGTkCMdbdHYO40csgR9N1
	 8orNKTswom2VPEOFFlLWuPXadktvtyBRr6mKh5b8227V3Z5816UNnFyBlX5MGBvYa0
	 KdetVrLEf0lsQa+bvW3KQeBilKQhdRW2XPWcN0N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C120F804E1;
	Wed, 28 Oct 2020 09:06:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03B3AF80217; Tue, 27 Oct 2020 13:17:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54642F8019D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 13:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54642F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="fcBVAav9"
Received: by mail-wm1-x343.google.com with SMTP id h22so1205325wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DX4Vpt/5rOOp/h8PsP6BCvcutYZPagP/0wvqhEtDkrc=;
 b=fcBVAav93bPjLTMO/GKGNWbWJSyP9xDWjrQdREKVHUObC2fvcpeMBWbKtOvwqTtDBw
 TYuM0tjJGe4hFI+bJgCEuy05Jhcj7DoPbEbpzYlue9mGnIAJyPrd5G7jnyVyC0ouqYQE
 KUcuZgHebd/KjJ7WpMudfra+Ob5jpn/DPH6XMb8lun7OwUCY62x1ZRk3XnvNkzK8JTfI
 GDSUhxWu1bxiLfQLX/wnkP4DE/r3YkbU7n/g2xdLeTwmRffMBnF1fQyXeAU/KAOUkWXm
 Qr72qjOlysXmXLLv9c8JP8XDyn+yxZSMDREYLPBPXV2IBO4ogKZ9faYnUv5Hy6pUK1mv
 KBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DX4Vpt/5rOOp/h8PsP6BCvcutYZPagP/0wvqhEtDkrc=;
 b=uWhPgVkzymCbZNR9ntRtY1i+e120maBJ6dbDXY7V7syEeAzJUhIiSOAxKxX1YAFooc
 YR8tI9s8nqBexdq5Xx35r8BiMLJuFGQ6Kw/gOSWYxv0nJIUXpG1wM46BuKxp775AlJXS
 cUGZmzHDYS0D+2WhkJGqYmZnouH9hVTK84nyz+IZt3tcVkXJZN/vHl645yHuuWP7zYow
 GTP/30W7nrJEBn53ANDr+zuT6sbl01aJVT8/2ljOQR0l40jSrms9OyPL3VnXNSAK5oxJ
 uRJM3hXn/LPFvo0f31f8trOgjtSXSAJZCx0qkKsuvAozOveAwkiX8zeWBiLWgv/e9lPg
 l5tw==
X-Gm-Message-State: AOAM533ONpFvAdupYDw2c/lmdhAO9dYf0alQkUOBRxEX78/TTnOOgjoY
 D5FOWAP3/t21KWjrhnkOb5ragw==
X-Google-Smtp-Source: ABdhPJxpFHC1iDNaVhyqgdX0LXFgCHzNZUEcFDl9D5G1/wCxSZcWoj/5QOXgpccEbzpQpJAT/3s/cw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2573033wmi.140.1603801066439; 
 Tue, 27 Oct 2020 05:17:46 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:45 -0700 (PDT)
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
Subject: [PATCH 5/8] edac: ghes: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:22 +0100
Message-Id: <20201027121725.24660-6-brgl@bgdev.pl>
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

