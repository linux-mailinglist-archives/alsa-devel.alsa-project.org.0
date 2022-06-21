Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38755529D2
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 05:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3643282E;
	Tue, 21 Jun 2022 05:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3643282E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655783686;
	bh=0bslzVbZWTQ/52tX6rcHc5OwNsKy725y+KEMgI3XWqs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KwzxMHtWLpUV65uCBIwIbDSeAUxwH1IACNIWXiKNCfZaByKRHmvFNW1HffbWhQ1ga
	 QETp01/pBivp4bLtEK+K7F8sFg7k1Fdw36JWipGx9AyaErjSi+VfOq47dz58CAMWzK
	 CkspGdqw0nXdyWq2re0efZyk/H33pLk8nSiC9QDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D691F800E3;
	Tue, 21 Jun 2022 05:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A27AF80155; Tue, 21 Jun 2022 05:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1474DF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 05:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1474DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="OsmTWjBh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="r+UFu+TU"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ACA6F32002B6;
 Mon, 20 Jun 2022 23:53:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 20 Jun 2022 23:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1655783613; x=
 1655870013; bh=jEaH9weO9WQaC4cyD1pIEie9Rb7LuvlGt+Au5epHemY=; b=O
 smTWjBhl5zhpSUziDlExOs533T9hkbJ9Gm5vUow49Qifaj5aTPEetFDjI+TiZP2D
 1K+XoZIeguRasx6dCtrBvpYsGnQhqf9POBAK6dTEQF6SD9mb4UyAI1O5o0WQrbra
 kIWDbiFFFBFbQBV8cIVTHp4TyJNI5FpIWyFX8PWV+vnZV4DQW36b5Whcynhg7i5G
 XMKhin24nliZ2tCSFfXszwaWZ58e9x/ARMDZhT3I2OrJ9LndcLq8y6igiJumKdvv
 r23ol5tRn0c3/SCrhMq0l76JW5/q733SBMRigthux7zVg//AqVyRYppPuBmQdHTv
 CfrdqKIpLOqqhX8w/Cd1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655783613; x=
 1655870013; bh=jEaH9weO9WQaC4cyD1pIEie9Rb7LuvlGt+Au5epHemY=; b=r
 +UFu+TUhrqig1M6cwbofOfUrGMIYr+cByQ60jeKbNwjbVWeMLwegaYWDUBMt3uyM
 yGK9xA/LZfCJC818xeG0oc+ePyrnLgFD65wnrlGuPYLKhV3HmiZ+ndEgDbWNSe0a
 TOCfe8pkNxoT3NRP7ePusgrOmy8JnuLjEpkXi0Cp1wdt8bi+UNSt6+TqeCxgadLE
 jZN24iFaVTnDAXS/E2RE6ZYtLudwZodw9QfJMwZedYFxpQxHeaNWQoxNOYydgjxF
 eupkcmY1IKvOppQrYzMcqKdz6RCq/3x+RSX/iWY1ZMrdVhN9NB3ataRevUUoZb2q
 uqoVhYM85s+K0Kuis9+dw==
X-ME-Sender: <xms:vECxYsjuU5jEz7XlYnfOy_3NQjCnMbBlrUh7ihtJLS2MsGZk_BzKDg>
 <xme:vECxYlB3mhzh13l35kqZpvg8_bs3ZwxF1focjlK-wwRT4koF0XZm4l6S-SfJI5c9J
 n-KLdnfks0hb6--cg>
X-ME-Received: <xmr:vECxYkEFF0oAwW-yCVCk2Y3mIo9OobpuSbIKzhzmzpdeBSSsQSX8Ab4RynJV5KcJZf0W7HCI4Xov4ONy9ImrZtBY6PUWB1LGQwjhfNRsVrx3uuU1wpzLTLsjfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
 tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:vECxYtQOVbWl5Mhtl7G7dOIj0lfyD2rDDLf5MPi2dzxyrXnDPCfe9w>
 <xmx:vECxYpyMPWAdQzmKFyPhiaoBDl64iQ4xCj9aN4R0KnpXtZBxKkrFjQ>
 <xmx:vECxYr6iP68MTSeZIbzXw_5DgS99AAf3wfSoiViK665Ajv50uLmdtQ>
 <xmx:vUCxYpgUilpu6SvA7Y26DawDgg7OxO8SUO2dlgo6m6dkSEUlRp-cJg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 23:53:31 -0400 (EDT)
Subject: Re: [PATCH 2/3] ASoC: sun50i-codec-analog: Add support for internal
 bias
To: Mark Brown <broonie@kernel.org>
References: <20220616062554.57266-1-samuel@sholland.org>
 <20220616062554.57266-3-samuel@sholland.org> <YqrpxWrnaqqYWaGC@sirena.org.uk>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <743a2629-f1a4-a12a-a7c0-90a2a28b68b4@sholland.org>
Date: Mon, 20 Jun 2022 22:53:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <YqrpxWrnaqqYWaGC@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On 6/16/22 3:28 AM, Mark Brown wrote:
> On Thu, Jun 16, 2022 at 01:25:53AM -0500, Samuel Holland wrote:
> 
>> +static int sun50i_a64_codec_probe(struct snd_soc_component *component)
>> +{
>> +	struct sun50i_codec_analog *codec = snd_soc_component_get_drvdata(component);
>> +
>> +	regmap_update_bits(component->regmap, SUN50I_ADDA_JACK_MIC_CTRL,
>> +			   BIT(SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN),
>> +			   codec->internal_bias_resistor <<
>> +				SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN);
>> +
>> +	return 0;
>> +}
> 
> It doesn't make much practical difference but is there any reason this
> can't be done in the main device probe?

There's no particular reason, and doing it in the device probe would be much
simpler. I'll do that for v2.

Regards,
Samuel
