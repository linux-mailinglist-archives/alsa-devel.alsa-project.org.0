Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E7894C2A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:07:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA1892D54;
	Tue,  2 Apr 2024 09:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA1892D54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041654;
	bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EY/AUWLy+pwigRt5/2QPK3kuMcolQwDXqf/uJMHqXyl97YK5YtRKv4BStwzrVNhnn
	 1TgR4oe8502NlE/WkwXMlatWWEupMSAssRAAFAf3MaY88aeHfAYdN+7adU4l1GcMWQ
	 k/10XKDB/7hTTTmLyLH8pBXhFxGfC0GL7U7oMd4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40AA3F899FF; Tue,  2 Apr 2024 08:56:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B76F89A0A;
	Tue,  2 Apr 2024 08:56:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C939F80238; Sun, 31 Mar 2024 10:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49C0DF801D5
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49C0DF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MyVTi5u1
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-341e3682c78so1878147f8f.0
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874709; x=1712479509;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=MyVTi5u162iiXThdAIHoUtqqwOONR6kj52+vvOiztwmP9V3P3DiWLGEWpF4QzOD8sO
         0g4ytoGsiFOdhwg8ybIuOQKWRl67qybuptmZtRsxlw56ArIwSb0Sb4xuu4t4c1cC3N20
         lJfA1nsozI6d3O88Edmp1X18bgaBtD1XSHB//lExRNNMktwXMEUkT+jba2PQrfmIH8NE
         2SCXhhjIn6uinJlOYhjN500GxwJmi5byeSTZ1DrwuQ17KOUliOHBbj9rXB7HXfIXKrOc
         zEWqgFRNKl3gG2crYdUDxqotVrw4lhyaMaaSBaTcHyixB3mJwT0zS/krynLheEZYaQL9
         MNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874709; x=1712479509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=P6c2HWJiq7HS2/74GqJC97JXXK8VKGGqbUHvWbYgiVjNlecL4H2eLr+K8bdRdMhO0D
         S/uSqAMY14m2M5ssUoh5yWHRLAjsZS65N5snUBGb4XKOuVZd2rGYkbj9ljWLjOVY+/3q
         6FrOMg+Ak642h1dckWGirZB/pseupj5lsCayZLEJGmfzfJasFb6MgkM7w6ErEp3nUJVg
         sFMwfGjlReUIGe8SewjWuX4qqR09yg41IbESZfhzKLn02UM5Q6Y1FIxHO8MtX4OFaGw/
         npljQL5yBfI4b79beoS5Ay0Ztko9ByvuPAaFpBvkcloq8G7tZttoadfK3+WUn/qUI7x9
         RErw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSz/9Lf/bxzDDYPGjpkuIsTrcPOpDyaKo/EoIobAdiDH+GTpyCysWoIl6Lv0GNya7lPLNJtkbRIv21IHjwEPcoE34TQ0wC+nAgd7I=
X-Gm-Message-State: AOJu0YyelUDX0D1nryKWba+tCJ+Qp6QcP7BKBBzW0sqXPDSOuFUsP5zd
	yoJJSAbZ+oKza5Eqz4w4udoWgBcy+y/rsWWj95O2ojyV112bETsVp4nOczDH9Jc=
X-Google-Smtp-Source: 
 AGHT+IG3jSNF7268J0E1HJfmQrmSXJ4Wl8mFjBEZXGvEomzawa1g4Wm2Mox5PQKcv6wxXeChlF8YxA==
X-Received: by 2002:adf:fe87:0:b0:33e:ce15:8a15 with SMTP id
 l7-20020adffe87000000b0033ece158a15mr3641010wrr.5.1711874709483;
        Sun, 31 Mar 2024 01:45:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:56 +0200
Subject: [PATCH v2 09/25] virtio_console: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-9-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJY2K0WgWstI+JyoJVlI8wvHUdkoPQyLPDHn
 4y16zZ8fXiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWAAKCRDBN2bmhouD
 180zD/9DCleQCk0epueksPN87k8Rp6GpcfhV+x4ryTb7+1K/feJB0wQfepIMa34bCTenS9UDOq2
 17ccCayDu3cNPaVqPJkWZB7UHFd3M2I8rG5Zqv528TsLUB5P3GbKEzcbyWqO5e4agxHE8cl7Tj7
 WxP1hYOzNaXSzfgBdmLEdZnCkyjCjsj/RIsXHYE8MS+ZSxOj7lM0opJpEh0nm1LFrwJ2qBc7/He
 vC502dc39B5RmOcBsqj3ddPhdRhpLfNdx4gAx6ZVOKGRozzVnMD+nk2Fq+qw5cTF65PYbNVfiW3
 AjKdSMYJ3DeXggQXymSeoR1ShLp7brAPxaXnmtWrxc85IQfO8gZWq1+hMhjUZF7ufo60dkFBjDz
 mCwrbXy88PJtANZ1FIpswOU8JKtrv46Htzjm7Z9zDzUDY9iXPHJFYH1Pg/cXtyi8vzEjpE2XW6L
 SnnfiTn3zE+JLip/Gk6QPHvHJc3RjcXC8N675rP1wBc1xZ/5JkNuCSCMUHTviSCx1VCcyP9vfPw
 nrbK2ErijtG+z1HgWesUOmEVRyAKQsJr3pzDuAHRRgxKPPP7fuZHNBH1ddvq7lYw/S5sxT4q+pm
 wU3Fapsvk4HWIMkJhBfYxaHhi6SKit31adV0tbCNXvebNcsyFe6pgKRsPlRXbNuSiMeYZy4VS4p
 80u8Jql9MNv6YBQ==
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
Message-ID-Hash: L6UTL745IUPLZIKZX5CP3RRCDHUA575G
X-Message-ID-Hash: L6UTL745IUPLZIKZX5CP3RRCDHUA575G
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:53:21 +0000
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

