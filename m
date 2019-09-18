Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03888B60F3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8459C166F;
	Wed, 18 Sep 2019 12:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8459C166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568800882;
	bh=5OZ3ybLmwA7qB9ogN1SaffzATfgS0YMUDqJHuULqqMo=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDEFgYqlcQmIh2G210bhtQ65CRzfWtoS5yfByqphATGL5nqGyMsFM1ijYiY9OO4hX
	 4bPN/+2Zvlmy4GiMkMzg3RbYQM4vhEkOyA2wf+00YXjlDTmRxsIxj0zj/OBHryM6Xw
	 8NYfNaSRGScz5SLo4onNS72O1GP3JELP6bzCh2i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E6DF80146;
	Wed, 18 Sep 2019 11:59:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC716F804FF; Wed, 18 Sep 2019 11:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41196F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 11:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41196F80146
X-Originating-IP: 86.207.98.53
Received: from localhost
 (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1A7AE240013;
 Wed, 18 Sep 2019 09:59:26 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
In-Reply-To: <20190918094800.GJ21254@piout.net>
References: <20190918094114.15867-1-gregory.clement@bootlin.com>
 <20190918094800.GJ21254@piout.net>
Date: Wed, 18 Sep 2019 11:59:25 +0200
Message-ID: <87impq7wn6.fsf@FE-laptop>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: atmel_ssc_dai: Remove wrong spinlock
	usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Alex,

> On 18/09/2019 11:41:14+0200, Gregory CLEMENT wrote:
>> A potential bug was reported in the email "[BUG] atmel_ssc_dai: a
>> possible sleep-in-atomic bug in atmel_ssc_shutdown"[1]
>> 
>> Indeed in the function atmel_ssc_shutdown() free_irq() was called in a
>> critical section protected by spinlock.
>> 
>> However this spinlock is only used in atmel_ssc_shutdown() and
>> atmel_ssc_startup() functions. After further analysis, it occurred that
>> the call to these function are already protected by mutex used on the
>> calling functions.
>> 
>> Then we can remove the spinlock which will fix this bug as a side
>> effect. Thanks to this patch the following message disappears:
>> 
>> "BUG: sleeping function called from invalid context at
>> kernel/locking/mutex.c:909"
>> 
>> [1]: https://www.spinics.net/lists/alsa-devel/msg71286.html
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  sound/soc/atmel/atmel_ssc_dai.c | 7 -------
>>  1 file changed, 7 deletions(-)
>> 
>> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
>> index 6f89483ac88c..365957e86419 100644
>> --- a/sound/soc/atmel/atmel_ssc_dai.c
>> +++ b/sound/soc/atmel/atmel_ssc_dai.c
>> @@ -116,19 +116,16 @@ static struct atmel_pcm_dma_params ssc_dma_params[NUM_SSC_DEVICES][2] = {
>>  static struct atmel_ssc_info ssc_info[NUM_SSC_DEVICES] = {
>>  	{
>>  	.name		= "ssc0",
>> -	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[0].lock),
>
> This member is now unused and can be removed from the struct.
>
> Once fixed, Reviewed-by: Alexandre Belloni
> <alexandre.belloni@bootlin.com>

Indeed I wanted to do this but finally forgot.
I am sending a v2.

Thanks,

Gregory

>
>>  	.dir_mask	= SSC_DIR_MASK_UNUSED,
>>  	.initialized	= 0,
>>  	},
>>  	{
>>  	.name		= "ssc1",
>> -	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[1].lock),
>>  	.dir_mask	= SSC_DIR_MASK_UNUSED,
>>  	.initialized	= 0,
>>  	},
>>  	{
>>  	.name		= "ssc2",
>> -	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[2].lock),
>>  	.dir_mask	= SSC_DIR_MASK_UNUSED,
>>  	.initialized	= 0,
>>  	},
>> @@ -317,13 +314,11 @@ static int atmel_ssc_startup(struct snd_pcm_substream *substream,
>>  
>>  	snd_soc_dai_set_dma_data(dai, substream, dma_params);
>>  
>> -	spin_lock_irq(&ssc_p->lock);
>>  	if (ssc_p->dir_mask & dir_mask) {
>>  		spin_unlock_irq(&ssc_p->lock);
>>  		return -EBUSY;
>>  	}
>>  	ssc_p->dir_mask |= dir_mask;
>> -	spin_unlock_irq(&ssc_p->lock);
>>  
>>  	return 0;
>>  }
>> @@ -355,7 +350,6 @@ static void atmel_ssc_shutdown(struct snd_pcm_substream *substream,
>>  
>>  	dir_mask = 1 << dir;
>>  
>> -	spin_lock_irq(&ssc_p->lock);
>>  	ssc_p->dir_mask &= ~dir_mask;
>>  	if (!ssc_p->dir_mask) {
>>  		if (ssc_p->initialized) {
>> @@ -369,7 +363,6 @@ static void atmel_ssc_shutdown(struct snd_pcm_substream *substream,
>>  		ssc_p->cmr_div = ssc_p->tcmr_period = ssc_p->rcmr_period = 0;
>>  		ssc_p->forced_divider = 0;
>>  	}
>> -	spin_unlock_irq(&ssc_p->lock);
>>  
>>  	/* Shutdown the SSC clock. */
>>  	pr_debug("atmel_ssc_dai: Stopping clock\n");
>> -- 
>> 2.23.0
>> 
>
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
