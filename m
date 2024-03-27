Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45B894BEF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:57:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A2B2C11;
	Tue,  2 Apr 2024 08:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A2B2C11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041024;
	bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I0E7Y6GKZ0IoiBjqIpP3fAWBmhZEpDHd0mc/WVxOGyopIKsJW1fWx1dB/3Nensvtd
	 Kh70m6XgQRJJfjTPs9l7oGsonGvfeW3ORSIOxjizczmi45SGKEpSNG7GW+ZZW5AahS
	 r11Eyynb/nz6kHbWz6DDSCYxNgbmpOoOKqL6nt4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E4A4F89768; Tue,  2 Apr 2024 08:51:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0537BF89769;
	Tue,  2 Apr 2024 08:51:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F6F2F8025F; Wed, 27 Mar 2024 13:46:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2048F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2048F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iH+Z73KT
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56c2b4850d2so2155802a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543578; x=1712148378;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=iH+Z73KTP15YfwV7otycXPDjXSKOIa4eHRJnI/BneLSuuE7jVtacj75oiD6xM1TTtM
         jCy3JRgBXGv1z+kzfBsfOa3sWUtUJxmVDlVuY95CyUABzqOiPUMkcpMd64SMnSah5nCf
         XLmhcG08sR691pFo9RDp0C8bavMmdxIjtoBUYP7fURH5eIe0tRC0yOM1jJZsGQFYs5ZS
         8/Y+DD4e40+sAC7iPQW8VRsBsguaHcjoTPpDCNSVdG8tpD+fJBbfzOV/ADNfPgjI7/u/
         z78Lzcl/ClQmux/eb1ty1YOIvzUpH/281Czo4U6UMntbUzZ3rmGML2opEDi5ur9NBeBT
         MTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543578; x=1712148378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=lYtn57EN4MX06YTaovfwClp7JAaVZ+kQQ8qPekbn+wgs07kN6FZnrkyqYwtUjUJoqD
         ASlUNcY79ul8wO7wLvtj+4cQ7jfmum0YHPuR9Zup+yvkJ6avgCEV9W1GfBWg7omRfkos
         GyN577qY1HWH4Kkk7vUL7J4PerbMHY5o+rP2azavC3tPeYr51kvPCVtJRxf73t9BnX80
         Phb9woWM1S/8K+d7z2kcsY8zs+5avnxrEs/aWZ9xVhHhPQHtjndXCydX9+fon2AGHWuN
         pUM1hLAq7BvKqWiT2nCZp3g9bnl0uIwl7JnYOrq/ei477X2L6OGf3/qkOsgVilaRdhIQ
         IhaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0jsX7WVIRHFTK7h21t8ZmSlXphBb3/sRBvdmWQc9V3jGYDmKyPbD5ahABkYYadH4CiOOC8EcfSHm1Met4dKwDGKfCIgfZV3wgD9o=
X-Gm-Message-State: AOJu0YyeMwWkEkwDaAjUxK/RzZoEDV8S71peMPg5qOd9i4Lz3L1l2glv
	1JsiTT2CyEdvvRmOVzgxmVhx0KI0sX2gg+7sGfDkEAQiQKYY/PPf/NLAIz+hfJ0=
X-Google-Smtp-Source: 
 AGHT+IFX9TzVkfreMFnggYGMLSIMwa6TdcWtnATIFoctKTDk56r9dBF2wj2yYQDj0kzNPmIK0zouXA==
X-Received: by 2002:a17:906:4542:b0:a4d:ff5f:98ad with SMTP id
 s2-20020a170906454200b00a4dff5f98admr1560710ejq.37.1711543578195;
        Wed, 27 Mar 2024 05:46:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:08 +0100
Subject: [PATCH 15/22] net: 9p: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-15-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPn2yRXyBXkq6ACxK8eFxLTG7R9tVOB7uD/Y
 7v9Elz1TnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5wAKCRDBN2bmhouD
 15k2D/9hVir7j0TqughjehMP7EZCDouF1HvdZ3+c7KMqYHSlkKGrnvjzwyfCDv3RlZhh+e4FdHm
 X+s2MAMJ3/85Ly02t4joZHI5QfXytoQo4wwpxxtkpRJN5HiVm/rzZcXsccHZKIRcYWz1PH1N/38
 fm3Bxvy+ZnHsCGiSHZsM4PqLa6T9KeFlpqp++ZsNra60QDqFbPqgVbY7+kqLkwM0/AUsGpG5KH+
 fANSzGGe28ClqfxLt1Vu4U8CSlWj7o3ElcC/D1XBCweTqRPcA+2iLe7qUDmhal7tLZX6ScveM68
 DfAmPWnA9tNLgNUIX4SkzIHy5muQ2Carr3j/RrrZpNNVOt5Rb7NUnfq4S2bZNQmiGMtu/X7CDDx
 YJi/1RGHGSqYKlxD5AR9Ez4RoFG35FAuZUI8gO/AbAvW4cJ75x77zX3gQSCjiiqhn9mLgzwLmDE
 1oKNZb8RoXjYMGAXa4ZRkn76LzMcWV5/Bt2t+04gDUOR8V1oiQqStsdHKtr1HJO9N86cbbk05le
 RrseGA2RFkzWlx0/Wu+TgsVFtHEwAqu5ZP8LQMSd/i+S9ZdwaO77JXqExIP7SpKvQP8EPSlg574
 lkdW0kb9S1N7OPFwSIwHgZjvg2eSitp5mVOTWd2Cs0lm+avAC5JESLW0CvDV6P34723ld4sdEDl
 LSIrKL+jjHKKMPg==
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
Message-ID-Hash: 7PMRDZRVWDVWD6FPVJRWIQ5JKJ55VMTH
X-Message-ID-Hash: 7PMRDZRVWDVWD6FPVJRWIQ5JKJ55VMTH
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:49:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PMRDZRVWDVWD6FPVJRWIQ5JKJ55VMTH/>
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
 net/9p/trans_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e305071eb7b8..0b8086f58ad5 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -781,7 +781,6 @@ static struct virtio_driver p9_virtio_drv = {
 	.feature_table  = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name    = KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= p9_virtio_probe,
 	.remove		= p9_virtio_remove,

-- 
2.34.1

