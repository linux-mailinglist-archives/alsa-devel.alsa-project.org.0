Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5682894C32
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F092D71;
	Tue,  2 Apr 2024 09:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F092D71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041729;
	bh=5dl9NHTh9y5H4tCny8ybMFxMPRLUrKfowCNkKiS6mRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hoHRLV9mgaN8U2iceAGnwLLOaDl5wlmDXVc9g1Xhxj9yUtra50eMa/trQgh8cA18c
	 m4nfZoZM2bsHuumNycu/LxSzhTiT/WRVk5K9CVkAW4fsxxRIuj6+NJA0fIlct1hXx9
	 cteXX1F0qjisuA+9PAgLEP5mGGKj9WcDBx4xHUZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D7CBF89AC9; Tue,  2 Apr 2024 08:57:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA437F89B09;
	Tue,  2 Apr 2024 08:57:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E49A6F80238; Sun, 31 Mar 2024 10:45:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 64F68F80130
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64F68F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fFwk87V4
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so2376861f8f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874755; x=1712479555;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7ekE7D2gd0aNFp79HNvxaXJwfCkZ3wIe32KjT1nW5Q=;
        b=fFwk87V4R+xZRgvF3Sz3Z2Ylp4WZIxqFhDdIvXoLirpB9keAgKbCSjhEeppUtFz712
         wccUbQEdovi44YqzvHbLcfpCubzcQE2CIwTOrlo471fIYmXynHoutXQA0g9uliG1iujM
         LCZsY2n8Kt2jsZrAb38y31N5luLQZG0qx8Ozwxg96jj2rHAEH786rirgNA7yXSoQshqG
         mDpks7sZTjOCr25hV8b4DCq2c3sXpxmz5hN6ZP+GJhYZh2rv6ghv4AZIeOfOLrHqM9f1
         9SCEm2Z6IZZ3xJ7FbQ0zgMyE3A+Ba7dMUJUU/okA/MHnZ4AVVqJ5Cfz91arCgS9X0iK6
         KQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874755; x=1712479555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ekE7D2gd0aNFp79HNvxaXJwfCkZ3wIe32KjT1nW5Q=;
        b=nKuQqagxv6u1nA0GVF6a4e7T/7TnB2hn8Jz7/7r76pEdUNwSCo09JrRPLlJLmljdvp
         v48VvPFYfWnTZoTo8y02tEA69peo6sWaVj4cn4Yk3VV6bKRlq+5as1m5BpV8NpLjiTYj
         GLScJAFZgSc4n3Rkp0+zOVbHQMHSfw79JkNe7u8UC0tMoP2jlybFzdb94nmiRNXRA3/g
         /oaGYGIYvCSULW9gciFL30xwT7aS7Cv7QF6ViDxRH7+idRnFvbL+onHykCNDeIXV9wvM
         8zFypJmBLtv+qssiTe5X3Na9NLU9zFNqDU3kw8XfI3hqvlWX3vgaVkaj2Z6xJxVKOt8n
         /8UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfbpVfjeQLfUpygnuSRND9pXjgNAm7EjTE5IIdXSRtdxy7iCjdnPtwmZqHk0cpcfs6l0ZOlpiDd+4OApckpPBGcTDZDxffEpGXAbo=
X-Gm-Message-State: AOJu0YyPYZD058ADMZB0FCx2s3GS9PypxoiD9rOeCsV44O9gUuO+wA4u
	DavesxXlxQAHb6uKWVXnT/bBzJJ90QJXO8UGXTzoHOeQRV+3znvpxfg1cDhIDyg=
X-Google-Smtp-Source: 
 AGHT+IHY4jvw69go4YrexvUO+g7bpZX2iGHLXVofTcCejYK0NsEIJ6fVRrU+mpuH9SmiUHUnya0lAg==
X-Received: by 2002:adf:f9d0:0:b0:33e:c7e3:b1bb with SMTP id
 w16-20020adff9d0000000b0033ec7e3b1bbmr3804378wrr.16.1711874755569;
        Sun, 31 Mar 2024 01:45:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:06 +0200
Subject: [PATCH v2 19/25] vsock/virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-19-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5dl9NHTh9y5H4tCny8ybMFxMPRLUrKfowCNkKiS6mRo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJgfo8D9Iywb3YbbB+haseiaS7hwl8I7GNnU
 gN5S8CUSaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYAAKCRDBN2bmhouD
 1ynHD/kB086VP7zwkINBMOuLtMvEWc+ntX9e3b9T60ArHB1XFORqGA9Cfk/X4Xd8lg3xRFyt0I3
 3DbMVZgjLetwapU5SywzAZRv+sQhJvRCGiT4R53cOj9D3+CVWiLMFHPzeNl+J8UTiR8zO1OydZD
 iX1ZEV/aX17efMwK2c6sW6DfCy0XdEClWLFaoNhT0vwGEqu/gl1hAZaA6GLpAfitOT2zrJNaUA8
 c8Fy18ZJGcFiwIpFKEcpVCE82fSv2Q3v1gf1KYKTDlJBhFFceaiYD28j0IbBjDRoZTx0XQg5Cv/
 yd4PXc2kASxcUzl8yI8ov0t21VLGjBI+QFGY8psfuZT3rIBPZF1VenQ4dbTErDZb3xWhUt4tBGK
 RU2sIzcU+Hqerfkd6YHjV4ti4LHUfRPORFtg788xKx44NrBoJ9r2GLPab7JSZL7AjZAYOUNx4Op
 iNXSZPULjqG3zZg3AZ+NILd9u/zAp6t1r5eEiBusCKGguYyEIrbQutmNIsSIqWgNGKZ25X0Ypee
 7517fTJGgJcLSYgVKO0zgJh4z1Lq1YAom+EGc8WFF5dd5CZ03p5iQjDdpmNvBoOqDp/ENFLzcx0
 g7/yuB9kIHOthzTRKAJkMdEidrBMPLnZhJjq4SnNTzXiDHmR5nysZ2gzxLzE1GW0iIr1wY5bfZL
 7noJDUdPEH4jNfQ==
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
Message-ID-Hash: ARMK2YDSQOP2THXVAXFVABOBQZJY65ZE
X-Message-ID-Hash: ARMK2YDSQOP2THXVAXFVABOBQZJY65ZE
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARMK2YDSQOP2THXVAXFVABOBQZJY65ZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

virtio core already sets the .owner, so driver does not need to.

Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first patch.
---
 net/vmw_vsock/virtio_transport.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 1748268e0694..13f42a62b034 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -858,7 +858,6 @@ static struct virtio_driver virtio_vsock_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtio_vsock_probe,
 	.remove = virtio_vsock_remove,

-- 
2.34.1

