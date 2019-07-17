Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9636C389
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 01:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BE5167F;
	Thu, 18 Jul 2019 01:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BE5167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563406421;
	bh=F0TQS0e19jc0yRYaeF/VtWgja6KeiuMmD+cWdAQ9N2g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhkGX7hfu5DN6uSa9H03voiJ0VvbLmp0hlQ9VMfH9H0GDD/dZPVlb817ZGyj2+ptL
	 vWJnQXP+0+qtNQMIkAUbrlhVq6Md7O8o7N8OOfWTXZvqA6OLGUUpcGU0XsOns5S5O1
	 5216gZezBhaIJbroEqDzWkjGn1tkHNph3AuRp0m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9901F80363;
	Thu, 18 Jul 2019 01:31:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D74D5F80363; Thu, 18 Jul 2019 01:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C36F8015B
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 01:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C36F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r01M60NW"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BDD520651;
 Wed, 17 Jul 2019 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563406289;
 bh=8VpnxGStLf8E5O7z0t32FrG8nOd4aZ30LIjDn4eMqCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r01M60NWkw8fznxWilOLF4w8ZPxjnmrEfdkmqVj156+7ZWyrosI1IL6TPX/oCKQZ0
 oy2vQ7UQ+90CCBMdvSV5CvM4EKIrVwIiwguYjO6FIMdZq8K8qsX9UP61ie+IkbFJaf
 sQuEEWFunKmVil4IsA35Gc+sw/p4vx8VcMsBvm78=
Date: Wed, 17 Jul 2019 19:31:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20190717233128.GB3079@sasha-vm>
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-3-oleksandr.suvorov@toradex.com>
 <CAOMZO5AgCqH+8W36vh4n3tCFvqUE=H+4Zp0jG1NQi5UFOsSSAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5AgCqH+8W36vh4n3tCFvqUE=H+4Zp0jG1NQi5UFOsSSAQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 2/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 17, 2019 at 01:48:43PM -0300, Fabio Estevam wrote:
>On Wed, Jul 17, 2019 at 1:30 PM Oleksandr Suvorov
><oleksandr.suvorov@toradex.com> wrote:
>>
>> Change VAG power on/off control according to the following algorithm:
>> - turn VAG power ON on the 1st incoming event.
>> - keep it ON if there is any active VAG consumer (ADC/DAC/HP/Line-In).
>> - turn VAG power OFF when there is the latest consumer's pre-down event
>>   come.
>> - always delay after VAG power OFF to avoid pop.
>> - delay after VAG power ON if the initiative consumer is Line-In, this
>>   prevents pop during line-in muxing.
>>
>> Also, according to the data sheet [1], to avoid any pops/clicks,
>> the outputs should be muted during input/output
>> routing changes.
>>
>> [1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf
>>
>> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
>> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> Fixes: 9b34e6cc3bc2 ("ASoC: Add Freescale SGTL5000 codec support")
>
>Reviewed-by: Fabio Estevam <festevam@gmail.com>
>
>By the way, I prefer the description you put in the cover letter as it
>explicitly talks about a bug being fixed.

Yes. This patch describes itself as an improvement rather than a fix.

You need to add an explicit stable tag, rather than just cc us.
Something like:

	Cc: stable@kernel.org

--
Thanks,
Sasha
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
