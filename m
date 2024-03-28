Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E9894C06
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892692C3F;
	Tue,  2 Apr 2024 09:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892692C3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041252;
	bh=sBPTJcGEYTbv3hcgUwqNauzYtskOKb+GWpnb7br0MOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nhZEgIJXvWviHE1vYRveBrfS3wZMKKw7m0ZTJRDcgd/N2l6rN7Bapr7qdZVNgPLTn
	 J7LYH+Hwzbv4y5bILuzo4LFQ7/DLXH/D31WfQx6AwP2nIAPlWXbQTdZqmvFIYxuv8u
	 el0wJ9WOAlFQ8HOy036mrTnzWAUnzI2O1k3eY16o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 197CBF89863; Tue,  2 Apr 2024 08:52:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E7EF89874;
	Tue,  2 Apr 2024 08:52:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD84CF8025F; Thu, 28 Mar 2024 06:16:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4ABBF80074
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 06:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4ABBF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T36FM+QY
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5a53d5aaaa4so284755eaf.2
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 22:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711602994; x=1712207794;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCBBqATkrmhAqNvcc7V5yUc6Bj0MDD2J9Hd2vuTQUac=;
        b=T36FM+QYhEeg5R9e5oYe3nEhJxd/HPZO5XqQivHQjCRbG3Et3Wm7ysUys+ajTEAeJR
         GpDZ+SUK+1BKKaJ2KfJLg4Vs3EVdpoahuRE8D+BBBjMlhfhiKp8E0x5Smm84bBQdmS0R
         0P0/RjD+riBkt+IBjYRDCslrjWuVuB4m8rOSJshqVclf4/FaWDLDzG5hh8Wc8hs/+Hbk
         VCsWRlb3gNhhOn54okUCx/4AekSvyPMAbrdKEVVJiMw7Kq/3MlqJBb/g5H9gI3/WquvV
         noIL/cTJ5Az1Fa4gSrLyemfFwJuOMJKUyObem0/dSo1Tt/6a9YyVamPTxBpOylhfHxrW
         awWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711602994; x=1712207794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCBBqATkrmhAqNvcc7V5yUc6Bj0MDD2J9Hd2vuTQUac=;
        b=YlmgBqaDSE8ENopoPTehJEgnGliYTPhC/p9UOnnKr/so4ke+rc3r95bEOttVsqO01e
         SGoQpZGP7JCcsLkfcdqDpclxNX2AthuMnPj3EWYNAglB5HcG2sr1riPokPPc4G7F75IR
         HgnDO1tPnFPqCJsgRyLAKrVRljHWl21WMO0QPly2geTKRuMR3aoqqVefoYvGHoOGrube
         CDnUcNSbruVTtoNDZ2BV5DLNMx7MK1OQgDmZy3lwM24aQLK3B3WSfZ1L29dDVSTt5Blq
         LmfUuUHYJMTWX6F5IcboHo/3tB+liIMFxfcjYJkMYvGTJVTCSjvk7TQ38t33KKr9YvNo
         WW1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMphWitvGe4KUG3kinlAKe7J0M0fXS64NIBI8ITi2vd4yBb4W3gxmX+dHlmqO1tlKivCQasptv7qb8s6PWIWYezfQIZUWkZNlk+WE=
X-Gm-Message-State: AOJu0YzDTWN04GPvMlAdPjYg5oXe4VzrvK4qNT+YCjZ84PBbG0ykc26S
	a+ysq5cH0fIH4tH/2sN0KxwxnYslRZY8PsSoOM242QYFfSGftCE+jdJ3g+ci0Us=
X-Google-Smtp-Source: 
 AGHT+IENjWm30W77Sho1F7STKjVDKRSghd/5qoLRwkalJNx2D7PN+W1+MnXgZZvq+TiwN/1tI/fojA==
X-Received: by 2002:a05:6358:5307:b0:17e:8f90:dd31 with SMTP id
 n7-20020a056358530700b0017e8f90dd31mr1555244rwf.32.1711602994298;
        Wed, 27 Mar 2024 22:16:34 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id
 u23-20020a63df17000000b005e857bba96csm433309pgg.10.2024.03.27.22.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 22:16:33 -0700 (PDT)
Date: Thu, 28 Mar 2024 10:46:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
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
	"David S. Miller" <davem@davemloft.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
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
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 09/22] gpio: virtio: drop owner assignment
Message-ID: <20240328051631.c5eitp4mzaj4bh6i@vireshk-i7>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
X-MailFrom: viresh.kumar@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: OCMXWR3RVSZZ4OHNV6UYOPV6BC32754E
X-Message-ID-Hash: OCMXWR3RVSZZ4OHNV6UYOPV6BC32754E
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:50:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCMXWR3RVSZZ4OHNV6UYOPV6BC32754E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27-03-24, 13:41, Krzysztof Kozlowski wrote:
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
> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver = {
>  	.remove			= virtio_gpio_remove,
>  	.driver			= {
>  		.name		= KBUILD_MODNAME,
> -		.owner		= THIS_MODULE,
>  	},
>  };
>  module_virtio_driver(virtio_gpio_driver);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
