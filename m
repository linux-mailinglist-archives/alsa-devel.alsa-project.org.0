Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C747C894C22
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9052D29;
	Tue,  2 Apr 2024 09:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9052D29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041535;
	bh=2Upz5yHnrh04ILzCunTBdzzxhReGAn3RLMhXlhS4dDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EfTMSnsBZEVDniA6OhTRiLqc7Kyv2R9XV6ncLQ3G7+zpPa5RNrASYgj3tC7L71g6x
	 YV1Nkf4GWI1IIF5v9Kn7nQn6CjLb5wENJsDA5YaSrLedIlgMZhdKhB6kYrFkoX6VRj
	 5eY12K32EHUjc5lpSpstaGaoOpkukif5/YZY4lYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBA01F806FA; Tue,  2 Apr 2024 08:55:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B90CAF896E7;
	Tue,  2 Apr 2024 08:55:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3993F80568; Sun, 31 Mar 2024 10:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12A16F801D5
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A16F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Lml9NIED
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-341b01dbebbso2889599f8f.0
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874677; x=1712479477;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8GsyJSzDMZB3KWSZh+ZpUPxiXhkF9vqYqu5y1Iq0qs=;
        b=Lml9NIEDD+APaAhiNIoSft8DvbK+PWmoRo54LKwXhiQEgorCIhJ5Nfi2jYWB+49qkh
         AM9F0wxLcyEFMG8NPmegfZHD0rmc12pv9llxaPP1QpCylDZMZ/Lj5R7lxvGX/YAHwMeG
         zv/f4sOfBqnNfsauEtOGCZJ+yEFzWClBwt+Bwz6+D+lZWsrLT5NbeYvUkgneRdaKXOPH
         ccrhoUGrH4cBWkQtzRGJQmeMsCmZLbdUTEC6CVcy8vfTewOAHUZbni+8XAzvdGtXLfYN
         ukJbhQsZiRPip8m8SdRTAgw5OWe8dRbVZvn8UnazWRUtYHcTGDkEuzDvibz4KRZFx8bL
         VIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874677; x=1712479477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8GsyJSzDMZB3KWSZh+ZpUPxiXhkF9vqYqu5y1Iq0qs=;
        b=fjdKcNri8yFuJGMQRqgyYjVnU+kP+Pvpk4o14IcS9OOhynDdJPcPsy/6FmeseZ7WcA
         B4mqQnjR9RFV/XX9+5DHmpv5AJprGcbUwYs0eM28pEG3KsxJfxTQDufg3KL7KXySzd0O
         HxzWH9Jiwkh34Z5NDVsUSQ/PHjHoLcx6N9neV9yG8DF2IoTkkL3WajFjJtzCrOuCg/FV
         x5rHgZ6NvuHMwkiyIrz6wND0tsO3xL6D4tVb9IBDFPGAqssKCTSFrR04YJMo8v9qcVfM
         +xkEbjp9A/hWWhXZut/gd6WXvL0mhSTNNsziADWfXDatARFhn9VGQetHBginKcZm+y1X
         fdlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy2Nmt2rokHDdlC+a1jPso69eRk3F1LUC+FQ9TXuxJfiTxizKWdtoOwWhkfq+IHEA05j5YDb0DPqAw3HiAqbsohwcnaRht9j6Znq0=
X-Gm-Message-State: AOJu0YyR4KxzkC8GHEI8qtKYbhEzOoQpTwIuqS1NZuRMyLXiDZZ+CRZI
	B9jO415YRisx3pzFfhGSMy+ygESicR93meR5SJmMDGRgL8E/8v+9Djz74H1ieoM=
X-Google-Smtp-Source: 
 AGHT+IHZTJIXQWmGKU9MzqOg35DEpqwe7TpnBZ66n+VRe8xGqjJcD8XSaNhFxZ0zfHKKZCPjNcUiNA==
X-Received: by 2002:adf:ed90:0:b0:341:cfd6:42b1 with SMTP id
 c16-20020adfed90000000b00341cfd642b1mr4845560wro.11.1711874676955;
        Sun, 31 Mar 2024 01:44:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:44:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:49 +0200
Subject: [PATCH v2 02/25] virtio: balloon: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-2-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2Upz5yHnrh04ILzCunTBdzzxhReGAn3RLMhXlhS4dDg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJSQJQIejoO8yNYAAgfkVMeaRAdpsoFw7Z+z
 9V2NnZ7ZA6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiUgAKCRDBN2bmhouD
 19O9D/4hy2yeN482kQMPK2LPDLJiJ3qvGi8LefZ4V+Bj4gx7QABbW+a4DRmQmHvE9gPdk7c68t9
 Zxjw80Rcnti0mYaLtegyasPNBBuzORsLYeA5CRXDRxOdqhwlUm8tL1s6c2PkFLPrHMsO/V5sHKA
 MNyFgcHg1AnnhmrRhA1HcrgXFsU34NjJgMMESB0NDfYoTFAYN/7jHQ8/3mzTFY/ld/c1bu8qPGJ
 haTCF0P/sjAL5Ml2yIvRAplaPQRYA4wfZ8pLje+L85JPzwWRpORwD70CEnHu9cOK7F8VFYl8rqg
 gJrOM45nGbqVHa3U6DHe8Uu3k7U5hI46THDZiVavl9qg5KhpD4Ke3EYVK/X5c9gBver3x4QRmCW
 jjPIbPsIulwMPv/3p3cb1T5cDXWgHBn5/dmfRxYqi26LCCdR53MGPWTAog7t/NbCkxUuYveNBek
 zlIm/GfczAU8ovV43vEhzfZayWjK88MWhM7xGwAaEei9sgCQfKAn6G5ucIqZnlBrbjHZcQOTO8r
 3SHSfJaQfajrJEe75kSOocR8t1SrdbxmAS4+x7ee1fWrpej/migYAQoA3AHZ1r2hbzvakCNrmX3
 ZCO44YIfsBGvTykqOvjiBmD62Et9R+Bbv+kR/mDipuOxNffsJHyV42SdkPv5jZUI+vCSWHdpi78
 WN+pzsc8Ru4IbYQ==
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
Message-ID-Hash: ECX3PKMPUNZE74EDHAGZJPQETSYISI27
X-Message-ID-Hash: ECX3PKMPUNZE74EDHAGZJPQETSYISI27
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:53:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECX3PKMPUNZE74EDHAGZJPQETSYISI27/>
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
 drivers/virtio/virtio_balloon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 1f5b3dd31fcf..85d28a0a404d 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -1155,7 +1155,6 @@ static struct virtio_driver virtio_balloon_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.validate =	virtballoon_validate,
 	.probe =	virtballoon_probe,

-- 
2.34.1

