Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF7812E22
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 12:07:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B913DF6;
	Thu, 14 Dec 2023 12:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B913DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702552024;
	bh=/K9KMmDQbTnRhqvJoJIS6PJ4HuelYCrZaf+vFjnFl+g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MIEAe+FkBFSUHEad5Ym65azNHmHHNVwzCiVWKjoWVtDa381FPpgL3kXQDvSCQLOiP
	 yjIjcAkRZwIVkOSZb7yeHPvc5hTxeRmCd+PoFIpA5vtT0DveIo5EcDlWjwE80bkNxY
	 W0n+N7T5WPGXVxWYboKyAnoM4c9CfPgi4vpXISqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 243AEF805CA; Thu, 14 Dec 2023 12:06:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EBB4F805BA;
	Thu, 14 Dec 2023 12:06:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47F42F8016A; Thu, 14 Dec 2023 12:04:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 701C2F8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 12:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 701C2F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vQkTMrY5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3bzta1/D;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vQkTMrY5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3bzta1/D
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E1E71F7C5;
	Thu, 14 Dec 2023 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702551851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Skljw5BSFfgpdqQOUDwAU/GCeFOgAjR5XeHFC81qJ/A=;
	b=vQkTMrY51vyqlOg2jW5/nLQEPzZYE1f5yCnE4mFBzuluT+Njn+CXslgqe6U70uf9/1tT3P
	EzkUXzYNjB/at29bS8wHUI++bWErXHEwijxXpk/xZP6DJByPieFXU9oTkZniEuAkDx/fzA
	8nZ0f7FozdBeDA5GIhbh+nRyftoUpFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702551851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Skljw5BSFfgpdqQOUDwAU/GCeFOgAjR5XeHFC81qJ/A=;
	b=3bzta1/DtvaaOVt6hYd6neZPDuvXk7u9Vqc6CdtOsl03namm2nc4Pk9CipUVASKQOrKvGa
	TxZ2knK6DoJRBpAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702551851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Skljw5BSFfgpdqQOUDwAU/GCeFOgAjR5XeHFC81qJ/A=;
	b=vQkTMrY51vyqlOg2jW5/nLQEPzZYE1f5yCnE4mFBzuluT+Njn+CXslgqe6U70uf9/1tT3P
	EzkUXzYNjB/at29bS8wHUI++bWErXHEwijxXpk/xZP6DJByPieFXU9oTkZniEuAkDx/fzA
	8nZ0f7FozdBeDA5GIhbh+nRyftoUpFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702551851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Skljw5BSFfgpdqQOUDwAU/GCeFOgAjR5XeHFC81qJ/A=;
	b=3bzta1/DtvaaOVt6hYd6neZPDuvXk7u9Vqc6CdtOsl03namm2nc4Pk9CipUVASKQOrKvGa
	TxZ2knK6DoJRBpAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEF27137E8;
	Thu, 14 Dec 2023 11:04:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LA0HNSrhemXnZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Dec 2023 11:04:10 +0000
Date: Thu, 14 Dec 2023 12:04:10 +0100
Message-ID: <87edfpqc45.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/tas2781: call cleanup functions only once
In-Reply-To: 
 <1a0885c424bb21172702d254655882b59ef6477a.1702510018.git.soyer@irl.hu>
References: 
 <1a0885c424bb21172702d254655882b59ef6477a.1702510018.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.84 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.06)[60.79%]
Message-ID-Hash: BOOHF5BXSYZMZRXM7YD4U7WMTUQWHWAT
X-Message-ID-Hash: BOOHF5BXSYZMZRXM7YD4U7WMTUQWHWAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOOHF5BXSYZMZRXM7YD4U7WMTUQWHWAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Dec 2023 00:28:16 +0100,
Gergo Koteles wrote:
> 
> If the module can load the RCA but not the firmware binary, it will call
> the cleanup functions. Then unloading the module causes general
> protection fault due to double free.
> 
> Do not call the cleanup functions in tasdev_fw_ready.
> 
> general protection fault, probably for non-canonical address
> 0x6f2b8a2bff4c8fec: 0000 [#1] PREEMPT SMP NOPTI
> Call Trace:
>  <TASK>
>  ? die_addr+0x36/0x90
>  ? exc_general_protection+0x1c5/0x430
>  ? asm_exc_general_protection+0x26/0x30
>  ? tasdevice_config_info_remove+0x6d/0xd0 [snd_soc_tas2781_fmwlib]
>  tas2781_hda_unbind+0xaa/0x100 [snd_hda_scodec_tas2781_i2c]
>  component_unbind+0x2e/0x50
>  component_unbind_all+0x92/0xa0
>  component_del+0xa8/0x140
>  tas2781_hda_remove.isra.0+0x32/0x60 [snd_hda_scodec_tas2781_i2c]
>  i2c_device_remove+0x26/0xb0
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied.


Takashi
