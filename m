Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA6D97533E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 15:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C74843;
	Wed, 11 Sep 2024 15:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C74843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726060068;
	bh=dheQBmjl8VxGoanNCMy3zDYLSfsxsO5fhRjlj/oRtIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gqahfTu5oMjccopbhy4ey/ITOOyNGwMUzoyvNGkOhlUd6MRd5NNtiW6Q0YCKd/ldC
	 gTqF84lxqGpy0AaCbhvDz+Td+Np87LZUwfswAqK6I6Q8JrQyOeNx+3ZGgc1Z0GKpd1
	 T7xZz3vQ0QEQZQQEJ++IuVX4A83fEPE3HWlXjeLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CC08F805BB; Wed, 11 Sep 2024 15:07:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1446DF805B1;
	Wed, 11 Sep 2024 15:07:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18608F801F5; Wed, 11 Sep 2024 15:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C518F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 15:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C518F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Lk/XF9WZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NcueuJJ1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Lk/XF9WZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NcueuJJ1
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B1C121AA2;
	Wed, 11 Sep 2024 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726060038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDHtztQY1hYlqh8Dn4Hf81FL0yRjWUDAVHpsevJl3xk=;
	b=Lk/XF9WZqnXzoz5uM5BF0EDi4zl/Mfd+RDUZu1LiiUlWR+NN6QGWR+Yol0yFYUNx1VJrWN
	1zLnLoZW23xBUfQMXj3HClJYCl1r5w/DBAFixK+KHbB0YPFZhUxmB1T0fDJ57TUz0IN/Kw
	Ji4WNU+TVOjNw/oeUMCgPzMiVrUEZhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726060038;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDHtztQY1hYlqh8Dn4Hf81FL0yRjWUDAVHpsevJl3xk=;
	b=NcueuJJ1RETZWdGSrZcH5ewcBqIUiOZr1jVAQRG4qJmvYY4TRxmWGzbyPahlkHAg/vN0xW
	2DyugLKvDcn+vaBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726060038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDHtztQY1hYlqh8Dn4Hf81FL0yRjWUDAVHpsevJl3xk=;
	b=Lk/XF9WZqnXzoz5uM5BF0EDi4zl/Mfd+RDUZu1LiiUlWR+NN6QGWR+Yol0yFYUNx1VJrWN
	1zLnLoZW23xBUfQMXj3HClJYCl1r5w/DBAFixK+KHbB0YPFZhUxmB1T0fDJ57TUz0IN/Kw
	Ji4WNU+TVOjNw/oeUMCgPzMiVrUEZhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726060038;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDHtztQY1hYlqh8Dn4Hf81FL0yRjWUDAVHpsevJl3xk=;
	b=NcueuJJ1RETZWdGSrZcH5ewcBqIUiOZr1jVAQRG4qJmvYY4TRxmWGzbyPahlkHAg/vN0xW
	2DyugLKvDcn+vaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F148132CB;
	Wed, 11 Sep 2024 13:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YsJfJQWW4WYTPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Sep 2024 13:07:17 +0000
Date: Wed, 11 Sep 2024 15:08:05 +0200
Message-ID: <87ed5q2v9m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,	Richard Fitzgerald
 <rf@opensource.cirrus.com>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Cezary Rojewski <cezary.rojewski@intel.com>,	Liam
 Girdwood <liam.r.girdwood@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,	Chen-Yu Tsai <wens@csie.org>,	Jernej
 Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
