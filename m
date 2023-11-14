Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E517EB42C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 16:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2B8ADF;
	Tue, 14 Nov 2023 16:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2B8ADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699977085;
	bh=GDukyXTD1hEsYOIfnGEg+x54JNKMuIoKcRwdvGrloZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WT8loa6a/dmUT+ndhSwNffnmfgbHq25GdI9Ciu+/+Bh4xpeXUgHDMrzV5aXE1XIiW
	 e3vKNwaw0+cmV4GLCEjwM9BAiVDuoGVZrJ2iklciaolu+h2W8MRUrPuhvsUbSRkcnE
	 kDcUsucc4+7Qo1aI/RzN1Xkuvfzats9v4+GW93PI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C3DAF8055A; Tue, 14 Nov 2023 16:50:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D792CF8016E;
	Tue, 14 Nov 2023 16:50:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36C70F801D5; Tue, 14 Nov 2023 16:50:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A193AF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 16:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A193AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yQGPX8yA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hQPaDJW5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E024204B3;
	Tue, 14 Nov 2023 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699977018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f66Z+ZwArpCifdVWAhGMFhUcTcx57YSj9CYF8NpAqlM=;
	b=yQGPX8yAX1vvYUnlf4UfpB7Fak8KnbUHSWUMGA43B1KRLSDW5bcZ+Ao0ZaXj5aGs1iT0GD
	18191kbr2pptDZ1RXMuNaPetx2u+4uEhMRXyUJoWzQuAPmVRNH9DhxIALfGVq2yFLDM5GM
	a7Kv7tvwSuyyYfAqVLPSz/Gfe5r2iCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699977018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f66Z+ZwArpCifdVWAhGMFhUcTcx57YSj9CYF8NpAqlM=;
	b=hQPaDJW5mrBVyMalxMj6FT1aOqgELzQ7m32X8RpP82+69NbjEX0ZcUMnQFp6hUz/eQoMvE
	Igz4Ln+3/t9YNGCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F1FA13460;
	Tue, 14 Nov 2023 15:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OnDDAjqXU2W6XAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 14 Nov 2023 15:50:18 +0000
Date: Tue, 14 Nov 2023 16:50:17 +0100
Message-ID: <87ttpopc5i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,	Jani
 Nikula <jani.nikula@linux.intel.com>,	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,	alsa-devel@alsa-project.org,
	"Saarinen, Jani" <jani.saarinen@intel.com>,	"Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
In-Reply-To: <f72ce7ff-19a4-4a12-9ede-615a964e7228@linux.intel.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
	<20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
	<ZVNUxZzCGcxQzqJX@intel.com>
	<87bkbwsebl.fsf@intel.com>
	<ZVN4rQjLxROOjTE-@intel.com>
	<f72ce7ff-19a4-4a12-9ede-615a964e7228@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-10.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: RIBVYLAF3UG3ZHOME3FIBA7J5HR7FZVG
X-Message-ID-Hash: RIBVYLAF3UG3ZHOME3FIBA7J5HR7FZVG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIBVYLAF3UG3ZHOME3FIBA7J5HR7FZVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Nov 2023 15:39:16 +0100,
Maarten Lankhorst wrote:
> 
> 
> Hey,
> 
> Den 2023-11-14 kl. 14:39, skrev Ville Syrjälä:
> 
>     On Tue, Nov 14, 2023 at 02:35:10PM +0200, Jani Nikula wrote:
>     
>         On Tue, 14 Nov 2023, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>         
>             On Mon, Oct 02, 2023 at 09:38:44PM +0200, maarten.lankhorst@linux.intel.com wrote:
>             
>                 From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>                 
>                 Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>                 the snd_hdac_i915_init into a workqueue.
>                 
>                 Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>                 probe function.
>                 
>             This completely broke i915 audio!
>             
>             I also can't see any trace of this stuff ever being posted to 
>             intel-gfx so it never went through the CI.
>             
>             Please fix or revert ASAP.
>             
>         Cc: Jani, Suresh
>         
>         Ville, please file a bug at gitlab so we can track this, thanks.
>         
>     https://gitlab.freedesktop.org/drm/intel/-/issues/9671
>     
> Looks like a simple patch should be enough, can you test below?

Seems that we reached to the same conclusion :)

I took a quick look at other code paths, and sound/pci/hda/hda_intel.c
is the only place that needs the correction.  Other (ASoC) drivers are
either simply always returning the error or dealing only with -ENODEV
case for skipping the HDMI codec.


thanks,

Takashi

> 
> ----
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 058f6e6491f9a..946aaa487f200 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2145,7 +2145,8 @@ static int azx_probe(struct pci_dev *pci,
>                                                                    * for other chips, still continue probing as other
>                                                                    * codecs can be on the same link.
>                                                                    */
> -                                                                 if (HDA_CONTROLLER_IN_GPU(pci)) {
> +                                                                 if (HDA_CONTROLLER_IN_GPU(pci) ||
> +                                                                     err == -EPROBE_DEFER) {
>                                                                                         goto out_free;
>                                                                   } else {
>                                                                                         /* don't bother any longer */
> 
