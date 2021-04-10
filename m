Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955B35AF86
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 20:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B421662;
	Sat, 10 Apr 2021 20:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B421662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618078731;
	bh=Zy17UvjdQgtZ5OK7qoaR2+NqhDJPhbF/NRijzoba8TQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPRAB8YreDuHczh70zxZyQInrZc7h98mIrFJKMjcwLXsxheGK6wDoKDOn4UrQeLYB
	 lrEfX06355p+xEfMqSbu/zZQy3FTiS1ajdJdo/3EhvgqqWggixzkF1HtRi5JRl15RT
	 AOusSZAnI/alfIzp+276l9J0usjbnnP8vR9rIJBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14E81F800BC;
	Sat, 10 Apr 2021 20:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A5FFF8020B; Sat, 10 Apr 2021 20:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EB02F80113
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 20:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB02F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="0DCITfk3"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id CA77AA12B3;
 Sat, 10 Apr 2021 20:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=flMyugclSqb+
 wAO9k1tJ+ecrs2GxO/hHiLPPe7sDecM=; b=0DCITfk38Efzyum2sPHDo/2Ucbqj
 bQK0hAUSCZm0Cyx/ioFrkapdLShAKjLaDznkxqbMIxTzoQVtScPg60RNKhlCQJn9
 42aT+ofGidgl1jsTQINRjnwQdRXXcOs3p4WRq8Y4giWtrTm08jXm0VkuKMDwj03T
 X/gj8uw5d2enk5TuYvXZkR7Sq3k9Y9UCjUaNRXyK0V4vRBlN+j+L7ZaQkJnElSqv
 YBkb+hq1fOCAMuCYlXDIwuv1zaejCOn+O17J8CUNPjjbZmDbZFNiWFSGwSMfbHTr
 WVjVoh2ev5cd5RY2cUP5yqxsKu4K4Oddu2pqtXqXyV8/eC+N9vceact4wg==
Subject: Re: [PATCH -next] ALSA: virtio: use module_virtio_driver() to
 simplify the code
To: Chen Huang <chenhuang5@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
References: <20210408125429.1158703-1-chenhuang5@huawei.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <d0c7f617-50ef-0d39-cbd2-11925eba24d0@opensynergy.com>
Date: Sat, 10 Apr 2021 20:15:45 +0200
MIME-Version: 1.0
In-Reply-To: <20210408125429.1158703-1-chenhuang5@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On 08.04.2021 14:54, Chen Huang wrote
> 
> module_virtio_driver() makes the code simpler by eliminating
> boilerplate code.
> 
> Signed-off-by: Chen Huang <chenhuang5@huawei.com>

Thanks for the patch.

Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>

> ---
>   sound/virtio/virtio_card.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
> index ae9128063917..150ab3e37013 100644
> --- a/sound/virtio/virtio_card.c
> +++ b/sound/virtio/virtio_card.c
> @@ -432,17 +432,7 @@ static struct virtio_driver virtsnd_driver = {
>   #endif
>   };
> 
> -static int __init init(void)
> -{
> -       return register_virtio_driver(&virtsnd_driver);
> -}
> -module_init(init);
> -
> -static void __exit fini(void)
> -{
> -       unregister_virtio_driver(&virtsnd_driver);
> -}
> -module_exit(fini);
> +module_virtio_driver(virtsnd_driver);
> 
>   MODULE_DEVICE_TABLE(virtio, id_table);
>   MODULE_DESCRIPTION("Virtio sound card driver");
> --
> 2.17.1
> 
> 

