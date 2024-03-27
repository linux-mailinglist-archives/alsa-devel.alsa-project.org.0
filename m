Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EC894BDE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 778BB2BF4;
	Tue,  2 Apr 2024 08:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 778BB2BF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040809;
	bh=KrWaLvXjNRGS2R/7/B1+JUwLcklixu9aLwMl5ahCx2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ypng2br+x9wjFuOXATKtfk/7h2wYg43MP6DtM1vdVgAkohgkHKjmOgM9YOcUmHP1C
	 4l1jFRWvJKx+raXwKOr0G4YpAk5naPJQorfIEl70SeocGbSi9PRWuGuLZlrQnSGYfB
	 /QbR4Y0kbwYmYpM/uOmK+ffkwQo2SpjU3kjEbciY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 327C9F805DF; Tue,  2 Apr 2024 08:49:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82093F805E3;
	Tue,  2 Apr 2024 08:49:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E80CF8025F; Wed, 27 Mar 2024 13:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3709AF801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3709AF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YX2FHOYg
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-513d4559fb4so8782914e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543343; x=1712148143;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyRMm/wBFZCWNsLJMI0b6MGwMk/UDF0WMd3K76wQcuc=;
        b=YX2FHOYgTFrt2cHr+TlcyZkWAaJtbNermGxIAYgu+y6Z3aymM5IGiivb9BZ6ZfAqTz
         778APIfJ8bk0IqHLjfDAQoME7RDf6SQbAOf7ysv1RWZPHXzW3OsNjSdR6U2rMaA/is6J
         4U0pr07uShdx8+kKoT13dht6/d3sYDoBXUpnKilNyLwalyp5MwkIvRgxk72YSyGoVbXk
         nPrdOyfqfVS+HVtYr+A4rnCRJX3QTdExjwPsjdSF/9z5PFn74kZpIkaangwlQwKzfKY0
         8MoQSHbZSy3DFk1M4lzSg5YfsStxK2HxMvok0I05jLGuWr0OJ4fBcTLjQyo++WOL1Qew
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543343; x=1712148143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyRMm/wBFZCWNsLJMI0b6MGwMk/UDF0WMd3K76wQcuc=;
        b=e5P5NBh96VGcrzMDVko/LZR5tpk8IqCvMGRlnDimj/hHchCRGO63/RffH+RVhbE06m
         MrVhxHeGAtkchpL2K3xPKFAlArV0TCiptGcTE51DMcKKZRIRqocMnCer+bJ96059KLAt
         1HK+dTzV6vkmlp6N1wyVvJ5eQYx/1ejUiaEmzJKZzklJ5QolVPEEy5KwjXY3+1WB6j25
         2e0RDsRyrxg7w/f7CQSny21p8nTzoGjyXUqo/kebN6wcQpckU8YytPnSaR9KeKAF+PsV
         V9fGE6RDRaIND4h1ORvw3h/W1SqQSd5FbPr8TcN8HDPLitC0nilXF0a+2YVsHHvB7JcD
         cMzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR6T++Hy6QG0YAtX+S/mGrmYEashvTMA7eM5fWv/FuT66aYXnovX7rdLsWYszj9WVwUME0aW/KAoy8aqx8PQulC9TRZL2FiUbSaWM=
X-Gm-Message-State: AOJu0Yw/Am8Qwy7uJCkUzvbVIe589noMOqHmkXp2t6VBGt+D4rE5y1b6
	vgcTlbFUQBuY3929gUyCOlPoLu9TE52naLJeXT43hWQ5aoHnpov+FaiIlhDgtlo=
X-Google-Smtp-Source: 
 AGHT+IE4FzeNxkir4iuwm3e6fVZcYVR1d5yg6o049b/koMtV0XB/ttMCSkTpg1aZyXSbfrGYGznh4A==
X-Received: by 2002:a05:6512:3705:b0:515:ab92:6a82 with SMTP id
 z5-20020a056512370500b00515ab926a82mr890664lfr.17.1711543343032;
        Wed, 27 Mar 2024 05:42:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:42:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:56 +0100
Subject: [PATCH 03/22] virtio_blk: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-3-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KrWaLvXjNRGS2R/7/B1+JUwLcklixu9aLwMl5ahCx2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPc5tmdWrFuFntuG/yAvvaSc6QQDgGKV3xXR
 d69ixg4mVWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3AAKCRDBN2bmhouD
 1wyfEACQliB2cEZpIO2A3tCh010r1fx2tRLerPwdyLvNuhf6A4vHrISqh/SkyeIavgOK59NAl/t
 Rp1B5Fmk6cyoLlyVI3UYVrttitFKN8XkcCSz14RB1mX+RMx2NfxbqjfcyZrhAZl0WU+JB4naqnr
 q9JxnjjG+J7i5EXrvzVQdXcbr7gOkdPw2Hhpw9tA11Hz5uRz+D8tg+b65wm5+wWLP0XiP/fpabz
 Q7W+nWhPoxCjeNFXwQJtTsKiwQ3JQqULRZE5V6QsmTIoggFcbktqr8l32KIWs/wkNhhRCdo81Yr
 XPYCaRbxyvul4I+GW9Pl3Bcip334GkciqKP0lGqxycAZKaJmFhhkuKwVH1DMv4k/h32/UVfAV5t
 Xb+mTjrD42g79FYzXvebQB5sAowZnY20DCAbX0Nt0Ha/JryD115o9Rw5doyU6CQ25F3QUddYWkc
 v+6ciPckjK3LQi58EdyotgmVwlVwyg6qtaEd926djnW+bGSwFXtrd4qHl7VPC3tONytWWRDAfHP
 ok5hPHVC6UFMbmKRJVjv8X4yEQw9Xb0TY8o1Ejyg6ks6Y6jcJ2HTZnTqgUBtzgx6Amu+nXSivUM
 s6tjX9vd69r4uEsD4Gmgq9fA+gkgTwOwJKGBx5Hd8aGZU5JMaAy9ADXKv3I3QgWIdIaU2wk1GOf
 nY1C/0V1R8J6KUg==
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
Message-ID-Hash: YO5NFK5DNWTPF22DFK2R3XWMVYT56B7G
X-Message-ID-Hash: YO5NFK5DNWTPF22DFK2R3XWMVYT56B7G
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:48:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YO5NFK5DNWTPF22DFK2R3XWMVYT56B7G/>
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
 drivers/block/virtio_blk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 42dea7601d87..46bdbad1ab48 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1658,7 +1658,6 @@ static struct virtio_driver virtio_blk = {
 	.feature_table_legacy		= features_legacy,
 	.feature_table_size_legacy	= ARRAY_SIZE(features_legacy),
 	.driver.name			= KBUILD_MODNAME,
-	.driver.owner			= THIS_MODULE,
 	.id_table			= id_table,
 	.probe				= virtblk_probe,
 	.remove				= virtblk_remove,

-- 
2.34.1

