Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6229CEDB
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA52E166D;
	Wed, 28 Oct 2020 09:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA52E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872683;
	bh=Qdypxaywex8+kOoD7cGhAruA7nGLt32GwpxHDK29mdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOAf7eWxkJxzBjNnEQnKrBJq6GQTn3JDxhv7wDRtq8JIzI6OO1U3PNIdIkX6g8i8i
	 JAy4+g2KSI81+JYM+pIDH9khfcQextVMSKAjMYYLJ8nzNamCW0oplBjDl6e5YMRts+
	 GCd0/JEtwGHXEiEnXSgCpUXXCYBnNTYj5YLaISL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08FB9F804FE;
	Wed, 28 Oct 2020 09:06:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3883BF80217; Tue, 27 Oct 2020 13:18:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 726A6F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 13:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 726A6F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="yOHWFHMO"
Received: by mail-wm1-x344.google.com with SMTP id l15so1204146wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=yOHWFHMOzbagC0sIByz6wesCWV3cXS/nI3Cmoh9rPQnQfktOmQ2fHmfj8t5QiyPB1i
 JUphXOi/RvRU2h+y1C0PS56sy6nIPSViAjZH7ZD1nL0kVb70/VdVHhj/AlJj5MwbzGtT
 Fz4SQHpcI/4fYul/80WnINgeUHB50rR1cTYD2+ptya0cZz6H6MnTFFgMAr7/MnsWRrjc
 rDDqtu/ht+rkyImTxS5uHgJepl4JUTv6GjjiiaPzGql9lSo9xdd048jkI/Kvk/PDUJaD
 tXJ1HdRkottcOLQk8yrpkIleD3Wyxw+1fcCHjnYdEOneZJMoeya+bL6uoh2P347Mm79Q
 Or/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J57Co4keOJLPpkOAtm30WeNaGboSbDo7KGbxSzSraLw=;
 b=FuutPaClPdoyNtaoOmzZlrQm4QyVGV9Jqdo8SS2BtvFLoFUaDlkYsFZQelILTHVt9r
 3nVvGOok1CkmPFh9VUvRt/jyDIbTFgJ6PqnB32q+fR/r/8jfwoyiFFzjRR8btyZ+vIi/
 B3pQccdjmpWqefwQ84b3TDYZR030jVxhVjavRjp+LdhRum5ppwAh8kyfMYRDx32t/wt/
 6wk6ckWUOfGberVOIpLYjWlgalAvlsz4fAq84yaaBqidpxKH0LoE6piV5x2RvxLyjwL2
 5nXyx8GdJLPMz0gEVgVCNJLhJgdmkNIPWXffSOyp8+Jw5Hu3uvhi0+rMSGQ3wMVqj8VH
 v1Gw==
X-Gm-Message-State: AOAM5321Xuzfx7QEan2G9izivt1WGpchvns3yi5o4psKZmSHPFgmE1aP
 o38MVjYXge4qAKDr5G0DG7Vp/w==
X-Google-Smtp-Source: ABdhPJzwzTmHdRfbZ3iyfMT0YC13fJkeiYScFTFd2MhD0PJKT6LJ0wGB9w/fQb4FZN9R2w5rbG6dAQ==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2566357wml.134.1603801070666; 
 Tue, 27 Oct 2020 05:17:50 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:49 -0700 (PDT)
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
Subject: [PATCH 7/8] hwtracing: intel: use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:24 +0100
Message-Id: <20201027121725.24660-8-brgl@bgdev.pl>
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

