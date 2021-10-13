Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792042DAC8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E831661;
	Thu, 14 Oct 2021 15:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E831661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634219406;
	bh=b9wappub/Txhanjcw8cUD3UywJVxldl1I/xfcUWILxQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cThcnbhCwsM1rSJ1Ngo98u0yd51uqEOxjicNKYpn6X/VUDiyhHW223nv9cVSInk4H
	 og2D2tmH7RHu81lYpsSBR9gWzqi2DH5F8TZa11kuK+VXYGLkqlgzOkFm/yASr0Ts78
	 f1qtMV//sc3UB+vTle+piMUbds9cYA7ayHBMiJOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D46A8F804FA;
	Thu, 14 Oct 2021 15:47:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0C67F80269; Wed, 13 Oct 2021 13:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63941F800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 13:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63941F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KD+D5y+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634123032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pm2HFBolkPmIutQKtnGVo/TAfScR5edRGy4d25/SdeA=;
 b=KD+D5y+PkswhupKI4VOQaOnKEuL0aMqNbVXb4jdTD/yk8hDkQZlx+7FHmnoJ+lbV37WTzE
 xEQc2FfXE1X0Q4auQ9u3G4Ba2FfjdP8q0Z5E22PxfYNzjaF8ppbeZkvzCaDBUfyJhJGVZH
 yfr9txkvaxa/rd4zUSbTP5m+ZyV9MCw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Uj4WFoOpOl6YIVIQ9y4NfQ-1; Wed, 13 Oct 2021 07:03:51 -0400
X-MC-Unique: Uj4WFoOpOl6YIVIQ9y4NfQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so1660492wrb.14
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 04:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pm2HFBolkPmIutQKtnGVo/TAfScR5edRGy4d25/SdeA=;
 b=ueZHJBYamutTWh1CPCWJhvnyyFJ0lllISZPRzUpxJVK7xfaNYqRVopmxtwk1iKM9uv
 ytkWTyDZ+et8I+6XhHRWfzprYiWxoH85WJfrK0Fo4BAt53C14LyQhnS96wjoj+HP1TnX
 ymkrotNr01NgnP+gxk4FE5rVsxzsWZIELAvpQUe1El0rbFHZ18aOtpFSAzpuzRxqnNma
 bonNIhOrnzWcF2jKoQafz90aUVcTQUaLcm5eqkzQQjhrXp1DYrXVY4qwYawo2TD/g+Po
 I21mvaApo1o7neGGvuVl8NbAhe7j95rtFFeXobNA9pLz/mXUXaYZzIjKMGK+O4iSjfAN
 chuw==
X-Gm-Message-State: AOAM532yrgIC6MgYHnMYNvaJBoTohcPonwG5HahrnAVK+Gs9yuQuyUfZ
 6pwkmEBS7XC1vi0Nbl5cztVhGyWWXEbc5Cnso/NyPGcmKOy7RLn/t+RMrTZ2yS2OD45TAh2RcJ9
 wDtmML+/1JL1NvOMloUKh2GYG1tiYV5jCU7tzT/O2UxTghNT4GPk+fBIc14UPmXmQNkWU3EM=
X-Received: by 2002:adf:a194:: with SMTP id u20mr39899254wru.275.1634123030521; 
 Wed, 13 Oct 2021 04:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypxsxhU5d6LZPZIfUUDegUVRR2UQLEo64TMqEnAh5Ix5FGAFA1VDGCfrTQu99KLNCm64Sq/Q==
X-Received: by 2002:adf:a194:: with SMTP id u20mr39899137wru.275.1634123030054; 
 Wed, 13 Oct 2021 04:03:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6774.dip0.t-ipconnect.de. [91.12.103.116])
 by smtp.gmail.com with ESMTPSA id m4sm5183560wrz.45.2021.10.13.04.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:03:49 -0700 (PDT)
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20211013105226.20225-1-mst@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2060bd96-5884-a1b5-9f29-7fe670dc088d@redhat.com>
Date: Wed, 13 Oct 2021 13:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:47:05 +0200
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 v9fs-developer@lists.sourceforge.net, Stefan Hajnoczi <stefanha@redhat.com>,
 kvm@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, linux-scsi@vger.kernel.org,
 Will Deacon <will@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Gonglei <arei.gonglei@huawei.com>, Kalle Valo <kvalo@codeaurora.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, virtualization@lists.linux-foundation.org,
 Marcel Holtmann <marcel@holtmann.org>, Vivek Goyal <vgoyal@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Eric Van Hensbergen <ericvh@gmail.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Jie Deng <jie.deng@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wang <jasowang@redhat.com>, linux-wireless@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-i2c@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, iommu@lists.linux-foundation.org,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13.10.21 12:55, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   arch/um/drivers/virt-pci.c                 | 2 +-
>   drivers/block/virtio_blk.c                 | 4 ++--
>   drivers/bluetooth/virtio_bt.c              | 2 +-
>   drivers/char/hw_random/virtio-rng.c        | 2 +-
>   drivers/char/virtio_console.c              | 4 ++--
>   drivers/crypto/virtio/virtio_crypto_core.c | 8 ++++----
>   drivers/firmware/arm_scmi/virtio.c         | 2 +-
>   drivers/gpio/gpio-virtio.c                 | 2 +-
>   drivers/gpu/drm/virtio/virtgpu_kms.c       | 2 +-
>   drivers/i2c/busses/i2c-virtio.c            | 2 +-
>   drivers/iommu/virtio-iommu.c               | 2 +-
>   drivers/net/caif/caif_virtio.c             | 2 +-
>   drivers/net/virtio_net.c                   | 4 ++--
>   drivers/net/wireless/mac80211_hwsim.c      | 2 +-
>   drivers/nvdimm/virtio_pmem.c               | 2 +-
>   drivers/rpmsg/virtio_rpmsg_bus.c           | 2 +-
>   drivers/scsi/virtio_scsi.c                 | 2 +-
>   drivers/virtio/virtio.c                    | 5 +++++
>   drivers/virtio/virtio_balloon.c            | 2 +-
>   drivers/virtio/virtio_input.c              | 2 +-
>   drivers/virtio/virtio_mem.c                | 2 +-
>   fs/fuse/virtio_fs.c                        | 4 ++--
>   include/linux/virtio.h                     | 1 +
>   net/9p/trans_virtio.c                      | 2 +-
>   net/vmw_vsock/virtio_transport.c           | 4 ++--
>   sound/virtio/virtio_card.c                 | 4 ++--
>   26 files changed, 39 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
> index c08066633023..22c4d87c9c15 100644
> --- a/arch/um/drivers/virt-pci.c
> +++ b/arch/um/drivers/virt-pci.c
> @@ -616,7 +616,7 @@ static void um_pci_virtio_remove(struct virtio_device *vdev)
>   	int i;
>   
>           /* Stop all virtqueues */
> -        vdev->config->reset(vdev);
> +        virtio_reset_device(vdev);
>           vdev->config->del_vqs(vdev);

Nit: virtio_device_reset()?

Because I see:

int virtio_device_freeze(struct virtio_device *dev);
int virtio_device_restore(struct virtio_device *dev);
void virtio_device_ready(struct virtio_device *dev)

But well, there is:
void virtio_break_device(struct virtio_device *dev);

-- 
Thanks,

David / dhildenb

