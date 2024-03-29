Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D859894C0F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A2832CCB;
	Tue,  2 Apr 2024 09:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A2832CCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041323;
	bh=n8h0843dN8D5vA/PkugrZHKUYOVTJ3ipk22+mvTL/rQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sR/cKf8xfkFpu3RUMdxzaLrpw/iKaifcbMnfgRm8Wpvuh9Z5vJWBJZ3HXtHboLYZQ
	 dfXvYen0cv5HldBLyxz6giqUgmdqoDLGud4LC5v6IiunFYYWCdjnfkkhQscPMPsQyA
	 JsWgFWPW1GrLwOk05iOxPiFhtKU9rP160Hwm7ivM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D42F805F1; Tue,  2 Apr 2024 08:53:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BBBEF898A8;
	Tue,  2 Apr 2024 08:53:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A9DEF8025F; Fri, 29 Mar 2024 11:27:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79B98F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 11:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B98F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=iTeBQrep
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-513d212f818so1993682e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711708050;
 x=1712312850; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPUqPHiAYDsvF7c6mpbUarOnTLvyyWG07eUiOIJt2gQ=;
        b=iTeBQrepsbMDE0xCMN4Iowo2mB5XVhgngkPZujupeN6c1+YLKwWjBxXijQWu/UvyBO
         ZWMwRBkFwuznS4dg/OfjAT+zVsnBAPsIc61A8N1zWtiQ5YwEgwC/5CF5eqEmlM9jShmb
         kQf4G/64L/+5o5N/y0o4M5uogH9XOVNSSP/cgRyGjySNjX/FSryxoPDfiYBJgCRU1g7M
         cYasm9/GbLy9NbzRI1hrIa+Wsk5JFgvhDEtvKrpo8Jm43UTRINPfIobzQpL8YB+mQCx2
         5EvzxF+vhnBhxhenU3+XgrCe5H8kBCiVS/TuQavYlinRxk9FJdeXSsVtyp8UzpoX67HN
         uaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711708050; x=1712312850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPUqPHiAYDsvF7c6mpbUarOnTLvyyWG07eUiOIJt2gQ=;
        b=DkbZNoWkdF3kWtYhYu/v/+XJcxGBzWxKTpOv5qO2nn0fqDRLCWJOzSjtNsqPTaV3ug
         7kT4I4PC4rHt7TucKvB2xmRuRSVW3aEx9i/K3PXbYg7o+Mo7vSZ0OqLl+31W9EyvNZcQ
         b3sWncvAJ3lgA/NYynUw5VWKDguoyXr/1Sgiz5hL0A6HGuLPnaSrN+6hnBaMKHjs4iS3
         Xnr5p9Db0ek9FY7YvBFOoWXk9khFA6DuC1S6x8DZ04NMl73/qO7aC6sdzHXSNtjOwY3E
         f4RYT/1mCBHCM0J45LMxw+Izl9hvTsRYjnZeOwqGWjg4HQCQ3TKetnoCGfh8zR5H5SWD
         s1jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXKYU372Bp2jKDV/sAsh7lGHcTO410ojG/5/O05/5fKq64fk2XAmiNgDHRrIGTU+ArNRKPVilK93KH0zuB0M3/Ll9WoIdvptud9n4=
X-Gm-Message-State: AOJu0YxKXOQryR4cmojQXZE6YbJh4QjaWa9PAE6o0iSfcJS4tv3wHR0u
	WfiQmxn2jfY2Iu50OmYp/zelxwJTOb3H1eP3UqQA+0NFyrBTzPyz3is5ORonQOX9f6ZBK5FreV5
	GFPvUsmWzaUOJ+IZw8mxTLVIzLLAQofhcODQwMw==
X-Google-Smtp-Source: 
 AGHT+IGkJetMoIDH9w2TQurNFFXLK7XsHfl+lPbtCC+0MeMFYTkyF7Alb8el7pzIkiwo9JvBX9h3ULKBGoxrg4XKpUU=
X-Received: by 2002:a05:6512:33ce:b0:513:af27:df1c with SMTP id
 d14-20020a05651233ce00b00513af27df1cmr1559870lfg.11.1711708050041; Fri, 29
 Mar 2024 03:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 11:27:19 +0100
Message-ID: 
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpio: virtio: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
 Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	netdev@vger.kernel.org, v9fs@lists.linux.dev, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: FJUIF3D6FJILKYOJHJPOGKSE6NUGM5YJ
X-Message-ID-Hash: FJUIF3D6FJILKYOJHJPOGKSE6NUGM5YJ
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJUIF3D6FJILKYOJHJPOGKSE6NUGM5YJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 27, 2024 at 1:45=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> virtio core already sets the .owner, so driver does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Depends on the first patch.
> ---
>  drivers/gpio/gpio-virtio.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index fcc5e8c08973..9fae8e396c58 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver =3D {
>         .remove                 =3D virtio_gpio_remove,
>         .driver                 =3D {
>                 .name           =3D KBUILD_MODNAME,
> -               .owner          =3D THIS_MODULE,
>         },
>  };
>  module_virtio_driver(virtio_gpio_driver);
>
> --
> 2.34.1
>

Applied, thanks!

Bart
