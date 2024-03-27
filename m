Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104E894BE0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C072BAA;
	Tue,  2 Apr 2024 08:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C072BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040842;
	bh=rFl/6jLaFbtBJ+88FvM913PJ4x0vjfjJ4PxyPcL+Huc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mu5qOlxGmRGPtSOqS+0hrp6IlooK+AdL+XE9VrsjjUTckZctzkWYVFwJqnJDXf1aL
	 Lfuv8Pj89qA5YIlZYW3qHx3EzfnbHhSx6DpwoxP2en+90GWGcNyXr6RxH5/AvwLjGE
	 N2/OzXYtziiHbfLfcEdZ3Y10F4S1yU9NpBUoI+Qc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22958F80C81; Tue,  2 Apr 2024 08:50:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37105F80CB9;
	Tue,  2 Apr 2024 08:50:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A6F3F8025F; Wed, 27 Mar 2024 13:43:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C52EF801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C52EF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oeUGrYi8
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56c2b4850d2so2151955a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543408; x=1712148208;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvtYxn/jBnHDfTZoo9tjjvjwD5frxuJyBUKvJwnL+3s=;
        b=oeUGrYi8JN/7SprburJQvJPerWrR5OcEW7c8ofI2/PNUPeJKJdLynScdUGgQpAriO/
         y7WagqzlfoTOvZaDZ1lKVFzP+y7DNYiSe1AGp4CgZWH8HiFqAeUGSqilH2Rdl8jKyTft
         Ld8smq85VSA88NJxJ38QvloRK8rJz1dV4MS+vUqDvUdq/5ShY6omdK/b5UHnc8Ln6LQ2
         TRjkXSaPVWWvGXJygLvU1cdyEKOpNvFe6OxJ/GdFUW6aRrq1mASDzpokBS6Fv8yfoa2L
         1W3cF3qsLKMEKuKr2d5Ve60cJk6+wo7uQREgz2eUW6eQSxmYcJtPcdNxgz8cRbPNoDgY
         vXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543408; x=1712148208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvtYxn/jBnHDfTZoo9tjjvjwD5frxuJyBUKvJwnL+3s=;
        b=GLjoJGknHfmiDIMPV+uFJeoX3RuLAI1+3LTpY3ITh7352r0/yV957QNauYGBQukh/2
         D191gbx9she4pzDsjjwhkbMB1HOoyFuVDBkiw41BoBykLZ2Z+/4xsAnZykynCmK11RYs
         YIxxNlkuPptbikPAengDR5gTlkNESZAVU2+cpDix/jl0TmuIM+G7IG6bT0rOq9osVQBQ
         NPgWAjqCsrvQAYJ5YNtm9y22Yf98lqV/cAb4hadtrZwRNWkf9zc7EC0sHRreffrF4tCL
         RHXk/efptjgnCmn5IWXeqR1gt9qlOV0DysfwUSY9bLGsH4WAZUVhzfOBMkc3hEKjNq66
         BVrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9SZVbis8vf/o3bY7MZnjyeGAjN/za3jgxay7T8dJLCMXc+P67u+Xfk7ppSUuNNAd4CH90HBPvMzTYOjX3A/EBjE/JWp2GqDsWw+s=
X-Gm-Message-State: AOJu0Yy2qGbTYGxw2k1xCVqcjOJOffqUtnGl4fdU9WdRyO0gZumHhEs2
	vsrOWLiL9Jbd7iwvUYK2Ed9lFlNhn7W/Q5ZC2W9fTWIXl9RxIB5NT3q+Z119As4=
X-Google-Smtp-Source: 
 AGHT+IFQzE941/frKvlveayAo5OwX27t9ISC9Ui//MJIb/s8SSfev7LRMOseQU2wGRtbmTboQ2qixg==
X-Received: by 2002:a17:906:af97:b0:a47:2d4f:6fad with SMTP id
 mj23-20020a170906af9700b00a472d4f6fadmr3640240ejb.39.1711543407742;
        Wed, 27 Mar 2024 05:43:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:43:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:58 +0100
Subject: [PATCH 05/22] hwrng: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-5-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rFl/6jLaFbtBJ+88FvM913PJ4x0vjfjJ4PxyPcL+Huc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPeh3H1wemzDqhAibGWW67UcAFh1HQXSznqt
 bEbHHO+hSuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3gAKCRDBN2bmhouD
 1ypVD/9oHD41Qj1Sqk48VDcTdVES1YvXuuDoKvE3VyWtnVGYiNb60QFQKU80jN6oLcjshjDFPK4
 E9ATN58meESWX5UMMQUPAUThgndBeYYVkY6/3jhOvGFwreHYYn4O2qTukURJ1fI7ASP2fyP/3nW
 zr2qKyF4JGyI2ZhgGugQ9cVcNM8jB7rnMrOLR759/ggj4hB10TDUDnS/PYNpCk5h+ilyPgVaiZO
 lIM7Rl/97VdAbNVvm67vKkma6hKMUwEPWrsQLNcssIjRs4uK15fsCuM6ZDHjQn3u6K/mSnvitSE
 EyW7+cwNG6sSW5FoX1RnBwUYIC3+ayD8aiBjm3Qi9QmwHNo7xf/VXT7UowyM7ax8vMNyNSXkWi+
 hZhp1/+lVuMFTQzw8S4FzsvcPx5VCKOtoQizvNZKcMN0MhhXh8GSusi2u8XPahVqki02HVqEd8i
 p73OVWfBh6OSn+I/RaMqDWLtZAUQbLU69/ujHReW2gJzgZLukbsW9E4kEq3bWO/LuLvm6yFdril
 sg92y2CGcR4zgijh+/THpA9SRF8QURenYZM4NUWlLj3Ef+o54LpKRfdBDST0ZPeeiaaVneb8UWE
 LRajuEBICJqBAAAyaa4VGBaB7T+nodd9jR3MEMAWXS0ZnBrP1efJCygFMbepcVlv5jiKT282G0W
 t4D4aOVlYAW4RKQ==
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
Message-ID-Hash: RONDW76FRAUGSBOKB3B2XMAIGB3Q4UF6
X-Message-ID-Hash: RONDW76FRAUGSBOKB3B2XMAIGB3Q4UF6
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:48:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RONDW76FRAUGSBOKB3B2XMAIGB3Q4UF6/>
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
 drivers/char/hw_random/virtio-rng.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
index 7a4b45393acb..dd998f4fe4f2 100644
--- a/drivers/char/hw_random/virtio-rng.c
+++ b/drivers/char/hw_random/virtio-rng.c
@@ -245,7 +245,6 @@ static const struct virtio_device_id id_table[] = {
 
 static struct virtio_driver virtio_rng_driver = {
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.probe =	virtrng_probe,
 	.remove =	virtrng_remove,

-- 
2.34.1

