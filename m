Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2D62A3E1B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:55:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201FB17D2;
	Tue,  3 Nov 2020 08:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201FB17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390108;
	bh=o8/LHt/M3Uwv/9ERBXKXLwFqb+fNz2ScTElZgH3iuOw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i9vPrHRm9gVh6ZIzNSEy0r0QKQ/a/RJ3gShFLswm/mMzZaUYcC9R1aA/qd2+OaXNV
	 4B2eV/UPQJ8v5qw5svOeapy0mZH1InGGTP8poK3uIiqEzkS8GcZwtygu3rvtSjH11j
	 JgCadDE3b5Cz9SUYHp9pjaB430EVUyN5fNBi7pvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9598AF8055C;
	Tue,  3 Nov 2020 08:45:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F073FF8023E; Mon,  2 Nov 2020 16:21:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D494FF8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D494FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="s1X5Rn6M"
Received: by mail-wm1-x341.google.com with SMTP id 13so9780937wmf.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2w+mckzOvrR699h8x/Xo77oVyHlYkQYkZ/tcGlQNKA=;
 b=s1X5Rn6M3uEqYAtmP0kMjZBhh9+T3p5FrLN+EMPkAgjibT+uR/uD2Ngl5VYCdQB9ij
 cQ6fxK8h+9iDfacQPynKZ5VyW7F6bKG7h/Mn2H7upcsowgEdGzkDXW0ZeoKAxWlZFX5x
 pqI6X7Y1SxJBUvvLsIqozUVcIl4kjDlk/82AQ/NKJkAUAZxchqqk6ZD/i9gwMOE04t7b
 WEkSas1VOVRvcMuWMty1ScX6mRMpJB2pYQQLO7hPytPI/lP2lQ51TXcmMAV2jxgLlrYn
 9vORg+bb2oQsagTOeapcQPmylm4ykQl2cpkCX5KomC0i7s4Qx+hD5CK4/4R0xv0vDrV1
 0OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2w+mckzOvrR699h8x/Xo77oVyHlYkQYkZ/tcGlQNKA=;
 b=tYkbktH9yTYed5F3CXgjqHoiqSU1ke9YHDRzbjeSlPZcS82MmLT+zqJ6yNz3sH6j/4
 6+UTlBsGyzW9d3D/9+B0nkCAJXlYtfCObX9p8ujvzPtIvuk3jvMc9tr2ZGzehDbZzyww
 1Mvj8YQYam18LVCHSVNvMHp4YwMg24bZvR1hZagRnCXquMXg9TIULqdgjJQn3pTD1BLv
 tKsGayGAH56WC9HZ3E/0XF/5A/uI/Ni1aKO/FSGlpU7iGXcYx5oE8riTnINUodIw4E5W
 ysEDK/Sx5XNNZe90RTmh/kQmlMwx8o6k2n/F/RNLypaesVQOslQvWi0WMmt8CTg/3vyb
 9oXg==
X-Gm-Message-State: AOAM530yCzW8bBmhl9WYArOsGQM0zF+nJCfyPyqZJjN1CDghT37MvuG1
 Tp3Vn0NQQeC9NtVDmzZf8bbBVA==
X-Google-Smtp-Source: ABdhPJyD2xFNQ0mA6fkAF0MmLHKBRwPoEVnTSJcs4kw8eo3aVlf+gVmqgA5IOaVwyXiBRsxgcVYV4w==
X-Received: by 2002:a1c:68c1:: with SMTP id d184mr17928489wmc.74.1604330457481; 
 Mon, 02 Nov 2020 07:20:57 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:56 -0800 (PST)
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
Subject: [PATCH v2 8/8] dma-buf: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:37 +0100
Message-Id: <20201102152037.963-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
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
Acked-by: Christian König <christian.koenig@amd.com>
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

