Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43570894C11
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843B72C41;
	Tue,  2 Apr 2024 09:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843B72C41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041339;
	bh=g8OQfrHBwhFx8ET7d7s7wkLQtKO+Fbki+HGAG42ZO84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DsA0v8OdKSfdtJNbLGocPpiieKTxkdOUmtxmtcm5C/cXaIurF5fZ/lybrIIlhCQ5I
	 4jFM3hWk6Skh7g0Z6Z/i/bNQRQ/upqMwJ8kBl+WWbQuqnUhrjm5+pHJiJaGoFcxm1Z
	 vyXWy9sEJkiNCl4YLEyy7QMBGC/uRfKWMLoJ1DlE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DBCEF80601; Tue,  2 Apr 2024 08:53:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95BF6F80841;
	Tue,  2 Apr 2024 08:53:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D9B9F8025F; Fri, 29 Mar 2024 11:58:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB7EF80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 11:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB7EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QbLejqej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711709889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObmCChwbxI4fnx/oMY/3duoto3dJqKFQjwXK6r0ebbk=;
	b=QbLejqejcTXYnpi6v7P/hoStHyYIo+wo9scz/Tc21eZlzdurPz0hDHn0u7VKd+9Qp0eSEF
	m62Hk0k8EnkFDeazd8L6AH5Qina9/+ibheUyOUNdXuW//tJ7croU+Hbw0j3p2AjtmDyqBg
	ad+MedvinPyTUtcIQ53sR+lJuC914dU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-O18duiwVNOK7cl3Mg_59Hg-1; Fri, 29 Mar 2024 06:58:08 -0400
X-MC-Unique: O18duiwVNOK7cl3Mg_59Hg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50e91f9d422so1922989e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 03:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711709886; x=1712314686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObmCChwbxI4fnx/oMY/3duoto3dJqKFQjwXK6r0ebbk=;
        b=JYobA7WTyGmmtJ2B8Vls5N2jK7tf8M64Nol+1/4jk3WPgXgaJje4vhaKpzJUoQ4It5
         IljtT3ymmBpfB+DvFMZdze801RGqR299OTVO8a2dSzsDcrys3xQmAxDQe6FGIbUy11J8
         fZiMnilpMS36bqHiMp/92cDJxUFiwBBZEk1zLqvG3FBJiGj37Emz4ytxKY5GDbKuy4Tv
         QkFhTmOUcjJXsPps/BVBRAEuXF5/4ku6DcMdp2M+44bO25VzXWED02tfoEo/pGudfjeG
         YJOV76oV5Znlh73sFjhJJLZIUd/8YU6bRxeFKNACuwUEgSpgHijLefkgXouNFAoFrzJQ
         zSuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1dylMOjr5A6cjUiQMgipim6qjWtjyU38B4FgchC8XmhV1F6SxUUHbvkgmvi5F2xrLQu8O8Fnx++ZU/nnCkKaYPHpIHXjkvtOsh9Q=
X-Gm-Message-State: AOJu0Yy0yB40dvmEeF6d0/+aG1FAsuO6Tm4OQGPr1Xx891Ole2xMhbhV
	v8RmkEj3zfZjLJDjsCI4Pt2XrMP9YxVApqDkxybCvSxLfMcTYO3irSFsTKDoJKvPl0zIzJAqyFY
	Fr0a12PPE10UH61RMS3haJL/Wvxr19gEdzKmk7g5LwJS+nZiBcaMQxIHIdtLC
X-Received: by 2002:ac2:4197:0:b0:513:d3c0:f66 with SMTP id
 z23-20020ac24197000000b00513d3c00f66mr1298007lfh.51.1711709886783;
        Fri, 29 Mar 2024 03:58:06 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IG29WemiigJFVRUgtZdZmONK+lboYNHffuMAIXm6vtZQPUrBU42pJdYIugnsyliFC3CMebqVw==
X-Received: by 2002:ac2:4197:0:b0:513:d3c0:f66 with SMTP id
 z23-20020ac24197000000b00513d3c00f66mr1297956lfh.51.1711709886231;
        Fri, 29 Mar 2024 03:58:06 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it.
 [87.12.25.33])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a056402194400b0056c4cdc987esm1879596edz.8.2024.03.29.03.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 03:58:05 -0700 (PDT)
Date: Fri, 29 Mar 2024 11:58:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
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
 Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@redhat.com>,
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
Subject: Re: [PATCH 09/22] gpio: virtio: drop owner assignment
Message-ID: <wevexb25pa4cwa73tmmlpqyf527drjyfr56j46ddrglofh2mew@sv5hxdqpiu73>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: 
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-MailFrom: sgarzare@redhat.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: NLX4YPAAE5US3G4MRRPN3NL22RVOCIXX
X-Message-ID-Hash: NLX4YPAAE5US3G4MRRPN3NL22RVOCIXX
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLX4YPAAE5US3G4MRRPN3NL22RVOCIXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 29, 2024 at 11:27:19AM +0100, Bartosz Golaszewski wrote:
>On Wed, Mar 27, 2024 at 1:45 PM Krzysztof Kozlowski
><krzysztof.kozlowski@linaro.org> wrote:
>>
>> virtio core already sets the .owner, so driver does not need to.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Depends on the first patch.
>> ---
>>  drivers/gpio/gpio-virtio.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
>> index fcc5e8c08973..9fae8e396c58 100644
>> --- a/drivers/gpio/gpio-virtio.c
>> +++ b/drivers/gpio/gpio-virtio.c
>> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver = {
>>         .remove                 = virtio_gpio_remove,
>>         .driver                 = {
>>                 .name           = KBUILD_MODNAME,
>> -               .owner          = THIS_MODULE,
>>         },
>>  };
>>  module_virtio_driver(virtio_gpio_driver);
>>
>> --
>> 2.34.1
>>
>
>Applied, thanks!

Did you also applied the first patch of this series?

Without that I'm not sure it's a good idea to apply this patch as also
Krzysztof mentioned after ---.

Thanks,
Stefano

