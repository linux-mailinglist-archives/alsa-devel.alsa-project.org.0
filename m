Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AACED7A6614
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 16:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB6ADE5;
	Tue, 19 Sep 2023 16:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB6ADE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695132185;
	bh=a23h8w8hCsxVcNzM6F/X4oiUvrpi8tm/MtHrDupsKI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Co2bpKfEE4HfeGvaUjwLk2RRE07txKS0BVWCvbQK7lM/TdlC5sFlj/AlcxofLhRyV
	 1JOCPP4P8QsORPHIzj9UKaiQWO6ANMGcbngFCcYAZChfKKKLMx2mO5QFfZM1WFr2ph
	 Iz8hgb2yHLsDp7aQnlej2dxhzJXksXD6+KSKfAIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A110EF800F4; Tue, 19 Sep 2023 16:02:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E955F80125;
	Tue, 19 Sep 2023 16:02:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11141F8025A; Tue, 19 Sep 2023 16:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59AE2F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 16:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59AE2F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D0pJDriw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7Nt7R46f
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC56B21DEE;
	Tue, 19 Sep 2023 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695132125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fd/xQDz15vOndtiJvw/jhej0bfknSG2UgFNCPnkAysk=;
	b=D0pJDriwfVZWo+1awEmBVIRdgm/OBgdeqDjg6C8K/qep1bBUnqYVHxufDMOxMRTR5eF6GW
	+Sh9ofBUCNE7nsWQs/yqTKQVCoGZ28CChXunjWkhyRhP6vzPufWTl0U4ge6sGds9jDuSWl
	H/kLoNpblMgbXeVgfM2cbnuLSjj3Z/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695132125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fd/xQDz15vOndtiJvw/jhej0bfknSG2UgFNCPnkAysk=;
	b=7Nt7R46fN6rCqjouFm7TRk0ojB3G386sVvru1FSESWwPv3k6kto5MI8IjJq0HDIjKcbJjj
	UwyB8nt52fp3nqDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B39AF134F3;
	Tue, 19 Sep 2023 14:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HWP/Kt2pCWU2SAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 19 Sep 2023 14:02:05 +0000
Date: Tue, 19 Sep 2023 16:02:05 +0200
Message-ID: <87r0muw9b6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: hda_auto_parser: Always set codec->fixup_name
 when a quirk found
In-Reply-To: <5eafb0a8-b8a9-4d4e-81e8-8f4c35c4037e@linux.intel.com>
References: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
	<87wmwmwagn.wl-tiwai@suse.de>
	<5eafb0a8-b8a9-4d4e-81e8-8f4c35c4037e@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AY27KGIDEDGSDGTQQKHWBACS7XGJZYR7
X-Message-ID-Hash: AY27KGIDEDGSDGTQQKHWBACS7XGJZYR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AY27KGIDEDGSDGTQQKHWBACS7XGJZYR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 15:51:31 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 19/09/2023 16:37, Takashi Iwai wrote:
> > On Tue, 19 Sep 2023 15:23:22 +0200,
> > Peter Ujfalusi wrote:
> >>
> >> If a fixup is found via a quirk then the codec->fixup_name is only set if
> >> CONFIG_SND_DEBUG_VERBOSE is enabled, otherwise the fixup_name is set to
> >> NULL.
> >>
> >> This will result prints in __snd_hda_apply_fixup() when applying the found
> >> fixup for example:
> >> ehdaudio0D0: ALC236: Apply fix-func for (null)
> > 
> > Are you sure this doesn't break?  snd_pci_quirk.name is defined only
> > when CONFIG_SND_DEBUG_VERBOSE=y.
> 
> Right, that might cause some issues (I have it enabled), hrm, but the
> print in __snd_hda_apply_fixup() is not much of a help in this case..

Yeah, but it shows the target SSID, so you can reverse-search :)


Takashi

> > 
> > thanks,
> > 
> > Takashi
> > 
> > 
> >> Fixes: 73355ddd8775 ("ALSA: hda: Code refactoring snd_hda_pick_fixup()")
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> >> ---
> >>  sound/pci/hda/hda_auto_parser.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
> >> index 7c6b1fe8dfcc..7b1ddb8d40cb 100644
> >> --- a/sound/pci/hda/hda_auto_parser.c
> >> +++ b/sound/pci/hda/hda_auto_parser.c
> >> @@ -1043,9 +1043,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
> >>  
> >>   found_device:
> >>  	id = q->value;
> >> -#ifdef CONFIG_SND_DEBUG_VERBOSE
> >>  	name = q->name;
> >> -#endif
> >> +
> >>  	codec_dbg(codec, "%s: picked fixup %s for %s %04x:%04x\n",
> >>  		  codec->core.chip_name, name ? name : "",
> >>  		  type, q->subvendor, q->subdevice);
> >> -- 
> >> 2.42.0
> >>
> 
> -- 
> Péter
> 
