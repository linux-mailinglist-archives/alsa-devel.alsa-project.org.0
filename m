Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E42894C17
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345502D07;
	Tue,  2 Apr 2024 09:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345502D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041423;
	bh=leo+Yi4AfSnMVg8mcM4Xju1MFqd5FSUEovb4t8XjI+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A9TOurNGP+Qx9FY6wD0FaMw2U8Z22sZ809x5ZgzHk2O1lMcH1rST9N9TEjuAMOTGN
	 AKoE16zrmEr/0HTDX0uQf/T1upJ2wuvGSY8k83Ew8vQ0ufL2ihL4DqVa1JeJnH2L74
	 yck5y7x1WA3Mtif1JtIDOTgqf0Y9jHQyZK9S+FFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 333E3F80617; Tue,  2 Apr 2024 08:54:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D68F8992F;
	Tue,  2 Apr 2024 08:54:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AB50F8025F; Fri, 29 Mar 2024 13:22:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3B9FF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B9FF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dGZWOr2u
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d6eedf3e99so28317181fa.1
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711714946;
 x=1712319746; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdH2/uZDyLmBSFlZ529ZdmMTMc2xJjXR5We9XRvPLc8=;
        b=dGZWOr2uCDmJ8k6bSOGcJSXsKZGS5F8EUq6GyMkKMuQke/pGj2QfwlPdgZ2B9Bce0T
         q77sg7oNReFzBqWaYuQ8lXb+0ZH5rj7iOPW5sSHIKSk4nfYZjPWwTgDH5xJtMqBA1XlH
         2gFUEBkMSboOAulSJCk2X3vG7a92vgh9vbmoXfUWNqBRHXaHEGoeg2llboVmGsACaV+x
         18TxvSLVQ75UR3DfHYyWXOPuaxYyhqvhraliqLhAfwoc2sXvThwggdYQ091RucylmD9h
         gxq/VBfrlemwwkl0h8us5g0ZJPI7j+gtlbyjbf0/2KOq1sCGRX+QqVmwkZT4pQ4KupuX
         mRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711714946; x=1712319746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdH2/uZDyLmBSFlZ529ZdmMTMc2xJjXR5We9XRvPLc8=;
        b=Mkyms1A294hDTKOZZu9WeSN1JCHh86lz+95rq5CF1w/ro61ionuHcdcV3CcInlwCfc
         AmXsYPF2vtnB/u6HcMFoo87rVVAtCzmZkV4S7+L3PTHldpgP7XzeMYzGvW5WdQgFcwsd
         J4oJiaTq5aakFhwn9PJc2KRCDeeU+fquimA75FTZAPFsjuGAuN/qcVQ6cApDaGsk4QoS
         1O5FY2WnaaVkfctNOQLFWSh5C3nOM0cwHDy8/QS6WpNfoL2b5BsacxISMv0/U5xZrjcP
         HbNe6Bf72e6VqR9Ma60eIAfkgbFax+RCWdp4TqpRCzpgEJ7oe/KJ1dSZccCVTYMVVcGm
         iWBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbCleqbsFHhHSTsgcdO4FZZAWRJaRmLOM0KDYrlP52aak9y/tBfpuDyDJXzxY4cGROeKwHawa2hUpl+/b1iW+zQUFg64X56SVv8zY=
X-Gm-Message-State: AOJu0YyYxNMhSRLR+xeV79maLyfgsNW6x1gm8/5GFIpq4zTy6HVW5+rw
	/R8FjHX4UiTy0A3Wtriq6OMFGTqq57CndUBTFJwKNm3B7xuIgKk5P0m4IDkZEBT1+I/3DQihG4w
	TXfgdJsoUJdx/L2SQz54iFC/pg4HsDNsn5u4DsQ==
X-Google-Smtp-Source: 
 AGHT+IE+HnSCJL2quawa1K1lMrp38Nm79TgJqcEd/z4x+7H7IfVDrdpUOVuBJN0I2Fw0lOyMRLNfqEQZZUdPpNwT2ZM=
X-Received: by 2002:a2e:8350:0:b0:2d3:5480:92aa with SMTP id
 l16-20020a2e8350000000b002d3548092aamr644831ljh.25.1711714946358; Fri, 29 Mar
 2024 05:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com>
 <1303b572-719e-410d-a11a-3f17a5bb3b63@linaro.org>
In-Reply-To: <1303b572-719e-410d-a11a-3f17a5bb3b63@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 13:22:15 +0100
Message-ID: 
 <CAMRc=Mfeez9kXkkVxdmUk5dy=L=rbnYkYujO6jSCT5WAyUw2HA@mail.gmail.com>
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
Message-ID-Hash: TPVTQAOWDVZ4CTEL3P7UCSF5NHBDCMCN
X-Message-ID-Hash: TPVTQAOWDVZ4CTEL3P7UCSF5NHBDCMCN
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPVTQAOWDVZ4CTEL3P7UCSF5NHBDCMCN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 29, 2024 at 12:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/03/2024 11:27, Bartosz Golaszewski wrote:
> > On Wed, Mar 27, 2024 at 1:45=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> virtio core already sets the .owner, so driver does not need to.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Depends on the first patch.
> >> ---
> >>  drivers/gpio/gpio-virtio.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> >> index fcc5e8c08973..9fae8e396c58 100644
> >> --- a/drivers/gpio/gpio-virtio.c
> >> +++ b/drivers/gpio/gpio-virtio.c
> >> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver =3D=
 {
> >>         .remove                 =3D virtio_gpio_remove,
> >>         .driver                 =3D {
> >>                 .name           =3D KBUILD_MODNAME,
> >> -               .owner          =3D THIS_MODULE,
> >>         },
> >>  };
> >>  module_virtio_driver(virtio_gpio_driver);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Applied, thanks!
>
> I expressed dependency in two places: cover letter and this patch.
> Please drop it, because without dependency this won't work. Patch could
> go with the dependency and with your ack or next cycle.
>
> Best regards,
> Krzysztof
>

Dropped, and:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