In-Reply-To: <1jy13yqrb8.fsf@starbuckisacylon.baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
	<20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
	<1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
	<87ed5q4kbe.wl-tiwai@suse.de>
	<5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
	<87y13y31kq.wl-tiwai@suse.de>
	<4f58ebe8-78fe-41f3-9fc6-720d314c026e@perex.cz>
	<87ldzy2wgc.wl-tiwai@suse.de>
	<1jy13yqrb8.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
	FREEMAIL_CC(0.00)[perex.cz,linux.intel.com,suse.com,cirrus.com,opensource.cirrus.com,gmail.com,kernel.org,intel.com,linaro.org,csie.org,sholland.org,vger.kernel.org,alsa-project.org,lists.infradead.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
Message-ID-Hash: W74ZAYA3JQLT7PJRBOETZRTRRPQB3SP4
X-Message-ID-Hash: W74ZAYA3JQLT7PJRBOETZRTRRPQB3SP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W74ZAYA3JQLT7PJRBOETZRTRRPQB3SP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Sep 2024 14:59:39 +0200,
Jerome Brunet wrote:
> 
> On Wed 11 Sep 2024 at 14:42, Takashi Iwai <tiwai@suse.de> wrote:
> 
> > On Wed, 11 Sep 2024 12:58:53 +0200,
> > Jaroslav Kysela wrote:
> >> 
> >> On 11. 09. 24 12:51, Takashi Iwai wrote:
> >> > On Wed, 11 Sep 2024 12:33:01 +0200,
> >> > P�ter Ujfalusi wrote:
> >> >> 
> >> >> On 11/09/2024 12:21, Takashi Iwai wrote:
> >> >>>> Wondering if this is backwards compatible with the alsa-lib definitions,
> >> >>>> specifically the topology parts which did unfortunately have a list of
> >> >>>> rates that will map to a different index now:
> >> >>>> 
> >> >>>> 
> >> >>>> typedef enum _snd_pcm_rates {
> >> >>>> 	SND_PCM_RATE_UNKNOWN = -1,
> >> >>>> 	SND_PCM_RATE_5512 = 0,
> >> >>>> 	SND_PCM_RATE_8000,
> >> >>>> 	SND_PCM_RATE_11025,
> >> >>>> 	SND_PCM_RATE_16000,
> >> >>>> 	SND_PCM_RATE_22050,
> >> >>>> 	SND_PCM_RATE_32000,
> >> >>>> 	SND_PCM_RATE_44100,
> >> >>>> 	SND_PCM_RATE_48000,
> >> >>>> 	SND_PCM_RATE_64000,
> >> >>>> 	SND_PCM_RATE_88200,
> >> >>>> 	SND_PCM_RATE_96000,
> >> >>>> 	SND_PCM_RATE_176400,
> >> >>>> 	SND_PCM_RATE_192000,
> >> >>>> 	SND_PCM_RATE_CONTINUOUS = 30,
> >> >>>> 	SND_PCM_RATE_KNOT = 31,
> >> >>>> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
> >> >>>> } snd_pcm_rates_t;
> >> >>> 
> >> >>> As far as I understand correctly, those rate bits used for topology
> >> >>> are independent from the bits used for PCM core, although it used to
> >> >>> be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
> >> >>> it's clearer only for topology stuff.
> >> >> 
> >> >> Even if we rename these in alsa-lib we will need translation from
> >> >> SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?
> >> >> 
> >> >> The topology files are out there and this is an ABI...
> >> >> 
> >> >>> But it'd be better if anyone can double-check.
> >> >> 
> >> >> Since the kernel just copies the rates bitfield, any rate above 11025
> >> >> will be misaligned and result broken setup.
> >> > 
> >> > Yep, I noticed it now, too.
> >> > 
> >> > Below is the fix patch, totally untested.
> >> > It'd be appreciated if anyone can test it quickly.
> >> > 
> >> > 
> >> > thanks,
> >> > 
> >> > Takashi
> >> > 
> >> > -- 8< --
> >> > From: Takashi Iwai <tiwai@suse.de>
> >> > Subject: [PATCH] ALSA: pcm: Fix breakage of PCM rates used for topology
> >> > 
> >> > It turned out that the topology ABI takes the standard PCM rate bits
> >> > as is, and it means that the recent change of the PCM rate bits would
> >> > lead to the inconsistent rate values used for topology.
> >> > 
> >> > This patch reverts the original PCM rate bit definitions while adding
> >> > the new rates to the extended bits instead.  This needed the change of
> >> > snd_pcm_known_rates, too.  And this also required to fix the handling
> >> > in snd_pcm_hw_limit_rates() that blindly assumed that the list is
> >> > sorted while it became unsorted now.
> >> > 
> >> > Fixes: 090624b7dc83 ("ALSA: pcm: add more sample rate definitions")
> >> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >> 
> >> This looks fine. But the topology rate bits should not depend on those
> >> bits. It's a bit pitty that the standard PCM ABI does not use those
> >> bits for user space and we are doing this change just for topology
> >> ABI.
> >
> > Yeah, and theoretically it's possible to fix in topology side, but
> > it'll be more cumbersome.
> >
> > Although it's not really a part of PCM ABI, I believe we should move
> > the PCM rate bit definitions to uapi, for showing that it's set in
> > stone.  Something like below.
> >
> >
> > Takashi
> >
> > -- 8< --
> > From: Takashi Iwai <tiwai@suse.de>
> > Subject: [PATCH] ALSA: pcm: Move standard rate bit definitions into uapi
> >
> > Since the standard PCM rate bits are used for the topology ABI, it's a
> > part of public ABI that must not be changed.  Move the definitions
> > into uapi to indicate it more clearly.
> >
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  include/sound/pcm.h         | 26 --------------------------
> >  include/uapi/sound/asound.h | 26 ++++++++++++++++++++++++++
> >  2 files changed, 26 insertions(+), 26 deletions(-)
> >
> > diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> > index 824216799070..f28f6d6ac996 100644
> > --- a/include/sound/pcm.h
> > +++ b/include/sound/pcm.h
> > @@ -105,32 +105,6 @@ struct snd_pcm_ops {
> >  
> >  #define SNDRV_PCM_POS_XRUN		((snd_pcm_uframes_t)-1)
> >  
> > -/* If you change this don't forget to change rates[] table in pcm_native.c */
> > -#define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
> > -#define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
> > -#define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
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
> > -/* extended rates */
> 
> It is cosmetic but I wonder, does the extended really start here ?

Maybe a bad choice of the words.  This was rather meant as the
extension since 6.12.  So I'll replace it with "extended rates since
6.12", to be clearer.

> From the table Pierre-Louis sent, I suppose that all the recently added rates could
> been seen as extended too (352.8 to 768). Those did not mess with the
> order though 

AFAIU, the topology stuff seems supporting only up to 192kHz for now,
but it's a matter of topology-only; the limitation could be commented
in somewhere in topology's headers, but it's basically independent
from the definitions in pcm.h.


thanks,

Takashi
