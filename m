Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C0983256A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 09:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 909C3827;
	Fri, 19 Jan 2024 09:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 909C3827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705651619;
	bh=WPQT+tS6NSneAp94KCLXM+GXH9VM9CTH1xf/mPDf+Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nAkJSGQ1h/nU27sPtx64RQYCjMTmuaHjhBrMGED0UPISwVLneGHDQajk+zrJZrhPd
	 ciRcmj/MuzYuBRo8Ytso+RosRXnmtrVaWu1pWidDJg126quZZTvH5JCGBxGL+sXGL/
	 ysMgKik5PMcHOF3z8b2SMKyNvtApcbQL+W81CiTk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA34F801F5; Fri, 19 Jan 2024 09:06:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16B2FF80548;
	Fri, 19 Jan 2024 09:06:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DECAF801F5; Fri, 19 Jan 2024 09:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C1B0F800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 09:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1B0F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iLqIgOTb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4FECCE0222;
	Fri, 19 Jan 2024 08:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7EFC433C7;
	Fri, 19 Jan 2024 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705651566;
	bh=WPQT+tS6NSneAp94KCLXM+GXH9VM9CTH1xf/mPDf+Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLqIgOTbpKObnRHe8jUnzJO4m+SsNJiE3A1ihbhfIGWonvm+wVIQRsxR2AhBKYE1P
	 phOTnPN3oVklYuHkuUP/zNTpo0+39gUqLF9/x+Md8NW7JKBJM3aEgKbihpDm0jrydt
	 I2wbVIJu0S8VA05wF5mX3fep8pJCCsHRSqOZjLS2rMhzmtFwyCPjmVLtiKI1xcAOK2
	 gznz2bVWsbpFg5/PwcP3W3ncSiFx/yGLVAy9MSEGaxj03+CDQFOoeRZaCU2svbYBsO
	 nQC2TbmJsXbsZFRh0q4ENTIaf1KdUJHL/qrQ+l8vcb7/RWwRdftF52RPsVl/7Bvmnr
	 i/O/OsMpH8slg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQjtG-0004aL-2O;
	Fri, 19 Jan 2024 09:06:14 +0100
Date: Fri, 19 Jan 2024 09:06:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <ZaotdsEutSLfbD3x@hovoldconsulting.com>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-4-johan+linaro@kernel.org>
 <ac6eb9f9-9a5c-472d-9a57-ee509d9589f9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac6eb9f9-9a5c-472d-9a57-ee509d9589f9@linaro.org>
Message-ID-Hash: RVS3ABC2OE6UA66MXFFGNJXRR7ARKNXP
X-Message-ID-Hash: RVS3ABC2OE6UA66MXFFGNJXRR7ARKNXP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVS3ABC2OE6UA66MXFFGNJXRR7ARKNXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 07:37:14AM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 18/01/2024 16:58, Johan Hovold wrote:
> > The UCM configuration for the Lenovo ThinkPad X13s has up until now
> > been setting the speaker PA volume to -3 dB when enabling the speakers,
> > but this does not prevent the user from increasing the volume further.
> > 
> > Limit the PA volume to -3 dB in the machine driver to reduce the risk of
> > speaker damage until we have active speaker protection in place.
> > 
> > Note that this will probably need to be generalised using
> > machine-specific limits, but a common limit should do for now.
> > 
> > Cc: stable@vger.kernel.org	# 6.5
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >   sound/soc/qcom/sc8280xp.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index ed4bb551bfbb..a19bfa354af8 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -32,12 +32,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
> >   	case WSA_CODEC_DMA_RX_0:
> >   	case WSA_CODEC_DMA_RX_1:
> >   		/*
> > -		 * set limit of 0dB on Digital Volume for Speakers,
> > -		 * this can prevent damage of speakers to some extent without
> > -		 * active speaker protection
> > +		 * Set limit of 0 dB on Digital Volume and -3 dB on PA Volume
> > +		 * to reduce the risk of speaker damage until we have active
> > +		 * speaker protection in place.
> 
> I would prefer a 0dB here instead of -3dB, this could become issue if we 
> are testing speakers without any pluseaudio or any software 
> amplification. ex: console

I know you want that, but I'm not willing to be the one raising the
default volume that people have been using so far and that you have
(unknowingly) used in your tests to verify that you did not break your
speakers.

Once you've run some more tests we can easily raise this limit.

I just want to make sure we have something safe in place ASAP now that
people will soon be able to change the hardware volume control more
easily (i.e. with the fixed UCM files).

> >   		 */
> >   		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
> >   		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
> > +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 1);
> > +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 1)
> 
> It would be nice to consider using component->name_prefix here.

That can possibly be done later.

Johan
