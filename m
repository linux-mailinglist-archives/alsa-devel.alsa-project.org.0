Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C129CED4
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6F21683;
	Wed, 28 Oct 2020 09:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6F21683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872537;
	bh=U9QFJP+vxA7e+ZAg1VX9Xm2DVxiqodIiHbBgxQHcRyo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jx7dx4+iQpIqlZ6OlkhzT5uFMzX+YYNMjy4qLoQnKM4JYNzeTf+PCu+85hw5V0yKR
	 MXnTVPYgENARBGy0xtt7IFAff8SLuryImF1qIrfR+8OeTqVARGFGGjlTdCEX4wRRXo
	 DOkDhwzuQEvSD5T62UnrR21PlZPpj5ukOfDWi8LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 914E8F804B3;
	Wed, 28 Oct 2020 09:06:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22423F8021D; Tue, 27 Oct 2020 13:17:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27B22F800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 13:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B22F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="P+3tCIHO"
Received: by mail-wm1-x344.google.com with SMTP id c16so1209292wmd.2
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJP6zUa9eBmdV8bx1jdaWyKmaK9MsWkK16il5Qo0OrM=;
 b=P+3tCIHOjCZAx0wmilW2GDFvIGyFUKkJ6kMCnuzTaqTK/WVy0FTiGFvqMSEeEaTSDi
 lidtNcACGQa4FsZTJSv/WM+PJAWcMBZ84eqrsFS5cBt5SmJFi36Zt8P8jQqLDmjkvqeW
 khRH3E+peGeaQTCIY3Vt2p8gYCX0QOu5toB/kJmHKtw/28SJ6BKumTSSq2MJytdIAdgp
 oJxR5uAJUIN5EhwIO49GT3ZmC5B5ob3NU85YWSk0gy8yt2me9ot389ODzNeNzE1g7isf
 BjKSBXgUK2OMn2MduiDvTrDfwsn8XX/eMtY9lahl6HLlIYN8j7wdAJNYVoPtfuaoSs+h
 PRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJP6zUa9eBmdV8bx1jdaWyKmaK9MsWkK16il5Qo0OrM=;
 b=GFL9g5FHOL+zB26RO8UOKtpYIrbKQuIgNyPCVb7aAN5fpOyBsUPepMlX+euMIZZgaP
 s7ppEd55BYdAE2JQJ0EySY+kvDB2R1+IIdh2Qjdypk8VMPDdXGXZZIDljeHDzkIM7v+1
 0xpuHQ6Nezu9vkpWiR/pfphKgwa7JBjWl3GrSWw0uUydHh7ybNilL1IKN4ZOAoUibtr7
 jdpzR/D5j2DkVZeXLoi+ca2wKdrB7sOUKjojJSnkZgxCvuVQmhC7ee9quKIgSNoSO0hx
 /OjOUMyAPJah+DRjtxb9njdUt7sA4ZvPhuRp9T5bPiY88hE7RQ+jmJhii9u2zKWbZ3+p
 Fr4Q==
X-Gm-Message-State: AOAM532005mx/Vn/9WDKjQcW23se8bcSHXb7DnVZpGwdGW+4aNV/J0zG
 Ftsq/qyPVPxiGW7v6UwGKQKXVA==
X-Google-Smtp-Source: ABdhPJxUDPfM7/G4w39/lM3kfVBbiG37Et7vUzW73qIzYGjUaK5vAjNfvCioGZotPrXrgX+P7fvBjA==
X-Received: by 2002:a1c:8087:: with SMTP id b129mr2477389wmd.10.1603801056147; 
 Tue, 27 Oct 2020 05:17:36 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:17:35 -0700 (PDT)
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
Subject: [PATCH 0/8] slab: provide and use krealloc_array()
Date: Tue, 27 Oct 2020 13:17:17 +0100
Message-Id: <20201027121725.24660-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:29 +0100
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

Andy brought to my attention the fact that users allocating an array of
equally sized elements should check if the size multiplication doesn't
overflow. This is why we have helpers like kmalloc_array().

However we don't have krealloc_array() equivalent and there are many
users who do their own multiplication when calling krealloc() for arrays.

This series provides krealloc_array() and uses it in a couple places.

A separate series will follow adding devm_krealloc_array() which is
needed in the xilinx adc driver.

Bartosz Golaszewski (8):
  mm: slab: provide krealloc_array()
  ALSA: pcm: use krealloc_array()
  vhost: vringh: use krealloc_array()
  pinctrl: use krealloc_array()
  edac: ghes: use krealloc_array()
  drm: atomic: use krealloc_array()
  hwtracing: intel: use krealloc_array()
  dma-buf: use krealloc_array()

 drivers/dma-buf/sync_file.c      |  4 ++--
 drivers/edac/ghes_edac.c         |  4 ++--
 drivers/gpu/drm/drm_atomic.c     |  3 ++-
 drivers/hwtracing/intel_th/msu.c |  2 +-
 drivers/pinctrl/pinctrl-utils.c  |  2 +-
 drivers/vhost/vringh.c           |  3 ++-
 include/linux/slab.h             | 11 +++++++++++
 sound/core/pcm_lib.c             |  4 ++--
 8 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.29.1

