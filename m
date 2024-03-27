Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD48894BE2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80BF02BF5;
	Tue,  2 Apr 2024 08:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80BF02BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040865;
	bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kXIG70FmrFO8NgzrqLi+wd1OyF3TWS225HPgBNGeedmLRrx6KvZL8pwjgqNlGKsJY
	 iI5UL6xrzgqxhZ2fLHBcxsPu6GQeB/6JHQ7X4ytSYTt/c7lC9J//+lQ0lhZFEhrAbq
	 CNjlizu7CvxH70j2ajO8tZuqth9C2pxQFI8YCIDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7953F80CC3; Tue,  2 Apr 2024 08:50:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11BEDF80CC2;
	Tue,  2 Apr 2024 08:50:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95F99F8025F; Wed, 27 Mar 2024 13:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED0E5F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED0E5F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zUHx8Fw+
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a470d7f77eeso847676266b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543431; x=1712148231;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=zUHx8Fw+r3VqdRbxJijz+541ZmUoMb13m5eoYyP+rNRQ/ZVq3ZtZ7WVdMuL8yhr2Vi
         4vjzgrn+D3ejF9GkAP37yXscT6TEuaX7MAGOtrk0NGmJ9k69Tw2P6navNWl/VWvItIA9
         e80am3ggz0LMuAEAbc0pjtE4+Kb4icENKxL1OncbYRFUv02+8dtd9Nmau11NUnIN6RHr
         5+qQBeXTtmUxqw8X+gS/ZBdZuYkku37QwdK8rj8AU+cTZXiuRj9I1HKaTTM7ELi8cMTT
         ADmXpwCvpnSALP4SuwI6NazIViMjbu5jBnt+wv4rMDicirFBUi2Vveywxct3Gv1ccF0R
         iYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543431; x=1712148231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=ZatAW6qwVts7oTDHv5DuqFBeEyw8jEyoD0W0jSMT1XpasRuJw3lNa3/upqOKFCtn7j
         o23nll2jkBzaP8R24htwtJggaDzWoZQLrVkDJQ2eXzuQTwPcNM+Priugnuthw+L88fwj
         uFqu2+aPnAAh/DhCoedXCAli3+CSzV+gn6RD82KfxPRKseBFTVosLBJpDnPPEkItjqIY
         o/uvGn2VUM2awrOxdIwGiIV1dvs8rJ6rgjlg+8Hc1Yu2K8QcHrz0M+wdIoDctsonmYN1
         Q2RPJpce5HzzZ6cwQCDFNavSYB/gbOolw3f5ukvoGjeJcxTonN+HEVm/zXmMpNHz4oql
         E/zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhtbVfreuwJpHX+KrtWnnTwqW3s6TUuNgL3r5+5uL73vyKkpdR10/SIWLi56dBVZdQVsyZZbJYNFuaWJIzssdgnL8pthnH60ORwYw=
X-Gm-Message-State: AOJu0YwZyrdXZ6iOwYgMCH67VQhFUv09pDTCk6G8VCssTFPnca4Q9dN/
	1swA5+HdgoGJ2/HcpOvXsU1bkicsM9m/8KMjGt6EmVAWeI9a+4wZ/dBn22B0/BQ=
X-Google-Smtp-Source: 
 AGHT+IHIawhEWmM18csReaNkfj7KE+Mr23K/ZLmHctiSwGk/x/WXWLAILVQsaMoVXgQQh7ZH8TvBtg==
X-Received: by 2002:a17:906:4e83:b0:a47:31aa:142d with SMTP id
 v3-20020a1709064e8300b00a4731aa142dmr835338eju.70.1711543430493;
        Wed, 27 Mar 2024 05:43:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:43:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:59 +0100
Subject: [PATCH 06/22] virtio_console: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-6-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPfhSNGa7v+KPC1Mr5GnTmrNcEwnc0tCa4FH
 m0oKKQdogaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3wAKCRDBN2bmhouD
 17JlD/9KDr1Aax5X0o90P0yI2bf6cpve6MUh89ettR4omfAVd37Dod/vJ5UZ8YDgCWHVdzBE/lN
 pkmFzT2vbc1UL6oCj+BMBllZkbpmCkDtEvx3lol59Tz/OZUoXhv/8bDFpoyPwhLuwZBSu9GaBm7
 jl1D1sPVUPu5TFBwDqMVJPE9lNuBgpiPUVLh1Mw1LJM7U5PbFDz/797HaHICwxQCgs4Le/bzO6d
 NaHj5gx2JeWEPUyXNeThuz8Ltawko6tEtFZge1cW7WSCzRcoN7Bu3A2w3C+gsxSygfVZh9UMCaI
 F4wfQuj2fV04UAi5+OceMmgcvWbaizvgRFeaq9jC6oKv8tXcdTdgyWZb2R9kxYRYXsqdvFT49uf
 4EDLAt5abOVCXpJs2XF1Zsb6GMBJvPT8N6ur8Qx989vDOSbTxlC2I2J4pqHjgEoIpyS1EArc7xy
 cTGt0MceTl4TFQWnHh4l048GQyvV2ehpWlx9SLMDxZ2x2d/b/y07ik5mDHIZgd6e4GpGE5CwPuT
 f8/PBIExnfmQgxh6AycTHxwwJ0Ngy4B2R+bS3MR08Htxndq3Nrpu1U65K0m8WDKubEy4zaMN+kr
 hoFfKJUXhyFBrtl+Fehgcb19zQ4HSvsCzidVzGuXw4xvn+gVKRFbr3ZYDaPGyWFacIDHIhCFdn1
 FeGFa/txQr7dGRw==
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
Message-ID-Hash: XNTOD3EEYPR3MSNKC2TX2BIJKEPE4QFQ
X-Message-ID-Hash: XNTOD3EEYPR3MSNKC2TX2BIJKEPE4QFQ
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:48:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
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
 drivers/char/virtio_console.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 035f89f1a251..d9ee2dbc7eab 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -2173,7 +2173,6 @@ static struct virtio_driver virtio_console = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.probe =	virtcons_probe,
 	.remove =	virtcons_remove,
@@ -2188,7 +2187,6 @@ static struct virtio_driver virtio_rproc_serial = {
 	.feature_table = rproc_serial_features,
 	.feature_table_size = ARRAY_SIZE(rproc_serial_features),
 	.driver.name =	"virtio_rproc_serial",
-	.driver.owner =	THIS_MODULE,
 	.id_table =	rproc_serial_id_table,
 	.probe =	virtcons_probe,
 	.remove =	virtcons_remove,

-- 
2.34.1

