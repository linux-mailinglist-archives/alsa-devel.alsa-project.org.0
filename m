Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0595E894C13
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8B32CE8;
	Tue,  2 Apr 2024 09:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8B32CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041375;
	bh=CnPyW/y5UQrILS7vE5ScOzPk56jpnW7Bki+iQBNgkGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ugVCnU8RRXgHmzPLkx5XcAWhsXZDB/+XhdisjXPogKUVlQmBNAoSHlU0s4TEuy8e0
	 J9zg0Z7TrhR8dwgy1X0hihDxiMSt+h6Eht1dkpBtX7iU8ElLxIr1+5NxPGHLLfMH5d
	 2NYFJmkGUcFBTV9wMH9iv2RnB8hCHidqXATZs+Yc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 899C0F898E6; Tue,  2 Apr 2024 08:53:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4FF3F898D7;
	Tue,  2 Apr 2024 08:53:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAEA6F802DB; Fri, 29 Mar 2024 12:42:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD364F801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 12:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD364F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XLABrnXR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711712538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BsDTTyNU5pgUTxWeniUBybyV1pHa+zj3gLQFOaKcJw=;
	b=XLABrnXRSolT0vceLyGVBE+H8tmnoJucjQkXgGm5dGhzmbe0PHjzXWegDjl/dH3F52wgXz
	s8P7CvQ2OgvHo91ewidlrjPVmcPOzvQX8CAx6c5AXRIR1IZRRX9HJLW8VmgjV/yoNiVKKq
	kc7vZTvsGb8cj5DOiQE3wPulhCNzZLw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-9vOzcCtDP0m2Osfy2xTRWQ-1; Fri, 29 Mar 2024 07:42:16 -0400
X-MC-Unique: 9vOzcCtDP0m2Osfy2xTRWQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d6b9530792so16527511fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 04:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711712535; x=1712317335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BsDTTyNU5pgUTxWeniUBybyV1pHa+zj3gLQFOaKcJw=;
        b=voSheVF7qSTzHHO2LUvpom1g/4NincHTlDHdDpe0xAnsYvaaUUvNquydckVquoreng
         z6k7hV5IUxTdAbuWqTPtUeQcVgmfI3pE2zX+sFWU/H9Y/TS28pZGlRJtxIbJ6L/h0Vgj
         wBxaeR07bB5qako7ftq3zPud9jaim/4RnpX7QljhcNLCwQuYirPcRTaBfZbCnD9KEhdM
         i5ukP6k1N1F5H8ysdDy2xNQ5UkuDnw5spnsYWb6HpRYICnHgBrKDHTdmQJSqBjpnivk+
         U/sZ6fHCvYb8DdCIGF5Yrl6Acc10zcmrbwSVfultsQlYOlqoWnK+S+IHqpwH3yg7fptm
         8Wbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSfG7EzpEptzXldM47Q0s2vjNFWF0MWrJvO6B4ZZI7gnwCcMxbV8JU9CXYeyMErAvV+x7HFfFcS/xw/EXme9GD/kRgIRJRu7Flp6w=
X-Gm-Message-State: AOJu0YwdIChGIvIYMQI8OpjJ6l+KHOf0TMmHoR8rO3BvvbYUqr+BnTtb
	BqSGAiFW8CbJxsfISE/XT5ATcV5edklATng26jpHrlgMOMa2UIL5dQlG9dW7Qj1wFeoFykSsmuA
	UgOxfPdqiJWmOo3kW/mFypgedR+nTINaGROMlGh9YHDjmPxz2t0C2rs0rQLkZ
X-Received: by 2002:a2e:9659:0:b0:2d6:e148:2463 with SMTP id
 z25-20020a2e9659000000b002d6e1482463mr1428722ljh.24.1711712535135;
        Fri, 29 Mar 2024 04:42:15 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IEACBjwkvqDUtHOsu+pH/smraarLJWyQq+BtaLZf+sEYEs2CGiOj/cy+sTyYbp3cXHSv/vHng==
X-Received: by 2002:a2e:9659:0:b0:2d6:e148:2463 with SMTP id
 z25-20020a2e9659000000b002d6e1482463mr1428676ljh.24.1711712534737;
        Fri, 29 Mar 2024 04:42:14 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it.
 [87.12.25.33])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a1709062ec700b00a46abaeeb1csm1837128eji.104.2024.03.29.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:42:14 -0700 (PDT)
