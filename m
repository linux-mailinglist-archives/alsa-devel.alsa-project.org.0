Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E700985A19E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 12:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB60EBE;
	Mon, 19 Feb 2024 12:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB60EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708340885;
	bh=mH/z9hy5y1/jEvD4un/BSTP6zQ3aR1t42CU+6SFkCKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cfxb3E7WheU4O0xj0z9kFcsWaFqkGMRqjKbyD5ZiTbQ5k5d4zb8llf4DdlkzI8Cxt
	 2t2h7bwVHxBGERC1zTCdU33ChjT953r8BX2oN6uDjz+fAYVu/H4vcbuo0T6LB/7hJ8
	 BvevzIXZtmKyX/VCJM/smTEUNORqDyt4lSHaK3XI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCFAF8059F; Mon, 19 Feb 2024 12:07:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF05F80568;
	Mon, 19 Feb 2024 12:07:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A4C1F80496; Mon, 19 Feb 2024 12:07:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B64D7F800EE
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 12:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64D7F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=s86i5twg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UBGlvilk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=s86i5twg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UBGlvilk
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A8D1222F9;
	Mon, 19 Feb 2024 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708340818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VkQEWzEnd6uPTyGy38QQbhsmDl2BuN3OJaCFvojlto=;
	b=s86i5twgn2MtfLizWr3v+vuGVLzcvSg2Peyh1FBKe0C46J9WSpVN57M0vvk7PW1Xoq/QEl
	z9bbhf99Z0nt85d3UbQULxdp7NbnGWm52kd4LnJWMWcajaxRuVvn4Q/qmFtoMRk8uEdmPp
	uvljSRR5m862OU6OV9k0hmj+TTxigaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708340818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VkQEWzEnd6uPTyGy38QQbhsmDl2BuN3OJaCFvojlto=;
	b=UBGlvilkdOxexvJtL8JZ/pQLZ4r0X/oeFfep7ABRM5KKeSHlczaUTfG3OyLuq5COBK6Nne
	EmDpEGzvDifdsfBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708340818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VkQEWzEnd6uPTyGy38QQbhsmDl2BuN3OJaCFvojlto=;
	b=s86i5twgn2MtfLizWr3v+vuGVLzcvSg2Peyh1FBKe0C46J9WSpVN57M0vvk7PW1Xoq/QEl
	z9bbhf99Z0nt85d3UbQULxdp7NbnGWm52kd4LnJWMWcajaxRuVvn4Q/qmFtoMRk8uEdmPp
	uvljSRR5m862OU6OV9k0hmj+TTxigaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708340818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VkQEWzEnd6uPTyGy38QQbhsmDl2BuN3OJaCFvojlto=;
	b=UBGlvilkdOxexvJtL8JZ/pQLZ4r0X/oeFfep7ABRM5KKeSHlczaUTfG3OyLuq5COBK6Nne
	EmDpEGzvDifdsfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B50FF13647;
	Mon, 19 Feb 2024 11:06:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id viCtKlE202XtLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Feb 2024 11:06:57 +0000
Date: Mon, 19 Feb 2024 12:06:57 +0100
Message-ID: <87o7ccogq6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	LKML <linux-kernel@vger.kernel.org>,
	"Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
	Ethan Geller <ethang@valvesoftware.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [REGRESSION] Acp5x probing regression introduced between kernel
 6.7.2 -> 6.7.4
In-Reply-To: <3e364929-807e-477c-8530-f23db4ae7caf@amd.com>
References: 
 <CAD_nV8BG0t7US=+C28kQOR==712MPfZ9m-fuKksgoZCgrEByCw@mail.gmail.com>
	<7a0cd63f-8a83-4dc5-8763-63dcdae8d68a@leemhuis.info>
	<878r3qxcyr.wl-tiwai@suse.de>
	<871q9hwz2w.wl-tiwai@suse.de>
	<ZdDXJyXiZ++KiNqW@finisterre.sirena.org.uk>
	<87msrzos6m.wl-tiwai@suse.de>
	<3e364929-807e-477c-8530-f23db4ae7caf@amd.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s86i5twg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UBGlvilk
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Queue-Id: 2A8D1222F9
Message-ID-Hash: EH5BQMMCPD56GTFVYWDM252EXIW4VX45
X-Message-ID-Hash: EH5BQMMCPD56GTFVYWDM252EXIW4VX45
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EH5BQMMCPD56GTFVYWDM252EXIW4VX45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Feb 2024 11:50:46 +0100,
Venkata Prasad Potturu wrote:
> 
> 
> On 2/18/24 00:04, Takashi Iwai wrote:
> > On Sat, 17 Feb 2024 16:56:23 +0100,
> > Mark Brown wrote:
> >> On Mon, Feb 12, 2024 at 03:12:55PM +0100, Takashi Iwai wrote:
> >>> Takashi Iwai wrote:
> >>>> Interestingly, the system seems working with 6.8-rc3, so some piece
> >>>> might be missing.  Or simply reverting this patch should fix.
> >>> In the bugzilla entry, the reporter confirmed that the revert of the
> >>> commit 4b6986b170f2f2 fixed the problem.
> >> Any news on a patch for this?  Venkata?
> Hi Mark & Takashi,
> Sorry for the late reply.
> 
> 4b6986b170f2f2 ASoC: amd: Add new dmi entries for acp5x platform
> 
> There is no relation with the below error and this reverted patch, this patch is to
> define is to load Legacy driver for Jupiter Steam deck variant.
> 
> We will check on this.
> 
> Error logs.
> [    8.755614] cs35l41 spi-VLV1776:00: supply VA not found, using dummy regulator
> [    8.760506] cs35l41 spi-VLV1776:00: supply VP not found, using dummy regulator
> [    8.777148] cs35l41 spi-VLV1776:00: Cirrus Logic CS35L41 (35a40), Revision: B2
> [    8.777471] cs35l41 spi-VLV1776:01: supply VA not found, using dummy regulator
> [    8.777532] cs35l41 spi-VLV1776:01: supply VP not found, using dummy regulator
> [    8.777709] cs35l41 spi-VLV1776:01: Reset line busy, assuming shared reset
> [    8.788465] cs35l41 spi-VLV1776:01: Cirrus Logic CS35L41 (35a40), Revision: B2
> [    8.877280] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
> [    8.877595] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio client
> [    8.889913] snd_acp_pci 0000:04:00.5: enabling device (0000 -> 0002)
> [    8.890063] snd_acp_pci 0000:04:00.5: Unsupported device revision:0x50
> [    8.890129] snd_acp_pci: probe of 0000:04:00.5 failed with error -22

My understanding is that the fact that snd_acp_pci matches caused the
problem (without backports of other relevant changes).
In the working case, it's probed with snd_pci_acp5x driver.


thanks,

Takashi
