Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A570FBF1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 18:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE613E7;
	Wed, 24 May 2023 18:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE613E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684947005;
	bh=hvJt7YjyA2Q4IEqhRK/UATNSLwjQita55Z4eggN8Sec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TIPpdmL4BMpCK4TxfHh2icSsCq3RIo120WkRJsUJElG8tLEFroPfwMKsaV6/bJLRz
	 WU3JCMef5WYPLGGkD8KPZ9htaswMop7KrLPZnHIaaJLeA87X8CkbdqOtP7ibTcBb87
	 GomgHATDyXBBy4v5/3c11I65S0CidKNPsh9OvHbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB852F8055C; Wed, 24 May 2023 16:21:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 141BEF8055C;
	Wed, 24 May 2023 16:21:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B035F80564; Wed, 24 May 2023 16:21:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66A5BF80007
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 16:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A5BF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=DDzb++/B
Received: from [192.168.1.90] (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 21E976605943;
	Wed, 24 May 2023 15:21:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684938080;
	bh=hvJt7YjyA2Q4IEqhRK/UATNSLwjQita55Z4eggN8Sec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DDzb++/BzzeLQ6R1GbLy8KbEJ/cumPebTkGoHFK66V2TcIStLD9HE1jJ65Mw+TNXm
	 FHuMI1xvaX1gXwKK8gUs59pTpEfy/R767P5gpsGCHKsEQHaYOyK+ZDh92x0DrxA1B1
	 clXfs60YXvTlUCIRpicYerr9gLwe7NRdG2HVRWrF7NgjE29JRDiOuXG7KozI33HhhP
	 JiqKZQRe1cdRTmF80vIZ1RYCltHKd0WNtaeanFThogcgHXML635kDFikzXC25mxzzE
	 HFaAmBdC3li0VDw+13iD0t+RQ1HDquIGHsaiAjYdL5OxTcSnGYJGGrx/WNc6G5WakT
	 tVX/oB4i6miUw==
Message-ID: <0f5765e4-484e-2ae7-dc43-c1d6e9e3e1a4@collabora.com>
Date: Wed, 24 May 2023 17:21:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Assign ES8316 MCLK rate on
 rk3588-rock-5b
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Zhu Ning <zhuning0077@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Yang <yangxiaohua@everest-semi.com>, Daniel Drake
 <drake@endlessm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@collabora.com
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-4-cristian.ciocaltea@collabora.com>
 <5b3e479f-366b-4de7-a4ec-5348166ebcbc@sirena.org.uk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5b3e479f-366b-4de7-a4ec-5348166ebcbc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZPBCOEVOSLNYOVLSQJOJCRG2YP6FIO2A
X-Message-ID-Hash: ZPBCOEVOSLNYOVLSQJOJCRG2YP6FIO2A
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPBCOEVOSLNYOVLSQJOJCRG2YP6FIO2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/24/23 13:39, Mark Brown wrote:
> On Wed, May 24, 2023 at 10:41:56AM +0300, Cristian Ciocaltea wrote:
>> The I2S0_8CH_MCLKOUT clock rate on Rock 5B board defaults to 12 MHz and
>> it is used to provide the master clock (MCLK) for the ES8316 audio
>> codec.
>>
>> On sound card initialization, this limits the allowed sample rates
>> according to the MCLK/LRCK ratios supported by the codec, which results
>> in the following non-standard rates: 15625, 30000, 31250, 46875.
>>
>> Hence, the very first access of the sound card fails:
>>
>>   Broken configuration for playback: no configurations available: Invalid argument
>>   Setting of hwparams failed: Invalid argument
>>
>> However, all subsequent attempts will succeed, as the audio graph card
>> will request a correct clock frequency, based on the stream sample rate
>> and the multiplication factor.
>>
>> Assign MCLK to 12.288 MHz, which allows the codec to advertise most of
>> the standard sample rates.
> 
> Surely this is irrelevant with your previous change, and if the clock is
> freely reprogrammable as it sounds even harmful given that it'll
> restrict rates that are not available with the selected MCLK?

As mentioned in the previous patch description, there's a bad timing
with es8316_pcm_startup() being executed before the 2nd call to
es8316_set_dai_sysclk(), with the effect that the new/updated
rate constraints won't be used until the next playback attempt.

Hence the approach here was to ensure the initial list of restricted
rates is sane, by (pre)assigning a proper MCLK. Alternatively, we could
have used an unsupported MCLK and, with the help of the previous patch,
we would have ended up with no restrictions applied on es8316_pcm_startup().
