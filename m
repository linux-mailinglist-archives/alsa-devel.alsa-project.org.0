Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28C30E128
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 18:35:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFA5173B;
	Wed,  3 Feb 2021 18:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFA5173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612373757;
	bh=KWqKqt2f1goILVaLW6keSi7a8xmdBlxaTpcjEM7focg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTSVbCBj/dSJNKvhsNmt2V3BnnHbGUwFEtYGNojcfeEa99jGYbh7rhc7az7yLctqy
	 AN4Ty62PBG4JSpvy5pqhZGPdlxihg1z8dFpedVGU82n+scfra5TQaR1+kPTFMtBg+z
	 2PAIvxaSQcPmvfwE4b9i6XwOj1iO1ZB8M5YBDFqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B88F80155;
	Wed,  3 Feb 2021 18:34:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B174CF8015A; Wed,  3 Feb 2021 18:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF332F80155
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 18:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF332F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="ZS9V4YZ7"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id DEDB2A15A4;
 Wed,  3 Feb 2021 18:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=6JriUFT4K4Gw
 YTQBWmEFwOKzOJIBhwKv+n4I3Bk9mZ4=; b=ZS9V4YZ72FWVi7jLDWcSYcAxKf+E
 q4/rbVgU+kTQKo0+HohUXRP4aRJctXkwRTS7slZVNXGVKEiK9xYezJH9qleb++ty
 JDcfELO4n6iMqRMMd0uR7JoH2qOXonsSXmUprzdqEdYgcb9UJ5qN8waT3PmM2XPN
 dlUUlFCn3FynQI2qXzqEURdH7WoJ1zk7yMy89/tIPNhS8TiZERrSlg8ybV0LKvN4
 OLsmqvjaD56VsoWRsLLSzTwfxCW8IgfMgG9uVJemr/v2fqHOTROjmkg4MgFGNlYR
 JULqEYM8W+YWDNKrq+WzFkkvkBm5hy9haTBbLVTHCkGRzuKehKmn9ICG+w==
Subject: Re: [virtio-dev] Re: [PATCH v2 2/9] ALSA: virtio: add virtio sound
 driver
To: Takashi Iwai <tiwai@suse.de>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-3-anton.yakovlev@opensynergy.com>
 <8754dae8-114-6383-510-de2ba9dc4fa@intel.com>
 <52f71ac6-3ec7-2884-7a64-1995f416d20a@opensynergy.com>
 <s5h35yd9jf0.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <fb4808e7-28d6-996e-02fc-c63d0e1d8221@opensynergy.com>
Date: Wed, 3 Feb 2021 18:34:12 +0100
MIME-Version: 1.0
In-Reply-To: <s5h35yd9jf0.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, virtio-dev@lists.oasis-open.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

Hi Takashi,


On 03.02.2021 17:59, Takashi Iwai wrote:
> On Tue, 02 Feb 2021 00:18:09 +0100,
> Anton Yakovlev wrote:
>>>> +/**
>>>> + * virtsnd_reset_fn() - Kernel worker's function to reset the device.
>>>> + * @work: Reset device work.
>>>> + *
>>>> + * Context: Process context.
>>>> + */
>>>> +static void virtsnd_reset_fn(struct work_struct *work)
>>>> +{
>>>> +     struct virtio_snd *snd =
>>>> +             container_of(work, struct virtio_snd, reset_work);
>>>> +     struct virtio_device *vdev = snd->vdev;
>>>> +     struct device *dev = &vdev->dev;
>>>> +     int rc;
>>>> +
>>>> +     dev_info(dev, "sound device needs reset\n");
>>>> +
>>>> +     /*
>>>> +      * It seems that the only way to properly reset the device is to
>>>> remove
>>>> +      * and re-create the ALSA sound card device.
>>>> +      *
>>>> +      * Also resetting the device involves a number of steps with
>>>> setting the
>>>> +      * status bits described in the virtio specification. And the
>>>> easiest
>>>> +      * way to get everything right is to use the virtio bus interface.
>>>> +      */
>>>> +     rc = dev->bus->remove(dev);
>>>> +     if (rc)
>>>> +             dev_warn(dev, "bus->remove() failed: %d", rc);
>>>> +
>>>> +     rc = dev->bus->probe(dev);
>>>> +     if (rc)
>>>> +             dev_err(dev, "bus->probe() failed: %d", rc);
>>>
>>> This looks very suspicious to me. Wondering what ALSA maintainers
>> will say
>>> to this.
>>
>> I'm also wondering what the virtio people have to say. This part is a
>> purely virtio specific thing. And since none of the existing virtio
>> drivers processes the request to reset the device, it is not clear what
>> is the best way to proceed here. For this reason, the most
>> straightforward and simple solution was chosen.
> 
> What is this "reset" actually supposed to do?  Reconfguring
> everything, or changing only certain parameters, devices, whatever?

It means bringing this particular device to its initial state.

After that, the driver can re-read the configurations from the device
and reconfigure everything.


> thanks,
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

