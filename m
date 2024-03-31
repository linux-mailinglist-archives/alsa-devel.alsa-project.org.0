Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74621894C36
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C3E2CA7;
	Tue,  2 Apr 2024 09:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C3E2CA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041774;
	bh=rkTpT83OyeYcLFTcFWPlfq1EO9ueUCyja/WSxZqw7hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8FoLVjCG4uR4PdoKatl4OqYtAcmnGukZ6jTBBLckL6m9m5LY5QdXJ8PFNafrNngw
	 yKE+OsD0Ea/osrvH6AwlIPxmVGhXQTnM8D+Y1yiIKKeB+0E6oaFsDM4G9IM5xbRcUK
	 nH+5iLMfgO07xgslJtDzNnIYlPMXs7eRkkSXQTBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BB76F89AAB; Tue,  2 Apr 2024 08:57:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B07FF89AA4;
	Tue,  2 Apr 2024 08:57:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1F6EF80238; Sun, 31 Mar 2024 10:45:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7E8BF801D5
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 10:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E8BF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K9Dg67xK
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-341cf28dff6so2475476f8f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874737; x=1712479537;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpODOh8SpqDydjsGmjw6Via7WFpVB11YsZ1xvZ5Vpsw=;
        b=K9Dg67xKTvxQeX15XsplbRguSdxwusMYUK0h6DlQKMFZnHVucvDf6qA/Ubn71dn+Vj
         efr9bNqT1xEcoDvKPM1Ma2ayZs4j8/mXabjtZi8FmH7XoOzsRaC4/9YGVu5/OukUOsgu
         QaKZ7wWupWQyIui8NERBJeTxCQsLwTnG4mfE+wnLPyBqDtYLPiH7ulvkZv3KV7SH0tmw
         w2Ai7dnEcn+E3dFRZv+YvA0n8w0lnB/fpsW+jh8uV1razT8+WXIZ/TYXhsMnG8pe8wRJ
         jaGNawneBoRPdflJz+dwyQ4a6usj9ErH41L1GWJALms+2L4FaA/uDw74YrJ1QwaXjzAx
         7LGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874737; x=1712479537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpODOh8SpqDydjsGmjw6Via7WFpVB11YsZ1xvZ5Vpsw=;
        b=UuwjPx8ZCPb8nRHJf/tPPFS8BdVaL+gC671v5ToqsvcvXR4TMHGH8RnuWVKAcmCihp
         39gg2GtwBM44UwqKHZaD4seZLcuk4pz3XmIGsTuWOh3dfpLDQj5XXrIduyAfBnNbXXxB
         qL2X05laWo5lH2IjllT1xPmOl7/5JhTlrKwzJwQyzX8JVFp1SXnMb4p/ldJ6Nw0CKuGy
         Z/BFuE6aTOuYLhcl1mRVWSYCMyN1R+XLrSzv45Buqeq/9W5xsPWdP/wrXt0jV9kFl7xi
         2tIZ2uVHyr8Bvc8y65wip83hXqMVCU64DxMtni6SFHR7AGwIXWwpFO1bCbXTQBstCLmY
         1gJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1LRkSQriImqnHuXsEL/w0ueU56lflYnxksgzZT/pfgchopy2vClp17sDoEWWJ60QU0btuIu+45hkrD3B16LaMmWn8ue9LVK6KSUs=
X-Gm-Message-State: AOJu0YxiHJP/zmxyYHKz3ospF0uE7vkVMMtbdWXp4XBeLqSVASx7Cxv+
	jt/1rgrLaFVdoOBcEdvLerQMCsJI/iMbM57ecAxSAZQBOXnyoQrjiA+6Tg2XtPA=
X-Google-Smtp-Source: 
 AGHT+IFhMJyghUycTdACT9icbSfKwd5VYS5+lHR7GEHa8HFyFfxUN9leod9pf+Cfrh2o34+h8a1zxA==
X-Received: by 2002:a05:6000:120a:b0:33d:4966:fa8f with SMTP id
 e10-20020a056000120a00b0033d4966fa8fmr3764747wrx.46.1711874737155;
        Sun, 31 Mar 2024 01:45:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:02 +0200
Subject: [PATCH v2 15/25] misc: nsm: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-15-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rkTpT83OyeYcLFTcFWPlfq1EO9ueUCyja/WSxZqw7hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJdqEGjps1UnoPgvmyvw1qk/es9sAOvFP6i7
 rDkSj/3F6mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiXQAKCRDBN2bmhouD
 1zh1D/9K9JiZ97FbRH997WXYeCIcOLie8y2bqS/tD2tujwmKzpHYmuBcAuNOI+xUFCEA8dY9ZXw
 Xxv/alBFKHlBE+G5EjNOODjB6vPUte/sSc53V4DB1/khRKZXwLX2GCksWhBKxe2Bo8hWQ1uWPrx
 zZqhsapmUGDnwRrG4U2DvNOQFc2WP9MoXnHRI9Vn4WXcJ8NjXlmBLoh2SmH/y7Xnn83iAsY4Bd9
 FJtqV6C94yGjdfn3mNcEd1nkXz6GM4cB59sJjLC5LMrCICh6donIiz5rbH2jmwPPMzFCx89FCBo
 QFtEU7uXE190p/t1P+2MImFzqbzp9AXhclMuU+9H6MHRDTBZ6F5AKb2xCpjNUJ9FYvCT+Oc0/l1
 yR7kmKwZOYE/Z6N8tohI7QT0GuBxqh9+yh+qsD9MpuHsNSwE2xLFJ29VpEUUcUMXBNYKADSdJbL
 CF9FasVoxOWKghUj0Si8FZ55UJ92wVI8P4ZTNOUWZ7Rzgyz2txMbsfAslxSkDxEyv+cKDMAYb/X
 lkeTdl48V+76z4vY3NM3ADVZGkCRhNpnE1/Dylblp2mvOMZGCGh5Qbn6aKYIPbaP8ovLWpLt2ey
 zWfa1CVWWaXBOT46qGPDtdbm9Wc+IsLSUv46B0GgwCXox+drd7wsQkIOppqY7gTC0Chte/FjF7J
 4fZvDPp1PJKyCmw==
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
Message-ID-Hash: PDA6GCU36Z7ISRSVD7DVXE3KCUXZLB4F
X-Message-ID-Hash: PDA6GCU36Z7ISRSVD7DVXE3KCUXZLB4F
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:53:58 +0000
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

