Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E6894C46
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:11:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C65D2CAA;
	Tue,  2 Apr 2024 09:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C65D2CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041886;
	bh=s2Mj8PFVzHUnyWBxfjg5SBZxGZiBlbDBzv7Dx2i8dmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vZKzcSsd4Bp4TmKvnkm/ztubXdFXt/Lbq4eSe7dFlW1eGoO+olfmPyGGf68qxtK2/
	 7kZYlAfIAZ+swtaYKHSGmpOy+Yl1Qo20y2zOL/dL23ECbPATvJAVJMaWPb/bTQkxCe
	 +Kmh5aFpdjewEQQVT7Gk4I6CtbjaovgXTr243UHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C164F89C11; Tue,  2 Apr 2024 08:57:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DCCF89B4C;
	Tue,  2 Apr 2024 08:57:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5332F80238; Sun, 31 Mar 2024 10:46:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7D87F8016E
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D87F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LfN1KBeT
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso1561072f8f.0
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874672; x=1712479472;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2gqY2xVgjiqYd3plRFeW5FJATNTaLEJOUnLK54AS+4=;
        b=LfN1KBeTINjHPq8hxCJYL5F8IAIxf8vP7ydcvl0a43oq87XfL5p2wpXQ6fkRznzwYu
         b075kmCoKfJmgovSj/7VIb8cyhR/6mpMFBJnzqVxg545o0aHsR4W7hRmtu/3Syb+bYeI
         It3F5MEnnyxY6soKTHBmNbm+y+tlC8AT8YMgWRWo6oxS+fw2qXWYF3H/Gr+0+nSD5Lvo
         rfsOpUxhOOd+RixJnzIu9q3M78pLPC24f8nmvKcvJPPCgptPio4IfpUAqkI9HaQeEL2Q
         pfmlol4NYokCkVVKwpc5kkvQBmTVXd7NnVx7qXSgQXD9EOrSXO7q8LDgRXs2MmBu6r4I
         ULGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874672; x=1712479472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2gqY2xVgjiqYd3plRFeW5FJATNTaLEJOUnLK54AS+4=;
        b=a7UR+0AOxLw+XPIHAbkLnERKwkzeiLy2imJDX0PrQ6RM3m5ZRcNm0It8VCgc/MZdNI
         2HwCmUyOHYwFxbhlmnWFqTQM5k9R2auasjf2D4p4Ake1VJEh77i9oDiTd8FJdJjFtfea
         ibmKmE+MBBJlg09RzZB/zpfWvlX9jsOrbZaDpfeX9hcVYg6CIvI9bnebPsJxUMm+HxnC
         G07LuFOsJYetNjdOPTY7roMEoa2jYmXjhjcv55gmE0PiBzhnwkIGjm6PhIxvZOz0Fq0V
         o+PPnpLVs31wK/TIMM+0TRACM71AFSuwzCqJAMMT6GibBqchblHQS+dd13hYGJLTUqjn
         B5LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzR0lVA028xXcClR9QwCdW8KWb0ivHJIvOQocjkt27bbeMTIItpR0IbWYTE5Ghq8vYjQgu80w3O0x7kBz8FAd8TEm/mo38RT6QKLI=
X-Gm-Message-State: AOJu0YwJ1F6ZcvI6a9aG21ruuhFbwkKm9gORSVKV1jOslr8TFYAGFaAp
	G8aGCSgAorknFVdvZBE+SQ50bVf+71sWvuZz1YcW/fsbOra4p1uxnY3XtdjQWO4=
X-Google-Smtp-Source: 
 AGHT+IFxLkTASaVlM+54K0R8k1ijktRvGP8npYlgKOHWvCMgwx6bYbCzbUX+6nbz+A1gBdO+Q97GFQ==
X-Received: by 2002:adf:f287:0:b0:33e:c91b:9083 with SMTP id
 k7-20020adff287000000b0033ec91b9083mr7888273wro.16.1711874672351;
        Sun, 31 Mar 2024 01:44:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:48 +0200
