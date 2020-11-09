Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2302A2AD361
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEEF01713;
	Tue, 10 Nov 2020 11:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEEF01713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003546;
	bh=lVaTk+Wa6L7uydk3tQ2l1XRZa70PK1xead8PeXhvC40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fr08AiDeSkRd8ZZrjwZsdhC1Dh9cMdbSAAKQ1/kduZMwn7Bw8EeG7iBFs8/7I/eWg
	 3RQ6fMCcQ4iD6cS30wOCK+JTC5RYOsLThopNyYzBfAiuyqWfriW6Wx/04mD3Mi6DiW
	 r1TcdkPT/AD9a4kE0qtkQz2rA8bBowFX1WIAFUts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB95F804E6;
	Tue, 10 Nov 2020 11:15:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3418AF800BA; Mon,  9 Nov 2020 12:07:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0765F8020C
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0765F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="aox5vh8y"
Received: by mail-wr1-x442.google.com with SMTP id c17so8204049wrc.11
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X2Rt2FzEDhfwvo5anIXOq/hUQeEl4/lxGNeKa+o6J0w=;
 b=aox5vh8ytYutbWVc26/liVn7Z8hEPu2nlIMQId7oA48asO+6m3jeTPz78Xi5tKvZ5M
 bwqHNNDNK70TD0NuDOZApqzQQQIxd7lpVAV+s12r5UTEgNsP0LLtTP/8WwzPWY/N5W3F
 Npda/QnMuuCjfODUnOM6c1KUKnZ4sERDBgsxwJiNxobq6BnhL/yQBZO223GeqTICPw9m
 vPcqcg/xsiMtQw2qzDEvFh+x8itNf6+A8g+1ljb0/aVhzJkxBCaUC9gPqB0T/1iCSeAD
 Up5ueADAnhN5fgjIVO2va7mHiOxvK3gevDqJSukErF5i8yrzIC+ShGo5F2g2sSe+Tv4s
 iVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X2Rt2FzEDhfwvo5anIXOq/hUQeEl4/lxGNeKa+o6J0w=;
 b=kkReOD5fm1QYp64gYQsi4QnYK+utBE21zi2K2tYJeReoVYKHFa4Jqag5FNtVG4qny/
 wKBnHhCn0ZDA0ilIz7ccbNmeEmbhLsPHr4Rja0af+TYX9WGMXm67BDdwup99jfYoraJk
 9xp/WCztPvSgfBQSPlpxLZ3DQRDjH2v6FIbizW7i+mXi343k5SSvXhixD5F3ElxdRKIt
 pmtwkM43O677Tq1lSUu6peaLuGzk6nzLWP5k2fR+S/KVsKV+FHu5bTqTZb4vfVshEdc9
 jK8iwZ8bMkIoIOi5h0BkewAVew6UVpGiiM3NGe8weF8tCC+VdPMgrHT1ogm/vlVP9kcm
 DalQ==
X-Gm-Message-State: AOAM533xAyI9WmMIsbr8hHirVXkim6LJo36OSwNg6/xOD+NantZROmwi
 T2QzyXdgQCKylUbM020tmIYDHQ==
X-Google-Smtp-Source: ABdhPJz9QUvKGU969idAKC9U5b3ocmwgTjZ8J0vtC/TaPYMbRMpLHkJeyp4aCBCLAgcQ+m/LRxWMMA==
X-Received: by 2002:adf:9066:: with SMTP id h93mr18252530wrh.166.1604920022928; 
 Mon, 09 Nov 2020 03:07:02 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:02 -0800 (PST)
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
Subject: [PATCH v3 2/9] mm: slab: provide krealloc_array()
Date: Mon,  9 Nov 2020 12:06:47 +0100
Message-Id: <20201109110654.12547-3-brgl@bgdev.pl>
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
 Vlastimil Babka <vbabka@suse.cz>, linux-edac@vger.kernel.org
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

When allocating an array of elements, users should check for
multiplication overflow or preferably use one of the provided helpers
like: kmalloc_array().

There's no krealloc_array() counterpart but there are many users who use
regular krealloc() to reallocate arrays. Let's provide an actual
krealloc_array() implementation.

While at it: add some documentation regarding krealloc.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 Documentation/core-api/memory-allocation.rst |  4 ++++
 include/linux/slab.h                         | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 4446a1ac36cc..5954ddf6ee13 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -147,6 +147,10 @@ The address of a chunk allocated with `kmalloc` is aligned to at least
 ARCH_KMALLOC_MINALIGN bytes.  For sizes which are a power of two, the
 alignment is also guaranteed to be at least the respective size.
 
+Chunks allocated with kmalloc() can be resized with krealloc(). Similarly
+to kmalloc_array(): a helper for resizing arrays is provided in the form of
+krealloc_array().
+
 For large allocations you can use vmalloc() and vzalloc(), or directly
 request pages from the page allocator. The memory allocated by `vmalloc`
 and related functions is not physically contiguous.
diff --git a/include/linux/slab.h b/include/linux/slab.h
index dd6897f62010..be4ba5867ac5 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -592,6 +592,24 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
 	return __kmalloc(bytes, flags);
 }
 
+/**
+ * krealloc_array - reallocate memory for an array.
+ * @p: pointer to the memory chunk to reallocate
+ * @new_n: new number of elements to alloc
+ * @new_size: new size of a single member of the array
+ * @flags: the type of memory to allocate (see kmalloc)
+ */
+static __must_check inline void *
+krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags)
+{
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
+		return NULL;
+
+	return krealloc(p, bytes, flags);
+}
+
 /**
  * kcalloc - allocate memory for an array. The memory is set to zero.
  * @n: number of elements.
-- 
2.29.1

