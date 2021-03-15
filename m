Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D833C002
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 16:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3284F171C;
	Mon, 15 Mar 2021 16:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3284F171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615822539;
	bh=2M8wUMxs7zXDodY95569qAYHWHyO922dSOBjft62t7Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbGE5a3cEOIKZ6+Sx/wb2fLHI1t5x8MshARV134xKlaArJfuvIilzeEnWdpg7bHDe
	 nvNyVBJCOpoIHqZKuHBYFFDzbkBIa0H9kJDj4UJNO/5s9y/WoDD7FQI2duRwgEE2BP
	 Epl6UH1j32a3i/oNYfb7ljITyWxdQYBY8VWdrWg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 512CDF801F7;
	Mon, 15 Mar 2021 16:34:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F368F80171; Mon, 15 Mar 2021 16:34:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF90F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 16:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF90F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="mytZaPrP"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3F8EA22234;
 Mon, 15 Mar 2021 16:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615822437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbVwUggcs2nPgaFEMPDtK0QUutNDv7zKU6Q26Q+MwaA=;
 b=mytZaPrP8ENcZGr8vB3Eiew0DhH1MNwSXqZNxMTTqDhYJ6EFxh5URyYP3vo6ZzHxnsF+b8
 2oNDWaxJwbNYqbSkVA1zx7Sk0NhwJBAa/hgCadBygf/llhdPs9Xp1JL5f7CMhkG7S8rcY7
 h5YkoRif7oO3DUKWJLha9CMi5VwwfrI=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 15 Mar 2021 16:33:57 +0100
From: Michael Walle <michael@walle.cc>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
References: <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
 <8cdf1cfa971945792b509a687a4de735@walle.cc>
 <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <33a5c89d15ca04ad75f9993bd5d22cb9@walle.cc>
X-Sender: michael@walle.cc
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 Mark Brown <broonie@kernel.org>, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

Am 2021-03-15 16:19, schrieb Sameer Pujar:
> On 3/15/2021 5:35 PM, Michael Walle wrote:
>> External email: Use caution opening links or attachments
>> 
>> 
>> Am 2021-03-12 14:46, schrieb Mark Brown:
>>> On Fri, Mar 12, 2021 at 01:30:02PM +0100, Michael Walle wrote:
>>> 
>>>> The card calls set_sysclk(), which eventually ends up in the codec.
>>>> The codec therefore, could figure out if it needs to configure the
>>>> clock or if it can use its internal FLL.
>>>> Is that what you mean?
>>> 
>>> Yes.
>>> 
>>>> But the set_sysclk() of the codec isn't even called, because the
>>>> card itself already tries to call clk_set_rate() on the Codec's 
>>>> MCLK,
>>>> which returns with an error [0].
>>> 
>>> OK, so I think we need to push this down a level so that the clock
>>> setting is implemented by the core/CODEC rather than by simple-card,
>>> with the helpers being something the CODEC can opt out of.
>> 
>> Sameer, it looks like the proper fix should be to add the clock
>> support to your codec.
> 
> I agree that complicated clock relationships should be handled within
> the codec itself, however MCLK rate setting depends on "mclk-fs"
> factor and this property is specified as part of
> simple-card/audio-graph-card codec subnode. Right now codec, in
> general, does not have a way to know this. The set_sysclk() callback
> takes rate argument and not the factor.

Why would you need the factor?

> Moreover the same codec is
> used by other platform vendors too and unless a new DT property is
> added for codec, runtime MCLK update based on the scaling factor
> cannot be supported.

Could you test the following:

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 67f0ab817135..7fd41f51f856 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3426,12 +3426,18 @@ static int rt5659_set_component_sysclk(struct 
snd_soc_component *component, int
  {
         struct rt5659_priv *rt5659 = 
snd_soc_component_get_drvdata(component);
         unsigned int reg_val = 0;
+       int ret;

         if (freq == rt5659->sysclk && clk_id == rt5659->sysclk_src)
                 return 0;

         switch (clk_id) {
         case RT5659_SCLK_S_MCLK:
+               ret = clk_set_rate(rt5659->mclk, freq);
+               if (ret)
+                       return ret;
                 reg_val |= RT5659_SCLK_SRC_MCLK;
                 break;
         case RT5659_SCLK_S_PLL1:

-michael

> This would mean that we will be having two
> methods to specify "mclk-fs" factor, one from
> simple-card/audio-graph-card and one from respective codec nodes,
> which does not seem ideal.
> 
> Also it does not seem consistent with the way we handle MCLK clock
> based on where it is specified.
> 
>   a) If specified in simple-card/audio-graph-card, MCLK clock
> rate/enable/disable updates are allowed.
> 
>   b) If specified in codec device node, it is not expected to touch
> the MCLK clock. This patch tried to treat it the same way as (a) does.
> Advantage of this is, all codec drivers need not explicitly handle
> MCLK, instead it is done at a central place. The platforms which use
> specific machine drivers do the same and that is why probably the
> codec driver patch was never required. It is about just setting MCLK
> clock as a factor of sample rate, whenever the factor is available. I
> understand that it is breaking your use case, but I am not sure if the
> usage of set_sysclk() is consistent. I mean, it takes the "freq"
> argument. Does it refer to MCLK rate or system-clock (sysclk) rate?
> MCLK and sysclk are not really the same when codec PLL is involved. So
> I would like to understand clearly about what "freq" argument means.
> Also when "mclk-fs" factor is specified, is it related to MCLK or
> sysclk? My understanding is that it should be strictly viewed as
> related to MCLK.
> 
> 
> Does it help if a separate helper is used for audio-graph-card with
> current change and reverting the simple-card to its previous state?
> Morimoto-san, does it affect any other users of audio-graph-card?
> 
>> 
>> I've also looked at other users of "simple-audio-card" and
>> it looks like they will break too. For example,
>> - arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>     If I'm not mistaken, this will try to set the first clock
>>     of hdmi@ff940000 there, which is "iahb".
>> - arch/arm/boot/dts/sun8i-a33.dtsi
>>     There "&ccu CLK_BUS_CODEC" of codec@1c22e00 will be changed
>> 
>> And it doesn't stop there, it also sets the first clock
>> of the CPU endpoint, which I guess just works because .set_rate
>> is a noop for the most clocks which are used there.
> 
> Yes this is a problem, unfortunately I missed checking some of the
> simple-card examples. I wonder we should be specifically looking for
> "mclk" clock here.