Subject: [PATCH v2 01/25] virtio: store owner from modules with
 register_virtio_driver()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-1-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Richard Weinberger <richard@nod.at>,
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
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>,
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
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=s2Mj8PFVzHUnyWBxfjg5SBZxGZiBlbDBzv7Dx2i8dmM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJRMAmo958+gpAdtWf3kAKomp/Ip2aKL9xIN
 Z2BywqkB02JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiUQAKCRDBN2bmhouD
 189/EACR/B93stOdtu1JuyUNz4OfxjEk8+PI7wALF2CF8wWyUnX1RqIit4KjtyGpz8IU3wUEOGC
 vvkRH4dWkO4VfbeaYOXrYCQdMtciljn9VQceUtxxpKYZBYDzBXmVArj0/iUj0cb4OBc8fkXvRKi
 EMTUUcWHJmLIGJvNMN2U4I6qMRSWnpXQAhX5lCoswuE+s9DonLiw+Lv9tFBK/PSWTPZW3CTTOg3
 1s6rfpzJpnBxFSTQESh7M1dqpE/85wG8AQoXS/wEZ3AuZTxQbzWxvlymDKo4/D8Zsruaa5cw3mq
 tmRGWN5AzZOqbZ34CYnxq3SBAjVb/gW8+Bq/PbwZhNYAWM2Rb6QMKUq9n00JqZUc7NwfeT57fO0
 6ThiLflUllCHlXzO3VCJooih8+6jhemlv0kSariKz4FEJT//EvDmPMw3zRoQbOdeL2prM2sDXz7
 /HCfa04XqJo02JCSS6z3UOMhKyYdESZgy5fqIiutQuKa09AosUkF0rxKZPoBmaaFPSFelMb5gPY
 kKJaRfbDPV9OOzskHs6efccitB2qx+s4OAVyPIlY5M1M0HEIrYNxHMrylwffbNYJwLfel3k30m3
 iAlSeTFkTWrNk/60McW6xVUexB2Kej+RFiAZDn5U6Fs0RtBNfrg6d/X8YVYB7llg9va+5h7WabZ
 kUag/9PjoTLwGPA==
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
Message-ID-Hash: 5Z2AVSSCCAFC3TMSOMKFULET3OXL26QA
X-Message-ID-Hash: 5Z2AVSSCCAFC3TMSOMKFULET3OXL26QA
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Z2AVSSCCAFC3TMSOMKFULET3OXL26QA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modules registering driver with register_virtio_driver() might forget to
set .owner field.  i2c-virtio.c for example has it missing.  The field
is used by some of other kernel parts for reference counting
(try_module_get()), so it is expected that drivers will set it.

Solve the problem by moving this task away from the drivers to the core
virtio code, just like we did for platform_driver in
commit 9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
 drivers/virtio/virtio.c                                    | 6 ++++--
 include/linux/virtio.h                                     | 7 +++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
index e14c58796d25..e5de6f5d061a 100644
--- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
@@ -97,7 +97,6 @@ like this::
 
 	static struct virtio_driver virtio_dummy_driver = {
 		.driver.name =  KBUILD_MODNAME,
-		.driver.owner = THIS_MODULE,
 		.id_table =     id_table,
 		.probe =        virtio_dummy_probe,
 		.remove =       virtio_dummy_remove,
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index f173587893cb..9510c551dce8 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -362,14 +362,16 @@ static const struct bus_type virtio_bus = {
 	.remove = virtio_dev_remove,
 };
 
-int register_virtio_driver(struct virtio_driver *driver)
+int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
 {
 	/* Catch this early. */
 	BUG_ON(driver->feature_table_size && !driver->feature_table);
 	driver->driver.bus = &virtio_bus;
+	driver->driver.owner = owner;
+
 	return driver_register(&driver->driver);
 }
-EXPORT_SYMBOL_GPL(register_virtio_driver);
+EXPORT_SYMBOL_GPL(__register_virtio_driver);
 
 void unregister_virtio_driver(struct virtio_driver *driver)
 {
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index b0201747a263..26c4325aa373 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -170,7 +170,7 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
 
 /**
  * struct virtio_driver - operations for a virtio I/O driver
- * @driver: underlying device driver (populate name and owner).
+ * @driver: underlying device driver (populate name).
  * @id_table: the ids serviced by this driver.
  * @feature_table: an array of feature numbers supported by this driver.
  * @feature_table_size: number of entries in the feature table array.
@@ -208,7 +208,10 @@ static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
 	return container_of(drv, struct virtio_driver, driver);
 }
 
-int register_virtio_driver(struct virtio_driver *drv);
+/* use a macro to avoid include chaining to get THIS_MODULE */
+#define register_virtio_driver(drv) \
+	__register_virtio_driver(drv, THIS_MODULE)
+int __register_virtio_driver(struct virtio_driver *drv, struct module *owner);
 void unregister_virtio_driver(struct virtio_driver *drv);
 
 /* module_virtio_driver() - Helper macro for drivers that don't do

-- 
2.34.1

