Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CD7FA513
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A80BEA2;
	Mon, 27 Nov 2023 16:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A80BEA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099854;
	bh=gbKeorCNUOUGqg+DU6DbFyDsDDbUQcwyxzgYRbTzmgI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aP+HryB/dG9CNPzB0UESsYkXCG5TvE5oM/mDmKD6mg/jmKhDoM/dTCg+U0OJ6jn5/
	 WLlOhbCg4UTdZWmzRh0wBI4F1GJMyuWias2mhc3hVH7ZF8YlSSVb8KIOUJcUcDUfkH
	 p5FGJzKYsrGqRuVVudUXwIrCnS9IJYGfqdrC6qfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A30F8055B; Mon, 27 Nov 2023 16:43:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E0EF805B5;
	Mon, 27 Nov 2023 16:43:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA18F80563; Mon, 27 Nov 2023 16:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F9EFF80254
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F9EFF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VpaOG8xO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4kqnjTb4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C3511FB85;
	Mon, 27 Nov 2023 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701099822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3F+9hAeBdHl/6JS+C9c59KFNI04kQri6JLnlfZlMXE=;
	b=VpaOG8xOR9Y1umRXWU6zu8GQNnk33/qu0kOye5s8yrEeeO1dy+eerhmu0N+CkIz/tNqdrQ
	OrQEOx3I+JvLOiYS0WZfGganKXr53OAifgJnIZtoGAoyeQ/yuzRSBns+wQeehe1kRyb2ej
	EGRKRDFVdk83pTy2cWR/8U4UVEoFHCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701099822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3F+9hAeBdHl/6JS+C9c59KFNI04kQri6JLnlfZlMXE=;
	b=4kqnjTb4kBrXkT+BQM3xVa6O0o/Qki/gTpZXckcsoVF6+7zjhRUVQLv9ctLjC3Urmb6OYS
	l3QoXe6pDl7o15Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBD261379A;
	Mon, 27 Nov 2023 15:43:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6bR5LC25ZGVxSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Nov 2023 15:43:41 +0000
Date: Mon, 27 Nov 2023 16:43:41 +0100
Message-ID: <875y1np5g2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
In-Reply-To: <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
	<20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
	<87jzq3pc6r.wl-tiwai@suse.de>
	<d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
	<87cyvvp8t6.wl-tiwai@suse.de>
	<8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
	<878r6jp6jd.wl-tiwai@suse.de>
	<b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-7.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: K6DZT5L3OY4OGD3NCFCSNHYG4TLY3TJG
X-Message-ID-Hash: K6DZT5L3OY4OGD3NCFCSNHYG4TLY3TJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6DZT5L3OY4OGD3NCFCSNHYG4TLY3TJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 16:40:57 +0100,
Péter Ujfalusi wrote:
> 
> 
> 
> On 27/11/2023 17:20, Takashi Iwai wrote:
> > On Mon, 27 Nov 2023 15:45:54 +0100,
> > Péter Ujfalusi wrote:
> >>
> >>
> >>
> >> On 27/11/2023 16:31, Takashi Iwai wrote:
> >>> On Mon, 27 Nov 2023 15:12:51 +0100,
> >>> Péter Ujfalusi wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 27/11/2023 15:18, Takashi Iwai wrote:
> >>>>>> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
> >>>>>> +{
> >>>>>> +	int i;
> >>>>>> +
> >>>>>> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
> >>>>>> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
> >>>>>> +			return true;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	return false;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
> >>>>>
> >>>>> I'm afraid that this will bring unnecessary dependency on HDMI codec
> >>>>> driver.
> >>>>
> >>>> For HDMI support we anyways need HDMI code?
> >>>
> >>> But the ASoC hdac-hda driver isn't specifically bound with HDMI, I
> >>> thought?
> >>>
> >>> With your patch, now it becomes a hard-dependency.  It'll be even
> >>> build failure when HDMI codec driver isn't enabled in Kconfig.
> >>
> >> The change in hdaudio.h handles the config dependency, if
> >> CONFIG_SND_HDA_CODEC_HDMI is not enabled in Kconfig then
> >> snd_hda_device_is_hdmi() will return false.
> > 
> > OK, that's at least good.
> > But I still find it not ideal to bring the hard dependency there
> > unnecessarily.
> > 
> > With the introduction of a flag in hdac_device, the necessary change
> > would be even smaller like below.
> > 
> > 
> > Takashi
> > 
> > --- a/include/sound/hdaudio.h
> > +++ b/include/sound/hdaudio.h
> > @@ -95,6 +95,7 @@ struct hdac_device {
> >  	bool lazy_cache:1;	/* don't wake up for writes */
> >  	bool caps_overwriting:1; /* caps overwrite being in process */
> >  	bool cache_coef:1;	/* cache COEF read/write too */
> > +	bool is_hdmi:1;		/* a HDMI/DP codec */
> >  	unsigned int registered:1; /* codec was registered */
> >  };
> >  
> > --- a/sound/pci/hda/patch_hdmi.c
> > +++ b/sound/pci/hda/patch_hdmi.c
> > @@ -2597,6 +2597,7 @@ static int patch_generic_hdmi(struct hda_codec *codec)
> >  	}
> >  
> >  	generic_hdmi_init_per_pins(codec);
> > +	codec->core.is_hdmi = true;
> >  	return 0;
> >  }
> >  
> > @@ -3472,6 +3473,7 @@ static int patch_simple_hdmi(struct hda_codec *codec,
> >  	spec->pcm_playback = simple_pcm_playback;
> >  
> >  	codec->patch_ops = simple_hdmi_patch_ops;
> > +	codec->core.is_hdmi = true;
> >  
> >  	return 0;
> >  }
> 
> I see,  so this is what I was not sure how to do ;)
> I will rework the series and resend tomorrow.
> 
> Thanks for the code snippet, I will make you as author of it, if it is
> OK for you.

Sure, no problem.


Takashi
