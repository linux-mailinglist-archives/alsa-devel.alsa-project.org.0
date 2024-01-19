Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B183254A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:49:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 698CD7F1;
	Fri, 19 Jan 2024 08:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 698CD7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705650595;
	bh=H3Uf7Js0UOTDnU9yKusaLcwDSQM/Nh+Ict3ZoBItJfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LCLsm8fD9gvWIlBVqEAu3NaFpBJFU6+zCUMRKy37PnZwqP+lHBZ+XL/y7m+jzZ+Bv
	 qT0JiBkd718SQcGL4WtJsjc/kCqxcazvuVRqzc5M8sozv9c627iTY0IzP9MpyL++ZD
	 sjNe/a/gg+puJ4/rL4HHh/yXzyi41Fp3Si9l78tY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E58F8056F; Fri, 19 Jan 2024 08:49:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F56F80563;
	Fri, 19 Jan 2024 08:49:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B28DFF801F5; Fri, 19 Jan 2024 08:49:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4852F80074
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4852F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZardnbwE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0E15EB8172F;
	Fri, 19 Jan 2024 07:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636ADC433C7;
	Fri, 19 Jan 2024 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705650553;
	bh=H3Uf7Js0UOTDnU9yKusaLcwDSQM/Nh+Ict3ZoBItJfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZardnbwEoHWHVe1huoYuqGjGy5RMTQ2xqcP/ggeD/uYY40AHqvma5Q8pJRCDUHTbT
	 +NBWsSD4TRLpUKaainwQgZUqyhdKENDQriHmg5bNwAlh84Kx04wpUac6uxAq+p91CE
	 WOgNClmK7U+Bt5q2VKlDMfxxHxsvZm3dsjw2e+cM+LOTrg7eCjqqL0bc7GpHDusHu7
	 mwFza30HiIXeORgiJK6rpPlF0wU4j2Msx4bCK57AkIdN4BSe7SXNw8oBfIyqX6uHO4
	 mEHvr5bCZbgDAoUwrS6QnBkJYTbwSEQqtfFU5NufqDwYGaNMESR8ezW9+oRQMuoCOs
	 4llD1WaH6oxzw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQjcv-0004VT-38;
	Fri, 19 Jan 2024 08:49:22 +0100
Date: Fri, 19 Jan 2024 08:49:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/5] ASoC: codecs: wsa883x: fix PA volume control
Message-ID: <ZaopgcKTV0ePamsC@hovoldconsulting.com>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-2-johan+linaro@kernel.org>
 <3494d23f-2a56-4f13-a619-e240d208d300@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3494d23f-2a56-4f13-a619-e240d208d300@linaro.org>
Message-ID-Hash: PNDNL5GISOOKP2BSIFS4FSEVHJRDW4AE
X-Message-ID-Hash: PNDNL5GISOOKP2BSIFS4FSEVHJRDW4AE
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 07:14:03AM +0000, Srinivas Kandagatla wrote:
> On 18/01/2024 16:58, Johan Hovold wrote:
> > The PA gain can be set in steps of 1.5 dB from -3 dB to 18 dB, that is,
> > in fifteen levels.
> > 
> > Fix the range of the PA volume control to avoid having the first
> > sixteen levels all map to -3 dB.

> TBH, we really don't know what unsupported values map to w.r.t dB.

I've verified experimentally that all values in the range 0..16 map to
the same lowest setting, and only at level 17 is there a perceivable
difference in gain.

And the datasheet you have access to describes the range as -3 to 18 dB.

> > Note that level 0 (-3 dB) does not mute the PA so the mute flag should
> > also not be set.
> > 
> > Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
> > Cc: stable@vger.kernel.org      # 6.0
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >   sound/soc/codecs/wsa883x.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> > index cb83c569e18d..32983ca9afba 100644
> > --- a/sound/soc/codecs/wsa883x.c
> > +++ b/sound/soc/codecs/wsa883x.c
> > @@ -1098,7 +1098,7 @@ static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
> >   	return 1;
> >   }
> >   
> > -static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, -300);
> > +static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, 0);
> >   
> >   static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
> >   				struct snd_ctl_elem_value *ucontrol)
> > @@ -1239,7 +1239,7 @@ static const struct snd_soc_dapm_widget wsa883x_dapm_widgets[] = {
> >   
> >   static const struct snd_kcontrol_new wsa883x_snd_controls[] = {
> >   	SOC_SINGLE_RANGE_TLV("PA Volume", WSA883X_DRE_CTL_1, 1,
> > -			     0x0, 0x1f, 1, pa_gain),
> > +			     0x1, 0xf, 1, pa_gain),
> 
> gain field in register is Bit[5:1], so the max value of 0x1f is correct 
> here. However the range of gains that it can actually support is only 0-15.
> 
> If we are artificially setting the max value of 0xf here, then somewhere 
> we should ensure that Bit[5] is set to zero while programming the gain.

Good point, but the reset value for that bit is 0 so we should be good
here.

I'll also update patch 2/5 so that we explicitly set this register on
probe in the unlikely event that something else has left that bit set
before Linux boots (and the powerdown at probe isn't sufficient).
 
> Whatever the mixer control is exposing is clearly reflecting what 
> hardware is supporting.

No, not at all. The range exported to user space is all wrong and this
breaks volume control in pulseaudio which expects the dB values to
reflect the hardware.

If changing the range is a concern (as Mark mentioned), we at least have
to fix the dB values.

And if this is something that may differ between the WSA883x variants
currently handled by the driver then that needs to be taken into account
too. I only have access to wsa8835 (and no docs, unlike you).

Johan