Date: Fri, 29 Mar 2024 12:42:08 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
 Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
	Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 linux-bluetooth@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org,
	v9fs@lists.linux.dev, kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/22] virtio: store owner from modules with
 register_virtio_driver()
Message-ID: <oaoiehcpkjs3wrhc22pwx676pompxml2z5dcq32a6fvsyntonw@hnohrbbp6wpm>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-MailFrom: sgarzare@redhat.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: M5KI5AFT4WJZ4BRMIDZHYSRUVQ5CD5SD
X-Message-ID-Hash: M5KI5AFT4WJZ4BRMIDZHYSRUVQ5CD5SD
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5KI5AFT4WJZ4BRMIDZHYSRUVQ5CD5SD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 27, 2024 at 01:40:54PM +0100, Krzysztof Kozlowski wrote:
>Modules registering driver with register_virtio_driver() might forget to
>set .owner field.  i2c-virtio.c for example has it missing.  The field
>is used by some of other kernel parts for reference counting
>(try_module_get()), so it is expected that drivers will set it.
>
>Solve the problem by moving this task away from the drivers to the core
>amba bus code, just like we did for platform_driver in
>commit 9447057eaff8 ("platform_device: use a macro instead of
>platform_driver_register").
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---
> Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
> drivers/virtio/virtio.c                                    | 6 ++++--
> include/linux/virtio.h                                     | 7 +++++--
> 3 files changed, 9 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>index e14c58796d25..e5de6f5d061a 100644
>--- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>@@ -97,7 +97,6 @@ like this::
>
> 	static struct virtio_driver virtio_dummy_driver = {
> 		.driver.name =  KBUILD_MODNAME,
>-		.driver.owner = THIS_MODULE,
> 		.id_table =     id_table,
> 		.probe =        virtio_dummy_probe,
> 		.remove =       virtio_dummy_remove,
>diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>index f173587893cb..9510c551dce8 100644
>--- a/drivers/virtio/virtio.c
>+++ b/drivers/virtio/virtio.c
>@@ -362,14 +362,16 @@ static const struct bus_type virtio_bus = {
> 	.remove = virtio_dev_remove,
> };
>
>-int register_virtio_driver(struct virtio_driver *driver)
>+int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
> {
> 	/* Catch this early. */
> 	BUG_ON(driver->feature_table_size && !driver->feature_table);
> 	driver->driver.bus = &virtio_bus;
>+	driver->driver.owner = owner;
>+

`.driver.name =  KBUILD_MODNAME` also seems very common, should we put
that in the macro as well?

> 	return driver_register(&driver->driver);
> }
>-EXPORT_SYMBOL_GPL(register_virtio_driver);
>+EXPORT_SYMBOL_GPL(__register_virtio_driver);
>
> void unregister_virtio_driver(struct virtio_driver *driver)
> {
>diff --git a/include/linux/virtio.h b/include/linux/virtio.h
>index b0201747a263..26c4325aa373 100644
>--- a/include/linux/virtio.h
>+++ b/include/linux/virtio.h
>@@ -170,7 +170,7 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
>
> /**
>  * struct virtio_driver - operations for a virtio I/O driver
>- * @driver: underlying device driver (populate name and owner).
>+ * @driver: underlying device driver (populate name).
>  * @id_table: the ids serviced by this driver.
>  * @feature_table: an array of feature numbers supported by this driver.
>  * @feature_table_size: number of entries in the feature table array.
>@@ -208,7 +208,10 @@ static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
> 	return container_of(drv, struct virtio_driver, driver);
> }
>
>-int register_virtio_driver(struct virtio_driver *drv);
>+/* use a macro to avoid include chaining to get THIS_MODULE */
>+#define register_virtio_driver(drv) \
>+	__register_virtio_driver(drv, THIS_MODULE)
>+int __register_virtio_driver(struct virtio_driver *drv, struct module *owner);
> void unregister_virtio_driver(struct virtio_driver *drv);
>
> /* module_virtio_driver() - Helper macro for drivers that don't do
>
>-- 
>2.34.1
>

