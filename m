Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4C84B616
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 14:13:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9AAD84A;
	Tue,  6 Feb 2024 14:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9AAD84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707225209;
	bh=pQ5978DNg56uJKXZdg/gf4ds5wQ+oWnn70I2+3ozUwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l8vxVsak234OmUObq8C9zXKcDH5kyT05XeOD0QdN/Gw18lgvmIuG9XYCzHLZn34d2
	 HCTVz03/hkL3eh3Kj7DxfWAR5J+i27IuvcjzUqKLJxXZw/XUIeqPyJhFpg3Hb+rwHS
	 8HTWgyvHJ64y6E6EeDU4PGYG6F04cqq5ENCkQ598=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 382B6F805AE; Tue,  6 Feb 2024 14:12:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97A89F80548;
	Tue,  6 Feb 2024 14:12:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA114F801EB; Tue,  6 Feb 2024 14:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38B8CF8016E
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 14:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B8CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nzRqkNa9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xJkjNn/l;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nzRqkNa9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xJkjNn/l
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45FA121F23;
	Tue,  6 Feb 2024 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707225169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pu0AmyhNLblBGibwDuGJkfaRqWe4VLl/6YMlZsow0qs=;
	b=nzRqkNa9xazo+VgyphXV+yGCSIvuhLB7QRfansFESogku2rqIFhrJ29YwNG/odg7xHZJeL
	pVSS7Q6U4QQGhO389T7FaAKxsyPi8WPslGHa/XfZ80qfVaQFD0s5o2AIQ5ybWlXPDzgQNe
	YF3QOT2yvdQFM+Af+oTsPzNhEoGwNYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707225169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pu0AmyhNLblBGibwDuGJkfaRqWe4VLl/6YMlZsow0qs=;
	b=xJkjNn/lmurCkg39PYsOcnXXO3go57x86ZHTuH8mOB28zShJ2cADmDVcBKuGrl5UZhMxEa
	muEzCM8RIed52rDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707225169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pu0AmyhNLblBGibwDuGJkfaRqWe4VLl/6YMlZsow0qs=;
	b=nzRqkNa9xazo+VgyphXV+yGCSIvuhLB7QRfansFESogku2rqIFhrJ29YwNG/odg7xHZJeL
	pVSS7Q6U4QQGhO389T7FaAKxsyPi8WPslGHa/XfZ80qfVaQFD0s5o2AIQ5ybWlXPDzgQNe
	YF3QOT2yvdQFM+Af+oTsPzNhEoGwNYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707225169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pu0AmyhNLblBGibwDuGJkfaRqWe4VLl/6YMlZsow0qs=;
	b=xJkjNn/lmurCkg39PYsOcnXXO3go57x86ZHTuH8mOB28zShJ2cADmDVcBKuGrl5UZhMxEa
	muEzCM8RIed52rDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0911C132DD;
	Tue,  6 Feb 2024 13:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Iky2AVEwwmUuOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Feb 2024 13:12:49 +0000
Date: Tue, 06 Feb 2024 14:12:44 +0100
Message-ID: <87wmrhvir7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<corbet@lwn.net>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v13 32/53] ALSA: usb-audio: Check for support for
 requested audio format
In-Reply-To: <20240203023645.31105-33-quic_wcheng@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
	<20240203023645.31105-33-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [2.37 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.03)[56.46%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 R_RATELIMIT(0.00)[to_ip_from(RLjs3ec4aura4kmsd6wxjjm4hg)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: GY2KIYCIVPLUMFAPW32PXU45SYU33K3B
X-Message-ID-Hash: GY2KIYCIVPLUMFAPW32PXU45SYU33K3B
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GY2KIYCIVPLUMFAPW32PXU45SYU33K3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 03 Feb 2024 03:36:24 +0100,
Wesley Cheng wrote:
> 
> Allow for checks on a specific USB audio device to see if a requested PCM
> format is supported.  This is needed for support when playback is
> initiated by the ASoC USB backend path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Just cosmetic:

> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> +			struct snd_pcm_hw_params *params, int direction)
> +{
> +	struct snd_usb_audio *chip;
> +	struct snd_usb_substream *subs;
> +	struct snd_usb_stream *as;
> +	const struct audioformat *fmt;
> +
> +	/*
> +	 * Register mutex is held when populating and clearing usb_chip
> +	 * array.
> +	 */
> +	mutex_lock(&register_mutex);
> +	chip = usb_chip[card_idx];
> +	if (!chip) {
> +		mutex_unlock(&register_mutex);
> +		return NULL;
> +	}
> +
> +	if (enable[card_idx]) {
> +		list_for_each_entry(as, &chip->pcm_list, list) {
> +			subs = &as->substream[direction];
> +			fmt = snd_usb_find_substream_format(subs, params);
> +			if (fmt) {
> +				mutex_unlock(&register_mutex);
> +				return as;
> +			}
> +		}
> +	}
> +	mutex_unlock(&register_mutex);

I prefer having the single lock/unlock call pair, e.g.

	struct snd_usb_stream *as, *ret;

	ret = NULL;
	mutex_lock(&register_mutex);
	chip = usb_chip[card_idx];
	if (chip && enable[card_idx]) {
		list_for_each_entry(as, &chip->pcm_list, list) {
			subs = &as->substream[direction];
			if (snd_usb_find_substream_format(subs, params)) {
				ret = as;
				break;
			}
		}
	}
	mutex_unlock(&register_mutex);
	return ret;
}

In this case, we shouldn't reuse "as" for the return value since it
can be non-NULL after the loop end.


thanks,

Takashi
