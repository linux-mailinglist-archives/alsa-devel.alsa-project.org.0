Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8C894BE6
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:54:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0AD19E7;
	Tue,  2 Apr 2024 08:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0AD19E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040896;
	bh=+TTEvPeSyDKzVSSZ0ChnkaU38LId0eko0vuS5jdKWCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=isfYnttR9qAP+fbdnJ2Lh2Pgr0fEIJAbMMgIb1BmJ15idXOe7AsyKfk6jV+dl98ol
	 1a+jsMvCzNHX0hry/kG+WkamXbYA6aCbnDLiy6Lv8mizEsY3XTQrSS+4rehP7vtMgU
	 PMOXzWZWimq9tGTpjvtGC0Q3n7P+NQDshcdmTiog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F91F80638; Tue,  2 Apr 2024 08:50:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 710A7F806E1;
	Tue,  2 Apr 2024 08:50:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C276BF8025F; Wed, 27 Mar 2024 13:44:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8B91F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B91F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ONmPMqp9
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56bc5a3aeb9so8790870a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543481; x=1712148281;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLTRp2vTdiF6En9+dHZ3QcMOJs6Q2EWbLSRJcvapXSg=;
        b=ONmPMqp9BLXXd/vFB5Qa+NPJnYnKD1BlJLlewz9HMVzB487EJmAx52oxQSIckDPsNy
         supcEsiSUSkQ70XU7kplNjdScxiZk5n+tn7UptVnZhvjYn8OcskNTyjYWGTC31Vdbi8h
         WfSsnMYnJSLeUmGUVaPX9Z26iZtcim+QyRmhFL1lJ+slW/9U7InKam/+0Ev9BBErCTsj
         40w7XObo1jBrPxcCG2M0vo1rnfwhn5f+K/tTC2FxdP1CwPFmI2mFOPAyW7Par0o7t4kv
         NVz4wQOgvKNGlLfTRZkR7Rxakr1K2L5Z8H/OnvfVOVUoF9BcysGACy9eaF3jXaMk/AGF
         FjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543481; x=1712148281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLTRp2vTdiF6En9+dHZ3QcMOJs6Q2EWbLSRJcvapXSg=;
        b=bX0cSdK/f2wjY2+o2K0mlNKawvsuViIFwK4qJAbOuZEkvejOA7OzdzQ1BQfc7qvh/g
         biKL9MU4I6fuR+NrBipvTt1LkKjrjDeRNOsOMVJMgTrF0s0T/roptMtNUGwXY+pu1cUY
         ktflzHFgN3cLVDC5KFpgA3Xm9TqMiumCtBkw8dBJlTSnga9jjrbEQUp5/QJugaeHthlO
         7DqkguYUcxk56Hpt/UiDRTmrf+TDjn1EDjBav67hROzG3K4PrkZpNXM6TDqi/PZE4tMq
         gwpwnmjmaHvA83y9WW6+lZx2m9xZMacY/c/sBJE0W1Xr1zJ8Q66haSIlYnydXK/SRxpU
         siAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu+Yw0KBs2uGfL8PkoZUZlrUTL9SNU9Tv6DurgsEjjCgcq85NOjAo2k9CJh82FkHB6MjmgQhH+28g/B9NKnWU4Iiwf1P6dVTiBbVc=
X-Gm-Message-State: AOJu0YxKU32C3B/Ua14Jn/AUGhjS3WFLWInfmbo7pLI3fqThSYfZp0AY
	o7/0e2oLZiMzR9Xmh4iMZnfEd3IPSYUUsZyAME5jV5F/5cffYErCqa0BtGbLJIU=
X-Google-Smtp-Source: 
 AGHT+IHhazMmScpDCVE5i2KB2spuKKBHY96umDzN4+tbnuRVjM0nNvNgt07FxjvGx72WnVTtepaPNQ==
X-Received: by 2002:a17:906:c7c4:b0:a47:4ae0:3bb9 with SMTP id
 dc4-20020a170906c7c400b00a474ae03bb9mr1746143ejb.23.1711543480699;
        Wed, 27 Mar 2024 05:44:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:44:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:01 +0100
Subject: [PATCH 08/22] firmware: arm_scmi: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-8-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+TTEvPeSyDKzVSSZ0ChnkaU38LId0eko0vuS5jdKWCQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPgrxhxsNBNmJJQCHKExyWHnP8ODMwEsvhWt
 n/mycDlzamJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4AAKCRDBN2bmhouD
 10y3D/4z3M+4KkLsY4QC3Xn4tvrxIjQ5Wb5DPTrn24JMZBhJ0G36SkzajGkhIsJvlZAWAN5cjth
 BGRcFpee63p66hs/5nlr7xvsuuUaFToUJGB1MEtOMPJVcGgxdwT+QY608PsisH3k7Q5LfND+vtd
 a00SB8S8bdFeo/J6QR+Lo4WVzn4MmQ6bQUUO0x+w6j9u2ApDWUpbn4lQFBXyeB6M9QvhtpKKT18
 WIlAR+9+r+YSy1Jv1Alf8VtzMU5ZrE2C4/22VDZfP/KjTOokwZprIl+pdQS2AfNe/Ov/Um8lFzP
 LAcx4A+9rIPngAmQgBppsvGcueE06F1zjch2eVeKOCJfzpMUIa8YMWxzrmDoz9DhFTK2fLHILan
 PRiM3f7a9Tz1k0IHaxCdiTlw89mA9VaCF9BFGTcX5VDzbukPSs/J7S6jmkkXYum2exhtLNOZ4X4
 gCG9UW75vXSFzlKKDrxGjGn+4JQxdKpNyd1/8uEaDXO23Fl8L5Ivv7rB+UEoBnPrG26oOMmLi9h
 0pFF+gXPq1C693H4Fh6zYpvN8MTP+GmO3O+kgxgNgIQXapBUXSVJXHcUY8in0h+Y3Zw8XhDa7fY
 thDmSLGfYHMHtGA5AdIZ4s0FpTgXieMccsEo2WE/DQoaAEKsnyro00wnY0zbQWRvD26KY1iP+dv
 LPx5k0S9Vk6nZYA==
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
Message-ID-Hash: PIZG5XI2Q4EJR427OHM4IQWK5LEAHKRM
X-Message-ID-Hash: PIZG5XI2Q4EJR427OHM4IQWK5LEAHKRM
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:49:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIZG5XI2Q4EJR427OHM4IQWK5LEAHKRM/>
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

