Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93787EB523
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 17:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B966E846;
	Tue, 14 Nov 2023 17:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B966E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699980843;
	bh=i36POMKB4J+nxRuHRnMjcJfbm2DtkJVIN7modo9tKsg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T/9Ltf4U8Y8dW6GlUK8thj7pJj+XuUyQoP9l9I+xEJ0wbrZ2qmHu2/PVNNBcMl/JX
	 t7xGFoIWJCctH2BqK08QWOfGkCcCV1APy6HWVjXHTE0eB3SiAnQZ3jA+dHGqgTARuL
	 l4FI+0QyXWxMt21edeex7Pa/+mvqcJsuxQZPgiKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3922CF8016E; Tue, 14 Nov 2023 17:52:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C38DF8016E;
	Tue, 14 Nov 2023 17:52:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A9BDF801D5; Tue, 14 Nov 2023 17:52:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E9B3BF80152
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 17:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B3BF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SflG4PFW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uO94e4zn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64E6220292;
	Tue, 14 Nov 2023 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699980761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJFN+3cmN4sk9HKTacJYVaiCfC/TQzS4P55b6FO8sB0=;
	b=SflG4PFW9sRF+rwnVF1DJESgnG7Io87h0D+3rUdd59sjOl3p/Y2fG5B/XNa02XsxSArnPs
	2KVcc0qqGAJbJ+JOKNXncK2dwnVg4OCW+KI/TEigtJWksXYZiyenzNnld6VNQ4BBUP9QPY
	S+8+UFVwgRD/r7mETTwSMPNvXneguXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699980761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJFN+3cmN4sk9HKTacJYVaiCfC/TQzS4P55b6FO8sB0=;
	b=uO94e4znjDCTc6jQvSCIKiEfaD5qxGCU8cIURwI3OdHKtlypv41KZDI0tFBV9r6VzY74V5
	alV0dp0LN4gqEVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 304E313416;
	Tue, 14 Nov 2023 16:52:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KeLKCtmlU2XufQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 14 Nov 2023 16:52:41 +0000
Date: Tue, 14 Nov 2023 17:52:40 +0100
Message-ID: <87jzqkp99j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Jani Nikula
 <jani.nikula@linux.intel.com>,	Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>,	"intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>,	"intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>,	"alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>,	"Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
In-Reply-To: 
 <DM8PR11MB5655518A6F21A2E4CA2E76D3E0B2A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
	<20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
	<ZVNUxZzCGcxQzqJX@intel.com>
	<87bkbwsebl.fsf@intel.com>
	<569f8832-25f1-45be-bb60-50f5a76d8e44@linux.intel.com>
	<DM8PR11MB5655518A6F21A2E4CA2E76D3E0B2A@DM8PR11MB5655.namprd11.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-10.10 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
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
Message-ID-Hash: 6WAITOF2YHRF4TCDQIC4FPYF5W4GND4M
X-Message-ID-Hash: 6WAITOF2YHRF4TCDQIC4FPYF5W4GND4M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WAITOF2YHRF4TCDQIC4FPYF5W4GND4M/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Nov 2023 14:31:25 +0100,
Saarinen, Jani wrote:
> 
> Hi, 
> > -----Original Message-----
> > From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Sent: Tuesday, November 14, 2023 3:30 PM
> > To: Jani Nikula <jani.nikula@linux.intel.com>; Ville Syrjälä
> > <ville.syrjala@linux.intel.com>
> > Cc: Takashi Iwai <tiwai@suse.de>; intel-gfx@lists.freedesktop.org; intel-
> > xe@lists.freedesktop.org; alsa-devel@alsa-project.org; Saarinen, Jani
> > <jani.saarinen@intel.com>; Kurmi, Suresh Kumar
> > <suresh.kumar.kurmi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
> > to before probe_work.
> > 
> > Hey,
> > 
> > Den 2023-11-14 kl. 13:35, skrev Jani Nikula:
> > > On Tue, 14 Nov 2023, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >> On Mon, Oct 02, 2023 at 09:38:44PM +0200,
> > maarten.lankhorst@linux.intel.com wrote:
> > >>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >>>
> > >>> Now that we can use -EPROBE_DEFER, it's no longer required to spin
> > >>> off the snd_hdac_i915_init into a workqueue.
> > >>>
> > >>> Use the -EPROBE_DEFER mechanism instead, which must be returned in
> > >>> the probe function.
> > >> This completely broke i915 audio!
> > >>
> > >> I also can't see any trace of this stuff ever being posted to
> > >> intel-gfx so it never went through the CI.
> > >>
> > >> Please fix or revert ASAP.
> > > Cc: Jani, Suresh
> > >
> > > Ville, please file a bug at gitlab so we can track this, thanks.
> > 
> > I've originally tested this on TGL and DG2, so can you be more specific on what
> > broke?
> Was this series tested on CI  ever as Ville saying no? How this got merged? 

Hm, I somehow believed that patches have been tested by intel people,
as they came from intel.  (Also thought that drm-tip or whatever tree
also drags the recent changes from sound.git tree for relevant part.)

In anyway, the whole patches were touching only sound/* files and no
changes in DRM side at all, hence they weren't sent to intel-gfx, I
suppose.


Takashi
