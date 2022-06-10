Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838954627E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 11:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B125418A7;
	Fri, 10 Jun 2022 11:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B125418A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654853686;
	bh=J2frKo07JAZM2IUZ67WQhilvoH6SqJYTVn5+UPh8hvE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgEKe52CABF4E7c+NqVzinmFTVhBtClF3tLN0/l5yPhCqmAgHDYd9e1BZyz3MmNRQ
	 UeuGFmujQ0RQeWZhZk2G/ewNBajJQBN7iIxWCy4pAsn9vWCk4O3WXfH+iAkXjWK7LV
	 T9nmBpeQ8CPti4SvslOYICNLDN9krPshH7CW7KLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3117FF800DF;
	Fri, 10 Jun 2022 11:33:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26CB6F804D2; Fri, 10 Jun 2022 11:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C097F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 11:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C097F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WzkqQwba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654853623; x=1686389623;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J2frKo07JAZM2IUZ67WQhilvoH6SqJYTVn5+UPh8hvE=;
 b=WzkqQwbasOq2Y4bwG3iWvX32d99ePMK0s757fC3/4AjxVdb9WtEqUDME
 wUuuedZt6j256XqsrWdvYkls3c9JRh2lel86lz04JqWYnSfBD7WUQZjaU
 Y3Ij+q+W3s+KCXPpIhLB2JDUIZJQ4SSf888pdFvZxgozbpHUETKrm/DsE
 zkYKm9+UyqBZe0Olynt7EcdmMyriNltJBOJGcxg+dqCbJetHeXBKFUrFF
 clJWIuI0UrEe/fVRBGuaoyPkAoxJpKF8DSJLzDHouB7p6qMI5MBNTuawb
 dH5oEY1yDqJ3YsDn00FqoSFXVoEFB47cZn5OtUBIAnbekHrbgMoStISHZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266342474"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="266342474"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 02:33:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638042722"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.158])
 ([10.99.241.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 02:33:36 -0700
Message-ID: <4ac15ba3-1f20-5361-1941-2687962ce454@linux.intel.com>
Date: Fri, 10 Jun 2022 11:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 07/11] ASoC: codecs: rt274: Enable irq only when needed
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-8-amadeuszx.slawinski@linux.intel.com>
 <YqIBRGNAOfxPJjc+@sirena.org.uk>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <YqIBRGNAOfxPJjc+@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 6/9/2022 4:18 PM, Mark Brown wrote:
> On Thu, Jun 09, 2022 at 03:35:37PM +0200, Amadeusz Sławiński wrote:
>> Interrupt is only needed when jack detection is enabled, so enable it
>> then, similarly disable it when jack detection is being disabled.
> 
>>   	if (jack == NULL) {
>>   		/* Disable jack detection */
>> +		disable_irq(rt274->i2c->irq);
> 
> There is absolutely no need to do this, it'll interfere with any sharing
> of the interrupt and if the interrupt isn't firing then there is no cost
> to having the interrupt registered.
> 
> The driver could use some cleanup of the interrupt handler, it currently
> unconditionally clears anything that fires and reports IRQ_HANDLED but
> should only report IRQ_HANDLED if there was anything from the device.
> Practically speaking it shouldn't make much difference unless there's
> spurious interrupts or the interrupt gets shared.

I will recheck this again, but if I remember correctly we may have had 
problems that codec kept firing interrupts when we unloaded machine 
board and codec driver kept spamming dmesg due to _dbg message present 
in irq handler.
