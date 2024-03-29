Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B75A894C19
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F98E2C2C;
	Tue,  2 Apr 2024 09:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F98E2C2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041453;
	bh=zlmV0sBDPPllGZWjPqa2/c1/r7nXDK5/rzJZO9Fvals=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o0XNinldSS88Ew4Vy9qtcbGhE5RT8+/Z4B2GglvrXAjHBsf5FUg5jHe7J0WCciR4K
	 9oxq4ytYSNvDz9TST9xxcfEEA1TSz2UHCJn8Xx0iiOho4pTSxRPkg/JSPXMHSra2z1
	 ic3i6EjEokmQub6R4+l/EOTX7jYCXcbocwl2z7Wo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15EB3F89946; Tue,  2 Apr 2024 08:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D511F89951;
	Tue,  2 Apr 2024 08:54:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B536EF8025F; Fri, 29 Mar 2024 14:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0B38F801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 14:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B38F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CAX6OoVD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711718919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9b2+syugljaMrrOP++3j3QqL3+aM8ytb7iOaLk3Q4wQ=;
	b=CAX6OoVDVnn52AkgtNnO3Pc2KcUioajNI90CLWKUrPSq4ltweMNUzvIELD8senVcJ0GUbF
	N0NgMJrwzTSm+/4p5AoQcnc4xptC4GKZOcFGmutNKXHp2YLmT5iOWKr+QuJnhECCY4WBiE
	yWeh1JnPEuYKzpzT5i9TCnhPmhKn+5c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-QIqV8Y6_Mn2MrXOnnGTuug-1; Fri, 29 Mar 2024 09:28:36 -0400
X-MC-Unique: QIqV8Y6_Mn2MrXOnnGTuug-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33ed44cb765so1145156f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711718915; x=1712323715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b2+syugljaMrrOP++3j3QqL3+aM8ytb7iOaLk3Q4wQ=;
        b=W3g0vf/oVCdjpFqvdd29UgYW1aSgGDQAs5qgHSdJfRAn83J0/ytUW1+2SNCRoVj0IC
         F7F3CcvoHw384YZnO7Wx7OIX2jvw8JLfsI0JMmn43ukmXvUdDR4xsLYoE8hTmgqWr7yI
         FcM5hitX6oy5uGYnYJkwqnvkzSKsMd8yiTA4knuUffdDkef/NwbiREcTrM2ckb5sqRMr
         JZtmjAecUwDcc5WLxyS6/Aij7V1yl23xdfSC1cEgVrCcW1+DFbMgts6O+O1AjRG9NhSJ
         GBonjFFdJCQmpREB0cCPT7T0OXNfR5dMdW9brVaWX9scvOo7xfK+UrYVpleIE19+vSaM
         3LKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVszXCFndGHKvXOvRbgcf+LFvOdi4MasOz3W2dW6dyiQsnteSU3fW9PBYbyXPIS/rwILCRxfh7khSQyIqkb+72TBvf8zBLgl189b1U=
X-Gm-Message-State: AOJu0Ywhlcj21OB03UNkSNuTGi571ejeKnLC5nMNU/UtMUiFczecFoUZ
	zGc1FvX+1AjwNNk2QTGTDFkDmo2D1w6aMKLZK9qpTIBmzc4WkxC9IwPliHpdHwCW2WPFFoXnPj6
	SkG8Xa2NIyTeoxJyZ4ERWG0UnBIyqUx4w9/Gt/asXEAhlp4m9gnwg41GlcSbt
X-Received: by 2002:a05:6000:258:b0:343:3e54:6208 with SMTP id
 m24-20020a056000025800b003433e546208mr405090wrz.55.1711718915576;
        Fri, 29 Mar 2024 06:28:35 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IG0y693U6Mrafzyu7YFm6f17FVsvRLIAvGL111PeLg9URymVxfxN4rrw7+XNw571qiaGR1ycw==
X-Received: by 2002:a05:6000:258:b0:343:3e54:6208 with SMTP id
 m24-20020a056000025800b003433e546208mr405040wrz.55.1711718915211;
        Fri, 29 Mar 2024 06:28:35 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it.
 [87.12.25.33])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a056000194b00b00341c6b53358sm4171063wry.66.2024.03.29.06.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 06:28:34 -0700 (PDT)
Date: Fri, 29 Mar 2024 14:28:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
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
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
 Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
	Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 linux-bluetooth@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org,
	v9fs@lists.linux.dev, kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/22] virtio: store owner from modules with
 register_virtio_driver()
Message-ID: <e2xy5kjdctpitcrev2byqc5gcwntvsd6pfutrvp3l2kfe3llgs@l2xp5opj7xu2>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
 <oaoiehcpkjs3wrhc22pwx676pompxml2z5dcq32a6fvsyntonw@hnohrbbp6wpm>
 <d01cc73e-a365-4ce8-a25f-780ea45bc581@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d01cc73e-a365-4ce8-a25f-780ea45bc581@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-MailFrom: sgarzare@redhat.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: KQ2BP4HJPU3DDZ36HPSPMHYWVLHTYHKM
X-Message-ID-Hash: KQ2BP4HJPU3DDZ36HPSPMHYWVLHTYHKM
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQ2BP4HJPU3DDZ36HPSPMHYWVLHTYHKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 29, 2024 at 01:07:31PM +0100, Krzysztof Kozlowski wrote:
>On 29/03/2024 12:42, Stefano Garzarella wrote:
>>> };
>>>
>>> -int register_virtio_driver(struct virtio_driver *driver)
>>> +int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
>>> {
>>> 	/* Catch this early. */
>>> 	BUG_ON(driver->feature_table_size && !driver->feature_table);
>>> 	driver->driver.bus = &virtio_bus;
>>> +	driver->driver.owner = owner;
>>> +
>>
>> `.driver.name =  KBUILD_MODNAME` also seems very common, should we put
>> that in the macro as well?
>
>This is a bit different thing. Every driver is expected to set owner to
>itself (THIS_MODULE), but is every driver name KBUILD_MODNAME?

Nope, IIUC we have 2 exceptions:
- drivers/firmware/arm_scmi/virtio.c
- arch/um/drivers/virt-pci.c

>Remember that this overrides whatever driver actually put there.

They can call __register_virtio_driver() where we can add the `name`
parameter. That said, I don't have a strong opinion, we can leave it
as it is.

Thanks,
Stefano

