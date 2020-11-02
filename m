Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAC2A3E0B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:52:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4C317A9;
	Tue,  3 Nov 2020 08:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4C317A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389972;
	bh=IYQ/Pp/p1dFqFCI3HMJkUendY8kf2XAtCSzfes8v6VQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUqG8CjIxi28ke6xAJpFsAyav4qJ6Fc3hB6cG2WesFPi8EdFNiRlVDa1xxmjfXUzC
	 fqe/RZO8IUg0TyuVe8fX4o6rtFUU5aikLLo5ovwoHftzjUadeHF9nmdwwR+IDgKxQ7
	 XbOQncyI2itbUL+mIeJqhwKFfsfP0Y3Qkw9eQDs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C7FAF80533;
	Tue,  3 Nov 2020 08:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F2CF804AF; Mon,  2 Nov 2020 16:20:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D39FBF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D39FBF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="oJDk04WZ"
Received: by mail-wr1-x441.google.com with SMTP id k10so13721419wrw.13
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
 b=oJDk04WZntZBUbAydrL0ALwZvx6qsFnM0UTwP7yjzGp9SneSLAZ43tbdB/bF7oQqW3
 iiuSouFoG62GGcADtc8azAKYtDYI0ZnCIVLXLENOWEvJtP9dEhgy+GyDXB3JKS+l2fGx
 bxF0NSqOMUp/P8+SkU3s5luJjeEhP2lfKWf+pC10hdkDrEXp60OzkmeLn09PzpY01EkY
 MwgDB4TUg62M7QnU/rsSmTQOq5JnBOcV5FU9fgHyN1JZK6xeFZDJ6PchjKtIM6/g/M7c
 AXXVv6RED3VXkyertnMsUGPB/xvLGiikQh4Jzj9aP3M/2EMPl4c4y4bnyySk5m25IxHj
 ZNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
 b=r45w8a/X7yvIsqHQy0OWu6UmhkrFAJe+h4Viug+q1pN3JehLxjVIQ+16xQ4UYlSJbU
 a+gsTM2BnGi/ZNk1nxE7BHTue5GKvJfxfcoyjEmutE1S/1Od9YMrcA3+dYqHHca6/A02
 LRkSPnZyiCz7KxRkrZ4bqKODMnJtGyNSKfaYsC7TDHBjwhEt6xSdAPui0iXCzD8EFWYo
 GkRGv11Qa4WlQKVKv+oILW5WcQv7R+YqR+FlT6Arygo5YkLmch7NbfU13Ptfa3b8lZgu
 lFHgbkKwsvtnsUkh7hZRBkKkiggwnU17q+LtLo+/nVpAz1hIZduFXgTquJ/hUQ+wwMlI
 BKYA==
X-Gm-Message-State: AOAM5314gS+GjTCCX5KgLMr40gUdzL/hrpfJRzTXcApp0FttbpFQ1MOF
 UGhZaQCrgN2cOdZ75tboWjbARA==
X-Google-Smtp-Source: ABdhPJwvKcFeOxhAGZIOl2LHYhbvs+cPksUqs/XQ2W4u8LoRrqAy/FNPpiVpDIX+qAcFGl6qizbLQA==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr20784973wrn.52.1604330447426; 
 Mon, 02 Nov 2020 07:20:47 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:46 -0800 (PST)
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
Subject: [PATCH v2 3/8] vhost: vringh: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:32 +0100
Message-Id: <20201102152037.963-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vringh.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..08a0e1c842df 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -198,7 +198,8 @@ static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
 
 	flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
 	if (flag)
-		new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
+		new = krealloc_array(iov->iov, new_num,
+				     sizeof(struct iovec), gfp);
 	else {
 		new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
 		if (new) {
-- 
2.29.1

