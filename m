Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8FA42DAD9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82A5E168A;
	Thu, 14 Oct 2021 15:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82A5E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634219538;
	bh=6quDtpoUMb9edEveJ/0zvmdZfmotsWRXWHfFuDGgrPY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5cFQbVThfLSCy2kJ5EbP6646ovPUmoylP+BhRUpTxkN7l6JJxNuUvVad6lz76lwu
	 TnAUn280ayjPETxHJ/DUwBiYcH0WAgflnagRCFQaQStS976COZ5ozveO9Cjqe0nQ1h
	 3NRIV15YCt16oEw5/+RXuQmvX8qFejI3HsYT32eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E501F8052E;
	Thu, 14 Oct 2021 15:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB58F80269; Wed, 13 Oct 2021 18:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7BFFF800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 18:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7BFFF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hKHxbn94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634140811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCm5dOclxo0psHU4qKEkJZZeOXU3321uNZD2ahb33xs=;
 b=hKHxbn94bnUOkhCnB+rapZ4Rxxj1eKgoK5qmGoMNJgNIGHdlvzuL5CR1LQaNtsTyZb2ooH
 SH1tSYxmJ8GG9iebjhlAfdKXklJVN8M5ng4d5+FjktUaptNpYtdJDs02S+ESH2lWPO3jmW
 DoxkRAi1Dou1cB8UlPpImyD2LkDCjWI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-ORFvHjBCPcKwcK7vvp6DBw-1; Wed, 13 Oct 2021 12:00:06 -0400
X-MC-Unique: ORFvHjBCPcKwcK7vvp6DBw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so2361881wri.11
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 09:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QCm5dOclxo0psHU4qKEkJZZeOXU3321uNZD2ahb33xs=;
 b=MNRkLZStl+jEBIK3DU/3RMgTUfGAgeObSZKRil5hfNafRoSTgIOrOU3Z+kqBvKx1VC
 6JDyhQRtJytBIpGsaeXnD+G9SFAGWMSAAXoyJ6sJhbYdYoken+DyeMwFxPxGz4TT7DpS
 9ChvI/+FvKUfZVTIfGSPXmtxr01YbRKdu/AsMRbIjsYmExTVxgqhDCYAyqih80I4MlS7
 goo3dlbVOucfRFep6LM4L8HgK6PBZq0VeazeUzMQKXC9lHBRHvpTk9h4Ok0wLtsEn+Z/
 0Ob7uJ3/eYVNBvVuTszWzYMWAVrnEnwb55axS/yZUfF+skq0BVZqgAowUdINbRWIypuY
 SwAQ==
X-Gm-Message-State: AOAM5330Rc7E8vX4KiaLnb04UZcVcUqw5nX5aOD2So11gdpwsg0IEVbl
 urrDt8PPnSGm8McpTShrgHq+cRq9ANoftdPrH3N/XOS9n0eaLQ7XoupntcYPM5T1PgwbqSOTfto
 BlSSnNdVJ+XkckI6hxl35Cg0=
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr9653wri.158.1634140805530;
 Wed, 13 Oct 2021 09:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyItkbAA3kGIqmmHgTgrrpf9fCG54WlJV2+wdefB9WU28Q546eZydpGXWHl2Ou3h6lUqYc/hA==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr9603wri.158.1634140805309;
 Wed, 13 Oct 2021 09:00:05 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6774.dip0.t-ipconnect.de. [91.12.103.116])
 by smtp.gmail.com with ESMTPSA id n17sm6521wrq.11.2021.10.13.09.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:00:04 -0700 (PDT)
