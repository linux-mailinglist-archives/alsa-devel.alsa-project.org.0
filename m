Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98E894C3E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:10:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58322C46;
	Tue,  2 Apr 2024 09:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58322C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041808;
	bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H+XqOGOy57f8W5ECgjESE/rlCiR1R9u657pce+OBI0eFj3s6Da8B1hhDHVTl9vko4
	 OEiAhDs5/K0tkqfhuiGT+JiGU0ANepIzLnz+hbfsyvw2Mh0yGsJU4vDzFwkbokmnEp
	 3Zvtlf9F7g//o5wkTxuqDLSdx5UeEYaUJDLX+mes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15FD3F89A73; Tue,  2 Apr 2024 08:57:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85FC6F89AF7;
	Tue,  2 Apr 2024 08:57:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71F5F80238; Sun, 31 Mar 2024 10:45:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 49767F801D5
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49767F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XMPH6uXA
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso1933250f8f.3
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874751; x=1712479551;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=XMPH6uXALdmztW13IUVgSLWpvGpI0I2yRrqL0fl9w70EH1ngXhMJ5nveei7HZp2b8+
         o8pXsO7ruLxxFsjxPXPbSewbP6ZxtFaOeXyE+JbffDVCIyoHre81hcvFhmOqnRyHZBig
         UW5LC4CvOd94LPROX8Cc0pFDGz0lrRo/5yS6ZDQGvIbJbMULfiFB95stRyzSeHaYVlFF
         05qF+WWaVS8tKMwbqB6elO6osxOlld0sqr2T2EVbBZDceUyvHoGfTyBMLOFmCwBplbSo
         RafmIoi6NHC49lwcYzu/SizpBHt8kvrcQXkWSnfGSbb9mKQvUaHzIekUSv1isJDVmyAB
         hsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874751; x=1712479551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=W0KVVE8jlvowVDJrgwKuUSOwMf8XFttmI9y0p0A/GjylVonqoMaYEZq3g48GiZA0ev
         JJeQFw2k4Bc8AfTOML3uzWXbYIzNs2uU00q74zc/oJoOQTC13NvKDZCdnptRNvDwG1hQ
         OJqddN/4bVm4m69SftpBYEgyRJibJ9dg8rOd3pz7mhnqItHpCdV7D48N/SJ3H6pdcwMB
         CYFnd/ImKh6vXzaF+WYh/NMIU/2bPDDu9rB9OgYw8VX1BgWA09da5MSgmJatiet4JQoi
         RZd2ViN3LTeUg5YWSvEbqXRY+erEBDQc260+Wn5WVWNZXVpP8gpoSDMGUvuH3LgfJHAZ
         t3gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPFtqF17ojEA2/YvbdNWduLjonAdxqOb5mwDVFl4NPTLqNnAMD51AhjyUh8tR+d79JGwxe5TKcI8drlSy/nvU9mMd/LklcN+4Pzik=
X-Gm-Message-State: AOJu0YxuhMWjGM6oKzn3Rn4oM17MZp+sX9/V2cRpsp3UToLDYdDirAdw
	hlQX4edP4ECWOCUGmFLkA0ezYypR25FtjoNCG2Bd+4KRyzFBK7Gl25M9CcTL5Oo=
X-Google-Smtp-Source: 
 AGHT+IGeuGXiCbCJT2fwDI0SEWizUJ9iibgMGqfwV7TaAR+tREdoNJwDLyVfYi67Bn1T1MJNDldUog==
X-Received: by 2002:adf:f804:0:b0:341:ddbc:fcf7 with SMTP id
 s4-20020adff804000000b00341ddbcfcf7mr3806166wrp.1.1711874750824;
        Sun, 31 Mar 2024 01:45:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:05 +0200
Subject: [PATCH v2 18/25] net: 9p: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-18-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJgSqws1ddSI6zt8bZXVN2NyD1CLEpfewZVv
 OwoagjJv6qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYAAKCRDBN2bmhouD
 102lD/wIvu7W4oAOrFSz41pWQt8EAwtItoVXQB9hvcjw/YA+2zX+aydeb02+0qHLAQbGNHBdxfc
 yT1jMBjqC7hm1u0RTSxBcbJJzGs8e2DQ5Vhp70FBMhH5Suzn68J6dOPX6N5wHdff75zMWr9dJyK
 vSMxNyOJ19ThsLo5G/naBdf5gD/wl7GWZ/BynkDrQeahyUwT7EAmobRBH3C58X0PJzx1UeyIaGn
 BD4PrDB3XmtMl2+8fDS+Yga7XtwImkKcCKQmPYaMiOyK8nsvmE0G5mjoqBDyuvj3DbXP5PyEcah
 8siN4HSdpwXj68yE2KgItH1tHOp6PLEId2/8rHBD1Cf8LRqYUpJOSxYFlVCzh0QFv0epWEaRBFY
 t+sVw1BOnmBi6uJ6zpDaomcniLZ7+QMb6J8kX0aGCnE5xhfvD3GSVTn0b4+Zt9glME77oY2Csxv
 27NZ0gLAatWrCnBDi9A/Xe83MKDzfdh5+JqvpcrgsnvNQamvwK41r74/++Ec+O8FElCfF/VXAcc
 ON4Fxjm+sLJHUICUQYzW8QNCnzdVMi6R+G1UPZyqrIbvxfEG1TvL3Sd5Z+A14qs4De367Wz2+XG
 1OHZrEYXkqdpZXUSnF3NgkWODrQkgjG6Fl/9xfwVMVzKxPLTYE5G/yHlgDd6baxF42Rlh2MjRz5
 eR/43u41s6aOCmQ==
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
Message-ID-Hash: HWI66T6FLV2S6WF7VSEP7EFQE5UFRV2J
X-Message-ID-Hash: HWI66T6FLV2S6WF7VSEP7EFQE5UFRV2J
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWI66T6FLV2S6WF7VSEP7EFQE5UFRV2J/>
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
 net/9p/trans_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e305071eb7b8..0b8086f58ad5 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -781,7 +781,6 @@ static struct virtio_driver p9_virtio_drv = {
 	.feature_table  = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name    = KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= p9_virtio_probe,
 	.remove		= p9_virtio_remove,

-- 
2.34.1

