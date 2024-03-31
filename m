Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8A894C45
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D14972CAA;
	Tue,  2 Apr 2024 09:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D14972CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041867;
	bh=byDVRILrqLVYqJchwRhJu0lhk/rZQ3LlQcHvAe7XDWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l4/ckId2KoJ4f2IaAKTJX3udanOwIVZkhzx+N2eDB+zl6PWF1Y07z0PTrLCh/ER7c
	 OCsZS4/6BSL+woWibShR1/npBw5P58HMdxbBJB8MBW+kU5cib5Y8n8vDHsJf7h/psW
	 Y0Wxp+8sU2T/7lZUrO1VYkoS/JQTnuYsLb4grVns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E469F89B15; Tue,  2 Apr 2024 08:57:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6555FF89BE7;
	Tue,  2 Apr 2024 08:57:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D380F80236; Sun, 31 Mar 2024 16:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC102F8016E
	for <alsa-devel@alsa-project.org>; Sun, 31 Mar 2024 16:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC102F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JG6HZp4P
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7dacc916452so613223241.0
        for <alsa-devel@alsa-project.org>;
 Sun, 31 Mar 2024 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711896549; x=1712501349;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZrhGWnam5ewIEKvi1J/+KImvnv5s5c+ztrxTkd52KY=;
        b=JG6HZp4PfqGNku/1wj1K4HbgqWjXf50Z1XdbqpmgJZ3ysjH6Y9je9EytOIWpaoN/MB
         AO4lpB/2bbAJkRWYfkYPayTo9WkBlesoR0oHulIJUS4yMQS0+DGfb3zUmKNi1KLVYF0R
         tG49UQ6ngMC6Ws3zJTUwXzlaLVslwolvT2dOU4zZc0MLt0qCHAr6bJTaUr+3KBlgIT24
         lOxF+UYQqhyEJ6tS/SKeHSVxN5BozqHwm9bZAoAUAUrKNB6Kk7hSuc+CBaYi0J9peMyI
         64Uh7oEyV1RADtb2hczOyKQ5JCf16/K8yDCNmVQGOB7PUrwFbVBpSQvj2Vg7rcg7QHT8
         ytxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711896549; x=1712501349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZrhGWnam5ewIEKvi1J/+KImvnv5s5c+ztrxTkd52KY=;
        b=dfH6nyTepCwWOi4NTwwnatWfyWTPgMOud4RGMQ1y3wIrQnoj5nxl/s0QT7NNtl7HjP
         jskAcFVxMS7tc7R2ws8mWvJ4YqjKcz9/pqsQmtT3OQDEoSo710r+VxwiD9LGFTGqOrK/
         DV7++NCWe1PeYE/uOruBUC1LuqVdID1mGQ76+zekGBMBKbYJ0v/D37yHLMwMdqNQSwFs
         lQXM4eFXPi7fz40cvUxEXF7tV9gyzbBKBqheQjsKqoFwujqInEsRfx306hwbikhOyfi8
         hc0Wai/3sG5wKL7CpKAZMUVAfar1tUHknHAx5UPWVxUgKvmegict+r/9xsIFx9d1HEAM
         TX9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9fTRbDdx04YZQTR8Kq49PFrf77wdQjXchrDjCXh9Lw+RIpcHl75IJxJERRBGO69D8ds7eZu29g9/UsXCllaO3/ZZSs/olTgdRuEg=
X-Gm-Message-State: AOJu0Yw35GJBs0n9FyOyO/lOYrY/MS2fvb1nIERBBlvOy6v65v8aR4ci
	SV2a3fAILc4gxj+8oLvqxdMpyxcqd4Jk24mIEQdXJGq2t/lDFe3OKqoJ1jHbEm7GqQF55dRF21y
	VU/XANiZyAhSOwNCdglyPP7EvFoM=
X-Google-Smtp-Source: 
 AGHT+IFvToDn2sP8Wi5+v8cPfIOyxQBhtd8MxUHO86mJJT0esgw5Bcm/X9E3+Vmr6W4QD1kjdvDaweIsXuHn0rSW0s8=
