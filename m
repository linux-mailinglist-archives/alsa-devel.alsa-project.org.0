Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC53894BF6
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9808C2C20;
	Tue,  2 Apr 2024 08:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9808C2C20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041084;
	bh=+b7HD7blN2XR0vp569P7KUgZ+rP9RZRo3/7Ljc6RdPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W8expUaBjdTJigA2F4eYE0Whgnj8QSu6/U9bECD5uQVeyR5bBdJLQPzW3A0Ei22Kr
	 b9BSvvxTrbkRsBCfCS1gJCFLtenC+cQC3uqnLSQ15MFsRanYZvujfavYGZesPJH1Ej
	 1OuV6r2YurbOrwGTKczleNRxlJ3/pGAC9kJqtsqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5B2CF80815; Tue,  2 Apr 2024 08:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 500E5F897A7;
	Tue,  2 Apr 2024 08:51:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C1F7F802DB; Wed, 27 Mar 2024 13:46:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FC2BF801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC2BF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PtkaDhoR
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4e0e3ef357so13432966b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543600; x=1712148400;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TImcoBJxfXGIQgqj3n4MKEXII2pXosMotms9pHsJzXs=;
        b=PtkaDhoREDwA8gAyVDXwzGOvtmm50Q08tyZMWZAJoHPflecEOMdT3FcPCVeBF7SFHZ
         Ql+YuRzAlrt+opybARd6eh3k6PWEh4fhxi8+c259rNrulRG6FvCLrdIqITN8Tmyy3RYe
         FDiPoumetA5E52o+JIKnJEDYqG0k/zJJgGPUkGn0u6qfSCokDMvUSLSH8nnfy/S9sSP5
         yxPuDDZSABOYzRxp/V8B1GuXtqSlUxewdKp4wVe8ChjemLUB0LrM87OjQCDKHB+0vUnf
         /Uv0V98HjgbzBMwNASEm4znoabaCBLP1Z5hm/AqsMOY4zEqyaWhRR9bnZGMFHx/TYonL
         AfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543600; x=1712148400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TImcoBJxfXGIQgqj3n4MKEXII2pXosMotms9pHsJzXs=;
        b=dHdXi/T+CnYT4iTk4sEiYbTIMMvjaP6RsFvdpEyvFZIUhekR1hPWDe79c3cskemMfr
         ey3b1jbOJ4NF4S4/JbS/0TlUkCM2nmSbYIh5UdHu0fxSpWZwm2IuTm1blj52GzIjQPF1
         PtePNfTFweXeaY51DPc+/BQidg595J+wUfBhGqHdjwZ19qwyIyMdcjO6c1HOYVZkd+Sy
         1WNBoplxHP1sqGG7ReZlrPURj56COEMdHJXATIBpQ20OriJ2zKzI3x4lxjjn10eDIRpT
         45IZCLw2liEvP61b9Gb+oIEolB0u2aHAU2Wl5TjXf0OSESKdhjYpQ/zM61mCgdzZYsVb
         /8ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCURcpl3CkBOk8Heozvgl6VwLxIEPEbUX3tENJACLSk16SCifFdphBciJ95Sa1wvxXRyO9R4vBWBGrqq6KDfc2FrU1m8k+Ezhr4uoZ4=
X-Gm-Message-State: AOJu0YyiOrMsm9fFPwdrImm7ALZdZrKArfMWlvkPtNXgk2WiX9XPgmrC
	vhWiqw47enTyGXh6sgbrZsgj0bC/Und/5OSTmAKaTWeyNFUx+1UNctwfdZTNTEI=
X-Google-Smtp-Source: 
 AGHT+IHz3XNCa9vYxVdXv7C592UPDYjRtJdl/QW4qXpaVGK+f9EGoToWDlCo1tr4K4SuiD6SS2oOpw==
X-Received: by 2002:a17:906:5847:b0:a47:1b77:7c4 with SMTP id
 h7-20020a170906584700b00a471b7707c4mr907960ejs.48.1711543599897;
        Wed, 27 Mar 2024 05:46:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:12 +0100
Subject: [PATCH 19/22] rpmsg: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-19-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+b7HD7blN2XR0vp569P7KUgZ+rP9RZRo3/7Ljc6RdPk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPqAdq/eg/PtMCEKo1gva2x7VgdnMT6C6Tep
 2wGqe9FMdyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT6gAKCRDBN2bmhouD
 1/TJD/4qOl/HewPvOEL3qGcOWPCkSVABYFtSCCfDob4NTUwAYOsNZXbH02ywzlUMcBk5kU1U06e
 AkckuKvzdO/5ojXTRYDkDVHSyZ/6w/2Zete946WspuC9senP7Ez3D3YkNyAxCE+Sk2DVkmiCf2E
 CyINMhaAkygs+ceOFDbHwFTbo7vJVRYCTGaGRm542+GjfTkvYuWVg4xeDHg1ogRagShb3QsonMJ
 iM7hJlEEdxsNQj/ThY3v2hfTnTAx2YlEu+KeqadqilMq04KLM5rus3fTej4xY0P3Ne5G0IffMH1
 EveHiww1oViKjbvjP1s8KwwzV/hlVXkuLkEpSakHpjgTxlrBqrMB2RUdWwPDNaH/T6cC0lQxSHn
 PbZ7RdLNVmu6v4LPR9S1ncpMO//afg+3LNsPd20FwxOaCv3IEiUwKRbUqxkbjuSQH4iwKR6llkU
 IGcF4f5x4/q+EXK6r0Foa98dU3i91q5S1y0X+Fsyceaza2rKKZSTaxY46atCOCfkKWuYH+5+Uju
 5UESG7t+HFinMBkI1h6Qjkyrz93J+YOK5IKd6DQYtK0YownJLLGBpupYua5HeUemtn1gA/b+4ci
 nrfmHTqXJfXn1sKxAPG+3hj2jFzFA2Ibj7vzIzNYNdcpR33XtvVIbUpTu2kE3HPXhlMaJh18Nxt
 9eoqc6/7NrkIp+w==
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
Message-ID-Hash: QPZLUL67DEZLIAROIURJYAXVHUON7JOR
X-Message-ID-Hash: QPZLUL67DEZLIAROIURJYAXVHUON7JOR
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:49:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1062939c3264..e9e8c1f7829f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1053,7 +1053,6 @@ static struct virtio_driver virtio_ipc_driver = {
 	.feature_table	= features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name	= KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= rpmsg_probe,
 	.remove		= rpmsg_remove,

-- 
2.34.1

