Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F82AD352
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:18:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6676B16F2;
	Tue, 10 Nov 2020 11:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6676B16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003488;
	bh=xJtX0XM2AgsY8wxOUI6WvVEyPvZVf07JVOWqbnTjp1U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dwVBFNRvY3jHDPmN01DKzwm/DeBx+dXN/RfhRxLxySu35mzfkUydw6GD3RRF6IkaV
	 fEvREn0pS5w13RoU3HvzvWhPBhbVtH+cQJMdE64PkevBZLQax5fg36q7RVF1rWqlXy
	 kTCsiEWhSIuzMGSdgZpJ3EdqSKMC287X2Vd3Amfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA86F804D2;
	Tue, 10 Nov 2020 11:15:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB4EF80257; Mon,  9 Nov 2020 12:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D2DDF801F5
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D2DDF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="SLmwWdYm"
Received: by mail-wr1-x443.google.com with SMTP id b8so8231843wrn.0
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uLK4LNo7fJGEwA0NXfYaAQzvkTW8/WkGHuVu61FcZ4=;
 b=SLmwWdYmA2Su0OyL+219YDZzeVXOkzpy5gortE6aVnwng+6cHrJzhAQJzNByqcPbPZ
 isbE6V3Lb9JgstbUlm/PZvCpNxelIDnwHLTINtWIzMAUAJP+6YLk/AWf+cW33RVJOvLq
 4EQlOOLu8zd+gVrxvr0w9485FxLsZ4uiV1jlwgDMS4E7kDkszYjvid4w0z806pFvA1dO
 U+nHioEgRrLmfLyR8tH/H/Ge3+qH76H09ubPywZEg/u4KcGzZ6YzgnyKXZKxxyWIo1cW
 FT3Tuwvxb43JhyG0QmKnG/8uRrjp2S/bO4jEisldpzuA8EOA5eJuEswwYg/l6KV0K70j
 EAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uLK4LNo7fJGEwA0NXfYaAQzvkTW8/WkGHuVu61FcZ4=;
 b=uIsvbdbkASGA1mhoWj+lCtQ46H+6kt86VZnscJBrz6USPI/WdEHi43WlehsJnhVYK/
 wDjZ7ke1GF+fNLty7AZ1+hOOimXQ2V/n+bXuUP3YrrPBHYOVYzmhrF8oD9D9B6uSmlvK
 nIwvYVYK+4Rxn9jCKlvg/y+ORqCNgNIy5RXof1zra6Lcean7oVbWFzehj1Ue03dt+jSX
 hLeKNW/x0c3eoOjYTbpjilKEaDb5qFZG0Luv7Vz2H8FwYBEmSjKimk9bF0HIKtht2ez4
 zeTo4LXrUbPsPKl6Z1/Uitc9waYC2b9hynTKzXGFb/Ey8/RQialy21SOB3xECvjad/md
 K/GQ==
X-Gm-Message-State: AOAM533Dn8pzCnm+ABply1BIxYSYV1wny+NIa0DRXEERhZb/CVW9vBR9
 i0EfoPAtoDJJMEUFuj9NHkbgUg==
X-Google-Smtp-Source: ABdhPJwC1VmwvlzIaWje0LLMyGfNJlg7DPW07nQhl2YWyOW+KS6oIpzkSUqvI/A14QOWWdg2F+P+tA==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr16961027wrc.17.1604920021208; 
 Mon, 09 Nov 2020 03:07:01 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:00 -0800 (PST)
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
Subject: [PATCH v3 1/9] mm: slab: clarify krealloc()'s behavior with __GFP_ZERO
Date: Mon,  9 Nov 2020 12:06:46 +0100
Message-Id: <20201109110654.12547-2-brgl@bgdev.pl>
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

__GFP_ZERO is ignored by krealloc() (unless we fall-back to kmalloc()
path, in which case it's honored). Point that out in the kerneldoc.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 mm/slab_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index f9ccd5dc13f3..d6df73f79204 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1091,9 +1091,9 @@ static __always_inline void *__do_krealloc(const void *p, size_t new_size,
  * @flags: the type of memory to allocate.
  *
  * The contents of the object pointed to are preserved up to the
- * lesser of the new and old sizes.  If @p is %NULL, krealloc()
- * behaves exactly like kmalloc().  If @new_size is 0 and @p is not a
- * %NULL pointer, the object pointed to is freed.
+ * lesser of the new and old sizes (__GFP_ZERO flag is effectively ignored).
+ * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
+ * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-- 
2.29.1

