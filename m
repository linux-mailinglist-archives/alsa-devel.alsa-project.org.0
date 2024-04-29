Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915F8B5C05
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 16:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D4C826;
	Mon, 29 Apr 2024 16:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D4C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714402511;
	bh=XREl17CHloVH9LS2iww9neF4mNAICGbwb3N+eWBXfvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tDclb4LIvRhyOxImgqs2CM3F1sazZCNeaWkwQOwkphxQAz4YwzpcsCHw44i6i64AO
	 YXPoYvrB8uLEcs4yB1fTqlQygpmy5yn7/58MZXSXOFiz1zGQz8HQVy8WDzPMl4BaOq
	 lz9z9CU4y+tEja3B14ryTCOohkDcYuv+ImNZxM9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0821FF805AD; Mon, 29 Apr 2024 16:54:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF33F805A0;
	Mon, 29 Apr 2024 16:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A43EDF8028D; Mon, 29 Apr 2024 16:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 976ECF8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 16:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 976ECF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XXPPQqCn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EA824CE0C2F;
	Mon, 29 Apr 2024 14:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD231C113CD;
	Mon, 29 Apr 2024 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714402449;
	bh=XREl17CHloVH9LS2iww9neF4mNAICGbwb3N+eWBXfvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXPPQqCntLwoiOXb9YO5bMX4zMDr/YgPfkLPH/CeWkd4WQp19+6iP9ASUkdN+fcbl
	 ONk91QPa68V0YBAdAAX5GsV4fxcm1coYso4AP2MFTfthCIn9/V7jsuVdKnIheTDICp
	 duOJVahxniXuCzTa1CXXC1pV1kx69bsrQ9cPTOK8pC2/Xj7hepPyF0ksF6kcaRkw3O
	 G1ilwJOwpKRwIsCGuSJAVpsRmXikTIM1i2k4k7TnSIRjuPs+aeUlgRUiqORS6gyx7A
	 FmcZmvAnukW03FMqKCYdktLntOiIVndXDEpbU+XpXHbDp0wG4ByQtWwoRAdcz0ONrb
	 zV1/GjDNwyCMA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s1SOP-000000005GI-05vD;
	Mon, 29 Apr 2024 16:54:09 +0200
Date: Mon, 29 Apr 2024 16:54:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
Message-ID: <Zi-0kSU6TMcev05r@hovoldconsulting.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
 <ZiejT5yddioQ8upR@hovoldconsulting.com>
 <b9d0e2fd-069c-439c-a85f-1e99bf9018c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d0e2fd-069c-439c-a85f-1e99bf9018c3@linaro.org>
Message-ID-Hash: PKUJLFDA7WAXYQVWSZLD3UC34IYAFGIA
X-Message-ID-Hash: PKUJLFDA7WAXYQVWSZLD3UC34IYAFGIA
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKUJLFDA7WAXYQVWSZLD3UC34IYAFGIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 23, 2024 at 04:55:32PM +0100, Srinivas Kandagatla wrote:
> On 23/04/2024 13:02, Johan Hovold wrote:
> > On Mon, Apr 22, 2024 at 02:43:52PM +0100, Srinivas Kandagatla wrote:
> >   
> >>   static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
> >>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> >>   	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> >> +	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
> >> +	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
> >> +	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),
> > 
> > Shouldn't these be split in dedicated HDMI and DP jacks too? What if you
> > have a machine with HDMI and DP jacks which would otherwise both claim
> > "HDMI/DP0"?
> 
> These map to the Jack's added as part of qcom_snd_dp_jack_setup and 
> belong to DISPLAY_PORT_RX_0, DISPLAY_PORT_RX_1, DISPLAY_PORT_RX_2.
> 
> If its going via USB-C DP controller it will be either DP or an HDMI ?

It will always be DP out of the machine even if an adapter can convert
to HDMI internally.

The DRM ports are called "DP-1" and "DP-2" so it seems we should match
that.

> This is the most common naming for the USB-C DP/HDMI jack events.

It looks like some Intel machines use names like "HDMI/DP, pcm=%d Jack"
(with a pcm device number), but we also have "DP Jack". Not sure which
are are used with USB-C, though. (Or if the former actually support HDMI
altmode.)

> Qualcomm LPASS in some older SoCs had a dedicated HDMI interface which 
> is different to this one.
> 
> Usual Other ways to connect HDMI is via external HDMI Bridge using I2S 
> interface which totally different to this DP interface.

Sure, but if there's ever a design with such a port then it will be
called "HDMI Jack" and then the "HDMI in "HDMI/DP0 Jack" is unnecessary
and confusing when it is always DP out.

Johan
