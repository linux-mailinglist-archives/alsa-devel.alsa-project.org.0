Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F213D894BEB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E8052BC3;
	Tue,  2 Apr 2024 08:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E8052BC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040964;
	bh=rkTpT83OyeYcLFTcFWPlfq1EO9ueUCyja/WSxZqw7hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ox6MFo6prj8rUGt6rGGv99h+TUn67J+03HeS6GapGLRosiPxpSKgYVagF5Q5u+fVo
	 yrHsw63UhB/zNhS9DbQccYXZaQ3VeBrRvaBZQJZBdCCu7b5zpXDFa3CLJH6KfL0Hnb
	 2q7M6w8EK36GXUErRnvQXknp5it/1Zdmm1NHQLAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5953AF80716; Tue,  2 Apr 2024 08:50:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F83F80587;
	Tue,  2 Apr 2024 08:50:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7202EF8025F; Wed, 27 Mar 2024 13:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FE54F801EB
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FE54F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pOg/THvB
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so890890866b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543541; x=1712148341;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpODOh8SpqDydjsGmjw6Via7WFpVB11YsZ1xvZ5Vpsw=;
        b=pOg/THvBF4vnwseyuMAYalyWyQJdP++HHd1pPKP7HtMoIYZZVEF313h5FE3yPGEi8i
         k1PGYhsiO9yrXZegpbdDnDpxmN7x6ARhJggpzl1EyOCiEkLSrJendIKZSx2Vtsg/CXB8
         vNp3eG1T9rou+3jRTFgHP0BhALoC9m7bGv/KBvcF+9LCxyL1UMsn3N7MXpmWtwpP7+nZ
         VPUT8BPp0Jimijn/9peN3TkpYcwVQUA668VusZv1GhuD4jq24zoMTFVv33naLG62L1AO
         Bel6awjlndIq+K784BUaz2c5YzPznv3f/WpWQLqGaqIZkVBcNAx0+RwlZ8zv28SywneD
         r53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543541; x=1712148341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpODOh8SpqDydjsGmjw6Via7WFpVB11YsZ1xvZ5Vpsw=;
        b=Tk2vjJpztnW1iKKSeKe9cf+cW4atUnYlio7ozCPY8/82SDF7QaA4O5VBCGoydYmHQT
         z4SoZTIpDXuAKUy0JRY5WcolI4rQh2OKDuGmtyleDZ0e7IBatHL9bM8vhN9C8li3hevt
         r4QGLG5pDPjsSLugjrsnuvnwmBM6mOOk+ZHX/GunNZl/bFv0ubg6HFRtBHzWhYJDoT0+
         ORHS30r5lS8k4tzL+bn/G/hOBP08UzOVNsizvGzKFWMm479UUkI0wZ0UmgHB4c34r6RD
         e7/GM3oyfhPZWqAYVeK+mVX6p9mA8NNEFDXud8MJSQbEvBsHQO+BDqAlsQTfkgfnmb+c
         DyjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOJ5uikVpSJj3ieP9+h+c3hHcWH8jEp8++3JE4RpF253OgxjhX+mtBu1rfxNwIZmiYXeFrVFjAJi7x1RSZmksfMPwg1fIEMkK84Xo=
X-Gm-Message-State: AOJu0YwPi+DebuMWHnQ23yz/bldXKryepbMrQnOFib+JhPlHEdjzYTD3
	tYToxM2aiIIviYJ2fEJbvk7YVPQFxoXKj5MtgmbktmU45E6BmbNfPZvE9q+sW0g=
X-Google-Smtp-Source: 
 AGHT+IEcvI6eWDqWD1PBGrew0jG/V5c4yhsfSwGlGbpPcqAQ0aJsRX7Gtm1g92tL7NJRpTYESthDyw==
X-Received: by 2002:a17:906:5910:b0:a4d:f0c3:a9e9 with SMTP id
 h16-20020a170906591000b00a4df0c3a9e9mr3515531ejq.28.1711543541620;
        Wed, 27 Mar 2024 05:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:45:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:05 +0100
Subject: [PATCH 12/22] misc: nsm: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-12-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rkTpT83OyeYcLFTcFWPlfq1EO9ueUCyja/WSxZqw7hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPkwT30jL7yE3CaV8BYCN+/iF2QF578w++SH
 K+O+AlOBQGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5AAKCRDBN2bmhouD
 1+hfD/9LpFlPpmo0LIxovBV8yHSMe527wWwFBJ/jtDNTokOT1qr5tsLO6Gblc437dKLraA6Id5O
 jyjhJkIiVy3XO1NdcfudmUFdTqABE9vcJJKQhW2nT4ribKRBHNQme4adAnbw7QNCLUPa806/fgS
 hkQlx8/2Did8dJ5+92jQUozhcu9vo3nLWq0cSjHv/Venr0g8dJXzd8FiQQGQMeeBd1VPS1E491n
 GYPDAvFyKRPnmetuDQm7BK2utJbC9d0MLMFC5wI875XRWP0DQAEaXM7H0Yehh08/eq7Wh9WO3Di
 UZfnUJ1mB4s8b2z5PL7WG2MTG/EClvSwWR7VW8CT/hTsmT8N0qeBl31u/eygtYUrOn0XZiNYhSL
 YgP1CFY7lKJOkXB0n4rHAuFcdTNRFe4DL6uh2reZdn5D4tM7z0KursxDh3t5J7uDGR6XbLzueIo
 19ZZXkrXjB+eF9EnnUO6Q3loSOL2FDGBs0yP9CvyrDFeo4Ly3qbfLqqQxcoUysY/PtlCvOuJK/H
 54zdsxocH/qjiDsZwX9NxtaTbc5uj5fQhJAUrGSetA3lLsGQ+GXf7Nter9+bEVuW3gUjfj0hGM0
 wooTlvC1TzDHtqrYqiqdZa/UE9CD5vso4YDeEkuh03eSXDjDIwsAWssPYOOxEY20BlNvAOen5cF
 w6kXIs+XeHqgVjA==
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
Message-ID-Hash: 7MDG4DEZR53YAH7TIJETK7DFXFAA34A5
X-Message-ID-Hash: 7MDG4DEZR53YAH7TIJETK7DFXFAA34A5
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:49:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MDG4DEZR53YAH7TIJETK7DFXFAA34A5/>
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
 drivers/misc/nsm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/nsm.c b/drivers/misc/nsm.c
index 0eaa3b4484bd..ef7b32742340 100644
--- a/drivers/misc/nsm.c
+++ b/drivers/misc/nsm.c
@@ -494,7 +494,6 @@ static struct virtio_driver virtio_nsm_driver = {
 	.feature_table_legacy      = 0,
 	.feature_table_size_legacy = 0,
 	.driver.name               = KBUILD_MODNAME,
-	.driver.owner              = THIS_MODULE,
 	.id_table                  = id_table,
 	.probe                     = nsm_device_probe,
 	.remove                    = nsm_device_remove,

-- 
2.34.1

