Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F92AD380
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:20:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185E7172D;
	Tue, 10 Nov 2020 11:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185E7172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003605;
	bh=Qdypxaywex8+kOoD7cGhAruA7nGLt32GwpxHDK29mdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aw2XfNwxbnvzKCojDt+igZs/gzdzLVuRRmr0v56InOSXuCz3fu5XcEDl1Zv+VsNSJ
	 4PBrcKPorbXH3M/yt2od0QhKfSVuGvWVt+MFm+bowojMYio5/aaCA2mqdZRu57G/qo
	 LDIExlOeA+LU/fxDeD/dZ1snKAIw+tAoLwJH9r3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D47F80506;
	Tue, 10 Nov 2020 11:15:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87AECF80257; Mon,  9 Nov 2020 12:07:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B837F800BA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B837F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="HhaZo+nO"
Received: by mail-wr1-x441.google.com with SMTP id w1so8230042wrm.4
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=HhaZo+nOQzKzvbAFydHzhq/fvxbfXxDfWyMZKdv59I7MN/VIBjySEDnQMe/RJ80TcA
 NqPHcZzpiT9Vl9Yv9IKKm9MwVsxWHCkStLHrUf+NXGH1EdedBhImimOgYD1RGc+hVmS7
 w0LenYwK8h9OxuojkNtPP/U49HQw6iHdNr1gHrLWaakhF3wjn2TLICq+r+Fvsy9Kj7WT
 gmAKJGEedbXEoO0msCfLubbx9HXBW+3H7tEdvhbVHTF26G/FKgFsRpd/Awh3sW7fPLGz
 7w8aHtYKHTSY1GKa52i0+6eq6D3dhx5U74J+YXZObagUWKCdgL97HF3UpwbYvvsgC9kA
 GnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=p5H1yhR4IXrE/TkWRZ3LOPwbp+0pLeKmBcUbEmDmGbzXcCfwRX4peZrGBjewy8pjfN
 wzDGg1p975zzcjKGaxIMvDiz5nJkBGFICejyK75VdSq0PxlptYzKBsnPytglCJeIzYYp
 ORNGcF5O31LFlXwVEy6VKcH3Zv22OuFz36p6mcYB8oIG067iacfkljSHI98cXyDNDUb2
 EJ0WYn5FXHPeZ/6UwV0zwzuC94rSJp1JyNDUgW6FhTgvCOok9VpOfbNVKiraguWJWeGN
 LCa6MO68/o2cx1d9tulvfq+kXxg38HhGgRq87YhlldQzce4vfoo2ra9G7FBN6Mlb/01P
 OioQ==
X-Gm-Message-State: AOAM533bofjHPcbS/+NgHJGg20u4nXgSqk9DTv47qcbs+odV1D1xRa5Y
 1xDq2fPwf6Q11g7n7+j/ZIOtEQ==
X-Google-Smtp-Source: ABdhPJzNywkuCE6gKvE4DqCuDXqgftMItDHnLcQ5bFuAdPNNL+1SS5MLyT2l3jA/w7yub/ZI0a6q7A==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr17558818wrq.121.1604920033391; 
 Mon, 09 Nov 2020 03:07:13 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:12 -0800 (PST)
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
Subject: [PATCH v3 8/9] hwtracing: intel: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:53 +0100
Message-Id: <20201109110654.12547-9-brgl@bgdev.pl>
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

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/hwtracing/intel_th/msu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 3a77551fb4fc..7d95242db900 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -2002,7 +2002,7 @@ nr_pages_store(struct device *dev, struct device_attribute *attr,
 		}
 
 		nr_wins++;
-		rewin = krealloc(win, sizeof(*win) * nr_wins, GFP_KERNEL);
+		rewin = krealloc_array(win, nr_wins, sizeof(*win), GFP_KERNEL);
 		if (!rewin) {
 			kfree(win);
 			return -ENOMEM;
-- 
2.29.1

