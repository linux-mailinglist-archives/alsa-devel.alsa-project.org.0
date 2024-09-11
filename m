Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E667974E6E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 11:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D285A1DD;
	Wed, 11 Sep 2024 11:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D285A1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726046494;
	bh=aN3aTbeMefxFALf3DptsvXFgiQ9/tCgK9LMlfnIDh6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mbPnOtjOq3zrYiQRppdPvut7ufJcvpGHGcsacFUlo24+GjKV021R/tqDRoVH22sTa
	 1mGWJdZTMSf6R/r6VsaRHg7XjfWhmdfAuc/mblpHAs8gikBHpzYf/xnb2Wn5mFXEqg
	 oyfT4aZZ+uY8pQJjxjz8tRpvswDyyWQubWN+bcQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23924F805B4; Wed, 11 Sep 2024 11:21:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F601F805A8;
	Wed, 11 Sep 2024 11:21:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65504F801F5; Wed, 11 Sep 2024 11:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D346F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 11:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D346F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WlQ0c93f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dXvnduZT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jZ1PUUEE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QM1RHpuy
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1751021977;
	Wed, 11 Sep 2024 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726046455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHHB1d6LpCAvI301vcFCxsMNfaOpaL8edCvtkNjoSj0=;
	b=WlQ0c93ft5NkmtIjDAxIyoPfnShfAph0lnN95j1EQQmemU2/rNQzVpZ6GPU0uRQ2Nx5msM
	omGPJJygqEFdcA6sSMrokC8qPgYDze0kr08JjPdvwI+DUFzZdRZ+1RApuisDk+mAZFRYVT
	4fPRqYJat1eN2YxjDNELF7YstZcimLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726046455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHHB1d6LpCAvI301vcFCxsMNfaOpaL8edCvtkNjoSj0=;
	b=dXvnduZTuWfVWuFS/1Ru9PU0tD2khFp3SISeB1vp+/7MtjgeDTqMXMt5CzcGB0ruBLurpL
	lznzo8kcduKy9VBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726046454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHHB1d6LpCAvI301vcFCxsMNfaOpaL8edCvtkNjoSj0=;
	b=jZ1PUUEEbTy/jFdjFdttLjX3JZjXzc2heJAfTztuFvMe2tVCTTGobEuOsI0P5P3OKZFa69
	l5w/sOp34YsMuI5ayIpX3q6kH36SjkTjHwvEboO38H8RslAL7TReTcZh+Oqh2/bCaj08UR
	czNv/IWhzprYgI8ov/sKHmoc4hGAOFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726046454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHHB1d6LpCAvI301vcFCxsMNfaOpaL8edCvtkNjoSj0=;
	b=QM1RHpuyGurfRc1rjQQF09dFQ0fje1sSk36DLrg1MrSjI/+xUkB0jNkLGRgCTji61M8Prd
	6+7pi6dPBeeF5RCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F261132CB;
	Wed, 11 Sep 2024 09:20:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kj/PGfVg4WbbbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Sep 2024 09:20:53 +0000
Date: Wed, 11 Sep 2024 11:21:41 +0200
Message-ID: <87ed5q4kbe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
In-Reply-To: <1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
	<20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
	<1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com,gmail.com,kernel.org,intel.com,linux.intel.com,linaro.org,csie.org,sholland.org,vger.kernel.org,alsa-project.org,lists.infradead.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,baylibre.com:email,suse.de:mid]
Message-ID-Hash: QE3YSJWO3GX7S6HE7RH6XFYOZA2EST5E
X-Message-ID-Hash: QE3YSJWO3GX7S6HE7RH6XFYOZA2EST5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QE3YSJWO3GX7S6HE7RH6XFYOZA2EST5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Sep 2024 11:09:59 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 9/5/24 16:12, Jerome Brunet wrote:
> > This adds a sample rate definition for 12kHz, 24kHz and 128kHz.
> > 
> > Admittedly, just a few drivers are currently using these sample
> > rates but there is enough of a recurrence to justify adding a definition
> > for them and remove some custom rate constraint code while at it.
> > 
> > The new definitions are not added to the interval definitions, such as
> > SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
> > rates to drivers that may or may not support them. For sure the drivers
> > have not been tested for these new rates so it is better to leave them out
> > of interval definitions.
> > 
> > That being said, the added rates are multiples of well know rates families,
> > it is very likely that a lot of devices out there actually supports them.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  include/sound/pcm.h     | 31 +++++++++++++++++--------------
> >  sound/core/pcm_native.c |  6 +++---
> >  2 files changed, 20 insertions(+), 17 deletions(-)
> > 
> > diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> > index 732121b934fd..c993350975a9 100644
> > --- a/include/sound/pcm.h
> > +++ b/include/sound/pcm.h
> > @@ -109,20 +109,23 @@ struct snd_pcm_ops {
> >  #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
> >  #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
> >  #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
> > -#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
> > -#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
> > -#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
> > -#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
> > -#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
> > -#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
> > -#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
> > -#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
> > -#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
> > -#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
> > -#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
> > -#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
> > -#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
> > -#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
> > +#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
> > +#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
> > +#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
> > +#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
> > +#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
> > +#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
> > +#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
> > +#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
> > +#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
> > +#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
> > +#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
> > +#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
> > +#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
> > +#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
> > +#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
> > +#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
> > +#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
> >  
> >  #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
> >  #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
> > diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> > index 44381514f695..7461a727615c 100644
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -2418,13 +2418,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
> >  	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
> >  }
> >  
> > -#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
> > +#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
> >  #error "Change this table"
> >  #endif
> >  
> >  static const unsigned int rates[] = {
> > -	5512, 8000, 11025, 16000, 22050, 32000, 44100,
> > -	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
> > +	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
> > +	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
> >  };
> >  
> >  const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
> 
> Wondering if this is backwards compatible with the alsa-lib definitions,
> specifically the topology parts which did unfortunately have a list of
> rates that will map to a different index now:
> 
> 
> typedef enum _snd_pcm_rates {
> 	SND_PCM_RATE_UNKNOWN = -1,
> 	SND_PCM_RATE_5512 = 0,
> 	SND_PCM_RATE_8000,
> 	SND_PCM_RATE_11025,
> 	SND_PCM_RATE_16000,
> 	SND_PCM_RATE_22050,
> 	SND_PCM_RATE_32000,
> 	SND_PCM_RATE_44100,
> 	SND_PCM_RATE_48000,
> 	SND_PCM_RATE_64000,
> 	SND_PCM_RATE_88200,
> 	SND_PCM_RATE_96000,
> 	SND_PCM_RATE_176400,
> 	SND_PCM_RATE_192000,
> 	SND_PCM_RATE_CONTINUOUS = 30,
> 	SND_PCM_RATE_KNOT = 31,
> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
> } snd_pcm_rates_t;

As far as I understand correctly, those rate bits used for topology
are independent from the bits used for PCM core, although it used to
be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
it's clearer only for topology stuff.

But it'd be better if anyone can double-check.


thanks,

Takashi
