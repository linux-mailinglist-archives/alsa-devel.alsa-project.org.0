Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B444763661
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 14:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2192E6C1;
	Wed, 26 Jul 2023 14:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2192E6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690374787;
	bh=gA6GaMteIn8dL6/kI364eioZ9lbLQGOOlPjqfb3klwY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pidNt156E3cLUIgu4DL1hucF3uYQT5Pp9AufczVeg3XV82m+d2oSgxBvJO1W6Whiu
	 Sd+lLUeoasT2WPd+Mz/lr74FCls6fpfwCApKCQwhBjT/pisIWQndir0sg0xziddLlT
	 5yrEiGm24tKEfoArDlQTwFG3iRw3gxMWcZcht30Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3490DF8053B; Wed, 26 Jul 2023 14:32:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2308F80153;
	Wed, 26 Jul 2023 14:32:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 823E5F8019B; Wed, 26 Jul 2023 14:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E467F80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 14:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E467F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sBohaG/6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6NQCnDnv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D7A2021CB9;
	Wed, 26 Jul 2023 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690374718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQRJ4YwQA/6O0WXa/1Z5ActdMgPE2S7rN2kN4ZsnP5s=;
	b=sBohaG/6wQ0MNG9epgDlnJLCBjqa7F+dl7OQQwWTyzLvPMjFK9Za3zLY+0QNKFAGk8v4CU
	Q3BcKt+i+WNHpAgpsFU40HGoPIB8YUVDcdem+zT+KpIFphRtfOo6KbVm90W2/fWtjl3bWn
	H393pY7OIvuzH1hTOOJ+d+yz7fwj4bQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690374718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQRJ4YwQA/6O0WXa/1Z5ActdMgPE2S7rN2kN4ZsnP5s=;
	b=6NQCnDnvw0PBrRBwW12lm/uW8aVoTQyAKwUdfFpg4zDta1dnUnd3kuke3mhlpepVyJLKsG
	BJFwhGeXeoBjnkBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91720139BD;
	Wed, 26 Jul 2023 12:31:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x/X4Ij4SwWQdSAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 26 Jul 2023 12:31:58 +0000
Date: Wed, 26 Jul 2023 14:31:58 +0200
Message-ID: <87msziyhtt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <agross@kernel.org>,
	<andersson@kernel.org>,
	<robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>,
	<catalin.marinas@arm.com>,
	<will@kernel.org>,
	<mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>,
	<Thinh.Nguyen@synopsys.com>,
	<linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-usb@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<quic_jackp@quicinc.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<oneukum@suse.com>,
	<albertccwang@google.com>,
	<o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 18/32] sound: usb: Introduce QC USB SND offloading
 support
In-Reply-To: <243ee81d-d46d-e05a-1fcd-35e6301a39cd@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
	<20230725023416.11205-19-quic_wcheng@quicinc.com>
	<87bkg0v4ce.wl-tiwai@suse.de>
	<243ee81d-d46d-e05a-1fcd-35e6301a39cd@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HI7EHDFAEII3KJIB6MAQFW67SXPWV7VV
X-Message-ID-Hash: HI7EHDFAEII3KJIB6MAQFW67SXPWV7VV
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HI7EHDFAEII3KJIB6MAQFW67SXPWV7VV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Jul 2023 00:59:57 +0200,
Wesley Cheng wrote:
> 
> >> +static int enable_audio_stream(struct snd_usb_substream *subs,
> >> +				snd_pcm_format_t pcm_format,
> >> +				unsigned int channels, unsigned int cur_rate,
> >> +				int datainterval)
> >> +{
> > 
> > ... this implementation, I wonder whether it'd be better to modify and
> > export  snd_usb_hw_params() snd snd_usb_hw_free() to fit with qcom
> > driver.  Then you can avoid lots of open code.
> > 
> 
> I think the problem is that snd_usb_hw_params assumes that we've
> already done a PCM open on the PCM device created by USB SND.
> However, with the offload path, we don't reference the USB PCM device,
> but the one created by the platform sound card.  Hence, I don't have
> access to the snd_pcm_substream.
> 
> I attempted to derive snd_pcm_substream from snd_usb_substream, but
> since PCM open isn't run, it doesn't provide a valid structure.
> 
> What do you think about adding a wrapper to snd_usb_hw_params?  Have a
> version that will take in snd_usb_substream, and another that is
> registered to hw_params().

Yes, that's what I had in mind, too.

> > In general, if you see a direct use of chip->mutex, it can be often
> > done better in a different form.  The use of an internal lock or such
> > from an external driver is always fragile and error-prone.
> > 
> > Also, the current open-code misses the potential race against the
> > disconnection during the operation.  In snd-usb-audio, it protects
> > with snd_usb_lock_shutdown() and snd_usb_unlock_shutdown() pairs.
> > 
> 
> I agree...I think then the best approach would be something like the
> above, ie:
> 
> int snd_usb_hw_params(struct snd_pcm_substream *substream,
> 			     struct snd_pcm_hw_params *hw_params)
> {
> 	struct snd_usb_substream *subs = substream->runtime->private_data;
> 
> 	snd_usb_ep_attach(subs, hw_params);
> ...
> 
> int snd_usb_ep_attach(...)
> {
> 	//implementation of current code in snd_usb_hw_params()
> }
> EXPORT_SYMBOL(snd_usb_ep_attach);

Yes, exactly something like that ;)


thanks,

Takashi
