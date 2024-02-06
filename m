Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F284B5D4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 14:01:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1865E83B;
	Tue,  6 Feb 2024 14:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1865E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707224468;
	bh=+aT0rKIS3UKpo4tm29e7syaTdpncuM29O5o+70E1SWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QZ9SGoWt/M8KfdjzsEgO+5y77/KWowzyVCXk1CDGyXpZxo3T/VusGZC19FjaOArf9
	 Fjz84AvL7ReCDOXEB6NsdvxWuOj+V+hQWB+yol3IPB2rMlMSh02wzKFdOBzqR+CdxP
	 Rslf/xmLGFEZO+OxIE0P0VhzQg6zddGDKTt9pmw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19AB9F80570; Tue,  6 Feb 2024 14:00:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62424F801D5;
	Tue,  6 Feb 2024 14:00:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00AA2F801EB; Tue,  6 Feb 2024 14:00:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F6CBF8016E
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 14:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F6CBF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W0j0SuN+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ANiJc1Kz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W0j0SuN+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ANiJc1Kz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26B5121F97;
	Tue,  6 Feb 2024 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707224420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPhPVGYDJ3fdMIeQrhxnapM7DO5sG2kieq0UlwBxO6I=;
	b=W0j0SuN+f3pdCTZ/eqYSrkeUibin5cCK5VUQZRbbQeVgIA+GrcC0q0bxzYOH85qV+pF3h8
	IyzuJDVmuYmw/NQQa8oeMAeSJq4nQ/eO7h2xUs2pbRczfdbWXnC1S1tCBa+/o0ZCXA7p1k
	pWtJ66CIO5nhWvmAEuF3xYlfB06bPdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707224420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPhPVGYDJ3fdMIeQrhxnapM7DO5sG2kieq0UlwBxO6I=;
	b=ANiJc1Kzkh0E1o6XsSz0NVKALAxAysv6xSiEsoyTnl62fV/+eOoyuwoQx0WVkjwFFwsrc2
	emMI+XJorrW4yzCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707224420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPhPVGYDJ3fdMIeQrhxnapM7DO5sG2kieq0UlwBxO6I=;
	b=W0j0SuN+f3pdCTZ/eqYSrkeUibin5cCK5VUQZRbbQeVgIA+GrcC0q0bxzYOH85qV+pF3h8
	IyzuJDVmuYmw/NQQa8oeMAeSJq4nQ/eO7h2xUs2pbRczfdbWXnC1S1tCBa+/o0ZCXA7p1k
	pWtJ66CIO5nhWvmAEuF3xYlfB06bPdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707224420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPhPVGYDJ3fdMIeQrhxnapM7DO5sG2kieq0UlwBxO6I=;
	b=ANiJc1Kzkh0E1o6XsSz0NVKALAxAysv6xSiEsoyTnl62fV/+eOoyuwoQx0WVkjwFFwsrc2
	emMI+XJorrW4yzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D30FD132DD;
	Tue,  6 Feb 2024 13:00:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OHcAM2MtwmXaNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Feb 2024 13:00:19 +0000
Date: Tue, 06 Feb 2024 14:00:19 +0100
Message-ID: <87zfwdvjbw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
	srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	corbet@lwn.net,
	lgirdwood@gmail.com,
	andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	broonie@kernel.org,
	bgoswami@quicinc.com,
	tiwai@suse.com,
	robh+dt@kernel.org,
	konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v13 50/53] ALSA: usb-audio: Allow for rediscovery of
 connected USB SND devices
In-Reply-To: <aaa76d7a-4299-4e1c-83f1-cbbea763927f@linux.intel.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
	<20240203023645.31105-51-quic_wcheng@quicinc.com>
	<aaa76d7a-4299-4e1c-83f1-cbbea763927f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.00)[32.59%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 R_RATELIMIT(0.00)[to_ip_from(RLjs3ec4aura4kmsd6wxjjm4hg)];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[24];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[quicinc.com,linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: DQJFDF2OPGU3GSRJ3KGTDCTPKDNY7K4B
X-Message-ID-Hash: DQJFDF2OPGU3GSRJ3KGTDCTPKDNY7K4B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQJFDF2OPGU3GSRJ3KGTDCTPKDNY7K4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Feb 2024 10:01:03 +0100,
Amadeusz S³awiñski wrote:
> 
> On 2/3/2024 3:36 AM, Wesley Cheng wrote:
> > In case of notifying SND platform drivers of connection events, some of
> > these use cases, such as offloading, require an ASoC USB backend device to
> > be initialized before the events can be handled.  If the USB backend device
> > has not yet been probed, this leads to missing initial USB audio device
> > connection events.
> > 
> > Expose an API that traverses the usb_chip array for connected devices, and
> > to call the respective connection callback registered to the SND platform
> > driver.
> > 
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > ---
> >   sound/usb/card.c                  | 19 +++++++++++++++++++
> >   sound/usb/card.h                  |  2 ++
> >   sound/usb/qcom/qc_audio_offload.c |  2 ++
> >   3 files changed, 23 insertions(+)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 11b827b7a2a5..995b2df676ab 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -202,6 +202,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> >   }
> >   EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
> >   +/*
> > + * in case the platform driver was not ready at the time of USB SND
> > + * device connect, expose an API to discover all connected USB devices
> > + * so it can populate any dependent resources/structures.
> > + */
> > +void snd_usb_rediscover_devices(void)
> > +{
> > +	int i;
> > +
> > +	mutex_lock(&register_mutex);
> > +	for (i = 0; i < SNDRV_CARDS; i++) {
> > +		if (usb_chip[i])
> > +			if (platform_ops && platform_ops->connect_cb)
> > +				platform_ops->connect_cb(usb_chip[i]);
> 
> if inside if, it can just be && or maybe move callback check before
> mutex lock and just return early if it is not present?

The callback check must be inside mutex; otherwise you'll get a race
about the platform_ops registration.


thanks,

Takashi
