Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9A428014
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 10:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CB8166E;
	Sun, 10 Oct 2021 10:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CB8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633855308;
	bh=BKqy/VnTufo2IS6ZwXrmZ/XgzwlIULyPAJL5Jw+AMPU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bh9rBxN5IwPm5IU7W/4+veE6xP+whIVN9NBhfjQx91XZFn5lEwg5QHP/fKKNHFgHY
	 u75/NLtykR3pfIlyBfF4CW3j+zj+pQAanT3IgtZ/CaFc5phAJyKG1d53HeuqZZ0u9g
	 DDjWNcyY6fCmoBCLMGImXuXvunP7H7Feai6vJ6U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 292E9F80212;
	Sun, 10 Oct 2021 10:40:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A4CEF801F7; Sun, 10 Oct 2021 10:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48340F800F0
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 10:40:22 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6BE4AA003F;
 Sun, 10 Oct 2021 10:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6BE4AA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1633855221; bh=jEddCVVyEM6hfDJAIIp/JF0rfCtaB9zR3MuC9Qro148=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=wKG6TDVhlblRcRd0f6VGjJyJlnjhQAmYlYNXqC/D15yntOn9n+tTwxJ2bioo55qGe
 jzz2CGbAPmQokinVBhrSwy3VjSGDJKkwrDIbIeH+PmRov5Rk2QO31XxKIp9uqp7MRV
 vLs+n2Oj0tfHRT/CZDNNgBNwd8huSrXKxg3dQJRc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 10 Oct 2021 10:40:10 +0200 (CEST)
Message-ID: <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz>
Date: Sun, 10 Oct 2021 10:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Content-Language: en-US
To: Diederik de Haas <didi.debian@cknow.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Guido_G=c3=bcnther?=
 <agx@sigxcpu.org>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org> <4974503.Y8KB3sNASq@bagend>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <4974503.Y8KB3sNASq@bagend>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10. 10. 21 9:47, Diederik de Haas wrote:
> On Tuesday, 22 June 2021 10:27:09 CEST Guido Günther wrote:
>> alsa-ucm groups by driver name so fill that in as well. Otherwise the
>> presented information is redundant and doesn't reflect the used
>> driver. We can't just use 'asoc-simple-card' since the driver name is
>> restricted to 15 characters.
>>
>> Before:
>>
>>   # cat /proc/asound/cards
>>   0 [Devkit         ]: Librem_5_Devkit - Librem 5 Devkit
>>                        Librem 5 Devkit
>> After:
>>
>>   0 [Devkit         ]: simple-card - Librem 5 Devkit
>>                        Librem 5 Devkit
>>
>> Signed-off-by: Guido GÃ¼nther <agx@sigxcpu.org>
>> ---
>> This came out of a discussion about adding alsa-ucm profiles for the
>> Librem 5 Devkit at https://github.com/alsa-project/alsa-ucm-conf/pull/102
>>
>>   sound/soc/generic/simple-card.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/generic/simple-card.c
>> b/sound/soc/generic/simple-card.c index 0015f534d42d..a3a7990b5cb6 100644
>> --- a/sound/soc/generic/simple-card.c
>> +++ b/sound/soc/generic/simple-card.c
>> @@ -621,6 +621,7 @@ static int asoc_simple_probe(struct platform_device
>> *pdev) card->owner		= THIS_MODULE;
>>   	card->dev		= dev;
>>   	card->probe		= simple_soc_probe;
>> +	card->driver_name       = "simple-card";
>>
>>   	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
>>   	if (!li)
> 
> Unfortunately this change broke multichannel audio on my Rock64 device running
> Debian. My Rock64 is connected to my AVR (Pioneer SC-1224) via a HDMI cable.

This looks like an user space configuration problem. You should check, if a PA 
profile or an UCM configuration is used (in the PA debug log).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
