Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2B29CEDC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:11:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB1F1686;
	Wed, 28 Oct 2020 09:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB1F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872698;
	bh=l8y8VH4rh3h9P3FRFKi1vvyPfxXBdcr/g2kMF736tFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nG5Vh+fJ/amFcC4eimzcyTCdExMNkoUwUTASumY5cRPH1oXOr+n3xEjvQ47lyhwHv
	 wpzzmNdRZIyfcW2Un9bH6iXhvoxdMr68apfTf4OwZzEyDA1oHcMkyuXHF+4/eo6ucK
	 sidJlnvy7fqHPo4UDp+DBliZcgbCrzPQ+5fhO4Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C7FF8050F;
	Wed, 28 Oct 2020 09:06:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B8EF8020D; Tue, 27 Oct 2020 13:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57534F80227
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 13:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57534F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="uINaxail"
Received: by mail-wm1-x342.google.com with SMTP id v5so1170727wmh.1
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNS5tvBpA/i0H7p7l8m9y8bW5QzwJCcb9cwqd3juySc=;
 b=uINaxail9sUfALoEWstn2csJR9jE7v9clDsZtLcLiOMSXg2LAVFIQqN6lHKyyZUd4l
 jRiwMGMG4DxMFJH69rSCLOtob+027D28VPhBQtpIrjKA/W5lb5Kv+7Q+cjTTcQNW8hxv
 wUoV9A8I84g3amtYBnRWsQ9zCBUoSUYIxS8yqik5kvDE0D17HbZwhUPBEWV0xwo4eSQB
 xtGlMRrIXAwBsMOZYueqppFbh9JQaNXeAayhSnZZJNrW9nmKvVAevDfxEiP//pXPGQn7
 22ZoAAwvkiz2v+dHQuQfEfVqcnXh5D2KeVL1FBqvTUVKMuvl7wX7b6wRp1orV+Uuzzwn
 SgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNS5tvBpA/i0H7p7l8m9y8bW5QzwJCcb9cwqd3juySc=;
 b=A+ffy4nxbvvBtmeeMQzWEEhTUgFGFbIs0CM5Y4CXb8HyJfdlOoTeB+1fsDub+YGm92
 PuQuVghNV2w/1e4kH+h75BtqjiK5WgjGrQ0DvlRV9rHi3L4Vo53RxHORBmEV/BsCag87
 bOgepOy9tSD0m1o+JeDB1Dm8eJwz6dE7Pm/jnfu2IZ7cEVbbUi3uHnWjQjjSOVu/QIKh
 FWkImar2qKb6yz7FeqIiJWtqHNR6/Sa4W0cPTDYR2y71CStknufNm7MmlUawSujbguRG
 NcGT4fhtU2FkFgUXtXR/lkSbb1zvnqribS3ZFMFTveX0iE2YVAmEIjJlpo3UzUFrhxob
 xZ+A==
X-Gm-Message-State: AOAM531lOIylqQUHuW9zdKOKWNcT/rysAEkrmA7cis3pJSY/5eB+Ytbg
 /A1hzABsVTyvweq6rbFVdSlMnA==
X-Google-Smtp-Source: ABdhPJwlnp8d7/fOEkypkqwExUCmIl2RKP9vSFIY6Z3TXZuynGv+gQ6ZzaCTjRN4xR7i9/EdKZccow==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr2460319wmo.143.1603801072719; 
 Tue, 27 Oct 2020 05:17:52 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:51 -0700 (PDT)
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
Subject: [PATCH 8/8] dma-buf: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:25 +0100
Message-Id: <20201027121725.24660-9-brgl@bgdev.pl>
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
 drivers/dma-buf/sync_file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 5a5a1da01a00..2925ea03eef0 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -270,8 +270,8 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		fences[i++] = dma_fence_get(a_fences[0]);
 
 	if (num_fences > i) {
-		nfences = krealloc(fences, i * sizeof(*fences),
-				  GFP_KERNEL);
+		nfences = krealloc_array(fences, i,
+					 sizeof(*fences), GFP_KERNEL);
 		if (!nfences)
 			goto err;
 
-- 
2.29.1

