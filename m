Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE54EDAA6
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B2F81743;
	Thu, 31 Mar 2022 15:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B2F81743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648733811;
	bh=cyk9vNIO87cQrdRTFwmV9ctNt3fvnwlMz5JVZqWzBbI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZyGnmEzlHWnoBGeuXrKhzxak/wzc7GCtYaDmVG7j7zleUtLDr5wkpW/SBAChXXyEr
	 1L8npInpSsumBSI4fyqobGVQao+BvHYpHNaX/tkdaL1jsxCahkQndB3pacjw37dm3X
	 sNGvPWxiV4n9dzVxEgGjTAS2PyEpx55ztjCHhGqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F510F80227;
	Thu, 31 Mar 2022 15:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D904CF8020D; Thu, 31 Mar 2022 15:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A33DF800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A33DF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="gI3e0WUc"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id E5ECF1F4688D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648733729;
 bh=cyk9vNIO87cQrdRTFwmV9ctNt3fvnwlMz5JVZqWzBbI=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=gI3e0WUcAQOpQKikV9eVbvPEmkrGJvFFlwoTtWxBI9zDa++2cwPCMl6l6WLC+KsJS
 lTQGIO1wo4MiBu7V9xPZ6dHwKMt7xHL6Olcd2RALErpCq41nHSa0gzv9wpXHhN92or
 naf3tEf0ovci+1cUJ2v9syX3fspRWNVuI8PiTGAIDeNznGdiA8SAmZDHONKc6l6kNS
 0M1QOP4j1mz8LGfZ8SCxIxeeqsglFGLjHPpjMYn52NyU6cZU1KpTSVavwPHQ2NM8h5
 gN1UNiOAq8DEVORF+qtelEGF6Rs82n2gr4yFNe2JvTllzJwmkYUv4wxtZfvXCNXAoo
 oUyf0oBxPxxqw==
Message-ID: <3e3b223f-7d05-f439-625a-a15afb44b95f@collabora.com>
Date: Thu, 31 Mar 2022 10:35:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
 <CAOMZO5D4_WboF4S0dgSLD1m15a13c2irK2yjDV4C77_Wb15=2w@mail.gmail.com>
 <d9f14221-b0ad-9853-e9c8-a35d9111549b@collabora.com>
In-Reply-To: <d9f14221-b0ad-9853-e9c8-a35d9111549b@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

Hi Fabio, Shawn,

Can we merge this please?

Thanks,
Ariel

On 3/25/22 10:56, Ariel D'Alessandro wrote:
> Hi Fabio,
> 
> On 3/25/22 10:49, Fabio Estevam wrote:
>> On Wed, Mar 23, 2022 at 10:56 AM Ariel D'Alessandro
>> <ariel.dalessandro@collabora.com> wrote:
>>>
>>> BSH SystemMaster (SMM) S2 PRO board comes with an audio card based on
>>> tlv320aic31xx family codec.
>>>
>>> The audio card exposes two playback devices, one of them using the EASRC
>>> (Enhanced Asynchronous Sample Rate Converter) module. Note that this
>>> would require SDMA and EASRC firmware in order to work.
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>>> ---
>>
>> What are the changes in v4?
> 
> * Fixed the sound-tlv320aic31xx audio-codec property to point to the
> right codec node <&tlv320dac3101>
> 
> * Reordered properties in tlv320dac3101, and removed clock-names property.
> 
>>
>> I see you removed 'clock-names' so this looks good:
> 
> Indeed.
> 
>>
>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Thanks!
