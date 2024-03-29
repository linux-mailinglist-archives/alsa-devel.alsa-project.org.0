Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA1894C14
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72682CF1;
	Tue,  2 Apr 2024 09:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72682CF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041389;
	bh=kNMj+YT8/hRCP1/RW7aCBo3XA153NEDluUwsJT0u81M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PFjcu3A+QNR9ofGp/cwoHefhv/l5XAwaldKQf84WiPae8aXWYOBgUAEUc9XAl3vhE
	 24xpcyARCs7ku7tNrUOP0X/Wy4kFTGlKCXoNI3w2/Vz3CJJDkjiIKk8lE00hJSPcg/
	 tW8xgV0QtLBYcVQCdB+3Y8XCueDD8WcZu8+/Cd4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F8EF80613; Tue,  2 Apr 2024 08:54:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED23F89904;
	Tue,  2 Apr 2024 08:54:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A667F8025F; Fri, 29 Mar 2024 12:46:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EF27F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 12:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EF27F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ipqMQXrg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711712756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+LLP6jd0zeIvxHanQorL3kqCJpFSSxGEDWd7CPARJUA=;
	b=ipqMQXrgdMsGEYu0j2osRY1fuWMLdGgCZe4aPgvsS5bk6utG0ntwpfmtSAISqalJkEKcmO
	ODoh3JoxMvdipSvz8JnT3J6zg3uIGGraKI4u5ItiEuaCYYgl53hsadV79Xl7MzJQZTatep
	BKlyHXq5EkuCxt9NN/NwArCx6bkgRqQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-yQ9V-ZeTPlO4jPXJZXzT-Q-1; Fri, 29 Mar 2024 07:45:55 -0400
X-MC-Unique: yQ9V-ZeTPlO4jPXJZXzT-Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5684bbeb4b9so1118499a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 04:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711712754; x=1712317554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LLP6jd0zeIvxHanQorL3kqCJpFSSxGEDWd7CPARJUA=;
        b=pDiiJBCeBKVZ43bzA/MJ7r/lT33MwDrEHXUj2vvvknyr31p0jHqkJKhfEd8heQWxSw
         fv6ZH8+AFf5mVWaBjXP4sY11GcUO/AFcVxobCyh1v8HaFRPWfcpuLjow8aBxDaFIZ0SF
         BBApKes0iwJCLq7mAJsjYXkaV3q2tN4/fG9sn5YEIcUH7u/YJGBWteRsQt9YeMAraddH
         /XVRe2XxT2L5arkKIBpcp92YGxmzN6vcOP8H+U43SQzfWmIbpjKG9GkdGM0f8wzT1DHf
         Nfm3bdZGALsVZJaRqisqzSZivk9AC41TCSeme3zKVFmOsB0c9ihdQHpOgWLEkdoSU6dC
         UNnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsv9l8Skh8h4W90P/os4w1f/gI6sqpzKCMJm0WFedVVsAsGNB95qP4EYwHGfGipbP/d4zO9AeNjBkbH+AEi2sl43q1ES2CcyuaMVo=
X-Gm-Message-State: AOJu0YwLRBwkLdRjJwA22Z2YVXslLQLRAipv3I8t7rXygN7ir6YR5dNo
	KpiUdOdbyhMwcZegr5pPjIX3wWn2t6QWD2TEHT6R/GrilqPdegiDeeK3CGRElhPeNnOs94A1VFj
	rJ2qwTndZs25QKLR7yFnr9U43O96+jCW9hTPL0j0D9JzrCOVv1nQlNlLizGOl
X-Received: by 2002:a50:9b1b:0:b0:566:4aa9:7143 with SMTP id
 o27-20020a509b1b000000b005664aa97143mr1413893edi.14.1711712753977;
        Fri, 29 Mar 2024 04:45:53 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IHYo6QfJYFEsVSF15QDDFwx8DOxbmiwf/M/DPk0Gc7NLZc79Ft95vFE1vuYwIhBFYvCdq0kyQ==
X-Received: by 2002:a50:9b1b:0:b0:566:4aa9:7143 with SMTP id
 o27-20020a509b1b000000b005664aa97143mr1413848edi.14.1711712753534;
        Fri, 29 Mar 2024 04:45:53 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it.
 [87.12.25.33])
        by smtp.gmail.com with ESMTPSA id
 e12-20020a50d4cc000000b0056bf6287f32sm1991237edj.26.2024.03.29.04.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:45:52 -0700 (PDT)
Date: Fri, 29 Mar 2024 12:45:46 +0100
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
Subject: Re: [PATCH 16/22] net: vmw_vsock: virtio: drop owner assignment
Message-ID: <xhr3nq5n5acn6m7lg7ai2cfaqvlc2a2nihruj54f7um2bjdpaf@tivbri5udlrb>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-16-0feffab77d99@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240327-module-owner-virtio-v1-16-0feffab77d99@linaro.org>
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
Message-ID-Hash: DZ5Y763TITZR6NDF7VV2D3JVLUWF2ZV7
X-Message-ID-Hash: DZ5Y763TITZR6NDF7VV2D3JVLUWF2ZV7
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZ5Y763TITZR6NDF7VV2D3JVLUWF2ZV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 27, 2024 at 01:41:09PM +0100, Krzysztof Kozlowski wrote:
>virtio core already sets the .owner, so driver does not need to.
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>---
>
>Depends on the first patch.
>---
> net/vmw_vsock/virtio_transport.c | 1 -
> 1 file changed, 1 deletion(-)

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Nit: you can use "vsock/virtio: " as prefix for the commit title.

>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 1748268e0694..13f42a62b034 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -858,7 +858,6 @@ static struct virtio_driver virtio_vsock_driver = {
> 	.feature_table = features,
> 	.feature_table_size = ARRAY_SIZE(features),
> 	.driver.name = KBUILD_MODNAME,
>-	.driver.owner = THIS_MODULE,
> 	.id_table = id_table,
> 	.probe = virtio_vsock_probe,
> 	.remove = virtio_vsock_remove,
>
>-- 
>2.34.1
>

