Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F2894C58
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4BCD2C46;
	Tue,  2 Apr 2024 09:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4BCD2C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712042005;
	bh=NiQjVjMZFYqKExZsObNgm/DCszic+bAl+n8BqmPOZX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CH4iQ3jFki9FeoTHqMuu3jv3lUOeDVUgkTjTVYjaF4SBIfQqvkgOPsmlwiF/Nu8bK
	 5mEgdxZRnvoZKs78KZmZq+xCIzSwTDQDnWYnEBza+biluv1T16ygV5sKC7LJpTCZXm
	 6Voo9bTD4p6j9kIAgf7ZX4N5BIAn/Qq7C1q5VIDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3D62F89C0B; Tue,  2 Apr 2024 08:57:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25AA4F8075C;
	Tue,  2 Apr 2024 08:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0CFCF80238; Sun, 31 Mar 2024 10:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B44BFF801D5
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44BFF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RGf9Pbha
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so2263360f8f.3
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874760; x=1712479560;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAdnlTchQh8FlREm+ioloxT9FS6Bj5xt9o2Hrx59/ek=;
        b=RGf9PbhaWDrTqvJ5VzFGXgR3y6x1WnmHffPqtvuVG83SzUrQjkmuJ/zKncQtOs7ip4
         pxIaVbKiuce4zYmRekS3mO1ule/0/rVMtHp+6EoJYXJYq59zy07lmWZWzbSmCrRDF/0x
         4oOAag3hgOylRN/9HAu4NltpcdXPJuhAITIP85vyhDwtDHEt1lqlNxfq0KcyypmSjZa4
         hcEpvWKLwDa2ghNnnzDHl/ZZL5Z5KaC3tD444MmQUmjksOK4tYxUBmDV7hb4Rfk5Eo3U
         EEvYcJJHmETnFzqzXARvBmndkM/oVIC/TYrNdc5ft7QD/Q24i2Elzf7pYwlrDXRfskmM
         BfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874760; x=1712479560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAdnlTchQh8FlREm+ioloxT9FS6Bj5xt9o2Hrx59/ek=;
        b=IDvRb4NGdS6YPXjsspI/xBsqIy4bn/q68kMHcFLGGlIL5tp0ZMWQULLP6YNmFjDSbk
         92OE5udOtenLF1j41sbWxf8qYoMFmhMKJ4DMRfeuSzo/M4Yl+LFauJIYOOicY9Y4miF2
         ZE63rWxMfRvKJyDX0PI2/y7QFmYvDpdyHeweZO7gsAHTBZkidOeqfk4bw72a7Rt96SuW
         kEzKikOcL9c1TBn1fMvpyIzL8tu4ioQiPT7BdHWQxcFe6DPOvqNBjIvi8J8/PqG52ObJ
         F9hUkf5zU8txotvHfIMzZyxaRB2cf/eP9wiAvCKjySOQ0eZe/BSxW5l3oIjrlPP/hpDY
         FyMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIiQmv1Qdtq5MuHnb60A6BF/nNj2bBYZiR87c7K/rDO+1aeyDm28jC68W9RTqnTa3Efn7+ZO02EoeV/PUrEgcEJsui7Ah1kARjiCY=
X-Gm-Message-State: AOJu0YySZS4BEQz5xsWUc9oMyHcZplRAVGJDYbkgO3p9OkijbubIGvJN
	dwswF/99HDLGXObzddkJ5YanRcFuupkfF9lBqwPn6bgxR+vu0APwry40kNrdGAw=
X-Google-Smtp-Source: 
 AGHT+IGz2LpPwhQY80sjD7cN8u8zFvxhFrt83Qh2uspjyZZar+MqP10mw3FpKFF2x5Oa/ktMacEZzQ==
X-Received: by 2002:adf:efcf:0:b0:342:2ea8:18fa with SMTP id
 i15-20020adfefcf000000b003422ea818famr4808562wrp.15.1711874759984;
        Sun, 31 Mar 2024 01:45:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:07 +0200
Subject: [PATCH v2 20/25] wifi: mac80211_hwsim: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-20-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NiQjVjMZFYqKExZsObNgm/DCszic+bAl+n8BqmPOZX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJhWw5LbpvzVhFws+zmYGQbgqyzkihUAHIKP
 oZSMQPlSqWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYQAKCRDBN2bmhouD
 139YEACIQuJ27qQd8eW1dGY27mv+DorF909fjdUQk9218e/PqSQf78sWt8Dwka7RhDehlGI5/jY
 KavPWJS8WmZupYTGwpWwO29uzaCgHZ2UkfSQaCt6QC21Sm2ZSIe5YSORBj73pm4F3aV1pqEG7Zf
 uEKF5SdJn8BL3Sq/8djgih8czEuNasmRrepanUNhtq4BZRUfa9b3d2hIu8czIoxIJ06K8gRv37w
 AsYE4wIp4r8/fbIlRYOdzERJeEbZy971KJWlKSO5MKy6kQgvEcu+ONjd1iR+Fdgfc8CKD9+R7qi
 j0rF0tfjdBKJZQxSDK4OGG7rYqAMfQW1dkb3Wwbs5BfrUc5FsD7sSNfdW4wSQNMO49JRC48Waai
 qcy5cn2TASJYAsl+9siLBtqYDCg8A+zkmblcAz+f8Tg0ZC7adlCFQKf3ab0eBEnC5H1P6JPY3k/
 P+KB2oUo3GGvXUKm0bsUYt4+bB28pkoKTNLzltigIgQGLvc6nx67bmM242YaJrj73rp9q+nHvKI
 69piU8bV2WDZcuDckA55wir1b4ShB3Fxjfw6pOqJxbJCSjvj0a5IvzYr2s2rFI+rEXi3dULTh3W
 8TMJIXX6xAyGSgH1txSm+cdudXTNKT96YWGp98mSXYwNEyRh2EUTl37ZRn/If53EnPmAxYVEX+Z
 M38gpeSfQm/346A==
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
Message-ID-Hash: ON3BXM5IBLYL4HBHY7QI5SVXLCNOJA2P
X-Message-ID-Hash: ON3BXM5IBLYL4HBHY7QI5SVXLCNOJA2P
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON3BXM5IBLYL4HBHY7QI5SVXLCNOJA2P/>
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
 drivers/net/wireless/virtual/mac80211_hwsim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index b55fe320633c..ef38b7cc9fdf 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -6662,7 +6662,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver virtio_hwsim = {
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = hwsim_virtio_probe,
 	.remove = hwsim_virtio_remove,

-- 
2.34.1

