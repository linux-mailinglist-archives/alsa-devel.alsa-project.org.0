Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914D894BEA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90ADF2C00;
	Tue,  2 Apr 2024 08:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90ADF2C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040952;
	bh=jCwmMevYkV3Lqd1Wbq1GxwStD6bPo7hGezrcOjB2c0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k+LYJkUvIl9QC2SbTz9AuZrqqerp9ioepf8+K21Yw2PBpKdWDl9+nKnkKOYrppOrL
	 mGJh4RWF08ydsLH5u7xsJiQBlvBEsRbrCSQG4Dl4qfsOJ/QMiW2UNM4GkW1P9wKR9k
	 31SOY83WbQfG8GdUv7u72OJL4b9ScuVqQLAYqG2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B16E9F80715; Tue,  2 Apr 2024 08:50:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AFA2F89719;
	Tue,  2 Apr 2024 08:50:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5061F8025F; Wed, 27 Mar 2024 13:45:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D095F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D095F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bEP4YoaO
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a474c4faf5eso438348866b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543533; x=1712148333;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No4VShp4MNQIo4/ZHdyujXMPexV2jpx81+F0aVzAh9c=;
        b=bEP4YoaOOUGJJ+2OFRy8YFEss/Ugu2ZbELVn5Fw7YqalWWBpzi8YsJrSKsO7Gnkcoz
         yZUc0S5XGIGXAabCkUZRv+GQFOzhGYQGPDsN5BwWAd4L2aMwD+m3ti8VF+u2BMaYj4ug
         Fp+qQT6YiYVTGmb18lBckrQUpFK9VxTHNTQiqJ0J2AjHMGSgMGICoIGEnK6NfppXtN0P
         idur4Sz0YjsrTWsFrNksARcBf90zwZ4HZv8/OQ3LAYSRRkhBj+aX0nNlaARBachVeWZU
         4aepCgSbk6Bri424cfMgr4bbiIF4OTiwKzMoIo2jV9b5BMzFOGcizcWMTYNutrimYwjm
         mBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543533; x=1712148333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No4VShp4MNQIo4/ZHdyujXMPexV2jpx81+F0aVzAh9c=;
        b=Wcd8SpyZJ/I/WmHFdw7BybVBodWDeenc3m+4zvRw5a81UZDjzOxYY/NovckxL+NgsP
         T8xwdOVj3E486Mjm8g6Qmk7eAqHqjNWugABZS3EcMJx0l4B2mdHxdadYSrZyIIBl8QgG
         3rxYX+04ql/RXsUYngYO/sxGy1h4y2DbF89TbN/uVPrd8a5gkPb1OLbYxAguaTAGlykN
         Tp47CvmRQtY5SfteMR6jssiFnuYLydiuxHrWPj4lppglnpW9T1TNnXCbIRWJRTYZJQ5/
         FBSJYlXa1RKTu+uzArztBIIijNnPhjRw5ARSQjr7MP02pywcP0AlDE0eHeccYMcY7m8K
         0pdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Cv6duiqW8lSin89M52zs55LJPKakZAIV7Txu8J0OvQ2O8EvAyDlx3u+rypU6U+SgOUXbg7iKAbDO7Qx7u0M84Chi/1fczioNBcw=
X-Gm-Message-State: AOJu0YzMeX90tAhWKXilx+Xasd7aqI0Uz1Vonc/IoRenb9clEJIkbu1R
	Fas6IZajfktxwbTxdB+FJ+KFmBz9Tp0igkyUEFUsF7HsVPVoTCUxmrl0qTOyjsc=
X-Google-Smtp-Source: 
 AGHT+IGcHd2qY7ZBro2wyisxjF8vmsU4S1L2u/P0SqS5KVxX0CKJYhU9jvIT/xpw11DDb5r10WYfVA==
X-Received: by 2002:a17:906:f2d3:b0:a47:35e5:7da0 with SMTP id
 gz19-20020a170906f2d300b00a4735e57da0mr825525ejb.41.1711543532979;
        Wed, 27 Mar 2024 05:45:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:45:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:04 +0100
Subject: [PATCH 11/22] iommu: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-11-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jCwmMevYkV3Lqd1Wbq1GxwStD6bPo7hGezrcOjB2c0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPjcRuWcdv+n/Al0ahdDHsSs8WafHdIUlLGa
 Dnt3fJtJ9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4wAKCRDBN2bmhouD
 18avD/9TrqZBBr4oeroLUMQVYofN5TjAKsnyKZWl94vQ0iYfSWHuOlNDOTMSN2Dt08NBk9v0Xs9
 eUeYmPAYKRPRGkVuIDT6wOGW74KIxf5Mzb+3Ds4U2QrJRdXG8f/ICyRsRD1pHENt8cK7rI+E6zd
 umkuE/KYrQKTdXb4i5CHK+4jJ+DeoSIswuO/54AUq+E3pgGpFpdxxhj3208Hfz7tvnh9pgJmVh6
 zMv18OlPg2XfxZF78f5CFbftrBco7QM6ZHNrOk4RVql8QzSC7xQUjkGRYbxSF9HZVWgRUQh2WXF
 xxDK7TkVVSHfRKctSH//72hik+jo9foWddmeNbFaTrbXNjnnfnMRGMsnzz2EPFrHjDeT61LqF0T
 u8SNrNOpi53cLv3XWw09T4PdY+XEqvqtEOvJNJ8yEihBPgdwlfuUFeotY8G4XEtfN9ajZcjpkdP
 F6UV6cNFIDph+aGoj6T5rloUw8mjhJCO8p2f/T4HHgOs9RkcoLnb4zY9lprMxc6PMlT2fC/AaSB
 JwlRKgB9FMrOWfSuB5JVqDAZUUoNi3ycrmnq6XQAxs+QanigRO2orLbBXUxhmwRrcORCAXzAY/m
 L00b+Gn5jqZIFKGhzVfYaO/NbGgHZGtdQ9ZEg14BZW6tIdbpC/y2F8V6vq4H0WyOMH7b1wZ8HiD
 Mj246oViTtDiKNw==
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
Message-ID-Hash: 4F36CIS724KCK3UJUS6QUMCP4RNP6Z7V
X-Message-ID-Hash: 4F36CIS724KCK3UJUS6QUMCP4RNP6Z7V
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:49:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4F36CIS724KCK3UJUS6QUMCP4RNP6Z7V/>
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

Depends on the first patch.
---
 drivers/iommu/virtio-iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 04048f64a2c0..9ed8958a42bf 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1261,7 +1261,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver virtio_iommu_drv = {
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),

-- 
2.34.1

