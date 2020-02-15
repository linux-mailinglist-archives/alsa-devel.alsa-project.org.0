Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6A15FC72
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 04:21:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C463C1674;
	Sat, 15 Feb 2020 04:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C463C1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581736903;
	bh=x6XJa78d9dhYHE/8a1aEk7fynpc/igZQzihomEp+kww=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hrNw+GbnLjkxJir/SQEEI7TT+lTzLtPaDG9m+/DM3Q+CCDEdy34OikMrSUDt7Szs/
	 7ByY4r2uBFhljWox9OHHcS7faVf6JJ7ccuqkASZuHEHdQyG5TdAv/y+J8nKAzRa0pd
	 +Mqw/fTmdC73D6aPcoiBlmao+sLX+7V2Jj8383+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC6DF80147;
	Sat, 15 Feb 2020 04:20:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8201BF80147; Sat, 15 Feb 2020 04:20:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5927F8011B
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 04:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5927F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="SephaeDI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sZcjFg93"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 096096D88;
 Fri, 14 Feb 2020 22:19:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 14 Feb 2020 22:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=y
 N2wari2ivX75m26fu/oSYka7THUtcpfjjkTTPAHPEE=; b=SephaeDI1Ip0QZuBm
 UGpm1CDV5osgS67egR/iVM70TqKGNcKnmqAKDYhyA2bv8zqZNJ9YXdrz6KPjl/PR
 xu8Xka831+AZRsv79vKCy+P5kASenm+MOaSrzgxwPNYPCXvgHt22VtMHQTT/pAF0
 wBRXSPpsULHqPUCNYrD6k9b0xas0WQTjCqKaJoOcZ7TSptmZBm+PbaT//jsxFfO2
 A2eUNrqRpFFEOEnYBFU0IU48V6oYFGZP0x4ij7KA18L2QjNqj4+mE/KaSzxqTs6c
 fJu+5EPyhszbZUXhAbGS5Y0rmM3Q5Qcbe5lo/YkUUPKwmjL2G0AVesnUFD8HqAIp
 Qdc+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=yN2wari2ivX75m26fu/oSYka7THUtcpfjjkTTPAHP
 EE=; b=sZcjFg93NS+Zp/mZ1oZhZjyS/JHwNCQM4aHNgHP1Etmr3VL9twfF6oxSE
 cwS9vm5ij4eraGQ8CWb5SakWSKN1j+z1yb1yslvzEil48Y6hJYOGgejKS1tXolde
 BAtgbtXLHBo7noYO4MurFTi2pkF6a+OLlZ11mIpbc+vnApZPHX7Mcei2uL94mkMh
 J+yr7X8ddHoGSgm6tNwNEo229y1mc25lHDl6JuyD9BA3JE9gwEsWqzWEbdAJlLLg
 /OABUaEZ+Bmy4T2IzUIC0GbAKJ98NcWvdwLhgms35p6ilzboQi1MchLiNMipVwjY
 gkFOCYUWtw+j3Cgz0qoaDrFQeot3Q==
X-ME-Sender: <xms:WGNHXrbDFBUwZKF-AquIobiLz8LwhPWwLbjPyv0IW5R2mFLQzwQlhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedugdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WGNHXmnGb9ADW47BAzei83fKYHskr1IwlEixVmBlUOaC9DAyo7tADg>
 <xmx:WGNHXg2HRJ3Xd_ghFR1YiePtqG5fLzTJPw9xIaCg0E3Zf0h_O3-tcg>
 <xmx:WGNHXgQxgyngIgx4oMvtQuXVZZfUX0W5OvcIGmQU7RsuQGcdF4oWjg>
 <xmx:WWNHXj3WcfFfPUEw4QeZp1WMl_FQjYQajQaKPKMTFdP9k6FyK-U8ow>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8483A3060C21;
 Fri, 14 Feb 2020 22:19:51 -0500 (EST)
To: Takashi Iwai <tiwai@suse.de>
References: <20200213061147.29386-1-samuel@sholland.org>
 <20200213061147.29386-3-samuel@sholland.org> <s5ha75nyp6v.wl-tiwai@suse.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <f443a53e-e214-481f-fe9c-6fe480d91292@sholland.org>
Date: Fri, 14 Feb 2020 21:19:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <s5ha75nyp6v.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH 2/4] ALSA: pcm: Make snd_pcm_limit_hw_rates
 take hw directly
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

On 2/13/20 12:30 AM, Takashi Iwai wrote:
> On Thu, 13 Feb 2020 07:11:45 +0100,
> Samuel Holland wrote:
>>
>> It can be useful to derive min/max rates of a snd_pcm_hardware without
>> having a snd_pcm_runtime, such as before constructing an ASoC DAI link.
>>
>> Since snd_pcm_limit_hw_rates only uses runtime->hw, it does not actually
>> need the snd_pcm_runtime. Modify it to take a pointer to hw directly.
> 
> I prefer adding a new function and change snd_pcm_limit_hw_rates() to
> static inline just calling the new one with &runtime->hw, instead of
> touching so many callers site.

I agree. I will definitely do that for v2.

Thanks,
Samuel

> thanks,
> 
> Takashi
> 
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
