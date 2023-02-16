Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2197699669
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:54:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B2AE94;
	Thu, 16 Feb 2023 14:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B2AE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676555676;
	bh=R+wRWFBEFXxWSjhTB2Cj0kB+lN6oMmyUK54AJe+mzYo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fUUGwwGAFzX9eBcYrBpZhb108IfIybm8h9u7GMFFMChAiLrNkKFSgksZHxWIZdRN4
	 gb/0vVtd4NTzvr6zrfd1YMBT/hBKrXeoOFytWWDCx/MgxAG718t1XUUiwLKauQdvCo
	 5E9/mmIBk2SMKHjU3YxTP1UTpKy/Gl2c0WvcWSYY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F433F800E4;
	Thu, 16 Feb 2023 14:53:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 007E4F80171; Thu, 16 Feb 2023 14:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9096EF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9096EF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256
 header.s=default2002 header.b=XhjsIg9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5wvZVya/2I1adudMn9fCri4kPYjsevI/+W1YoF4YvTA=; b=XhjsIg9nnXiF733/UZ3CZuuTc5
	J2M07IyYKxTdSWr2tvEhXuQlYBuhoFWWq8KpH+3QD4tC8rUeKh5fmCULd7AmvZmUY/SrLn1U6GN0J
	IVlxrM3ApZwEzri1aiJn3S9FlVgYsKb+ga4x2g4GamkYY8sm+9UhS/LLjB/AKzuTm/dZeLrldQnsq
	P1BGYyRLZxDuXQIxi8Yxuqic5THp2NRxUFThF0HhVnQIZNDCC1W2LUK5N93HC/KiD/BzqHUT3W0nH
	nZ2qLhh3G9XD+KIoAtziYmH4DTdOAeZ6Nxs0s/2NxqJbIMjFQtHjgYa1U+LBARPqfaD5NTDYpR69f
	ePclMGig==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1pSehd-000Nzn-Nj; Thu, 16 Feb 2023 14:53:37 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
	by sslproxy06.your-server.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1pSehd-0007xS-75; Thu, 16 Feb 2023 14:53:37 +0100
Message-ID: <b57b8fbe-c558-8d5d-5fb3-7540d2fa83ae@metafoo.de>
Date: Thu, 16 Feb 2023 05:53:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] ASoC: soc-generic-dmaengine-pcm: add option to start
 DMA after DAI
Content-Language: en-US
To: Claudiu.Beznea@microchip.com, broonie@kernel.org
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-2-claudiu.beznea@microchip.com>
 <b065e2bb-1f11-067a-b085-45d47626927e@metafoo.de>
 <Y+v8bbr4cNSOA1SF@sirena.org.uk>
 <4b109846-2019-219a-262e-46f5bb504c99@microchip.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <4b109846-2019-219a-262e-46f5bb504c99@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26814/Thu Feb 16 09:40:04 2023)
Message-ID-Hash: OK62KKPU2DQ5AYM62VH5A7U34MLUWKVJ
X-Message-ID-Hash: OK62KKPU2DQ5AYM62VH5A7U34MLUWKVJ
X-MailFrom: lars@metafoo.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OK62KKPU2DQ5AYM62VH5A7U34MLUWKVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/16/23 01:49, Claudiu.Beznea@microchip.com wrote:
> On 14.02.2023 23:26, Mark Brown wrote:
>> On Tue, Feb 14, 2023 at 10:14:28AM -0800, Lars-Peter Clausen wrote:
>>> On 2/14/23 08:14, Claudiu Beznea wrote:
>>>> @@ -450,6 +450,8 @@ int snd_dmaengine_pcm_register(struct device *dev,
>>>>    	else
>>>>    		driver = &dmaengine_pcm_component;
>>>> +	driver->start_dma_last = config->start_dma_last;
>>> This will break if you have multiple sound cards in the system.
>>> dmaengine_pcm_component must stay const.
>> Right, if we need to modify it we either need to select which of
>> multiple const structs to register or to take a copy and modify
>> that.  I've not looked at the actual changes yet.
> OK, I will try that and return with a new patch.
>
> On the other hand do you think the other solution presented in cover letter
> would be better? From the cover letter:
>
> "The other solution that was identified for this was to extend the already
> existing mechanism around struct snd_soc_dai_link::stop_dma_first. The downside
> of this was that a potential struct snd_soc_dai_link::start_dma_last
> would have to be populated on sound card driver thus, had to be taken
> into account in all sound card drivers. At the moment, the mchp-pdmc is
> used only with simple-audio-card. In case of simple-audio-card a new DT
> binding would had to be introduced to specify this action on dai-link
> descriptions (as of my investigation)."
>
Can't you just set `start_dma_last` on the `mchp_pdmc_dai_component`? In 
your code you iterate over all the components of the link and if any of 
them has it set the DMA is started last.
