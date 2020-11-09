Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA792AD385
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD8AB1704;
	Tue, 10 Nov 2020 11:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD8AB1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003686;
	bh=d0GnTrWnBMf2S4PsqPRVwHfaCUuNC58ESIPeKWqgtgs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHLYVu9FGtI57wn+xqmcP03GREy4STSv9L1on/a6g5kQWTT0JXUPcIu1IZXBCiDNO
	 OrVrjz4m2xdovG6IPipgez7DJ/BU0GjfFpFLcSzA/fEgESRmrSKQlDaFKAqdi8gbBq
	 u/D1/beO6elkGvaPLwMqm02o94wh7f6ld2FUh5/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A420DF8051C;
	Tue, 10 Nov 2020 11:15:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48283F800BA; Mon,  9 Nov 2020 12:07:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47A91F8020C
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47A91F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="RG2F+82o"
Received: by mail-wr1-x443.google.com with SMTP id w1so8230149wrm.4
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uU00Tfvm+17A7iE8x45GJfsjWZ/7CO3W5FPvjO+v7UE=;
 b=RG2F+82oEqldWg6NTKGoC7UPk0O3vTxH9eTGTjyarUGvACcl6LwiyVBskaFEt1Pqm6
 qMxcfA0KMfkW5wNV3g6IT+hgAs2iqXACJ3N3dvfqSrCeZzUAOMwEc5r60U68oM/abbdp
 BVvztISZFGbho3XV9t5SL1u/kBS3vwLpauBxX0yXvm1ttFGAsQfYFHV+KUfWm52I7cCD
 8gCnDBCe0CgXSwSibJtmk6kjahUuLaDNlL9UchomHElEtgRdetA4QUIzhJ3s2kqYQJIy
 hMGwQ19uDlTKAD9Oe+7Y24DOg21aGPiQwGkonVuLgyYUV5H0Om/MAWDetrgEg+DE7LJv
 /kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uU00Tfvm+17A7iE8x45GJfsjWZ/7CO3W5FPvjO+v7UE=;
 b=F/o8ZsuVt25SRUI2pjrAK3g4Lgesuxgt0b8bH/oz73jY9SY6VYiKPV2X1DC8Y/UAPo
 y7GZ3A4hvfhhldy5uDSd9K6Z9b2/Oigc2iyr23zWxft1QZuxHScQxWVDCdJrxqazi865
 vl0H+1JfM0msGAnFiRe4XqSEwNMvwBkLzftsY76ikvWAzEbL2wd+HCPaqamxFqR538Hh
 5Psof8zDzXJIB1wMqRDANIZl/FLBlCngLlE0nau33J5T3nBSvkFRNv8vATvm01cKr6de
 cyBxlW9GriZTelGo03hvWOT/KLgz3DXttNAW9gKY7K+zUb/4jMGZzhZ7sPaR1zfN8qXQ
 rDFw==
X-Gm-Message-State: AOAM531y3wSKB0tj/Nu3H9soKJA8tGAqz1cs3P6pUgwsBe639hs2m2P0
 wmgpxKh/hy3KPO6ERZ6JzvbbfA==
X-Google-Smtp-Source: ABdhPJxqEseYvyvPu8S4NoqtIS4iNC5GkWi9kRY0f7fjCzxFROga8iAwMRGM7mBzZtGU9vsmm1Ko/Q==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr9918092wru.397.1604920035266; 
 Mon, 09 Nov 2020 03:07:15 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:14 -0800 (PST)
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
Subject: [PATCH v3 9/9] dma-buf: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:54 +0100
Message-Id: <20201109110654.12547-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sync_file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 5a5a1da01a00..20d9bddbb985 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -270,8 +270,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		fences[i++] = dma_fence_get(a_fences[0]);
 
 	if (num_fences > i) {
-		nfences = krealloc(fences, i * sizeof(*fences),
-				  GFP_KERNEL);
+		nfences = krealloc_array(fences, i, sizeof(*fences), GFP_KERNEL);
 		if (!nfences)
 			goto err;
 
-- 
2.29.1

