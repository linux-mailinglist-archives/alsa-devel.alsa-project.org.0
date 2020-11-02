Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E32A3E04
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B5C1715;
	Tue,  3 Nov 2020 08:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B5C1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389830;
	bh=rvVtYJy7mJVMGmkChP9ZeKeWnqzB2nhWEUheDW88sfM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jkzbOuFIsukfKQAeTTLfkQz9aiVCbLGRBXcWg7fanOrZAolxHMcqs7D3dkdkKAdIS
	 FYz3VdODgm+NvF8xEkM2MB7HRGo9MeKYqo0CSdC8T/H5GdeR0YJfgj+572+n3G6QyF
	 OAy7iZ5PLtkKysWV4OLpJI1bGjc+IlzRVvmJ9YYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B88BF804FF;
	Tue,  3 Nov 2020 08:45:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A30FFF80234; Mon,  2 Nov 2020 16:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4BFDF8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4BFDF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Qx6XIDDk"
Received: by mail-wm1-x344.google.com with SMTP id d142so1145523wmd.4
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87j4CzgTjIznAlAGNVYlsLolKCjEqxgXtItxHQqBT+c=;
 b=Qx6XIDDkn/kgktIUkUO/8COUc5pZ7Xmrd4WIhOhtRKLqRH4jXfWsq4XQF+tviij2AS
 vQP1d5+o7im6WeNCxad2viztsEaWhYtaJWG1Vhj6E1J8UjnspJVoxf806Ry3jv4BdHop
 xwURD6IJS7yc8ElYCbGBoudPzERtKy2XkZUjWqe32YJYz8gF1KzLAhJg0Sgft+3IMCWa
 mV4JR08o+DnkkGEu+pVGUnHdRkfznAvaeW1sFyAveCP1kOZvsLyq+TKkJLfHFzK57TIm
 KW7GgBKwfAnVfidT0ZnlSAScho5vr6Rjk96VIp+X50g2am696JF1i4Ih5IAkrxiZq5BJ
 Pdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87j4CzgTjIznAlAGNVYlsLolKCjEqxgXtItxHQqBT+c=;
 b=m7/al3OqXKh9Rk2x2hE6ZXg7toVIMCLRp6HXsqLzX4xOet9obnFu4kT6wzd+XLql82
 tysoMJZip2Apdw/+AgJ/bJigHErJxk9E3MFp0ty3Lag+te2l4iYJUqVrqcJkBkjhVt3+
 xsnqDe7IlILonVd6FO4MJk7p6G6U5uFKoJSozKVoKVFoBa0AdyWn43TPGge+lCeDmt+U
 sgmKIr+TrTXV+RQIvP6XUFz6ijLfGI7dvUw5PLAuY0OxR7HWviejWoL+ECIU4IJgqYkm
 nBoXh738Nmd7B3vAMb3E9BeybQQ9NRGyTtlg6RRNstDUi/F25p0vId68hjFErWJHUmJc
 4t/Q==
X-Gm-Message-State: AOAM5304c0JiEOXzgfKMsz2EON34n3wPiSjXICUZr15Ihi8ECM0TXAYK
 zSJHv2Qp4MGpnMkAobr2Ou3ZnA==
X-Google-Smtp-Source: ABdhPJyrNQzSj1QE+Qkm5CWvnTtBNZHgXZdYRD5QsBgAGl8HowPGK/ocdDyRBmSt205H50cLvofh/w==
X-Received: by 2002:a1c:9848:: with SMTP id a69mr18051505wme.158.1604330441469; 
 Mon, 02 Nov 2020 07:20:41 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:40 -0800 (PST)
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
Subject: [PATCH v2 0/8] slab: provide and use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:29 +0100
Message-Id: <20201102152037.963-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
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

Andy brought to my attention the fact that users allocating an array of
equally sized elements should check if the size multiplication doesn't
overflow. This is why we have helpers like kmalloc_array().

However we don't have krealloc_array() equivalent and there are many
users who do their own multiplication when calling krealloc() for arrays.

This series provides krealloc_array() and uses it in a couple places.

A separate series will follow adding devm_krealloc_array() which is
needed in the xilinx adc driver.

v1 -> v2:
- added a kernel doc for krealloc_array()
- mentioned krealloc et al in the docs
- collected review tags

Bartosz Golaszewski (8):
  mm: slab: provide krealloc_array()
  ALSA: pcm: use krealloc_array()
  vhost: vringh: use krealloc_array()
  pinctrl: use krealloc_array()
  edac: ghes: use krealloc_array()
  drm: atomic: use krealloc_array()
  hwtracing: intel: use krealloc_array()
  dma-buf: use krealloc_array()

 Documentation/core-api/memory-allocation.rst |  4 ++++
 drivers/dma-buf/sync_file.c                  |  4 ++--
 drivers/edac/ghes_edac.c                     |  4 ++--
 drivers/gpu/drm/drm_atomic.c                 |  3 ++-
 drivers/hwtracing/intel_th/msu.c             |  2 +-
 drivers/pinctrl/pinctrl-utils.c              |  2 +-
 drivers/vhost/vringh.c                       |  3 ++-
 include/linux/slab.h                         | 18 ++++++++++++++++++
 sound/core/pcm_lib.c                         |  4 ++--
 9 files changed, 34 insertions(+), 10 deletions(-)

-- 
2.29.1

