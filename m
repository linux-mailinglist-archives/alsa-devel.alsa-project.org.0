Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6C376459
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 13:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FBE916AB;
	Fri,  7 May 2021 13:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FBE916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620385942;
	bh=YYg8Ovi29xW+OReGrjswjhW1g3Y990k1hSV5igccl8Q=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ec4RAkV+NFdvIuemKTf+m0udymnPmnEjRCNekJm1Vq28MI3/q5EbMmPPVvAUFmzwh
	 eTYRmjN5E4/MWEZXSIkZI63z4sdZO0gmTNCW5HowWK6mBmcuA56rArlcXfSbBR511I
	 q7RqgU5wljm2kO6Hetfo8cG2AgpKV5uhbSN4S/xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EFAAF80475;
	Fri,  7 May 2021 13:09:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B27D7F8025F; Fri,  7 May 2021 11:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43670F8010B
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 11:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43670F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gse-cs-msu-ru.20150623.gappssmtp.com
 header.i=@gse-cs-msu-ru.20150623.gappssmtp.com header.b="vwnM0CoC"
Received: by mail-lj1-x235.google.com with SMTP id p12so10709756ljg.1
 for <alsa-devel@alsa-project.org>; Fri, 07 May 2021 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gse-cs-msu-ru.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1o9fOfYSfdOLRiAvqZDl7HSV8PVlBtz8PalnoaqHKxE=;
 b=vwnM0CoCg7R1i/1jp1MZvWTP69djgR9Zc5n/8XqqmjmAq0U35kL1RKCMM2kB13+byt
 OJkErkQuCbfUqm4ME0Oi0poVqXn6xP6BiVhJOQ8wHFIVqjXmBK8We8BNtrBtrzMN/NRm
 O4ZJ+cpfsQFEAhYoRY76G8UWrNZ4AJ625uSJWXV/HSkbFGEMTfThQ87ox0cj7xeECT/E
 hnE3OjME6bryymqwRr4aQHtTwbPhzbfv9c9Srbi8vRy+dPxEnPj9vTQ/LqkENWwQCB8R
 6jag1InkvRfVl6GfVNzgiRltg8cXOd1ijfH2CJq5BHA1Q6KEJvl2QfSDEinbLjSclnAm
 Zynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1o9fOfYSfdOLRiAvqZDl7HSV8PVlBtz8PalnoaqHKxE=;
 b=Ieoa5IhmSSNzr4cfrYWatRTA4E2rAy5cj+6lCvYdxPgw8xcOQ7tMt4eExnu2V3i+8k
 XW4+dN7SGx4R2JCGFsWB3/FppMeYKVo6NaL/1crqtefqBKrFF8RS7TCa8o54rY/AP7zO
 w5bsWVEpHqAhtAG+bcn1H3W9SrIV3ozKE9S+Xcp2IeP6OoKnxBtsL9tsS9UPFjaPDE6s
 1kQc76KjYc4ZhL/PELhMqyNeKDqCHbZGvLz006cmHzOMNi2Qfs7IcRU0dpBUTV+JNQLR
 0OVMRHsGnCKkmnsM9iJOzvDHxgXR/kgTH71T1wdEEHwVp9WlfesDvHbkJRv6rp5/R95L
 FNZA==
X-Gm-Message-State: AOAM5333k3VHgfim8p0AMf/X3HlFceEov8LWADzAANMmTlqNhD2JL54n
 mjpCFaHkkQwjxt+rTuZnxZM/3yUUPWYau0aotC9/kA==
X-Google-Smtp-Source: ABdhPJwgfmUbDL1BY5nAx3kKI2XkygqI2MpgbmkeaOlAUMed3/6Vw5NvTFgEgoTiLB8Ubiz0H8mQotlxm/7/RrxCMMA=
X-Received: by 2002:a2e:1516:: with SMTP id s22mr7040859ljd.109.1620379137191; 
 Fri, 07 May 2021 02:18:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:7e06:0:0:0:0:0 with HTTP;
 Fri, 7 May 2021 02:18:56 -0700 (PDT)
From: =?UTF-8?B?0J/QvtC00LPQvtGA0L3Ri9C5INCQ0LvQtdC60YHQtdC5INCe0LvQtdCz0L7QstC40Yc=?=
 <s02190176@gse.cs.msu.ru>
Date: Fri, 7 May 2021 12:18:56 +0300
Message-ID: <CAA5EkfcVXC4MwMj=2GsfyLDjPsnT1nxgNk5XhdE346MuLFwMVQ@mail.gmail.com>
Subject: [BUG] ALSA: korg1212: Potential NULL pointer dereference in
 snd_korg1212_interrupt()
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Leon Romanovsky <leon@kernel.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 07 May 2021 13:09:50 +0200
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>
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

snd_korg1212_create() makes the following steps during initialization
of the card:
1) registers an interrupt handler (lines 2230-2232)
2) allocates and initializes korg1212->sharedBufferPtr (lines 2280-2287)
3) reboots the card via snd_korg1212_Send1212Command() (line 2358)

2145    static int snd_korg1212_create(struct snd_card *card, struct
                                 pci_dev *pci, struct snd_korg1212 **rchip)
2147    {
                ...
2230            err = request_irq(pci->irq, snd_korg1212_interrupt,
2231                                        IRQF_SHARED,
2232                                        KBUILD_MODNAME, korg1212);
                ...
2280            if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
2281            sizeof(struct KorgSharedBuffer), &korg1212->dma_shared) < 0){

2282                         snd_printk(KERN_ERR "korg1212: can not
                                 allocate shared buffer memory (%zdbytes)\n",
                                 sizeof(struct KorgSharedBuffer));

2283                         snd_korg1212_free(korg1212);
2284                         return -ENOMEM;
2285            }
2286            korg1212->sharedBufferPtr =
                        (struct KorgSharedBuffer*)korg1212->dma_shared.area;
2287            korg1212->sharedBufferPhy = korg1212->dma_shared.addr;
                ...
2358            rc = snd_korg1212_Send1212Command(korg1212,
                        K1212_DB_RebootCard, 0, 0, 0, 0);
                ...
2412    }

But if interrupt happens when snd_korg1212_create() is still within
lines 2233-2286,
snd_korg1212_interrupt() may dereference korg1212->sharedBufferPtr before
it was initialized without any checks (line 1149):

1098    static irqreturn_t snd_korg1212_interrupt(int irq, void *dev_id)
1099    {
                ...
1116            switch (doorbellValue) {
                ...
1145                        case K1212_DB_CARDSTOPPED:
1146                            K1212_DEBUG_PRINTK_VERBOSE("K1212_DEBUG: IRQ
                                        CSTP count - %ld, %x, [%s].\n",
1147                                korg1212->irqcount, doorbellValue,
1148                                stateName[korg1212->cardState]);
1149                        korg1212->sharedBufferPtr->cardCommand = 0;
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1150                        break;
                ...
1185    }

Should we be sure that such interrupt cannot happen or
should we move the registration of the interrupt handler after
korg1212->sharedBufferPtr is initialized?

Found by Linux Driver Verification project (linuxtesting.org).
