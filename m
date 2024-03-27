Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB548894BD9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FCA82BCF;
	Tue,  2 Apr 2024 08:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FCA82BCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040760;
	bh=ZqxqBePx9O0aSeYwWfac5JC18N8WH4wazKZPUDWtyb4=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B1t6ep5ua8xnNMXzKV/FwrYD/xq9z/zB7XMFzJDgYcZKscl1Ga1yycM8l5qC27p+D
	 PJz6wUAhTcCKCKAg5HLRzHyBBbByhMm4IWmn43PgkvYz+fpFn7cXW/70eo+NDMj2mm
	 9hmsUfNUZ9s9woZASDZddevYh7wtfthuX8yl7mZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB52F80857; Tue,  2 Apr 2024 08:49:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98366F80852;
	Tue,  2 Apr 2024 08:49:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 844E4F8025F; Wed, 27 Mar 2024 13:41:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAE09F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE09F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OmI1XC6x
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d700beb60bso1586011fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543298; x=1712148098;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFaFw1OZuXizkw4uNoNpzMqxfCxSvA28jWrn6rdqU5M=;
        b=OmI1XC6xB0kt87JVdWNB38SPOhKOy4vOBa9r7a9/2oBsYX4/rlWLMTpeuFnc1DjxVO
         ixMkjd47dK/fqc7eMKoGvUKlK0VYJeR5QxkjUG8Y1enS3OOfaHM/stfgMM0GcnzhYNQj
         8xn6aMAb1ZcQNGlTrcb5bv58Ie2qRFEXgAu90g0OzszpKxtuIhFW9h70eUuBjw+EE81A
         MukOoYp8mvFLhB7ijo9w7EOV9gMo97T2+RVI5eO3T0yyvf4RYtqrRDkIDifn6HAZrEyl
         1+t4mYbvjgcz2vANB5gGs7IOm5f3lbYs4ucC0aaKmoXs16nTm6FgxFjYz6yKR1y12/9X
         /MoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543298; x=1712148098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFaFw1OZuXizkw4uNoNpzMqxfCxSvA28jWrn6rdqU5M=;
        b=Eau0i0o/ForYUcmkoc0mgbYPu4KEAWm3PLnGkJ5lJy9ohoeaIOJniEaYYGOIOAZ1yn
         szy6F5NWksorUfqXbeBqYXSQ9ZcqpsGCzD/xi3ASFTjJdn9pmWSm7Uy1j3fO2sYi6xyQ
         lhcujkBwj/PQavKtkMxpKi9gcpmALhDTK3Ht0LbL1IbFuG4nD9NCzJNXuM7JVqSDIirq
         Y0U5Z06gAxjuyxbxk39ndYt/EP0DNkAdjOgHMv7w0GsuokJgRxEcSY7BbJF8pkauPQ8m
         oDHxwSzx2TV+dx028At42FG3O14ZH9mytWbkfOqcMoY2e0NYjdEluusVBIw4bzKMv7ne
         6P2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+2MxT89M4V8KwZbTUvMkg1QB9wutTezfKFPqgMKVsIIOIaATzr8A8QF/I8peo8BeOkx8p7j5HI928pJKvv/dPQmhTWR2vqoKZaNQ=
X-Gm-Message-State: AOJu0Yx6CUvINwjYrKIdJWje8rQU4JIpxu+shyhSzmBCCC9fp5oPOF1W
	7Royp7+uxEuBEPoS5Oi/aE/Kk0TzRDXsJB7Gu7x1g9g2Kq2wOwiW/3acrNxlJEM=
X-Google-Smtp-Source: 
 AGHT+IFS1x7gpjA7jUKSh2w40PflGxs4LWIU8D0QvTuDe3IphcKfLGKJ6nGMGd9SaTSRJh693GFsRg==
X-Received: by 2002:a2e:3a1a:0:b0:2d6:e148:2463 with SMTP id
 h26-20020a2e3a1a000000b002d6e1482463mr2074785lja.24.1711543298562;
        Wed, 27 Mar 2024 05:41:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:41:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/22] virtio: store owner from modules with
 register_virtio_driver()
