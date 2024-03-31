Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228A894C42
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:10:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C59012C78;
	Tue,  2 Apr 2024 09:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C59012C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041836;
	bh=+TTEvPeSyDKzVSSZ0ChnkaU38LId0eko0vuS5jdKWCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPQEtbak72Z4ISUBFMW/id0Zbt7UkUfa+ESYR8lGF9NULk4tH287jN50l01XLXN/m
	 UbtNiS9/1GeP/2krtO/3/ci9X/fHdPfOM65LQ/5kE91sxsyoAfDDjdIrDAr3OLQCl8
	 /PO/qbGhe29vLfb0lMZL6RQxXgCisaNUsq1GmfPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D2B8F89A7A; Tue,  2 Apr 2024 08:56:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D83AF89A31;
	Tue,  2 Apr 2024 08:56:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37685F80238; Sun, 31 Mar 2024 10:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF98CF80130
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF98CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F6kqqclW
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41562eaa636so582015e9.3
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874719; x=1712479519;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLTRp2vTdiF6En9+dHZ3QcMOJs6Q2EWbLSRJcvapXSg=;
        b=F6kqqclWQF+W4ESXg9y0XM2TrYviwYyjTh5M8vYgcwLhP/FVvCV7nQiGsvIWLtOnm7
         /LYGoXRQDWP2Ss0cl7mum/wGBk9vTOk4nYKDPNrgvgLXdt9mUVQhjHs8hPZyLj2dN60r
         l3ac703uGhwnIFG0EhLufMra30hxNprsidE6DPBcXcwRzn3hi1qIWvAQ1o+vOg0XlhS0
         xxlnTkpB3UxwfgVufeHDYSq9LBOjkWkpomN7vdq9Dz62a+5/4s4EEids1n0cOkiCHF9p
         rlA53lMUOpIwj720ZM+757lW+vyMgdYf9QG9ZnMheC/IXbB92ylIFfjJNxCuv7S2KDHR
         HqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874719; x=1712479519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLTRp2vTdiF6En9+dHZ3QcMOJs6Q2EWbLSRJcvapXSg=;
        b=L2u7nH5E22ELv77E+qVaWBDJ0wGslHeBIIQbL0jLeW6QXYjv9444fnCR5PasXH+c4B
         xmPZnfp7HcVx4zDtoXUlO0Dz+LOv6AHD0d5UqBlpiYTL81utLImCINYCGwLFHR3Tae3z
         pX4HB/n9JRVJJv3ededwm4HWvG4qRE8mVk+lSIYnMWGB0V3Fi+7m/EYaPcCT9Tx69FzP
         QZkzseYISc3sFzppQoV63xlP3Wg8qtztVs7hOSXNjKB5ultD/M8weBzfQVlwr+b3p3JK
         W7m2qYvBO+61DImgkQSWZG+P5CPXSSARoCKFkbjSFHLWyz0tTfHTGfoQGxFT71E4/N+q
         pW3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWajeavuXYGWDo3B3OkzQ8i3qiXitKZsDqmcYMj7PIe9gZL3UzMmsgpDY2nOjnx5CFZxt6Is/Lr7xT7w1z175i4q1EZTUA69e57AWI=
X-Gm-Message-State: AOJu0Yw/fNh1PmKGv7FfTCGK/KXi6pp/8mIfA4VE174JrTeSCjSxApCw
	tkNn93FwS3jEl0L4jlABsis9UE8AUlK8E2rrjpdcqfwCEpmJ3hBV2OGrb8Yb8Og=
X-Google-Smtp-Source: 
 AGHT+IEPNyzrG9C3csrNqH8eyb70LAbsPxWdsZOAVe+w6F+ieT87UCbeqCljG8/p0+9sLJiIE3zPLw==
X-Received: by 2002:a05:600c:4688:b0:414:63c2:23cc with SMTP id
 p8-20020a05600c468800b0041463c223ccmr5678340wmo.2.1711874718681;
        Sun, 31 Mar 2024 01:45:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:58 +0200
Subject: [PATCH v2 11/25] firmware: arm_scmi: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-11-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+TTEvPeSyDKzVSSZ0ChnkaU38LId0eko0vuS5jdKWCQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJa5FS1Ky3t5JnGN1NitxgxLomwAmtLXFvfN
 8kf04YQGIeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWgAKCRDBN2bmhouD
 10a0D/92QZJuTyhvifrg/z2Ow2dHDpsv8gq7Umut3xI+KYc/1ZKUlEDiOmrTkALSfIjl6/7Y5J3
 +YCRV0/q1aiOkNblM9AoDsC899MA0poxb4eT/CRWrpS2igLnISD+hutGurF/0PeMkpTjwVDqtdK
 QAe4gRbabXICA4p8kpjFSKtgIvcJ1rxSAsRQcGtEBDgwmtxzLWqIQrU9jfKdjQDv2wqxRiYJYDH
 y/S1fVkwV6rcC5wxajJi9x0vSP+rgWkEnJjEBFSyYVwa7O1pUeSj8pY0xfxMIa6l7bH4rrB8XH1
 6m5ucB5QnGmITIMRSH7peq2iKn6gWZ/T0zQZ7Kgjx5+n1KeU8+rj67oNBs7vBnlfimTgy6nJB9O
 Q0qtdF+C9DmAIDClmgbsSu96PXxAZyvO+HThDOWutSqH4+A8aEO4Tp2f7uiDyMUWLuVj7SjTdoi
 Cfe9sVx3Hxisr9AFQ68Kgpw+m5LU8f1zorJdB2rvMMZ0y107a5/g3ET+MelenCZgloWJZXV601q
 LpkQY4cqm249iNnZvYp4NX0eECKmmVeTEWg5ARWHzju+WZNSHJhML82qkvSp0AfbFecO9/zOnmn
 fS7n95h5yj52JoAVtZISNHX85xR38NI7TnvFSMXMRwXPa9cH4hPvk1D6bJ63EA005rfNlHugRSz
 fAP/ZxXxQqcGEHA==
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
Message-ID-Hash: BYJ4V4CHYBIGREADX2J6BUESBR7KRAHD
X-Message-ID-Hash: BYJ4V4CHYBIGREADX2J6BUESBR7KRAHD
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:53:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYJ4V4CHYBIGREADX2J6BUESBR7KRAHD/>
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
 drivers/firmware/arm_scmi/virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/virtio.c b/drivers/firmware/arm_scmi/virtio.c
index d68c01cb7aa0..4892058445ce 100644
--- a/drivers/firmware/arm_scmi/virtio.c
+++ b/drivers/firmware/arm_scmi/virtio.c
@@ -908,7 +908,6 @@ static const struct virtio_device_id id_table[] = {
 
 static struct virtio_driver virtio_scmi_driver = {
 	.driver.name = "scmi-virtio",
-	.driver.owner = THIS_MODULE,
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.id_table = id_table,

-- 
2.34.1

