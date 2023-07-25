Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D981A761823
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 14:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE6E1535;
	Tue, 25 Jul 2023 14:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE6E1535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690287619;
	bh=9aNFz4Z6YNl6u5Rw2AHgtw3ptE/9AzdYCNCUL9sI4Fc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sKlxhc4jfqwIG0xYpuW6YmvQeXwjflBi4vzjfM/nLI6HX7/UqR0CEuwGtQQHBu52s
	 qY8FU6mZvB5r/anIQMu8gv3VE8/ixXIpGHPOMN+wzXkz4aNXoSJFvN/ESMaFHQvkqL
	 CvvRML88jXk7YCQylReF1AG8v+MwF0ByjoAZYS64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EF5CF80544; Tue, 25 Jul 2023 14:19:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3046F80163;
	Tue, 25 Jul 2023 14:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD999F801F5; Tue, 25 Jul 2023 14:19:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84F2FF80149;
	Tue, 25 Jul 2023 14:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F2FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nKRhUzfP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=h3xvJsUV
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0AFAA1F8D6;
	Tue, 25 Jul 2023 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690287562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzhSLRFCc3FDGVZMyotgaVDt7Mrd8qvEnkZ0YwdXPV0=;
	b=nKRhUzfPH3cLfWoj4+66Uk2UJmAoLfr8dKfDCDoTRwVGc55sq6oN4wZ0c8BdBabQ/Ou0cv
	w6EpBcoVXBXrxChM0EiPrRXaW0WBWBp1+axQ+kRwWmdC0MBGyEaeuGzJ8PGyIBis1UPZtL
	kejjAdVf8HKp40rMOA76rNcypP1TTzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690287562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzhSLRFCc3FDGVZMyotgaVDt7Mrd8qvEnkZ0YwdXPV0=;
	b=h3xvJsUVFAXPSH7Xhlsu9+0t+dJV9ddIHtyQkWWmaR5f65LsHKyCPbSnW/JSjcRG5NpR36
	mmgOYCUOmi1XezCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE1CC13342;
	Tue, 25 Jul 2023 12:19:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tf90Kcm9v2QxOwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 12:19:21 +0000
Date: Tue, 25 Jul 2023 14:19:21 +0200
Message-ID: <87351ctc8m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	alsa-devel@alsa-project.org,	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,	Liam
 Girdwood <liam.r.girdwood@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Daniel
 Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 2/9] ALSA: hda/i915: Allow override of gpu binding.
In-Reply-To: <b0037097-b917-9069-7d8f-07e0317d6b9f@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
	<20230719164141.228073-3-maarten.lankhorst@linux.intel.com>
	<9b285ede-eaeb-40a2-086d-30cf74185784@linux.intel.com>
	<d75c1902-b715-4a33-1965-ec06d625e3ac@linux.intel.com>
	<932c4293-375f-685c-2cfd-0bc80fd80683@linux.intel.com>
	<b0037097-b917-9069-7d8f-07e0317d6b9f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JB7V357DAQ63OEHL2Y7WMIEVYBTQ3BGG
X-Message-ID-Hash: JB7V357DAQ63OEHL2Y7WMIEVYBTQ3BGG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JB7V357DAQ63OEHL2Y7WMIEVYBTQ3BGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 13:52:32 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> >>>> @@ -121,6 +128,9 @@ static int i915_gfx_present(struct pci_dev
> >>>> *hdac_pci)
> >>>>   {
> >>>>       struct pci_dev *display_dev = NULL;
> >>>>   +    if (!gpu_bind || (gpu_bind < 0 &&
> >>>> video_firmware_drivers_only()))
> >>>> +        return false;
> >>
> >>
> >> Bear with me since I am just going back to work mode but I can't figure
> >> out what the second part of the test does
> >>
> >> bool video_firmware_drivers_only(void)
> >> {
> >>     return video_nomodeset;
> >> }
> >> EXPORT_SYMBOL(video_firmware_drivers_only);
> >>
> >> and video_nomodeset=1 by default, so why would we return false when
> >> gpu_bind = -1?
> >>
> >> This seems to be a change of functionality, what am I missing?
> > video_nomodeset is 0 by default, only when nomodeset is given as
> > argument is it set to 1. :-)
> 
> 
> I must be missing something on how the default is handled.
> 
> bool video_firmware_drivers_only(void)
> {
> 	return video_nomodeset;
> }
> EXPORT_SYMBOL(video_firmware_drivers_only);
> 
> static int __init disable_modeset(char *str)
> {
> 	video_nomodeset = true;
> 
> isn't default 'true' then?

disable_modeset() is called *only* when nomodeset boot option is
given.  Then it overrides the value to true.


Takashi