Date: Wed, 27 Mar 2024 13:40:53 +0100
Message-Id: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANUTBGYC/x3MSQqAMAxA0atI1gY0dQCvIi4coga0ldQJxLtbX
 L7F/w94VmEPVfSA8ilenA1I4wj6ubUTowzBQAlliaESVzccC6O7LCueors4zLOiLExn+pYIQrk
 pj3L/17p53w9578lCZQAAAA==
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZqxqBePx9O0aSeYwWfac5JC18N8WH4wazKZPUDWtyb4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPZS5yGoH1UVP3T0Npm8blJRoVKIHSae5kBq
 HxYGiIbwMaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT2QAKCRDBN2bmhouD
 12zhD/9C6ukv+8iXJ63iu65KAxWO0209no/Zk8V5PPOIg8YWF23fhUh5Tg2IbxFs1SDSIqOKCGf
 078xrARdl7OLN91lsOjjrbjnZZrO+3UXwHxBg6rRfwtkp+kgAzLzR84hoSWqyqlq+JpiqE73Ex1
 fNyOEu1Il2sVbtLvNN9ZvBBGDNN/h7JC9ywVxJ0Fa0LD8kwtsV8pUIgsVva8ILQKkMQBTP09QPM
 7DW97OEmYao/IN0z9JQ8xmwCXf08ciDibfQZ884ZF4dVW/paLFkgw4OyR+22WTqneeBTsJKdlH1
 Os9//BH9zlvxyZG6vpAg3g6NvH7MxigyNbztqSw7Uqw1jx1u1032qs/yjWHbs7c4pNm32w5Sc2U
 BWMIQlsiyt2Gg33SxWybhDqMfp72LBlT04SmQHYDlMTlPA4vvgeUK/H/oYmg/uzy5MM/kx9WGtR
 pNCFFDPI2B6EAqAvrzZWEGv2PVNujF5tHSLKVqxYwXHWIDIqg8LnCgQeizyqp/tqjoQFY7vGlzI
 B3wE5riIQuaCN41Id+3PH7pVc6tEQlepaRhz7jRIFh+JEA53CORhQ62m1PpLMq7z8zNhn+Igsh+
 AB69huA3C3eKILpuFw33OXJybFczTX0Vd0F95nDwyWCahIwaUlrRfoO1JQlJFdOgChtyx0ws9Uf
 xOnSxyBfnZ9hbow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 5SKX3ON5OJQXQT5UHES65MS7UFLBQ4RO
X-Message-ID-Hash: 5SKX3ON5OJQXQT5UHES65MS7UFLBQ4RO
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:48:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SKX3ON5OJQXQT5UHES65MS7UFLBQ4RO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Merging
=======
All further patches depend on the first virtio patch, therefore please ack
and this should go via one tree: virtio?

Description
===========
Modules registering driver with register_virtio_driver() often forget to
set .owner field.

Solve the problem by moving this task away from the drivers to the core
amba bus code, just like we did for platform_driver in commit
9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Best regards,
Krzysztof

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Krzysztof Kozlowski (22):
      virtio: store owner from modules with register_virtio_driver()
      um: virt-pci: drop owner assignment
      virtio_blk: drop owner assignment
      bluetooth: virtio: drop owner assignment
      hwrng: virtio: drop owner assignment
      virtio_console: drop owner assignment
      crypto: virtio - drop owner assignment
      firmware: arm_scmi: virtio: drop owner assignment
      gpio: virtio: drop owner assignment
      drm/virtio: drop owner assignment
      iommu: virtio: drop owner assignment
      misc: nsm: drop owner assignment
      net: caif: virtio: drop owner assignment
      net: virtio: drop owner assignment
      net: 9p: virtio: drop owner assignment
      net: vmw_vsock: virtio: drop owner assignment
      wireless: mac80211_hwsim: drop owner assignment
      nvdimm: virtio_pmem: drop owner assignment
      rpmsg: virtio: drop owner assignment
      scsi: virtio: drop owner assignment
      fuse: virtio: drop owner assignment
      sound: virtio: drop owner assignment

 Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
 arch/um/drivers/virt-pci.c                                 | 1 -
 drivers/block/virtio_blk.c                                 | 1 -
 drivers/bluetooth/virtio_bt.c                              | 1 -
 drivers/char/hw_random/virtio-rng.c                        | 1 -
 drivers/char/virtio_console.c                              | 2 --
 drivers/crypto/virtio/virtio_crypto_core.c                 | 1 -
 drivers/firmware/arm_scmi/virtio.c                         | 1 -
 drivers/gpio/gpio-virtio.c                                 | 1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c                       | 1 -
 drivers/iommu/virtio-iommu.c                               | 1 -
 drivers/misc/nsm.c                                         | 1 -
 drivers/net/caif/caif_virtio.c                             | 1 -
 drivers/net/virtio_net.c                                   | 1 -
 drivers/net/wireless/virtual/mac80211_hwsim.c              | 1 -
 drivers/nvdimm/virtio_pmem.c                               | 1 -
 drivers/rpmsg/virtio_rpmsg_bus.c                           | 1 -
 drivers/scsi/virtio_scsi.c                                 | 1 -
 drivers/virtio/virtio.c                                    | 6 ++++--
 fs/fuse/virtio_fs.c                                        | 1 -
 include/linux/virtio.h                                     | 7 +++++--
 net/9p/trans_virtio.c                                      | 1 -
 net/vmw_vsock/virtio_transport.c                           | 1 -
 sound/virtio/virtio_card.c                                 | 1 -
 24 files changed, 9 insertions(+), 27 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240327-module-owner-virtio-546763b3ca22

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

