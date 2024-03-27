Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23B894BED
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7432C18;
	Tue,  2 Apr 2024 08:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7432C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040986;
	bh=se3bAL9NWlxdnI0R5l3waFKazObx3hz9jbN0xln52SE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTnStS5cSPy9g7HoGzhf4PSpQZJoxPWT4OFefLpaR8iYdpbSu0/S+0Ts7TJcwYAah
	 hWphk8DgaNFStZf9Xnoin4RLMMQ0rHi2ZXaEk0U+oRQOGmRKVjPVKZz5pr6hJvm/tq
	 5djR2a0aCRb77MKsKPgz6b6T2dWspqgKT46UJPeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3421FF8072A; Tue,  2 Apr 2024 08:51:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41FB7F8072A;
	Tue,  2 Apr 2024 08:51:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE96F801EB; Wed, 27 Mar 2024 13:45:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90008F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90008F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CaoOQRWi
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso822095866b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543551; x=1712148351;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCsDfZXw6LzB3XdNG+WbYeCWTW98m3a94TU3WahPKsY=;
        b=CaoOQRWiff37Ko80UXpNWEpXAT5XERj4V0gSR1eFm/VhbDAD/j/1igtt3JiZ4bszhf
         eAYVyZ0xHpLq6P2F14+Ta9JhRa3RmM2xZ1jzG4G3XL9mpLmX/8pjg1aYzpVVRgwcdLC/
         cF4+fxv56hKw//QDsdBUP4aiFngEsp3CpFMSarlYA2eeLMET/JzLJGM6YKUH3jfFswk9
         voP4tXQ26J0hxphNyqmd8kbHS07M8YYsvjTUmo4pJ5bmUSdzD1MhfW4Hyagp2xkVrFzT
         iRaDQZ45HeDjVoWJqw7F26Tbqy34OkcB2yJOu0RHcBlaaVv6jiaOnwNFJAXZu8aQrxoz
         t8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543551; x=1712148351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCsDfZXw6LzB3XdNG+WbYeCWTW98m3a94TU3WahPKsY=;
        b=QZfChny8pWd2P5AyWrrc5QVCeyiQ+FQg6fox0XqXsT2X/JyB7QJqfw8QGOeEInO3ib
         eiFWlyy0nZmO1jlJiRPRHruyfYiZWEvlys7XYL5/3TvNINGURCQzRPQD4MTw3Rw1Ctog
         BzXoS/NI75X79PhtFbxUoHqBPXCM42dWsBnlI6QevF6ZHW4cn7bG8i4Vd/UBrNvlny79
         x3DgIwXk8KeoymVxsFnNDrwTHrTf98SNvwSkYjJ7q3o4FxRlCjUTopL7ITBXeZXxzlnh
         mtfpQcbrx2zcWxHecUBaFWb9G85IesfjTYUPxuTJhsHDrzCdgomGSynJgLVzPtVJijD7
         Yq9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAl9vM6boWKc6C6zseLtHys9Nrkz09KFIpk7Ogdj4M+tJ57WmUccjSaFbc7UhvvC0/+fEJUgCkmdE3kPxL1aTG6+AWV0uI1Tkbawo=
X-Gm-Message-State: AOJu0YwLC1i/YzlX06AYnSUGB12aWFwcEpHzm/lI1RdPxX59w8aZvZ0i
	5YOY2B+wrNXfhCbKJZwS4sOGOgFmwtKo4gkJew7wehFAm8w766v0Vn8CMJJI4Vw=
X-Google-Smtp-Source: 
 AGHT+IHenEy2Nv09tc3hpD85ZlHlSHaO+RqOy+xZPq/kwcOthzgJhneH4ZMtAD4U4oj+26zW+LtQug==
X-Received: by 2002:a17:906:f289:b0:a47:11a9:9038 with SMTP id
 gu9-20020a170906f28900b00a4711a99038mr898123ejb.58.1711543550975;
        Wed, 27 Mar 2024 05:45:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:06 +0100
Subject: [PATCH 13/22] net: caif: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-13-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=se3bAL9NWlxdnI0R5l3waFKazObx3hz9jbN0xln52SE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPlFuOYVkS3jCI6zCCRPhdDIeMDfV433oH2/
 VlG3qjMpOSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5QAKCRDBN2bmhouD
 14caD/9pMti1eDVhObtjCsgc7qTxe4R+2U8ygVWuBbWTo4uxbl68SspsNCbn3wDquoXUfUJpH0h
 DAIBtQ8IEKNHp+pM30oT2NKYOfbgpk00p6t4L9oUqzhX8ytHCVAFojpdX1VqdZN//zwPu905ECZ
 8gJVLxWpQfs62Y9P97p5hkwcw6ubEphjm1U1Eo9wBa0mKhDPudQoGcIzO5hnogEoMGlO/lpNamP
 gm1H8DQteD1xtI4J8rPq4nhK/XC/OSaQKx8oodldJ35QExmQ831aVHRqzw2NCeSXMT3iv5+TIGv
 tTz1KRSwLG7fngl+72ebxNZiS1dPiGoheeJlDBxe5MMnwKVgzrxl4jil3eygmp4teE11VbWZLIx
 DytJ03jm7lJVeFeCRnij5joDyaRag2+C1HYxrwExDC2/438IMK8Foz1bZ19dUOpyp+j7UJLI2my
 qF7dydwkF3emHbHhmlBXuONlp2aJJDQZpTyubQWEmmXQX+1u2mnl60qwS4hBxMjiQW9JNTO6RSY
 V0A9gBxyrswSNxjAEs62V1NfsiCn07pEd/W7doeL9qtgSW9SvFccds+BhprZK2kktoUUZfSfnZt
 +5GMrgvAeA+GvuIbO4pQ3SQdqJDNznRq22k8JY32GZNmDmAeWkXXkATTYibLhTr6pwr5sDpaZuh
 1V6X4s4H6cGDkTw==
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
Message-ID-Hash: IZFODUDVYBLRCNSZYCEUMNFQJHKHCAUQ
X-Message-ID-Hash: IZFODUDVYBLRCNSZYCEUMNFQJHKHCAUQ
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:49:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZFODUDVYBLRCNSZYCEUMNFQJHKHCAUQ/>
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
 drivers/net/caif/caif_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/caif/caif_virtio.c b/drivers/net/caif/caif_virtio.c
index 0b0f234b0b50..99d984851fef 100644
--- a/drivers/net/caif/caif_virtio.c
+++ b/drivers/net/caif/caif_virtio.c
@@ -782,7 +782,6 @@ static struct virtio_driver caif_virtio_driver = {
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.probe			= cfv_probe,
 	.remove			= cfv_remove,

-- 
2.34.1

