Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2F7D644C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 10:00:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F154B7F1;
	Wed, 25 Oct 2023 09:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F154B7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698220824;
	bh=Exk/2FJNHLJmOwayR0cTV3bFKynZFYvPS0mRbk6OXR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sCDRG5nJ0KvV6x4H4BshZH1l8kA1NcCwwU5RzyYvM9+IQAG9ridujDWtpdz8iLQ7+
	 fzPO2PW+PuVnF2caTjs1QqtVzQPthbT8nVaUI9lIEMa9BVfs9I9jlQH9LR0bS3xjMC
	 YHBYPBkfaipmkwM7Q7Got3iiWvFBUz/osujZG/uc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BE39F80224; Wed, 25 Oct 2023 09:59:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6503F80157;
	Wed, 25 Oct 2023 09:59:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0132BF80165; Wed, 25 Oct 2023 09:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90C38F8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 09:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C38F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UwhmDNy1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7599F61DAE;
	Wed, 25 Oct 2023 07:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B2FC433C7;
	Wed, 25 Oct 2023 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698220614;
	bh=Exk/2FJNHLJmOwayR0cTV3bFKynZFYvPS0mRbk6OXR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwhmDNy1YhC7LZRNnONdznNEqS13t6/npNxeKplZvWm9OhBP5X3P5PAoBIA5HzN2j
	 rTUvHGun1GFIiTf103DsxT6tvezo8NHkLIJdpaAKda18J1DwR2lHkc3uJL/z0PrVXi
	 b53cRZ8OcXqeZM4O6qiSzWnP8eqhKn6xag8mDocVKaSqQDKPWg5V2LDA6GeYgU3qGq
	 5R54vAwlS953EZrg1Wm7REpk1HvlBlrTplKU+QlcQwAVh2JVyQphZZMpiY66Du5YzM
	 JIRLA7gdSVuIXbqw54wPztppmheE8tPm2Jzd5zWEdqkGXIk29fKxTR2fMdPkmA6qyh
	 cKwUncCxWZVOQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvYlM-00088u-2i;
	Wed, 25 Oct 2023 09:57:13 +0200
Date: Wed, 25 Oct 2023 09:57:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	johan+linaro@kernel.org, steev@kali.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
Message-ID-Hash: OYCMT7RIBXZXU2SXXLHCAAXZVZFQNMJZ
X-Message-ID-Hash: OYCMT7RIBXZXU2SXXLHCAAXZVZFQNMJZ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYCMT7RIBXZXU2SXXLHCAAXZVZFQNMJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On Fri, Mar 24, 2023 at 06:44:40AM +0000, Srinivas Kandagatla wrote:
> On 23/03/2023 17:07, Mark Brown wrote:
> > On Thu, Mar 23, 2023 at 04:44:02PM +0000, Srinivas Kandagatla wrote:
> >> In the current setup the PA is left unmuted even when the
> >> Soundwire ports are not started streaming. This can lead to click
> >> and pop sounds during start.
> >> There is a same issue in the reverse order where in the PA is
> >> left unmute even after the data stream is stopped, the time
> >> between data stream stopping and port closing is long enough
> >> to accumulate DC on the line resulting in Click/Pop noise
> >> during end of stream.
> > 
> > Wow, that hardware sounds *super* fragile.
> > 
> >> Moving the mute/unmute to trigger stop/start respectively seems to
> >> help a lot with this Click/Pop issues reported on this Codec.
> > 
> >> +static int wsa883x_trigger(struct snd_pcm_substream *s, int cmd,
> >> +			   struct snd_soc_dai *dai)
> >> +{
> >> +	switch (cmd) {
> >> +	case SNDRV_PCM_TRIGGER_START:
> >> +	case SNDRV_PCM_TRIGGER_RESUME:
> >> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> >> +		wsa883x_digital_mute(dai, false, 0);
> >> +		break;
> > 
> >>   static const struct snd_soc_dai_ops wsa883x_dai_ops = {
> >> +	.startup = wsa883x_startup,
> >>   	.hw_params = wsa883x_hw_params,
> >>   	.hw_free = wsa883x_hw_free,
> >> -	.mute_stream = wsa883x_digital_mute,
> >> +	.trigger = wsa883x_trigger,

> > This feels like we should be doing it at the framework level, either
> > tightening up where the mute happens in general or having some option
> > that devices can select if they really need it.

> That makes more sense, I can give that a try.

I understand Srini has looked at this but has not yet been able to come
up with a generic implementation. Would it be possible to merge the two
codec fixes as an interim workaround for 6.7?

Without the wsa883x patch there's a loud crackling scary noise when
starting a stream on the Lenovo ThinkPad X13s which users will hit now
that they can run mainline on this machine.

	https://lore.kernel.org/lkml/20230323164403.6654-4-srinivas.kandagatla@linaro.org/

I've been using this one myself for the past seven months without any
issues (even if there's still a faint click when stopping a stream):

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Getting this backported at least to 6.5 where sound support for the X13s
was added would be great too.

Johan
