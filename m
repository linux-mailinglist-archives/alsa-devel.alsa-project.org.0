Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57929894C25
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899C02D42;
	Tue,  2 Apr 2024 09:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899C02D42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041588;
	bh=wAjyw+8BG9Q/VwqKx0H5MhNDfrH26X7x79bC5lwKCk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cz5f7f0QWp+XpXoLZG0j3liGJSH2S8eNpO8XtWbkvdVj1wdO2jpTnFNFwMkFHlrhF
	 wpwdhV1KKzQ4z2XFhZ7X7w7u3DsWzyyodHhcRMFe9pTH1Xx1KnihoV9wMmv1a7qK7G
	 VrEf06J2bdDkldpI8de/gC08oX3NJXowH3qm65qs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF96BF8970B; Tue,  2 Apr 2024 08:55:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7393CF8058C;
	Tue,  2 Apr 2024 08:55:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F19BF8055C; Sun, 31 Mar 2024 10:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77A0FF80238
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A0FF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mpCdVbV/
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-341808b6217so2094961f8f.3
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874686; x=1712479486;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shrdZmoV/+LZqwehvxghCY6dk8UPLlZrkww7U3AfLpA=;
        b=mpCdVbV/HB1ys9w4urbCp2d/6QYXAlfgExTCe9Locsb/KJcz+miBneAS4WF0eZCQT5
         k7mMQPCTLMHAZKe0fdYmoC/JlkTvWhGxaIhrSHow2FSqYjUfF1+uM7gAC0bqFwv13Cpu
         YAxHrW0LRjKbVHqVGKq2l7rbcq8H/6IXMkCCNmmmjbMMRNVVHhx+lHgICc97/Zb8Augm
         rXtZTfES3+1d9G7IDVOQCmxHd+/+fLgsFRovpKuCaYJXLyOPbA2nvdNhvZHmBtZRSzm/
         OTWF9OaKHawS9YQe5wELSowjeYLKgt5vJ4LLzUV8eQJa1Q0w6v5S5+Ddtip14JxkGrHA
         DCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874686; x=1712479486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shrdZmoV/+LZqwehvxghCY6dk8UPLlZrkww7U3AfLpA=;
        b=t4wc7GiATLStsR5+yGZ0pFTWR17k7CtSy9GiLKtgcSJztS2mGIEStvYk37plQJ5G4E
         m0My4Ydc+xsI8AkIsWfBtOYAH7qfWzTq7iJpYmLAfd5HwV4ys/o0MqT6mGo9inwmIX26
         tGz7CzMxesEM1v7zqv/kXez08DmSbXdWET1XnkCVPjCeWmzk5Xfar1GjSKGZE0R8Ecjj
         eijQQGAn7sgiQ8Dszlnkj5OE+cn/fjnJLBa4BJNeZpWS9uembD81/HHLT08FddDtBvkt
         Mb2tT0bmOR0dIbrwy8XKRkMcRb5jU8B4yLv88iZL35jUD/Opl+z6j2kA2VjnKrdHuhbF
         rCeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgU/UMm59BWiXqdvDPmu8l0aqaz8tJAUOh6T110GxW5euLgL4OSpRjY59nTDqjVNEhBX1qhWjt2HOmDpIXNR0PXmJMSGGlN5bQ5+M=
X-Gm-Message-State: AOJu0Yw4Jwumt7Q1kGKKJKR3KDyDr8Xo0UafKoaR7mJoK9y0BB6k+b+8
	SGPIAoK8B+sL84W+isg2Qkf6YG8vBSB9GyOQi1XGwU6mUejQpSegJ4gDuP6agO8=
X-Google-Smtp-Source: 
 AGHT+IGE3mBHpk2iYgCZr4y748sr+z9cCqPzcpXrC7rbWUuwjwgJ1DZOI40A9D2OMrxW16aiemUNVw==
X-Received: by 2002:adf:fa43:0:b0:33e:d68a:7d42 with SMTP id
 y3-20020adffa43000000b0033ed68a7d42mr3902796wrr.30.1711874686293;
        Sun, 31 Mar 2024 01:44:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:44:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:51 +0200
Subject: [PATCH v2 04/25] virtio: mem: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-4-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wAjyw+8BG9Q/VwqKx0H5MhNDfrH26X7x79bC5lwKCk8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJTSAIIgTimebstG/Qy7uAfSArMFyh2juPUo
 6ZPodVLBXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiUwAKCRDBN2bmhouD
 1xDtD/4z5RmDFqjWll6kjvhDzAxQrcOG1NaTdWTMxysEd+H0xrvYrwZ47DKXPkAUiIdSBZbN+wM
 vueRYnxKlobdHqQt51krKCLl+ShScgF1bRuBVLLEK9c0R9rXygVdMqVnmYUOzjgGI5AP4dK8hd3
 /UxxdtXu5ezHuGb3vXKiFiVtZuTorRjWXgX5EfYg1qmNq0mZVLnzQjPl6hk2eUwnAyzaNAHlWkP
 il+dRt35QvwCmiKSxbsVvt1xUw2O58H5Ln21w9RYHg9yaqD9r9biAKNT8hz0+OhQ+csGBzb1qNQ
 Yy0/B2aVcnfNoxlvU/3B0n3IXe/94fTVmCGaMutYCGWUd7mmtXBPLQHQigb7XF/WhI+H3ZlhQ5j
 9iPp98vj6pSGuwWtvf1vAmWQ3C7hLch5jnolS3lhEb3Kr+Mzp7FvMpBPkSPapmaEoXyMhD9aFHS
 plVjGY0URnm/4qINC7B0fqXMQf5XKv1ozQF6C3ea3p8LZgknmtkiQGJOQjblgGJqwugh2zyhUBF
 9bx7ZBmQgtIz4A9IbAP5ZxYy+9ZZCD5dPZe4Hrwc1s2CGw8Ajpl8CNB+otZFRPRor3W0vF8G+hM
 dPJ70z0cLIp74sE/i0MtNiKtmuqVcPtTD2ASbduSMGLBpM0o4WfdMTlVFNjz4hdDGCV0cAgC34+
 RVnhiy/vQaspgfg==
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
Message-ID-Hash: 57MIKHIMHKLYE2WF46ARVUAK45VEPW4X
X-Message-ID-Hash: 57MIKHIMHKLYE2WF46ARVUAK45VEPW4X
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:53:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/virtio/virtio_mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index e8355f55a8f7..e605d906639f 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2991,7 +2991,6 @@ static struct virtio_driver virtio_mem_driver = {
 	.feature_table = virtio_mem_features,
 	.feature_table_size = ARRAY_SIZE(virtio_mem_features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = virtio_mem_id_table,
 	.probe = virtio_mem_probe,
 	.remove = virtio_mem_remove,

-- 
2.34.1

