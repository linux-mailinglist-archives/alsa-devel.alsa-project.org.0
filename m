Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1EF894C26
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE40A2D0A;
	Tue,  2 Apr 2024 09:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE40A2D0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041590;
	bh=kq0Ui8ydSZ7Hq9AlXQh0XFHRtPG8YMsmmEL0wAEhAnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VePTj/Yx5ai4fLjXpncI0UY3viik+BlNoHrww5oThvnHg11g50LhlMZTA9Z/69Qc6
	 NeTFsfp5jub/62c+PjjEiTJ7W9F/fVE5Ox4wfQq7bqyXJ1wxPprQMyH3ZZddN6iigj
	 K6AM5ydBkllU7OhG5iPghGm3xaWh0FgunuwUkd00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04065F80651; Tue,  2 Apr 2024 08:55:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A19F80C75;
	Tue,  2 Apr 2024 08:55:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60E01F80238; Sun, 31 Mar 2024 10:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1017F801D5
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1017F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=b6YFkajo
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34175878e30so2544257f8f.3
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874691; x=1712479491;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1fmxNrW+En3ik5NRwajUgb1npSjXN0p0vGcgo9pP3o=;
        b=b6YFkajotD2pfp0kL9B2EerUg8C5KSq67msTSV9Ceqx3z9Wl2A1XKzBZ8/nr7DZcgl
         fzyjUCX69KOGLlMcGPiG79MkOwF6sJLrglKwI4IzICo88rv4qR8OZtHeOtE3yN38U6//
         Vfh9vJsz1zp/s1FxGsajK3e8KMDERtK2mdhNsaZql0eWLtr545jZqkLTflOEuq7sXXKj
         XnxsATjlzbnUWg3UI61imudkmwgW/5Qxo0mFKPmPxLdlU5FfRGQ310V+0wxDWmgV/oWf
         BLeX+cDiUcEjQXe533YvZYyKwHRZmDCyCAFjwv4HRch9nuhbA5sCp5dXEvjSge313xOh
         5Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874691; x=1712479491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1fmxNrW+En3ik5NRwajUgb1npSjXN0p0vGcgo9pP3o=;
        b=sYhlXpSV35SIeLRRFEJAijPfysMb9RqYJ7VFMkwySlAJLPJ3hAXqDCkIGAB1B3Y6Cg
         KN1vxGT/6JNjIQdUV/ZkwhNWvY0I1WHf6hQY7fLgYGMLlmJPHwzMwQRJNeKVFxZsCI5K
         A6yJ28OTkBNkmFe0t8EcjUF+DdS5ae4ew1paucpoCQARmN0JXEoVplj/SDAjeqSDM+1t
         wl7mtZi4GnygSuSAfI0d7l9rOlRQb9H3FEbhInsFri97brbwGB6q+NJEI7UbLe8NM1Zv
         BBkjTGTv7Z64DXqyOUMRdvM1zonjhn5HLgLzxZG2m8yhqIQPy/BPoOAdMwr/XZtDmv95
         lccQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU6+P+CbW+SKOtCb8W2QVxPC/2febWj2J0VdH1EAUOhWD3bWRMRPx/rC8e7CI2krwQJzJIaQ97uz0qB2LC/Q/rJLdT0iANcuQujfE=
X-Gm-Message-State: AOJu0YxogTJ5Uc9OAgHpR6xFz+PPsoXtDzqSIwv70uPmlsFzdvk2yusH
	/JFp4a8qpnH9pbmJM5EUw0Z8Hdg7M0b+dYwcEPJf4piEl32JPkxrv2R6/VnWVM8=
X-Google-Smtp-Source: 
 AGHT+IEvG4Cb0djhBW2bVfE6XN6EEBOTKzJhcyxggJ3B5oUXP8szqnDQNAv76iS27j8cgymDVjUeZw==
X-Received: by 2002:a5d:4950:0:b0:341:cdd2:77e9 with SMTP id
 r16-20020a5d4950000000b00341cdd277e9mr4836936wrs.60.1711874691078;
        Sun, 31 Mar 2024 01:44:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:44:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:52 +0200
Subject: [PATCH v2 05/25] um: virt-pci: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-5-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kq0Ui8ydSZ7Hq9AlXQh0XFHRtPG8YMsmmEL0wAEhAnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJUTNbl4Q+dP5HrdikutJS/JjxedTtQx01xy
 nUN3Bc+MDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiVAAKCRDBN2bmhouD
 10bVD/0fUo9bh7ci+dZ2GEleWtdLm7IYNCSedKZaQfcrAw1NIF9rTRkW3y0Du0+OfxnZtreW7Jy
 xV/dOtVIW9BUDrDQcIEowtRs5jJTw4YHg3duDoqki6wKNBruHwdQBCQZfGL7DBt5m3VN2gdWlsv
 DrxXtKGcpiFvz9dfKy/FRbZTerQgtCE1+q5cGRc3eSXqDxfcJLHhwDglQhy23cErJuaCO/62JZq
 EWegfJR0lR8/PewSpOngB7JPLAMaf5JuKW3/1ridIGe5Il3gQbf/MU9qcUWg3iakTf6P+IrAyAI
 sQDQigdl4xH4tqu8XJ1d3QOaFpVon0OuylQVz3lrwp2Ovoy4BKHgYyXg47GzK19iFUUu4Tm4879
 KNPZTD3K7JP1S5e3TtwtduChtq8I0ZTG8mZbKV9EGPtjEtZIPP2soqzpzWPCqwNZ7Z9x0lk+wrD
 V+RVF3buo89apBrFu6qVyDl/XJhjHDZSpKrpsCdWRY9yOTq8P6qV6QN/jQP06I8hUvToGa2kHr+
 gO28lqLdp/8e/mH15NPGAtqseTT4RkgWLV5YMQupKmKufhnqTEQ2NpPG7bkdNLa3RowK6V5PUZR
 i7NI6F54U/axIEDTTXFAc9mjE6ExLu+nHeJQFmZbkAuSrw/C8DXb5Qfclk3+UFWHcvRqphFhox8
 8KvsBDpTxBKfHOg==
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
Message-ID-Hash: 7MTAIUERLHCR43K6GVL24VLVHSXX335J
X-Message-ID-Hash: 7MTAIUERLHCR43K6GVL24VLVHSXX335J
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:53:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MTAIUERLHCR43K6GVL24VLVHSXX335J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

virtio core already sets the .owner, so driver does not need to.

Acked-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first patch.
---
 arch/um/drivers/virt-pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
index 97a37c062997..7cb503469bbd 100644
--- a/arch/um/drivers/virt-pci.c
+++ b/arch/um/drivers/virt-pci.c
@@ -752,7 +752,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver um_pci_virtio_driver = {
 	.driver.name = "virtio-pci",
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = um_pci_virtio_probe,
 	.remove = um_pci_virtio_remove,

-- 
2.34.1

