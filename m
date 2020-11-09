Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D405A2AD384
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A741173E;
	Tue, 10 Nov 2020 11:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A741173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003652;
	bh=Fof5JbIO5d7I8NnKabR1C3pYfIHOZZJIubp2Ov9jNLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTkNxqcvNSg84A4/ah3vIDr7P2AeUriIgNyjek1Ww2fWlXUiBqBnbMUuW5KpaOB2L
	 zPUvpCbjIEL36A4VyYXFCEiwPM4+8QA60bNSXE7J7qFmijl41kPUG1eEOlPK8Q0oze
	 FsZSGrmhH5x1lfcAnuoLQpH3E0fcn7K88sPdSJWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1645F80517;
	Tue, 10 Nov 2020 11:15:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E83F801F5; Mon,  9 Nov 2020 12:07:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43825F80059
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 12:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43825F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="FyQZtjHq"
Received: by mail-wr1-x444.google.com with SMTP id p1so8197159wrf.12
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 03:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
 b=FyQZtjHqfEyQnPv0TcpcPtzRKkDJw+5CmWnvLutUBlrvUrtATk0Us2kMQ7uvhmWfUK
 0eNbMBkRypCB1SmS4/cqrqAasUoL4DRnxlRBQpx1RY6Tmr/Nmpi1qrl9p+XJQGfeV43E
 mFuEs1COfnJNQITfkQgHpOePzHVg4ZkMOJ3R2gxEfTlMvi1SeMz0xGFn8SpGlE7k3cDi
 ir/hpb8caCpkIei6+oq3/Ia4klZ1In4veaRJTPot+bbCaCVpPH5XTZ/5HXwtNVY6LaVL
 3yuEq5NuC3KQYT8NF2HDTR54VuMPtxnryjgjsmx6McYPUOFssMfDPYJ7o2Sth0VExlL2
 F4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cAnhvx340aJ9UoLX1zbzAI7OYOIgRl1WRMoR3sh/3E=;
 b=Df0wnUs5uruLzXrBcDsP/8JtErTqtr5XiYgpzL9kpfwhqfwN3LYNYSlWiMO+/GhZDe
 ba1cAvZ5M4LeHf+RbjAGbd+UmZtzuaWe33aLoMBVmmT853GcQO/UTia6ZbRMNKXBsorP
 brP6wVAa2GC20pBu/B7R9T+OuORF5z0hrPH1+fUizEou+Le6/lg4sRj5fduoeHq2HA7q
 tZFUCFf+SyEe8qlK7+c+3W1ztJu37xTLlctbkewd1eouQitTEOB7gPbyg61tk4qDO06I
 HMLbh5pVNolsEyGDzJUF3wvbxCl5z+faNRYjMlLpWI8EVuUW7CzXvV+yyAXP/B+pC7Wz
 idLw==
X-Gm-Message-State: AOAM532Z+erxseccS5Lqpjzb7uvi9r/PonB9fCAsOVohQ12qGetk8YOv
 S6NCMrOlTENdnldIGU9hCwr0cQ==
X-Google-Smtp-Source: ABdhPJzVQIP6CvZC6MnxUgT+6qZKHTI55QEgy3Y0wnhrHAwRmJiPirAD+L1SJbeYTFQHWYNVPaOZHg==
X-Received: by 2002:adf:a315:: with SMTP id c21mr17265337wrb.272.1604920029898; 
 Mon, 09 Nov 2020 03:07:09 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:09 -0800 (PST)
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
Subject: [PATCH v3 6/9] edac: ghes: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:51 +0100
Message-Id: <20201109110654.12547-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:56 +0100
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