X-Received: by 2002:a05:6122:318a:b0:4d4:1fe2:c398 with SMTP id
 ch10-20020a056122318a00b004d41fe2c398mr4258181vkb.2.1711896549612; Sun, 31
 Mar 2024 07:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
 <20240331-module-owner-virtio-v2-21-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-21-98f04bfaf46a@linaro.org>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Sun, 31 Mar 2024 16:48:57 +0200
Message-ID: 
 <CAM9Jb+jMsVVWufi=E2+rfgHtSsgg+M5CAE0HoqsEVFEOvnNy1Q@mail.gmail.com>
Subject: Re: [PATCH v2 21/25] nvdimm: virtio_pmem: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
	Alexander Graf <graf@amazon.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
	Kalle Valo <kvalo@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux.dev,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	netdev@vger.kernel.org, v9fs@lists.linux.dev, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, Linux NVDIMM <nvdimm@lists.linux.dev>,
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
X-MailFrom: pankaj.gupta.linux@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: DMQB533PY7E7GYJZW7HO6T25N2CEBGLL
X-Message-ID-Hash: DMQB533PY7E7GYJZW7HO6T25N2CEBGLL
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:24 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
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

dmlydGlvIGNvcmUgYWxyZWFkeSBzZXRzIHRoZSAub3duZXIsIHNvIGRyaXZlciBkb2VzIG5vdCBu
ZWVkIHRvLg0KPg0KPiBBY2tlZC1ieTogRGF2ZSBKaWFuZyA8ZGF2ZS5qaWFuZ0BpbnRlbC5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4NClJldmlld2VkLWJ5OiBQYW5rYWogR3VwdGEgPHBhbmthai5ndXB0
YS5saW51eEBnbWFpbC5jb20NCg0KDQotLS0NCj4NCj4gRGVwZW5kcyBvbiB0aGUgZmlyc3QgcGF0
Y2guDQo+IC0tLQ0KPiAgZHJpdmVycy9udmRpbW0vdmlydGlvX3BtZW0uYyB8IDEgLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZk
aW1tL3ZpcnRpb19wbWVtLmMgYi9kcml2ZXJzL252ZGltbS92aXJ0aW9fcG1lbS5jDQo+IGluZGV4
IDRjZWNlZDVjZWZjZi4uYzliOTdhZWFiZjg1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL252ZGlt
bS92aXJ0aW9fcG1lbS5jDQo+ICsrKyBiL2RyaXZlcnMvbnZkaW1tL3ZpcnRpb19wbWVtLmMNCj4g
QEAgLTE1MSw3ICsxNTEsNiBAQCBzdGF0aWMgc3RydWN0IHZpcnRpb19kcml2ZXIgdmlydGlvX3Bt
ZW1fZHJpdmVyID0gew0KPiAgICAgICAgIC5mZWF0dXJlX3RhYmxlICAgICAgICAgID0gZmVhdHVy
ZXMsDQo+ICAgICAgICAgLmZlYXR1cmVfdGFibGVfc2l6ZSAgICAgPSBBUlJBWV9TSVpFKGZlYXR1
cmVzKSwNCj4gICAgICAgICAuZHJpdmVyLm5hbWUgICAgICAgICAgICA9IEtCVUlMRF9NT0ROQU1F
LA0KPiAtICAgICAgIC5kcml2ZXIub3duZXIgICAgICAgICAgID0gVEhJU19NT0RVTEUsDQo+ICAg
ICAgICAgLmlkX3RhYmxlICAgICAgICAgICAgICAgPSBpZF90YWJsZSwNCj4gICAgICAgICAudmFs
aWRhdGUgICAgICAgICAgICAgICA9IHZpcnRpb19wbWVtX3ZhbGlkYXRlLA0KPiAgICAgICAgIC5w
cm9iZSAgICAgICAgICAgICAgICAgID0gdmlydGlvX3BtZW1fcHJvYmUsDQo+DQo+IC0tDQo+IDIu
MzQuMQ0KPg0KPg0K
