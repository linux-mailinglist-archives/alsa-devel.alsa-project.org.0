Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7526F60630A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 16:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12CA68924;
	Thu, 20 Oct 2022 16:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12CA68924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666276212;
	bh=YRfNYsaoqipH/JAZOGvxGYUzytun+eCvBvpDtycNUJw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GC3Z3YcviWHr2WSq944ert6vayk0R6vlFh1wWbru/kYGZaY9tYKNZUwOhNJ35POhn
	 6riaRHudqd5veCvw69Ttp0yNcb8QEUyyFLpcT7qynEloHQqmeSEUPXwEO46bVXlivG
	 9Tpu7nvEf50iWc3UuZROs2XIKevJo/E7cuMIehC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92446F804E5;
	Thu, 20 Oct 2022 16:29:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5105DF804D8; Thu, 20 Oct 2022 16:29:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1853F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 16:29:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 487FCA0042;
 Thu, 20 Oct 2022 16:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 487FCA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1666276149; bh=mgFNio+BuYR68UhSChavn7Cy0kxcP7MgNOePn9i1zaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o+EaAv3pINlDRPaU/YtDNgrgKVMILQ9I/ZvOsp3z0ruUva8cOmI83XStaKhPBIdw3
 As3YdzOhA9fOLS1xhfzif1QYvnmEL5Ad0/Latu3rnSZx+JwYhE1720yc4qfuKPEyU2
 pVq3jiUE/bczTIxr5nt2qdjAgaS991dQb1yLjUJo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 20 Oct 2022 16:29:06 +0200 (CEST)
Message-ID: <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
Date: Thu, 20 Oct 2022 16:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>
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

On 19. 10. 22 22:06, Pierre-Louis Bossart wrote:
> Hi Jaroslav,
> 
> On 9/29/22 09:37, Jaroslav Kysela wrote:
>> The driver field in the struct snd_ctl_card_info is a valid
>> user space identifier. Actually, many ASoC drivers do not care
>> and let to initialize this field using a standard wrapping method.
>> Unfortunately, in this way, this field becomes unusable and
>> unreadable for the drivers with longer card names. Also,
>> there is a possibility to have clashes (driver field has
>> only limit of 15 characters).
>>
>> This change will print an error when the wrapping is used.
>> The developers of the affected drivers should fix the problem.
> 
> How should we fix this problem?
> 
> I see all kinds of errors thrown in our first CI results based on 6.1-rc1:
> 
> [   12.684893] kernel: cml_rt1011_rt5682 cml_rt1011_rt5682: ASoC: driver
> name too long 'sof-cml_rt1011_rt5682' -> 'sof-cml_rt1011_'
> 
> [   12.219660] kernel: bxt_da7219_max98357a glk_da7219_mx98357a: ASoC:
> driver name too long 'sof-glkda7219max' -> 'sof-glkda7219ma'
> 
> I have no idea what is expected here in terms of naming. It's far from
> obvious to respect the 15-character limit AND have something
> readable/sensible given the proliferation of hardware skews.
> 
> Any suggestions?

The question is, how deep the driver name should describe the hardware 
details. The two drivers covering the majority hardware use "HDA-Intel" and 
"USB-Audio" strings here and there are a lot of variants of the codec / user 
space devices / mixer controls. The codec chain and eventually the audio 
bridge can be described in other identification strings like card components 
or the card name (note that most end users are not able to identify the 
references to hardware - it's a GUI string).

I would use "SOF-Intel-CML" and "SOF-Intel-GLK" strings or just "SOF-Intel" or 
any other variant as you like (lower case etc.). My opinion is that it's not 
necessary to have an unique string per driver here (the drivers should have 
just something common like the SOF core code).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
