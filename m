Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5931822216
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:35:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50FE1EBD;
	Tue,  2 Jan 2024 20:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50FE1EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704224149;
	bh=Xt6ZUFAhdugRe+ribp7EMvtbkOelIDWmNfEFHyW5CYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SxizW03YX+Rn5NvR7LPwQtHn7mhIRRM4aGg2Lc68nVK9oHVtlwlf0Mq+cuNdLGTVo
	 SNBUPJfZg74cSPxuvgEkIkGJAoSnTFxTT6BXt3TmQHAAXYk1Pw/oEG0dDWMq4EG21B
	 iaJwxMmBOqnjkCHadmRc2/e7XyomGeZJl9IYNszI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27DF0F805C1; Tue,  2 Jan 2024 20:35:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC53FF805AE;
	Tue,  2 Jan 2024 20:35:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71515F80549; Tue,  2 Jan 2024 20:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08C85F80224
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08C85F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bQCLWE58;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eSQlK6FV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bQCLWE58;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eSQlK6FV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B47E1F7BA;
	Fri, 29 Dec 2023 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703862415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TwSloUaHhIdJaEHD8xijbH/JrSmQwCnnAODCtHCepqc=;
	b=bQCLWE581EGILzWlD6iMj7RpfgGb0x7CosnhMLfp1StqcdZ3b4SCCG0i2j4osk+pG3bPd3
	7pt/eIs93abkDK2vFJLxzVkVSJn56EGlRdCuWJ8zgJdvwH9SDCc2CO86xBFIA95f5537zx
	06AAqwoKVgsD8YBjp9ksKs7Vf+Mzob0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703862415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TwSloUaHhIdJaEHD8xijbH/JrSmQwCnnAODCtHCepqc=;
	b=eSQlK6FV9hI1DmncWhjtTpQk1tYSV4BwUaU7GL7RcF4hKbE372r35Ac6NrYi6oK+Eia/tw
	9UPz39MlXb6bpMCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703862415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TwSloUaHhIdJaEHD8xijbH/JrSmQwCnnAODCtHCepqc=;
	b=bQCLWE581EGILzWlD6iMj7RpfgGb0x7CosnhMLfp1StqcdZ3b4SCCG0i2j4osk+pG3bPd3
	7pt/eIs93abkDK2vFJLxzVkVSJn56EGlRdCuWJ8zgJdvwH9SDCc2CO86xBFIA95f5537zx
	06AAqwoKVgsD8YBjp9ksKs7Vf+Mzob0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703862415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TwSloUaHhIdJaEHD8xijbH/JrSmQwCnnAODCtHCepqc=;
	b=eSQlK6FV9hI1DmncWhjtTpQk1tYSV4BwUaU7GL7RcF4hKbE372r35Ac6NrYi6oK+Eia/tw
	9UPz39MlXb6bpMCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36D6B133E5;
	Fri, 29 Dec 2023 15:06:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QoXmC4/gjmU6AgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 15:06:55 +0000
Date: Fri, 29 Dec 2023 16:06:54 +0100
Message-ID: <87edf5xd2p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/20] ALSA: scarlett2: Add support for Scarlett 4th Gen
In-Reply-To: <cover.1703612638.git.g@b4.vu>
References: <cover.1703612638.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out2.suse.de;
	none
Message-ID-Hash: PYOLGD32YVSAIHUOPWTYDE75R4EPNWDE
X-Message-ID-Hash: PYOLGD32YVSAIHUOPWTYDE75R4EPNWDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYOLGD32YVSAIHUOPWTYDE75R4EPNWDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Dec 2023 19:05:43 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> This patch series adds support for the Focusrite Scarlett 4th Gen
> interfaces. It builds on top of the two previous patch series I sent:
> 
> - https://lore.kernel.org/linux-sound/cover.1703001053.git.g@b4.vu/
>   ("ALSA: scarlett2: Firmware Upgrade and Error Handling Improvements")
> 
> - https://lore.kernel.org/linux-sound/cover.1703444932.git.g@b4.vu/
>   ("ALSA: scarlett2: Refactor in preparation for gen4")
> 
> I already sent patch #1 in this series below separately:
> https://lore.kernel.org/linux-sound/ZYsBIE3DSKdi4YC%2F@m.b4.vu/
> as it should go in to 6.7. I wasn't sure if I should include it again
> here or not; sorry if I guessed wrong.
> 
> Patch #2 is a little cleanup I missed before sending the previous
> series and would have gone there had I noticed.
> 
> Patches #3-18 add the new controls, etc. needed for the Gen 4 support.
> 
> Patch #19 adds the USB IDs and configuration data to enable support
> for the new interfaces.
> 
> Patch #20 adds a last-minute new control that is only present on the
> Solo Gen 4.
> 
> Regards,
> Geoffrey.
> 
> Geoffrey D. Bennett (20):
>   ALSA: scarlett2: Convert meter levels from little-endian
>   ALSA: scarlett2: Remove repeated elem->head.mixer references
>   ALSA: scarlett2: Add support for air/phantom control on input 2
>   ALSA: scarlett2: Add support for Gen 4 style parameters
>   ALSA: scarlett2: Allow for controls with a "mute mode"
>   ALSA: scarlett2: Add support for Air Presence + Drive option
>   ALSA: scarlett2: Add support for software-controllable input gain
>   ALSA: scarlett2: Minor refactor MSD mode check
>   ALSA: scarlett2: Disable input controls while autogain is running
>   ALSA: scarlett2: Disable autogain during phantom power state change
>   ALSA: scarlett2: Add power status control
>   ALSA: scarlett2: Store mix_ctls for Gen 4 Direct Monitor
>   ALSA: scarlett2: Handle Gen 4 Direct Monitor mix updates
>   ALSA: scarlett2: Add support for custom Gen 4 Direct Monitor mixes
>   ALSA: scarlett2: Add support for DSP mux channels
>   ALSA: scarlett2: Rename DSP mux channels
>   ALSA: scarlett2: Add minimum firmware version check
>   ALSA: scarlett2: Add R/O headphone volume control
>   ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4
>   ALSA: scarlett2: Add PCM Input Switch for Solo Gen 4

Now applied to topic/scarlett2 branch (merged to for-next).

The first patch was already taken in for-linus branch for 6.7.


thanks,

Takashi
