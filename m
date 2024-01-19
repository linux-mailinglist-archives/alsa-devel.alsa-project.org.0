Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C8832574
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 09:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16F6820;
	Fri, 19 Jan 2024 09:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16F6820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705651848;
	bh=sweX0lH8wV/qg+9x/p+aQgBhduMihO9OquglHodEy6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YO/HqsCXShJawocSaZk/iYHkVncCiPPMyev7EeYHP/NW/6Quu9cSj/tY/b6Udn3GM
	 CJHhOJAwNVPTPF7rp+6iOeeZrrLmD0GKrOnE3Zj8SHaXRyYH0Z8RYbs3HF781Oi6aW
	 4yjsAStlxtoGIqF+z59LCOdIxJqxrl8IH0pNPl3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 769C4F80580; Fri, 19 Jan 2024 09:10:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E42F80074;
	Fri, 19 Jan 2024 09:10:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE920F80236; Fri, 19 Jan 2024 09:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64386F800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 09:10:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64386F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q1GJpxsh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D6B2CE1B33;
	Fri, 19 Jan 2024 08:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED20C433F1;
	Fri, 19 Jan 2024 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705651804;
	bh=sweX0lH8wV/qg+9x/p+aQgBhduMihO9OquglHodEy6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1GJpxshVNXbcnh+rHok44XHEi1GbciwMQyriaMljWZFwGl4NuvANC2ciTKw6Q9cE
	 hwlcSSozhnAvGMVhQpmBpaIIa7gknJZyCgOznuRK52AWLr+Wq3azpdsofOO/1WoYj7
	 h354lyLNSg7ewFAH3Vbgdz4gQNifLukLdqTmIHC3KbWVwS/lBrGkSAAILf1AA5ESFk
	 RDlrxeExrwTtT+aleDaGhX4sxKYlXyAOCVT+yH45ChkypZaIBM3rgMCRSmtbCxgt1Z
	 h0N9d4RqiTT8gmzQkYknAJBH7NioLfYjp1wIrRKHVjK9ydtBcZISqi0eW68RAGeajL
	 pRbtzTGNveEbg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQjx7-0004be-0S;
	Fri, 19 Jan 2024 09:10:13 +0100
Date: Fri, 19 Jan 2024 09:10:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 4/5] ASoC: codecs: lpass-wsa-macro: fix compander
 volume hack
Message-ID: <ZaouZXdxWv3oahDl@hovoldconsulting.com>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-5-johan+linaro@kernel.org>
 <6d8f77e2-7257-4a6c-96de-fd3f1c821b51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d8f77e2-7257-4a6c-96de-fd3f1c821b51@linaro.org>
Message-ID-Hash: CLPBYNPIC43BQLAWQ7CKTKJOVUELY4XX
X-Message-ID-Hash: CLPBYNPIC43BQLAWQ7CKTKJOVUELY4XX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLPBYNPIC43BQLAWQ7CKTKJOVUELY4XX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 07:45:45AM +0000, Srinivas Kandagatla wrote:
> On 18/01/2024 16:58, Johan Hovold wrote:
> > The LPASS WSA macro codec driver is updating the digital gain settings
> > behind the back of user space on DAPM events if companding has been
> > enabled.
> > 
> > As compander control is exported to user space, this can result in the
> > digital gain setting being incremented (or decremented) every time the
> > sound server is started and the codec suspended depending on what the
> > UCM configuration looks like.
> > 
> > Soon enough playback will become distorted (or too quiet).
> > 
> > This is specifically a problem on the Lenovo ThinkPad X13s as this
> > bypasses the limit for the digital gain setting that has been set by the
> > machine driver.
> > 
> > Fix this by simply dropping the compander gain offset hack. If someone
> > cares about modelling the impact of the compander setting this can
> > possibly be done by exporting it as a volume control later.
> > 
> > Note that the volume registers still need to be written after enabling
> > clocks in order for any prior updates to take effect.
> > 
> > Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> > Cc: stable@vger.kernel.org      # 5.11
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >   sound/soc/codecs/lpass-wsa-macro.c | 7 -------
> >   1 file changed, 7 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> > index 7e21cec3c2fb..6ce309980cd1 100644
> > --- a/sound/soc/codecs/lpass-wsa-macro.c
> > +++ b/sound/soc/codecs/lpass-wsa-macro.c
> > @@ -1584,7 +1584,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
> >   	u16 gain_reg;
> >   	u16 reg;
> >   	int val;
> > -	int offset_val = 0;
> 
> TBH, as discussed in my previous review we should just remove 
> spkr_gain_offset and associated code path.

I don't understand what you are referring to. Are you talking about the
"ear_spkr_gain" perhaps?

I left that hack in place for now, as it's not currently an issue. It
could perhaps be removed later.

Johan