Message-ID: <cf511a7f-531f-4555-d7b4-cb171a615fdd@redhat.com>
Date: Wed, 13 Oct 2021 18:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211013105226.20225-1-mst@redhat.com>
 <2060bd96-5884-a1b5-9f29-7fe670dc088d@redhat.com>
 <20211013081632-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211013081632-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:47:05 +0200
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 v9fs-developer@lists.sourceforge.net, Stefan Hajnoczi <stefanha@redhat.com>,
 kvm@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <vireshk@kernel.org>,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, linux-scsi@vger.kernel.org,
 Will Deacon <will@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Dave Jiang <dave.jiang@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>,
 Gonglei <arei.gonglei@huawei.com>, Kalle Valo <kvalo@codeaurora.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, virtualization@lists.linux-foundation.org,
 Jeff Dike <jdike@addtoit.com>, Vivek Goyal <vgoyal@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Eric Van Hensbergen <ericvh@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, linux-um@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Jie Deng <jie.deng@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 iommu@lists.linux-foundation.org,
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

On 13.10.21 14:17, Michael S. Tsirkin wrote:
> On Wed, Oct 13, 2021 at 01:03:46PM +0200, David Hildenbrand wrote:
>> On 13.10.21 12:55, Michael S. Tsirkin wrote:
>>> This will enable cleanups down the road.
>>> The idea is to disable cbs, then add "flush_queued_cbs" callback
>>> as a parameter, this way drivers can flush any work
>>> queued after callbacks have been disabled.
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>   arch/um/drivers/virt-pci.c                 | 2 +-
>>>   drivers/block/virtio_blk.c                 | 4 ++--
>>>   drivers/bluetooth/virtio_bt.c              | 2 +-
>>>   drivers/char/hw_random/virtio-rng.c        | 2 +-
>>>   drivers/char/virtio_console.c              | 4 ++--
>>>   drivers/crypto/virtio/virtio_crypto_core.c | 8 ++++----
>>>   drivers/firmware/arm_scmi/virtio.c         | 2 +-
>>>   drivers/gpio/gpio-virtio.c                 | 2 +-
>>>   drivers/gpu/drm/virtio/virtgpu_kms.c       | 2 +-
>>>   drivers/i2c/busses/i2c-virtio.c            | 2 +-
>>>   drivers/iommu/virtio-iommu.c               | 2 +-
>>>   drivers/net/caif/caif_virtio.c             | 2 +-
>>>   drivers/net/virtio_net.c                   | 4 ++--
>>>   drivers/net/wireless/mac80211_hwsim.c      | 2 +-
>>>   drivers/nvdimm/virtio_pmem.c               | 2 +-
>>>   drivers/rpmsg/virtio_rpmsg_bus.c           | 2 +-
>>>   drivers/scsi/virtio_scsi.c                 | 2 +-
>>>   drivers/virtio/virtio.c                    | 5 +++++
>>>   drivers/virtio/virtio_balloon.c            | 2 +-
>>>   drivers/virtio/virtio_input.c              | 2 +-
>>>   drivers/virtio/virtio_mem.c                | 2 +-
>>>   fs/fuse/virtio_fs.c                        | 4 ++--
>>>   include/linux/virtio.h                     | 1 +
>>>   net/9p/trans_virtio.c                      | 2 +-
>>>   net/vmw_vsock/virtio_transport.c           | 4 ++--
>>>   sound/virtio/virtio_card.c                 | 4 ++--
>>>   26 files changed, 39 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
>>> index c08066633023..22c4d87c9c15 100644
>>> --- a/arch/um/drivers/virt-pci.c
>>> +++ b/arch/um/drivers/virt-pci.c
>>> @@ -616,7 +616,7 @@ static void um_pci_virtio_remove(struct virtio_device *vdev)
>>>   	int i;
>>>           /* Stop all virtqueues */
>>> -        vdev->config->reset(vdev);
>>> +        virtio_reset_device(vdev);
>>>           vdev->config->del_vqs(vdev);
>>
>> Nit: virtio_device_reset()?
>>
>> Because I see:
>>
>> int virtio_device_freeze(struct virtio_device *dev);
>> int virtio_device_restore(struct virtio_device *dev);
>> void virtio_device_ready(struct virtio_device *dev)
>>
>> But well, there is:
>> void virtio_break_device(struct virtio_device *dev);
> 
> Exactly. I don't know what's best, so I opted for plain english :)

Fair enough, LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

