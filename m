Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EC7A655D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 15:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A220DEC;
	Tue, 19 Sep 2023 15:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A220DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695130695;
	bh=ZH6uY6a2Mw4JAFF7v6HzF3eW0YrN1hILL+o0z8aLjio=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YkGPNOmjRYu5Cn0paGGLrgzSgUEtpv31sZ3AXi4vLFX51xTDphJ9R2z/N5pHHIlop
	 VmhDZp2r2Gi49fflBmagHB9Ld9lHNcuk1NZl3PabKNOpF+3sCr6ITTy4LNkQK7vtps
	 4ztzVWA+Qq7OY1mEPqArMy6lnXmbPjbQ0XEhUtn4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C62DCF80558; Tue, 19 Sep 2023 15:37:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 598A5F80125;
	Tue, 19 Sep 2023 15:37:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37AC1F8025A; Tue, 19 Sep 2023 15:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1857F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 15:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1857F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YgJtGdOA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gL5pX/yW
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0402D21E13;
	Tue, 19 Sep 2023 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695130633;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15KHoKmBUcMsVHEV2wbsNyPF7iDEgMYHmMYdas1SvYw=;
	b=YgJtGdOA8qHFQwXnzOOEB24Lo3qC+Ewrt1ZFFKPhWtvUfGU32oV4uGrOh48iUx8Qsao2oI
	xtoO5WVSanc5hSmvAfodPZVJ+EcBov0ZvQRTsJ1gw6KecdhCUe2h90HoetZ6VJ0wglFqHX
	Fd5Mhfd2CuOF7vuC/jrW4vjK8WE1vhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695130633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15KHoKmBUcMsVHEV2wbsNyPF7iDEgMYHmMYdas1SvYw=;
	b=gL5pX/yWruuHURgB0ES1Rpk5mUclSIp+D95HsmbEjk9IdA+ifiO3Fue/XQZv7RYcG8IkRS
	NillHUauuwdJ2vDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFB49134F3;
	Tue, 19 Sep 2023 13:37:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id T67FMQikCWU7OgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 19 Sep 2023 13:37:12 +0000
Date: Tue, 19 Sep 2023 15:37:12 +0200
Message-ID: <87wmwmwagn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: hda_auto_parser: Always set codec->fixup_name
 when a quirk found
In-Reply-To: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
References: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QAWQNZ6WBYIMJBB2EFRKOAC2M5EDN6VY
X-Message-ID-Hash: QAWQNZ6WBYIMJBB2EFRKOAC2M5EDN6VY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAWQNZ6WBYIMJBB2EFRKOAC2M5EDN6VY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 15:23:22 +0200,
Peter Ujfalusi wrote:
> 
> If a fixup is found via a quirk then the codec->fixup_name is only set if
> CONFIG_SND_DEBUG_VERBOSE is enabled, otherwise the fixup_name is set to
> NULL.
> 
> This will result prints in __snd_hda_apply_fixup() when applying the found
> fixup for example:
> ehdaudio0D0: ALC236: Apply fix-func for (null)

Are you sure this doesn't break?  snd_pci_quirk.name is defined only
when CONFIG_SND_DEBUG_VERBOSE=y.


thanks,

Takashi


> Fixes: 73355ddd8775 ("ALSA: hda: Code refactoring snd_hda_pick_fixup()")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  sound/pci/hda/hda_auto_parser.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
> index 7c6b1fe8dfcc..7b1ddb8d40cb 100644
> --- a/sound/pci/hda/hda_auto_parser.c
> +++ b/sound/pci/hda/hda_auto_parser.c
> @@ -1043,9 +1043,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>  
>   found_device:
>  	id = q->value;
> -#ifdef CONFIG_SND_DEBUG_VERBOSE
>  	name = q->name;
> -#endif
> +
>  	codec_dbg(codec, "%s: picked fixup %s for %s %04x:%04x\n",
>  		  codec->core.chip_name, name ? name : "",
>  		  type, q->subvendor, q->subdevice);
> -- 
> 2.42.0
> 
