Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E0F5E45
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 10:47:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC4C1678;
	Sat,  9 Nov 2019 10:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC4C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573292836;
	bh=5/OZvxem15MNvCbqwW9U7q7KEy8QlTKWathZct0h4xY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRqBERF/DKI0lehlfMh1heuEigp1k/JCY+KyWKW/zbHUOqLfydsoLN3aMX2EUDioL
	 AUjNA/wMJ7+OPYFp+QexfjOSZzDZPInkMVpODgYdN7Agid0DoRsR9n/2PuHfKIuA40
	 27tgh43Bb3+8R76XOs5sAkMarRY3yIL4Rm3y0DBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB53F8060F;
	Sat,  9 Nov 2019 10:44:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD599F800F3; Fri,  8 Nov 2019 18:14:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59BD9F800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 18:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59BD9F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="babhKa+H"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6F442232FE;
 Fri,  8 Nov 2019 18:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1573233255;
 bh=xz7VneuhDNhyAxfNOVJ8pZ6Cwxs/reD73VEhmpLDF3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=babhKa+HTcaMZkgBuuNaR3ZSqe/1/lPEH1pezi5o5Z4QQeJcF0IiBA/fbsFPsFHC9
 paTz4ex+4+eodTwv5AOP1XhGaJ7nNbfys2LItBQVK72GWq0xbOSiZynvO8B01NLG+u
 a2Afb4Mag8fthrFsoaqk/f1PUdgNK2aD4NCV5HRU=
MIME-Version: 1.0
Date: Fri, 08 Nov 2019 18:14:15 +0100
From: Michael Walle <michael@walle.cc>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20191108160704.GA10439@ediswmail.ad.cirrus.com>
References: <20191107231548.17454-1-michael@walle.cc>
 <20191108160704.GA10439@ediswmail.ad.cirrus.com>
Message-ID: <1ce127111686a80fe1461d49bac50f86@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.101.4 at web
X-Virus-Status: Clean
X-Mailman-Approved-At: Sat, 09 Nov 2019 10:43:39 +0100
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8904: configure sysclk/FLL
	automatically
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am 2019-11-08 17:07, schrieb Charles Keepax:
> On Fri, Nov 08, 2019 at 12:15:48AM +0100, Michael Walle wrote:
>> This adds a new mode WM8904_CLK_AUTO which automatically enables the 
>> FLL
>> if a frequency different than the MCLK is set.
>> 
>> These additions make the codec work with the simple-card driver in
>> general and especially in systems where the MCLK doesn't match the
>> requested clock.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> +static int wm8904_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>> +			     unsigned int freq, int dir)
>> +{
>> +	struct snd_soc_component *component = dai->component;
>> +	struct wm8904_priv *priv = snd_soc_component_get_drvdata(component);
>> +	unsigned long mclk_freq;
>> +	int ret;
>> +
>> +	switch (clk_id) {
>> +	case WM8904_CLK_AUTO:
>> +		mclk_freq = clk_get_rate(priv->mclk);
>> +		/* enable FLL if a different sysclk is desired */
>> +		if (mclk_freq != freq) {
>> +			priv->sysclk_src = WM8904_CLK_FLL;
>> +			ret = wm8904_set_fll(dai, WM8904_FLL_MCLK,
>> +					     WM8904_FLL_MCLK,
>> +					     clk_get_rate(priv->mclk), freq);
> 
> minor nit, might as well use mclk_freq rather than calling
> clk_get_rate again, other than that though I think this looks
> good.

whoops, I was too tired then. That was the whole intention of using the 
mclk_freq variable.. so yes, I'll fix that.

-michael
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
