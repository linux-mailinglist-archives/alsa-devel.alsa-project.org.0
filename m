Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E822884B861
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 15:51:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52297201;
	Tue,  6 Feb 2024 15:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52297201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707231073;
	bh=TRNOZ2E0jVFr1j4Jk3WeOB19Tmkl0WCO11cXpH5xx0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A8p7QaYOfOgZ/OvZeWhIKbSmYUtDxsERfNLSNqGJK/67T+BM9V7kEK18CcU/+ebf4
	 f8E6a2qP32t3XkEyQuYrPp7RqGzdMcEOIlLBrZsqGZlBHk42tfQ96PJpigu3PQ6JKz
	 Osk4RBeSwhm+P7FZ5ZQb9dzQBDZOFcG4XnU6Sn/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85EF7F8057C; Tue,  6 Feb 2024 15:50:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B17A1F8057C;
	Tue,  6 Feb 2024 15:50:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FDD2F801EB; Tue,  6 Feb 2024 15:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70BA3F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 15:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70BA3F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=kLFOOydV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FBF461536;
	Tue,  6 Feb 2024 14:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742AAC433C7;
	Tue,  6 Feb 2024 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707231024;
	bh=TRNOZ2E0jVFr1j4Jk3WeOB19Tmkl0WCO11cXpH5xx0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLFOOydVz8hY/tZlvFGGUr5yxRLIh5a3MMj5zIRocdMkLDC1jdALkpy9OA3M9F8lD
	 uRpBnMXQLY+8ovJ86Mu/N+WBHiVZCawbZRCXM749gkLpVYkyUjNoqP4OZx2B7X+6le
	 95uqhpXCNWzr+Hy9rLJ6CQwMVmoMMdIisEZbF31o=
Date: Tue, 6 Feb 2024 14:50:21 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
	robh+dt@kernel.org, konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v13 32/53] ALSA: usb-audio: Check for support for
 requested audio format
Message-ID: <2024020617-limb-name-f852@gregkh>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-33-quic_wcheng@quicinc.com>
 <87wmrhvir7.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmrhvir7.wl-tiwai@suse.de>
Message-ID-Hash: LD5M24C46TYJWHBYXE5UQHLDDB4B7MH6
X-Message-ID-Hash: LD5M24C46TYJWHBYXE5UQHLDDB4B7MH6
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LD5M24C46TYJWHBYXE5UQHLDDB4B7MH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 06, 2024 at 02:12:44PM +0100, Takashi Iwai wrote:
> On Sat, 03 Feb 2024 03:36:24 +0100,
> Wesley Cheng wrote:
> > 
> > Allow for checks on a specific USB audio device to see if a requested PCM
> > format is supported.  This is needed for support when playback is
> > initiated by the ASoC USB backend path.
> > 
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Just cosmetic:
> 
> > +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> > +			struct snd_pcm_hw_params *params, int direction)
> > +{
> > +	struct snd_usb_audio *chip;
> > +	struct snd_usb_substream *subs;
> > +	struct snd_usb_stream *as;
> > +	const struct audioformat *fmt;
> > +
> > +	/*
> > +	 * Register mutex is held when populating and clearing usb_chip
> > +	 * array.
> > +	 */
> > +	mutex_lock(&register_mutex);
> > +	chip = usb_chip[card_idx];
> > +	if (!chip) {
> > +		mutex_unlock(&register_mutex);
> > +		return NULL;
> > +	}
> > +
> > +	if (enable[card_idx]) {
> > +		list_for_each_entry(as, &chip->pcm_list, list) {
> > +			subs = &as->substream[direction];
> > +			fmt = snd_usb_find_substream_format(subs, params);
> > +			if (fmt) {
> > +				mutex_unlock(&register_mutex);
> > +				return as;
> > +			}
> > +		}
> > +	}
> > +	mutex_unlock(&register_mutex);
> 
> I prefer having the single lock/unlock call pair, e.g.
> 
> 	struct snd_usb_stream *as, *ret;
> 
> 	ret = NULL;
> 	mutex_lock(&register_mutex);
> 	chip = usb_chip[card_idx];
> 	if (chip && enable[card_idx]) {
> 		list_for_each_entry(as, &chip->pcm_list, list) {
> 			subs = &as->substream[direction];
> 			if (snd_usb_find_substream_format(subs, params)) {
> 				ret = as;
> 				break;
> 			}
> 		}
> 	}
> 	mutex_unlock(&register_mutex);
> 	return ret;
> }
> 
> In this case, we shouldn't reuse "as" for the return value since it
> can be non-NULL after the loop end.

Why not just use guard(mutex) for this, making it all not an issue?

thanks,

greg k-h
