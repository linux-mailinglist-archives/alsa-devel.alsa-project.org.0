Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A5701C27
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 09:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFE1E8D;
	Sun, 14 May 2023 09:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFE1E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684049833;
	bh=JbEpiNueWX3uSumUxv1fKSsPG5+RTQ7mRp/EI3ocZGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U2Dm7R56gaq83/YiF1Sep20HDAxHOjnZyyz2uAJp+JhmyIfrSBVGPF9/P1/y2iBgK
	 /9yYycYZfieLS3AZZC4EUNoSomZmKtYXnD5IYIJV0LdekAJL/26tUx82ptIs9NSrnh
	 L58++vKDTBggq3DYIrjqlowhnMi/f+tXn5EWa2Cc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D39AEF802E8; Sun, 14 May 2023 09:36:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC8E5F8025A;
	Sun, 14 May 2023 09:36:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3475F80272; Sun, 14 May 2023 09:36:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 87BEEF8016A
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 09:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87BEEF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ANFHi/An;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=veavSUvA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4939D1F8C1;
	Sun, 14 May 2023 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684049720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=io3WyacZBYgXYP+cm6H49c6wg9iNCb5kYPIaYDF+0mA=;
	b=ANFHi/AnWLr8g9wb71y4RA+ZDvF5ntZt0L2i+f4uiNocGHQsv02PQXeZaK7m7BmMrE0Awx
	JaE72flF23RVk64x/4NcWfugwHVj0ZuyZvAH8X3GVZlNpJSsq+l0GFQLdbCBiXikSiFR+L
	Zbvz8szmA2q5lWX7OTgmtBs7uRLjpEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684049720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=io3WyacZBYgXYP+cm6H49c6wg9iNCb5kYPIaYDF+0mA=;
	b=veavSUvAS7veyUM+n63a9AbG6E/JTk4JXMAXYcnu9qYqEKyPjxRs1ukSzSoQU9LIXTpN1U
	lysiCtys6PC1oGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC865139D0;
	Sun, 14 May 2023 07:35:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QlTTODePYGQcLwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 14 May 2023 07:35:19 +0000
Date: Sun, 14 May 2023 09:35:19 +0200
Message-ID: <87cz338ix4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joseph C. Sible" <josephcsible@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	regressions@lists.linux.dev,
	kailang@realtek.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: 
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLE6RIJ3OBLE3TLLIH6LNNUB7GTK3OAO
X-Message-ID-Hash: GLE6RIJ3OBLE3TLLIH6LNNUB7GTK3OAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLE6RIJ3OBLE3TLLIH6LNNUB7GTK3OAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 14 May 2023 08:46:14 +0200,
Joseph C. Sible wrote:
> 
> On Sun, May 14, 2023 at 1:41 AM Bagas Sanjaya wrote:
> > Can you attach dmesg messages so that we can know what exactly the error
> > is?
> 
> Attached are both warm.txt (where it's broken) and cold.txt (where
> it's working fine, for comparison). These messages (only in warm.txt)
> stand out to me immediately:
> 
> [    5.482071] snd_hda_intel 0000:03:00.6: azx_get_response timeout,
> switching to polling mode: last cmd=0x800f0005
> [    6.482536] snd_hda_intel 0000:03:00.6: No response from codec,
> disabling MSI: last cmd=0x800f0005
> [    7.485529] snd_hda_intel 0000:03:00.6: azx_get_response timeout,
> switching to single_cmd mode: last cmd=0x800f0005
> [   13.550516] snd_hda_intel 0000:03:00.6: no codecs initialized
> [   13.550500] hdaudio hdaudioC1D0: no AFG or MFG node found

The patch changes two places (the change in alc_shutup_pins() and
alc256_shutup()), and I guess the latter is the culprit.  Could you
verify that only reverting the latter fixes the problem?


thanks,

Takashi


> > > I bisected this to commit 5aec989, which first appeared in 5.15-rc6. In
> > > addition, I confirmed by doing a custom build of 6.3.2 with reverts of both
> > > f30741c (just to avoid a conflict) and 5aec989, which works correctly for me.
> >
> > Note: when you refer commits, write at least 12 first characters of the
> > commit's hash. You may want to set `core.abbrev=12` in your
> > `~/.gitconfig`. Also the canonical commit reference is
> > `--pretty=format:%h (\"%s\")`.
> 
> Got it. To avoid any ambiguity, here's the two commits I mentioned that way:
> 5aec98913095 ("ALSA: hda/realtek - ALC236 headset MIC recording issue")
> f30741cded62 ("ALSA: hda/realtek: Fix audio regression on Mi Notebook Pro 2020")
> 
> Regards,
> 
> Joseph C. Sible
> [    0.000000] Linux version 6.3.2-060302-generic (kernel@sita) (x86_64-linux-gnu-gcc-12 (Ubuntu 12.2.0-17ubuntu1) 12.2.0, GNU ld (GNU Binutils for Ubuntu) 2.40) #202305111150 SMP PREEMPT_DYNAMIC Thu May 11 22:22:15 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   Hygon HygonGenuine
> [    0.000000]   Centaur CentaurHauls
> [    0.000000]   zhaoxin   Shanghai  
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
> [    0.000000] signal: max sigframe size: 1776
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009e7ffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000009e80000-0x0000000009ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a21dfff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x000000000a21e000-0x00000000b045efff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000b045f000-0x00000000b045ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000b0460000-0x00000000b078efff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000b078f000-0x00000000b0a5bfff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000b0a5c000-0x00000000b0ad0fff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000b0ad1000-0x00000000b5db9fff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000b5dba000-0x00000000bbdfdfff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000bbdfe000-0x00000000bcffefff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000bcfff000-0x00000000bdffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000be600000-0x00000000bfffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021e33ffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000021e340000-0x00000002601fffff] reserved
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] e820: update [mem 0xa0719018-0xa0723e57] usable ==> usable
> [    0.000000] e820: update [mem 0xa0719018-0xa0723e57] usable ==> usable
> [    0.000000] extended physical RAM map:
> [    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009e7ffff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000009e80000-0x0000000009ffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
> [    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a21dfff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x000000000a21e000-0x00000000a0719017] usable
> [    0.000000] reserve setup_data: [mem 0x00000000a0719018-0x00000000a0723e57] usable
> [    0.000000] reserve setup_data: [mem 0x00000000a0723e58-0x00000000b045efff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000b045f000-0x00000000b045ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000b0460000-0x00000000b078efff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000b078f000-0x00000000b0a5bfff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000b0a5c000-0x00000000b0ad0fff] ACPI data
> [    0.000000] reserve setup_data: [mem 0x00000000b0ad1000-0x00000000b5db9fff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000b5dba000-0x00000000bbdfdfff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000bbdfe000-0x00000000bcffefff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000bcfff000-0x00000000bdffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000be600000-0x00000000bfffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021e33ffff] usable
> [    0.000000] reserve setup_data: [mem 0x000000021e340000-0x00000002601fffff] reserved
> [    0.000000] efi: EFI v2.8 by American Megatrends
> [    0.000000] efi: ACPI=0xb0ad0000 ACPI 2.0=0xb0ad0014 SMBIOS=0xbba71000 SMBIOS 3.0=0xbba70000 MEMATTR=0xad04c018 ESRT=0xaf1c7718 MOKvar=0xbbbb6000 RNG=0xb0a73018 
> [    0.000000] random: crng init done
> [    0.000000] efi: Remove mem66: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
> [    0.000000] e820: remove [mem 0xe0000000-0xefffffff] reserved
> [    0.000000] efi: Remove mem67: MMIO range=[0xfd000000-0xfedfffff] (30MB) from e820 map
> [    0.000000] e820: remove [mem 0xfd000000-0xfedfffff] reserved
> [    0.000000] efi: Not removing mem68: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
> [    0.000000] efi: Remove mem69: MMIO range=[0xfee01000-0xffffffff] (17MB) from e820 map
> [    0.000000] e820: remove [mem 0xfee01000-0xffffffff] reserved
> [    0.000000] efi: Remove mem71: MMIO range=[0x240000000-0x2601fffff] (514MB) from e820 map
> [    0.000000] e820: remove [mem 0x240000000-0x2601fffff] reserved
> [    0.000000] SMBIOS 3.5.0 present.
> [    0.000000] DMI: HP HP Laptop 15z-fc000/8B2F, BIOS F.07 03/13/2023
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 2395.330 MHz processor
> [    0.000017] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.000019] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000028] last_pfn = 0x21e340 max_arch_pfn = 0x400000000
> [    0.000036] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
> [    0.000294] last_pfn = 0xbcfff max_arch_pfn = 0x400000000
> [    0.005029] esrt: Reserving ESRT space from 0x00000000af1c7718 to 0x00000000af1c7750.
> [    0.005036] e820: update [mem 0xaf1c7000-0xaf1c7fff] usable ==> reserved
> [    0.005058] Using GB pages for direct mapping
> [    0.005808] Secure boot disabled
> [    0.005809] RAMDISK: [mem 0xa0724000-0xa512dfff]
> [    0.005816] ACPI: Early table checksum verification disabled
> [    0.005820] ACPI: RSDP 0x00000000B0AD0014 000024 (v02 HPQOEM)
> [    0.005824] ACPI: XSDT 0x00000000B0ACF728 00013C (v01 HPQOEM SLIC-MPC 01072009 AMI  01000013)
> [    0.005831] ACPI: FACP 0x00000000B0AC3000 000114 (v06 HPQOEM SLIC-MPC 01072009 HP   00010013)
> [    0.005837] ACPI: DSDT 0x00000000B0AAB000 017ED6 (v02 HPQOEM 8B2F     01072009 ACPI 20200717)
> [    0.005840] ACPI: FACS 0x00000000B1B9A000 000040
> [    0.005843] ACPI: MSDM 0x00000000B0ACE000 000055 (v03 HPQOEM SLIC-MPC 00000001 HP   00010013)
> [    0.005846] ACPI: SSDT 0x00000000B0AC6000 007EFB (v02 HPQOEM 8B2F     00000002 ACPI 02000002)
> [    0.005849] ACPI: IVRS 0x00000000B0AC5000 0001A4 (v02 HPQOEM 8B2F     00000001 HP   00000001)
> [    0.005853] ACPI: SSDT 0x00000000B0AC4000 00008C (v02 HPQOEM 8B2F     01072009 ACPI 01072009)
> [    0.005856] ACPI: FIDT 0x00000000B0AAA000 00009C (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005859] ACPI: MCFG 0x00000000B0AA9000 00003C (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005862] ACPI: HPET 0x00000000B0AA8000 000038 (v01 HPQOEM 8B2F     01072009 HP   00000005)
> [    0.005865] ACPI: UEFI 0x00000000B1B99000 000048 (v01 HPQOEM 8B2F     01072009 HP   01000013)
> [    0.005868] ACPI: FPDT 0x00000000B0AA7000 000044 (v01 HPQOEM 8B2F     01072009 HP   01000013)
> [    0.005871] ACPI: VFCT 0x00000000B0A9C000 00AE84 (v01 HPQOEM 8B2F     00000001 HP   31504F47)
> [    0.005874] ACPI: SSDT 0x00000000B0A9B000 000060 (v01 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005877] ACPI: SSDT 0x00000000B0A9A000 000A44 (v02 HPQOEM 8B2F     00000001 ACPI 00000001)
> [    0.005880] ACPI: CRAT 0x00000000B0A99000 000468 (v01 HPQOEM 8B2F     00000001 HP   00000001)
> [    0.005883] ACPI: CDIT 0x00000000B0A98000 000029 (v01 HPQOEM 8B2F     00000001 HP   00000001)
> [    0.005886] ACPI: SSDT 0x00000000B0A97000 000BAB (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005889] ACPI: SSDT 0x00000000B0A94000 0029C4 (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005892] ACPI: SSDT 0x00000000B0A93000 00049F (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005895] ACPI: SSDT 0x00000000B0A92000 000695 (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005898] ACPI: SSDT 0x00000000B0A89000 00889F (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005901] ACPI: WSMT 0x00000000B0A88000 000028 (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005904] ACPI: APIC 0x00000000B0A87000 0000E8 (v05 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005907] ACPI: SSDT 0x00000000B0A86000 000804 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005910] ACPI: SSDT 0x00000000B0A84000 0010AD (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005913] ACPI: SSDT 0x00000000B0A83000 000834 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005916] ACPI: SSDT 0x00000000B0A82000 0005E0 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005919] ACPI: SSDT 0x00000000B0A81000 0005E1 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005922] ACPI: SSDT 0x00000000B0A80000 0007B5 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005925] ACPI: SSDT 0x00000000B0A7E000 001F97 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005928] ACPI: SSDT 0x00000000B0A79000 0047F8 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005931] ACPI: SSDT 0x00000000B0A78000 000A10 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005935] ACPI: SSDT 0x00000000B0A77000 00008D (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005938] ACPI: SSDT 0x00000000B0A76000 000792 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005941] ACPI: SSDT 0x00000000B0A75000 000CC9 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005944] ACPI: BGRT 0x00000000B0A74000 000038 (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005946] ACPI: Reserving FACP table memory at [mem 0xb0ac3000-0xb0ac3113]
> [    0.005948] ACPI: Reserving DSDT table memory at [mem 0xb0aab000-0xb0ac2ed5]
> [    0.005949] ACPI: Reserving FACS table memory at [mem 0xb1b9a000-0xb1b9a03f]
> [    0.005949] ACPI: Reserving MSDM table memory at [mem 0xb0ace000-0xb0ace054]
> [    0.005950] ACPI: Reserving SSDT table memory at [mem 0xb0ac6000-0xb0acdefa]
> [    0.005951] ACPI: Reserving IVRS table memory at [mem 0xb0ac5000-0xb0ac51a3]
> [    0.005952] ACPI: Reserving SSDT table memory at [mem 0xb0ac4000-0xb0ac408b]
> [    0.005953] ACPI: Reserving FIDT table memory at [mem 0xb0aaa000-0xb0aaa09b]
> [    0.005953] ACPI: Reserving MCFG table memory at [mem 0xb0aa9000-0xb0aa903b]
> [    0.005954] ACPI: Reserving HPET table memory at [mem 0xb0aa8000-0xb0aa8037]
> [    0.005955] ACPI: Reserving UEFI table memory at [mem 0xb1b99000-0xb1b99047]
> [    0.005956] ACPI: Reserving FPDT table memory at [mem 0xb0aa7000-0xb0aa7043]
> [    0.005957] ACPI: Reserving VFCT table memory at [mem 0xb0a9c000-0xb0aa6e83]
> [    0.005957] ACPI: Reserving SSDT table memory at [mem 0xb0a9b000-0xb0a9b05f]
> [    0.005958] ACPI: Reserving SSDT table memory at [mem 0xb0a9a000-0xb0a9aa43]
> [    0.005959] ACPI: Reserving CRAT table memory at [mem 0xb0a99000-0xb0a99467]
> [    0.005960] ACPI: Reserving CDIT table memory at [mem 0xb0a98000-0xb0a98028]
> [    0.005961] ACPI: Reserving SSDT table memory at [mem 0xb0a97000-0xb0a97baa]
> [    0.005961] ACPI: Reserving SSDT table memory at [mem 0xb0a94000-0xb0a969c3]
> [    0.005962] ACPI: Reserving SSDT table memory at [mem 0xb0a93000-0xb0a9349e]
> [    0.005963] ACPI: Reserving SSDT table memory at [mem 0xb0a92000-0xb0a92694]
> [    0.005964] ACPI: Reserving SSDT table memory at [mem 0xb0a89000-0xb0a9189e]
> [    0.005965] ACPI: Reserving WSMT table memory at [mem 0xb0a88000-0xb0a88027]
> [    0.005965] ACPI: Reserving APIC table memory at [mem 0xb0a87000-0xb0a870e7]
> [    0.005966] ACPI: Reserving SSDT table memory at [mem 0xb0a86000-0xb0a86803]
> [    0.005967] ACPI: Reserving SSDT table memory at [mem 0xb0a84000-0xb0a850ac]
> [    0.005968] ACPI: Reserving SSDT table memory at [mem 0xb0a83000-0xb0a83833]
> [    0.005969] ACPI: Reserving SSDT table memory at [mem 0xb0a82000-0xb0a825df]
> [    0.005969] ACPI: Reserving SSDT table memory at [mem 0xb0a81000-0xb0a815e0]
> [    0.005970] ACPI: Reserving SSDT table memory at [mem 0xb0a80000-0xb0a807b4]
> [    0.005971] ACPI: Reserving SSDT table memory at [mem 0xb0a7e000-0xb0a7ff96]
> [    0.005972] ACPI: Reserving SSDT table memory at [mem 0xb0a79000-0xb0a7d7f7]
> [    0.005973] ACPI: Reserving SSDT table memory at [mem 0xb0a78000-0xb0a78a0f]
> [    0.005973] ACPI: Reserving SSDT table memory at [mem 0xb0a77000-0xb0a7708c]
> [    0.005974] ACPI: Reserving SSDT table memory at [mem 0xb0a76000-0xb0a76791]
> [    0.005975] ACPI: Reserving SSDT table memory at [mem 0xb0a75000-0xb0a75cc8]
> [    0.005976] ACPI: Reserving BGRT table memory at [mem 0xb0a74000-0xb0a74037]
> [    0.006154] No NUMA configuration found
> [    0.006155] Faking a node at [mem 0x0000000000000000-0x000000021e33ffff]
> [    0.006162] NODE_DATA(0) allocated [mem 0x21e315000-0x21e33ffff]
> [    0.006337] Zone ranges:
> [    0.006338]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.006339]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.006341]   Normal   [mem 0x0000000100000000-0x000000021e33ffff]
> [    0.006343]   Device   empty
> [    0.006344] Movable zone start for each node
> [    0.006346] Early memory node ranges
> [    0.006346]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
> [    0.006348]   node   0: [mem 0x0000000000100000-0x0000000009e7ffff]
> [    0.006349]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
> [    0.006350]   node   0: [mem 0x000000000a21e000-0x00000000b045efff]
> [    0.006351]   node   0: [mem 0x00000000b0460000-0x00000000b078efff]
> [    0.006352]   node   0: [mem 0x00000000bbdfe000-0x00000000bcffefff]
> [    0.006352]   node   0: [mem 0x0000000100000000-0x000000021e33ffff]
> [    0.006354] Initmem setup node 0 [mem 0x0000000000001000-0x000000021e33ffff]
> [    0.006359] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.006378] On node 0, zone DMA: 96 pages in unavailable ranges
> [    0.006567] On node 0, zone DMA32: 384 pages in unavailable ranges
> [    0.011549] On node 0, zone DMA32: 30 pages in unavailable ranges
> [    0.011561] On node 0, zone DMA32: 1 pages in unavailable ranges
> [    0.011984] On node 0, zone DMA32: 46703 pages in unavailable ranges
> [    0.020723] On node 0, zone Normal: 12289 pages in unavailable ranges
> [    0.020789] On node 0, zone Normal: 7360 pages in unavailable ranges
> [    0.020906] ACPI: PM-Timer IO Port: 0x808
> [    0.020915] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
> [    0.020930] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0-23
> [    0.020935] IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 24-55
> [    0.020938] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.020940] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
> [    0.020941] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> [    0.020945] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.020946] ACPI: HPET id: 0x10228201 base: 0xfed00000
> [    0.020956] e820: update [mem 0xad56d000-0xad580fff] usable ==> reserved
> [    0.020969] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> [    0.020990] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.020992] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
> [    0.020994] PM: hibernation: Registered nosave memory: [mem 0x09e80000-0x09ffffff]
> [    0.020996] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a21dfff]
> [    0.020997] PM: hibernation: Registered nosave memory: [mem 0xa0719000-0xa0719fff]
> [    0.020999] PM: hibernation: Registered nosave memory: [mem 0xa0723000-0xa0723fff]
> [    0.021001] PM: hibernation: Registered nosave memory: [mem 0xad56d000-0xad580fff]
> [    0.021002] PM: hibernation: Registered nosave memory: [mem 0xaf1c7000-0xaf1c7fff]
> [    0.021004] PM: hibernation: Registered nosave memory: [mem 0xb045f000-0xb045ffff]
> [    0.021005] PM: hibernation: Registered nosave memory: [mem 0xb078f000-0xb0a5bfff]
> [    0.021006] PM: hibernation: Registered nosave memory: [mem 0xb0a5c000-0xb0ad0fff]
> [    0.021007] PM: hibernation: Registered nosave memory: [mem 0xb0ad1000-0xb5db9fff]
> [    0.021007] PM: hibernation: Registered nosave memory: [mem 0xb5dba000-0xbbdfdfff]
> [    0.021009] PM: hibernation: Registered nosave memory: [mem 0xbcfff000-0xbdffffff]
> [    0.021010] PM: hibernation: Registered nosave memory: [mem 0xbe000000-0xbe5fffff]
> [    0.021010] PM: hibernation: Registered nosave memory: [mem 0xbe600000-0xbfffffff]
> [    0.021011] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xfedfffff]
> [    0.021012] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
> [    0.021013] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
> [    0.021014] [mem 0xc0000000-0xfedfffff] available for PCI devices
> [    0.021016] Booting paravirtualized kernel on bare hardware
> [    0.021019] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.021029] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:1
> [    0.021317] percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u1048576
> [    0.021326] pcpu-alloc: s217088 r8192 d28672 u1048576 alloc=1*2097152
> [    0.021328] pcpu-alloc: [0] 0 1 
> [    0.021359] Fallback order for Node 0: 0 
> [    0.021362] Built 1 zonelists, mobility grouping on.  Total pages: 1869380
> [    0.021363] Policy zone: Normal
> [    0.021365] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7
> [    0.021461] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic", will be passed to user space.
> [    0.022733] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
> [    0.023231] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
> [    0.023272] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
> [    0.023328] software IO TLB: area num 2.
> [    0.052873] Memory: 7111252K/7596864K available (20480K kernel code, 4170K rwdata, 22520K rodata, 4700K init, 17584K bss, 485352K reserved, 0K cma-reserved)
> [    0.052993] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> [    0.053038] ftrace: allocating 53634 entries in 210 pages
> [    0.064850] ftrace: allocated 210 pages with 4 groups
> [    0.065819] Dynamic Preempt: voluntary
> [    0.065842] rcu: Preemptible hierarchical RCU implementation.
> [    0.065843] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=2.
> [    0.065844] 	Trampoline variant of Tasks RCU enabled.
> [    0.065845] 	Rude variant of Tasks RCU enabled.
> [    0.065845] 	Tracing variant of Tasks RCU enabled.
> [    0.065846] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> [    0.065847] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    0.068348] NR_IRQS: 524544, nr_irqs: 512, preallocated irqs: 16
> [    0.068541] rcu: 	Offload RCU callbacks from CPUs: 0-1.
> [    0.068545] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.068691] Console: colour dummy device 80x25
> [    0.068693] printk: console [tty0] enabled
> [    0.068734] ACPI: Core revision 20221020
> [    0.069030] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
> [    0.069051] APIC: Switch to symmetric I/O mode setup
> [    0.070155] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.070160] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.070162] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.070163] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    0.070164] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
> [    0.070628] x2apic: IRQ remapping doesn't support X2APIC mode
> [    0.071400] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.076057] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2286fbe86e4, max_idle_ns: 440795324438 ns
> [    0.076067] Calibrating delay loop (skipped), value calculated using timer frequency.. 4790.66 BogoMIPS (lpj=2395330)
> [    0.076070] pid_max: default: 32768 minimum: 301
> [    0.079095] LSM: initializing lsm=lockdown,capability,landlock,yama,integrity,apparmor
> [    0.079112] landlock: Up and running.
> [    0.079112] Yama: becoming mindful.
> [    0.079150] AppArmor: AppArmor initialized
> [    0.079195] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.079213] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.079434] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [    0.079579] LVT offset 1 assigned for vector 0xf9
> [    0.079623] LVT offset 2 assigned for vector 0xf4
> [    0.079634] process: using mwait in idle threads
> [    0.079638] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
> [    0.079640] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
> [    0.079647] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    0.079649] Spectre V2 : Mitigation: Retpolines
> [    0.079650] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> [    0.079651] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
> [    0.079652] Spectre V2 : Enabling Speculation Barrier for firmware calls
> [    0.079653] RETBleed: Mitigation: untrained return thunk
> [    0.079655] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    0.079656] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    0.091274] Freeing SMP alternatives memory: 44K
> [    0.194706] smpboot: CPU0: AMD Athlon Silver 7120U with Radeon Graphics (family: 0x17, model: 0xa0, stepping: 0x0)
> [    0.194842] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.194844] cblist_init_generic: Setting shift to 1 and lim to 1.
> [    0.194860] cblist_init_generic: Setting shift to 1 and lim to 1.
> [    0.194873] cblist_init_generic: Setting shift to 1 and lim to 1.
> [    0.194888] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    0.194895] ... version:                0
> [    0.194896] ... bit width:              48
> [    0.194896] ... generic registers:      6
> [    0.194897] ... value mask:             0000ffffffffffff
> [    0.194898] ... max period:             00007fffffffffff
> [    0.194899] ... fixed-purpose events:   0
> [    0.194899] ... event mask:             000000000000003f
> [    0.194992] rcu: Hierarchical SRCU implementation.
> [    0.194993] rcu: 	Max phase no-delay instances is 400.
> [    0.195061] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
> [    0.195061] smp: Bringing up secondary CPUs ...
> [    0.195061] x86: Booting SMP configuration:
> [    0.195061] .... node  #0, CPUs:      #1
> [    0.196138] smp: Brought up 1 node, 2 CPUs
> [    0.196138] smpboot: Max logical packages: 1
> [    0.196138] smpboot: Total of 2 processors activated (9581.32 BogoMIPS)
> [    0.197538] devtmpfs: initialized
> [    0.197538] x86/mm: Memory block size: 128MB
> [    0.198349] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a21dfff] (122880 bytes)
> [    0.198355] ACPI: PM: Registering ACPI NVS region [mem 0xb0ad1000-0xb5db9fff] (86937600 bytes)
> [    0.199511] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.199522] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> [    0.199591] pinctrl core: initialized pinctrl subsystem
> [    0.199730] PM: RTC time: 06:11:09, date: 2023-05-14
> [    0.200465] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.200779] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
> [    0.200886] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.200989] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.201005] audit: initializing netlink subsys (disabled)
> [    0.201071] audit: type=2000 audit(1684044669.131:1): state=initialized audit_enabled=0 res=1
> [    0.201204] thermal_sys: Registered thermal governor 'fair_share'
> [    0.201205] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.201206] thermal_sys: Registered thermal governor 'step_wise'
> [    0.201207] thermal_sys: Registered thermal governor 'user_space'
> [    0.201208] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.201214] EISA bus registered
> [    0.201226] cpuidle: using governor ladder
> [    0.201229] cpuidle: using governor menu
> [    0.201259] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
> [    0.201259] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.201259] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.201259] PCI: not using MMCONFIG
> [    0.201259] PCI: Using configuration type 1 for base access
> [    0.201259] PCI: Using configuration type 1 for extended access
> [    0.201403] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
> [    0.210082] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.210087] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [    0.210090] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.210092] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.210710] ACPI: Added _OSI(Module Device)
> [    0.210714] ACPI: Added _OSI(Processor Device)
> [    0.210716] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.210718] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.228838] ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP2.WLAN._STA], AE_ALREADY_EXISTS (20221020/dswload2-326)
> [    0.228853] fbcon: Taking over console
> [    0.228866] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20221020/psobject-220)
> [    0.228870] ACPI: Skipping parse of AML opcode: Method (0x0014)
> [    0.229053] ACPI BIOS Error (bug): Failure creating named object [\_SB.I2CA.TPNL], AE_ALREADY_EXISTS (20221020/dswload2-326)
> [    0.229059] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20221020/psobject-220)
> [    0.229064] ACPI: Skipping parse of AML opcode: Device (0x5B82)
> [    0.231307] ACPI: 22 ACPI AML tables successfully acquired and loaded
> [    0.233069] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    0.239661] ACPI: EC: EC started
> [    0.239662] ACPI: EC: interrupt blocked
> [    0.240743] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> [    0.240746] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle transactions
> [    0.240748] ACPI: Interpreter enabled
> [    0.240764] ACPI: PM: (supports S0 S4 S5)
> [    0.240765] ACPI: Using IOAPIC for interrupt routing
> [    0.241768] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.241806] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved as ACPI motherboard resource
> [    0.241819] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    0.241820] PCI: Ignoring E820 reservations for host bridge windows
> [    0.242161] ACPI: Enabled 2 GPEs in block 00 to 1F
> [    0.243141] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
> [    0.244773] ACPI: \_SB_.PCI0.GP17.PWRS: New power resource
> [    0.245014] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.245288] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.245516] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> [    0.245907] ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New power resource
> [    0.246563] ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New power resource
> [    0.247666] ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New power resource
> [    0.248499] ACPI: \_SB_.PCI0.GP19.PWRS: New power resource
> [    0.248979] ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New power resource
> [    0.253939] ACPI: \_SB_.PRWL: New power resource
> [    0.253961] ACPI: \_SB_.PRWB: New power resource
> [    0.254809] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.254816] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.254905] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug LTR DPC]
> [    0.255064] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
> [    0.255065] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
> [    0.255507] PCI host bridge to bus 0000:00
> [    0.255508] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
> [    0.255511] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
> [    0.255512] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
> [    0.255514] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [    0.255515] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
> [    0.255516] pci_bus 0000:00: root bus resource [mem 0xfa000000-0xfcffffff window]
> [    0.255518] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xf9ffffff window]
> [    0.255519] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xdfffffff window]
> [    0.255521] pci_bus 0000:00: root bus resource [mem 0x240000000-0x7fffffffff window]
> [    0.255522] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.255537] pci 0000:00:00.0: [1022:14b5] type 00 class 0x060000
> [    0.255639] pci 0000:00:00.2: [1022:14b6] type 00 class 0x080600
> [    0.255723] pci 0000:00:01.0: [1022:14b7] type 00 class 0x060000
> [    0.255782] pci 0000:00:02.0: [1022:14b7] type 00 class 0x060000
> [    0.255840] pci 0000:00:02.2: [1022:14ba] type 01 class 0x060400
> [    0.255930] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
> [    0.256072] pci 0000:00:02.3: [1022:14ba] type 01 class 0x060400
> [    0.256105] pci 0000:00:02.3: enabling Extended Tags
> [    0.256164] pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
> [    0.256320] pci 0000:00:08.0: [1022:14b7] type 00 class 0x060000
> [    0.256370] pci 0000:00:08.1: [1022:14b9] type 01 class 0x060400
> [    0.256392] pci 0000:00:08.1: enabling Extended Tags
> [    0.256427] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [    0.256543] pci 0000:00:08.3: [1022:14b9] type 01 class 0x060400
> [    0.256565] pci 0000:00:08.3: enabling Extended Tags
> [    0.256602] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
> [    0.256849] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
> [    0.256971] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
> [    0.257098] pci 0000:00:18.0: [1022:1724] type 00 class 0x060000
> [    0.257128] pci 0000:00:18.1: [1022:1725] type 00 class 0x060000
> [    0.257156] pci 0000:00:18.2: [1022:1726] type 00 class 0x060000
> [    0.257189] pci 0000:00:18.3: [1022:1727] type 00 class 0x060000
> [    0.257217] pci 0000:00:18.4: [1022:1728] type 00 class 0x060000
> [    0.257245] pci 0000:00:18.5: [1022:1729] type 00 class 0x060000
> [    0.257272] pci 0000:00:18.6: [1022:172a] type 00 class 0x060000
> [    0.257299] pci 0000:00:18.7: [1022:172b] type 00 class 0x060000
> [    0.257400] pci 0000:01:00.0: [2646:5016] type 00 class 0x010802
> [    0.257423] pci 0000:01:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
> [    0.257657] pci 0000:01:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
> [    0.257806] pci 0000:00:02.2: PCI bridge to [bus 01]
> [    0.257812] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
> [    0.257886] pci 0000:02:00.0: [10ec:b852] type 00 class 0x028000
> [    0.257906] pci 0000:02:00.0: reg 0x10: [io  0xf000-0xf0ff]
> [    0.257930] pci 0000:02:00.0: reg 0x18: [mem 0xfce00000-0xfcefffff 64bit]
> [    0.258049] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
> [    0.258318] pci 0000:00:02.3: PCI bridge to [bus 02]
> [    0.258322] pci 0000:00:02.3:   bridge window [io  0xf000-0xffff]
> [    0.258325] pci 0000:00:02.3:   bridge window [mem 0xfce00000-0xfcefffff]
> [    0.258411] pci 0000:03:00.0: [1002:1506] type 00 class 0x030000
> [    0.258423] pci 0000:03:00.0: reg 0x10: [mem 0x7fe0000000-0x7fefffffff 64bit pref]
> [    0.258431] pci 0000:03:00.0: reg 0x18: [mem 0x7ff0000000-0x7ff01fffff 64bit pref]
> [    0.258437] pci 0000:03:00.0: reg 0x20: [io  0xe000-0xe0ff]
> [    0.258442] pci 0000:03:00.0: reg 0x24: [mem 0xfcc00000-0xfcc7ffff]
> [    0.258451] pci 0000:03:00.0: enabling Extended Tags
> [    0.258464] pci 0000:03:00.0: BAR 0: assigned to efifb
> [    0.258505] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
> [    0.258624] pci 0000:03:00.1: [1002:1640] type 00 class 0x040300
> [    0.258632] pci 0000:03:00.1: reg 0x10: [mem 0xfccc8000-0xfcccbfff]
> [    0.258654] pci 0000:03:00.1: enabling Extended Tags
> [    0.258687] pci 0000:03:00.1: PME# supported from D1 D2 D3hot D3cold
> [    0.258765] pci 0000:03:00.2: [1022:1649] type 00 class 0x108000
> [    0.258779] pci 0000:03:00.2: reg 0x18: [mem 0xfcb00000-0xfcbfffff]
> [    0.258789] pci 0000:03:00.2: reg 0x24: [mem 0xfcccc000-0xfcccdfff]
> [    0.258797] pci 0000:03:00.2: enabling Extended Tags
> [    0.258896] pci 0000:03:00.3: [1022:1503] type 00 class 0x0c0330
> [    0.258907] pci 0000:03:00.3: reg 0x10: [mem 0xfca00000-0xfcafffff 64bit]
> [    0.258933] pci 0000:03:00.3: enabling Extended Tags
> [    0.258968] pci 0000:03:00.3: PME# supported from D0 D3hot D3cold
> [    0.259050] pci 0000:03:00.4: [1022:1504] type 00 class 0x0c0330
> [    0.259063] pci 0000:03:00.4: reg 0x10: [mem 0xfc900000-0xfc9fffff 64bit]
> [    0.259089] pci 0000:03:00.4: enabling Extended Tags
> [    0.259124] pci 0000:03:00.4: PME# supported from D0 D3hot D3cold
> [    0.259195] pci 0000:03:00.5: [1022:15e2] type 00 class 0x048000
> [    0.259203] pci 0000:03:00.5: reg 0x10: [mem 0xfcc80000-0xfccbffff]
> [    0.259226] pci 0000:03:00.5: enabling Extended Tags
> [    0.259258] pci 0000:03:00.5: PME# supported from D0 D3hot D3cold
> [    0.259327] pci 0000:03:00.6: [1022:15e3] type 00 class 0x040300
> [    0.259335] pci 0000:03:00.6: reg 0x10: [mem 0xfccc0000-0xfccc7fff]
> [    0.259357] pci 0000:03:00.6: enabling Extended Tags
> [    0.259390] pci 0000:03:00.6: PME# supported from D0 D3hot D3cold
> [    0.259469] pci 0000:00:08.1: PCI bridge to [bus 03]
> [    0.259473] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
> [    0.259475] pci 0000:00:08.1:   bridge window [mem 0xfc900000-0xfccfffff]
> [    0.259478] pci 0000:00:08.1:   bridge window [mem 0x7fe0000000-0x7ff01fffff 64bit pref]
> [    0.259521] pci 0000:04:00.0: [1022:1505] type 00 class 0x0c0330
> [    0.259536] pci 0000:04:00.0: reg 0x10: [mem 0xfcd00000-0xfcdfffff 64bit]
> [    0.259567] pci 0000:04:00.0: enabling Extended Tags
> [    0.259609] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
> [    0.259711] pci 0000:00:08.3: PCI bridge to [bus 04]
> [    0.259715] pci 0000:00:08.3:   bridge window [mem 0xfcd00000-0xfcdfffff]
> [    0.262214] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [    0.262262] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [    0.262304] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [    0.262355] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [    0.262401] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [    0.262439] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [    0.262477] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [    0.262516] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [    0.280587] Low-power S0 idle used by default for system suspend
> [    0.280745] ACPI: EC: interrupt unblocked
> [    0.280746] ACPI: EC: event unblocked
> [    0.280753] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> [    0.280755] ACPI: EC: GPE=0xb
> [    0.280756] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization complete
> [    0.280758] ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions and events
> [    0.281099] iommu: Default domain type: Translated 
> [    0.281099] iommu: DMA domain TLB invalidation policy: lazy mode 
> [    0.281346] SCSI subsystem initialized
> [    0.281355] libata version 3.00 loaded.
> [    0.281355] ACPI: bus type USB registered
> [    0.281355] usbcore: registered new interface driver usbfs
> [    0.281355] usbcore: registered new interface driver hub
> [    0.281355] usbcore: registered new device driver usb
> [    0.287668] pps_core: LinuxPPS API ver. 1 registered
> [    0.287670] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.287673] PTP clock support registered
> [    0.288074] EDAC MC: Ver: 3.0.0
> [    0.288180] efivars: Registered efivars operations
> [    0.289192] NetLabel: Initializing
> [    0.289194] NetLabel:  domain hash size = 128
> [    0.289195] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    0.289209] NetLabel:  unlabeled traffic allowed by default
> [    0.289222] mctp: management component transport protocol core
> [    0.289222] NET: Registered PF_MCTP protocol family
> [    0.289222] PCI: Using ACPI for IRQ routing
> [    0.297266] PCI: pci_cache_line_size set to 64 bytes
> [    0.297316] e820: reserve RAM buffer [mem 0x09e80000-0x0bffffff]
> [    0.297318] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
> [    0.297319] e820: reserve RAM buffer [mem 0xa0719018-0xa3ffffff]
> [    0.297320] e820: reserve RAM buffer [mem 0xad56d000-0xafffffff]
> [    0.297321] e820: reserve RAM buffer [mem 0xaf1c7000-0xafffffff]
> [    0.297322] e820: reserve RAM buffer [mem 0xb045f000-0xb3ffffff]
> [    0.297323] e820: reserve RAM buffer [mem 0xb078f000-0xb3ffffff]
> [    0.297324] e820: reserve RAM buffer [mem 0xbcfff000-0xbfffffff]
> [    0.297325] e820: reserve RAM buffer [mem 0x21e340000-0x21fffffff]
> [    0.297356] pci 0000:03:00.0: vgaarb: setting as boot VGA device
> [    0.297356] pci 0000:03:00.0: vgaarb: bridge control possible
> [    0.297356] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.297356] vgaarb: loaded
> [    0.297356] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    0.297356] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [    0.299105] clocksource: Switched to clocksource tsc-early
> [    0.299177] VFS: Disk quotas dquot_6.6.0
> [    0.299186] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.299285] AppArmor: AppArmor Filesystem Enabled
> [    0.300574] pnp: PnP ACPI init
> [    0.300808] system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
> [    0.302410] system 00:03: [io  0x04d0-0x04d1] has been reserved
> [    0.302414] system 00:03: [io  0x040b] has been reserved
> [    0.302416] system 00:03: [io  0x04d6] has been reserved
> [    0.302417] system 00:03: [io  0x0c00-0x0c01] has been reserved
> [    0.302419] system 00:03: [io  0x0c14] has been reserved
> [    0.302420] system 00:03: [io  0x0c50-0x0c51] has been reserved
> [    0.302422] system 00:03: [io  0x0c52] has been reserved
> [    0.302423] system 00:03: [io  0x0c6c] has been reserved
> [    0.302424] system 00:03: [io  0x0c6f] has been reserved
> [    0.302426] system 00:03: [io  0x0cd0-0x0cd1] has been reserved
> [    0.302427] system 00:03: [io  0x0cd2-0x0cd3] has been reserved
> [    0.302429] system 00:03: [io  0x0cd4-0x0cd5] has been reserved
> [    0.302430] system 00:03: [io  0x0cd6-0x0cd7] has been reserved
> [    0.302431] system 00:03: [io  0x0cd8-0x0cdf] has been reserved
> [    0.302433] system 00:03: [io  0x0800-0x089f] has been reserved
> [    0.302434] system 00:03: [io  0x0b00-0x0b0f] has been reserved
> [    0.302435] system 00:03: [io  0x0b20-0x0b3f] has been reserved
> [    0.302437] system 00:03: [io  0x0900-0x090f] has been reserved
> [    0.302438] system 00:03: [io  0x0910-0x091f] has been reserved
> [    0.302441] system 00:03: [mem 0xfec00000-0xfec00fff] could not be reserved
> [    0.302442] system 00:03: [mem 0xfec01000-0xfec01fff] could not be reserved
> [    0.302444] system 00:03: [mem 0xfedc0000-0xfedc0fff] has been reserved
> [    0.302445] system 00:03: [mem 0xfee00000-0xfee00fff] has been reserved
> [    0.302447] system 00:03: [mem 0xfed80000-0xfed8ffff] could not be reserved
> [    0.302448] system 00:03: [mem 0xfec10000-0xfec10fff] has been reserved
> [    0.302450] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
> [    0.303440] pnp: PnP ACPI: found 4 devices
> [    0.308922] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [    0.309046] NET: Registered PF_INET protocol family
> [    0.309201] IP idents hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.310969] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
> [    0.311011] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.311068] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [    0.311328] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
> [    0.311449] TCP: Hash tables configured (established 65536 bind 65536)
> [    0.311570] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
> [    0.311608] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
> [    0.311643] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
> [    0.311695] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.311702] NET: Registered PF_XDP protocol family
> [    0.311721] pci 0000:00:02.2: PCI bridge to [bus 01]
> [    0.311728] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
> [    0.311735] pci 0000:00:02.3: PCI bridge to [bus 02]
> [    0.311738] pci 0000:00:02.3:   bridge window [io  0xf000-0xffff]
> [    0.311741] pci 0000:00:02.3:   bridge window [mem 0xfce00000-0xfcefffff]
> [    0.311749] pci 0000:00:08.1: PCI bridge to [bus 03]
> [    0.311751] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
> [    0.311756] pci 0000:00:08.1:   bridge window [mem 0xfc900000-0xfccfffff]
> [    0.311759] pci 0000:00:08.1:   bridge window [mem 0x7fe0000000-0x7ff01fffff 64bit pref]
> [    0.311762] pci 0000:00:08.3: PCI bridge to [bus 04]
> [    0.311765] pci 0000:00:08.3:   bridge window [mem 0xfcd00000-0xfcdfffff]
> [    0.311771] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
> [    0.311773] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.311774] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
> [    0.311775] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
> [    0.311777] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
> [    0.311778] pci_bus 0000:00: resource 9 [mem 0xfa000000-0xfcffffff window]
> [    0.311780] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xf9ffffff window]
> [    0.311781] pci_bus 0000:00: resource 11 [mem 0xc0000000-0xdfffffff window]
> [    0.311783] pci_bus 0000:00: resource 12 [mem 0x240000000-0x7fffffffff window]
> [    0.311784] pci_bus 0000:01: resource 1 [mem 0xfcf00000-0xfcffffff]
> [    0.311786] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
> [    0.311787] pci_bus 0000:02: resource 1 [mem 0xfce00000-0xfcefffff]
> [    0.311789] pci_bus 0000:03: resource 0 [io  0xe000-0xefff]
> [    0.311790] pci_bus 0000:03: resource 1 [mem 0xfc900000-0xfccfffff]
> [    0.311791] pci_bus 0000:03: resource 2 [mem 0x7fe0000000-0x7ff01fffff 64bit pref]
> [    0.311793] pci_bus 0000:04: resource 1 [mem 0xfcd00000-0xfcdfffff]
> [    0.311943] pci 0000:03:00.1: D0 power state depends on 0000:03:00.0
> [    0.312058] pci 0000:00:08.1: can't derive routing for PCI INT A
> [    0.312059] pci 0000:00:08.1: PCI INT A: not connected
> [    0.312267] pci 0000:00:08.3: can't derive routing for PCI INT A
> [    0.312269] pci 0000:00:08.3: PCI INT A: not connected
> [    0.312334] PCI: CLS 64 bytes, default 64
> [    0.312346] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
> [    0.312393] pci 0000:00:01.0: Adding to iommu group 0
> [    0.312407] pci 0000:00:02.0: Adding to iommu group 1
> [    0.312408] Trying to unpack rootfs image as initramfs...
> [    0.312417] pci 0000:00:02.2: Adding to iommu group 2
> [    0.312426] pci 0000:00:02.3: Adding to iommu group 3
> [    0.312438] pci 0000:00:08.0: Adding to iommu group 4
> [    0.312447] pci 0000:00:08.1: Adding to iommu group 5
> [    0.312457] pci 0000:00:08.3: Adding to iommu group 6
> [    0.312471] pci 0000:00:14.0: Adding to iommu group 7
> [    0.312479] pci 0000:00:14.3: Adding to iommu group 7
> [    0.312510] pci 0000:00:18.0: Adding to iommu group 8
> [    0.312524] pci 0000:00:18.1: Adding to iommu group 8
> [    0.312531] pci 0000:00:18.2: Adding to iommu group 8
> [    0.312540] pci 0000:00:18.3: Adding to iommu group 8
> [    0.312548] pci 0000:00:18.4: Adding to iommu group 8
> [    0.312556] pci 0000:00:18.5: Adding to iommu group 8
> [    0.312563] pci 0000:00:18.6: Adding to iommu group 8
> [    0.312571] pci 0000:00:18.7: Adding to iommu group 8
> [    0.312580] pci 0000:01:00.0: Adding to iommu group 9
> [    0.312590] pci 0000:02:00.0: Adding to iommu group 10
> [    0.312615] pci 0000:03:00.0: Adding to iommu group 11
> [    0.312624] pci 0000:03:00.1: Adding to iommu group 12
> [    0.312634] pci 0000:03:00.2: Adding to iommu group 13
> [    0.312645] pci 0000:03:00.3: Adding to iommu group 14
> [    0.312655] pci 0000:03:00.4: Adding to iommu group 15
> [    0.312665] pci 0000:03:00.5: Adding to iommu group 16
> [    0.312675] pci 0000:03:00.6: Adding to iommu group 17
> [    0.312685] pci 0000:04:00.0: Adding to iommu group 18
> [    0.313647] pci 0000:00:00.2: can't derive routing for PCI INT A
> [    0.313654] pci 0000:00:00.2: PCI INT A: not connected
> [    0.314039] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
> [    0.314046] AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX GT [5] IA GA PC GA_vAPIC
> [    0.314054] AMD-Vi: Interrupt remapping enabled
> [    0.581176] AMD-Vi: Virtual APIC enabled
> [    0.581341] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    0.581343] software IO TLB: mapped [mem 0x000000009c719000-0x00000000a0719000] (64MB)
> [    0.581438] LVT offset 0 assigned for vector 0x400
> [    0.581675] perf: AMD IBS detected (0x000003ff)
> [    0.581690] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [    0.582100] Initialise system trusted keyrings
> [    0.582114] Key type blacklist registered
> [    0.582161] workingset: timestamp_bits=36 max_order=21 bucket_order=0
> [    0.582173] zbud: loaded
> [    0.582326] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.582393] fuse: init (API version 7.38)
> [    0.582484] integrity: Platform Keyring initialized
> [    0.582490] integrity: Machine keyring initialized
> [    0.585394] Key type asymmetric registered
> [    0.585395] Asymmetric key parser 'x509' registered
> [    0.585417] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
> [    0.585487] io scheduler mq-deadline registered
> [    0.587070] pcieport 0000:00:02.2: PME: Signaling with IRQ 33
> [    0.587535] pcieport 0000:00:02.2: AER: enabled with IRQ 33
> [    0.587693] pcieport 0000:00:02.3: PME: Signaling with IRQ 34
> [    0.587750] pcieport 0000:00:02.3: AER: enabled with IRQ 34
> [    0.587879] pcieport 0000:00:08.1: PME: Signaling with IRQ 35
> [    0.588000] pcieport 0000:00:08.3: PME: Signaling with IRQ 36
> [    0.588038] pcieport 0000:00:08.3: AER: enabled with IRQ 36
> [    0.588122] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    0.642095] ACPI: AC: AC Adapter [ACAD] (on-line)
> [    0.642184] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> [    0.642203] ACPI: button: Power Button [PWRB]
> [    0.642234] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
> [    0.642246] ACPI: button: Lid Switch [LID]
> [    0.642337] Estimated ratio of average max frequency by base frequency (times 1024): 1677
> [    0.642559] Monitor-Mwait will be used to enter C-1 state
> [    0.642566] ACPI: \_SB_.PLTF.P000: Found 3 idle states
> [    0.642672] ACPI: \_SB_.PLTF.P001: Found 3 idle states
> [    0.643920] thermal LNXTHERM:00: registered as thermal_zone0
> [    0.643926] ACPI: thermal: Thermal Zone [THRM] (32 C)
> [    0.644016] thermal LNXTHERM:01: registered as thermal_zone1
> [    0.644017] ACPI: thermal: Thermal Zone [TZ01] (20 C)
> [    0.644588] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    0.646973] Linux agpgart interface v0.103
> [    0.648502] loop: module loaded
> [    0.648781] tun: Universal TUN/TAP device driver, 1.6
> [    0.648805] PPP generic driver version 2.4.2
> [    0.648907] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
> [    0.648909] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
> [    0.654538] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.654838] mousedev: PS/2 mouse device common for all mice
> [    0.654968] rtc_cmos 00:01: RTC can wake from S4
> [    0.655618] rtc_cmos 00:01: registered as rtc0
> [    0.655653] rtc_cmos 00:01: setting system clock to 2023-05-14T06:11:09 UTC (1684044669)
> [    0.655683] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    0.655693] i2c_dev: i2c /dev entries driver
> [    0.655759] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
> [    0.655775] device-mapper: uevent: version 1.0.3
> [    0.655805] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised: dm-devel@redhat.com
> [    0.655828] platform eisa.0: Probing EISA bus 0
> [    0.655830] platform eisa.0: EISA: Cannot allocate resource for mainboard
> [    0.655831] platform eisa.0: Cannot allocate resource for EISA slot 1
> [    0.655833] platform eisa.0: Cannot allocate resource for EISA slot 2
> [    0.655834] platform eisa.0: Cannot allocate resource for EISA slot 3
> [    0.655835] platform eisa.0: Cannot allocate resource for EISA slot 4
> [    0.655836] platform eisa.0: Cannot allocate resource for EISA slot 5
> [    0.655837] platform eisa.0: Cannot allocate resource for EISA slot 6
> [    0.655838] platform eisa.0: Cannot allocate resource for EISA slot 7
> [    0.655839] platform eisa.0: Cannot allocate resource for EISA slot 8
> [    0.655840] platform eisa.0: EISA: Detected 0 cards
> [    0.655841] amd_pstate: driver load is disabled, boot with specific mode to enable this
> [    0.655898] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.655916] efifb: probing for efifb
> [    0.655945] efifb: Ignoring BGRT: unexpected or invalid BMP data
> [    0.655945] efifb: framebuffer at 0x7fe0000000, using 3072k, total 3072k
> [    0.655947] efifb: mode is 1024x768x32, linelength=4096, pages=1
> [    0.655948] efifb: scrolling: redraw
> [    0.655949] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
> [    0.656026] Console: switching to colour frame buffer device 128x48
> [    0.656655] fb0: EFI VGA frame buffer device
> [    0.656775] drop_monitor: Initializing network drop monitor service
> [    0.704549] NET: Registered PF_INET6 protocol family
> [    0.726763] ACPI: battery: Slot [BAT0] (battery present)
> [    0.737054] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
> [    0.742336] Freeing initrd memory: 75816K
> [    0.747358] Segment Routing with IPv6
> [    0.747378] In-situ OAM (IOAM) with IPv6
> [    0.747413] NET: Registered PF_PACKET protocol family
> [    0.747438] Key type dns_resolver registered
> [    0.747711] microcode: CPU0: patch_level=0x08a00006
> [    0.747711] microcode: CPU1: patch_level=0x08a00006
> [    0.747720] microcode: Microcode Update Driver: v2.2.
> [    0.747751] resctrl: L3 allocation detected
> [    0.747752] resctrl: MB allocation detected
> [    0.747753] resctrl: L3 monitoring detected
> [    0.747759] IPI shorthand broadcast: enabled
> [    0.748813] sched_clock: Marking stable (747021351, 1482760)->(765050180, -16546069)
> [    0.748938] registered taskstats version 1
> [    0.749006] Loading compiled-in X.509 certificates
> [    0.749494] Loaded X.509 cert 'Build time autogenerated kernel key: c011e1f473392ce75d54b5aa66314e39b5c0c1ca'
> [    0.749898] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
> [    0.750295] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
> [    0.750296] blacklist: Loading compiled-in revocation X.509 certificates
> [    0.750311] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
> [    0.750324] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
> [    0.750337] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
> [    0.750353] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
> [    0.750366] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
> [    0.750378] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
> [    0.750391] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
> [    0.750403] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
> [    0.750472] zswap: loaded using pool lzo/zbud
> [    0.751740] Key type .fscrypt registered
> [    0.751741] Key type fscrypt-provisioning registered
> [    0.754262] Key type encrypted registered
> [    0.754269] AppArmor: AppArmor sha1 policy hashing enabled
> [    0.754366] integrity: Loading X.509 certificate: UEFI:db
> [    0.754396] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
> [    0.754397] integrity: Loading X.509 certificate: UEFI:db
> [    0.754413] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
> [    0.754414] integrity: Loading X.509 certificate: UEFI:db
> [    0.754429] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
> [    0.754722] blacklist: Duplicate blacklisted hash bin:47ff1b63b140b6fc04ed79131331e651da5b2e2f170f5daef4153dc2fbc532b1
> [    0.754724] blacklist: Duplicate blacklisted hash bin:5391c3a2fb112102a6aa1edc25ae77e19f5d6f09cd09eeb2509922bfcd5992ea
> [    0.754761] blacklist: Duplicate blacklisted hash bin:80b4d96931bf0d02fd91a61e19d14f1da452e66db2408ca8604d411f92659f0a
> [    0.754788] blacklist: Duplicate blacklisted hash bin:992d359aa7a5f789d268b94c11b9485a6b1ce64362b0edb4441ccc187c39647b
> [    0.754828] blacklist: Duplicate blacklisted hash bin:c452ab846073df5ace25cca64d6b7a09d906308a1a65eb5240e3c4ebcaa9cc0c
> [    0.754852] blacklist: Duplicate blacklisted hash bin:e051b788ecbaeda53046c70e6af6058f95222c046157b8c4c1b9c2cfc65f46e5
> [    0.755092] ima: No TPM chip found, activating TPM-bypass!
> [    0.755094] Loading compiled-in module X.509 certificates
> [    0.755512] Loaded X.509 cert 'Build time autogenerated kernel key: c011e1f473392ce75d54b5aa66314e39b5c0c1ca'
> [    0.755513] ima: Allocated hash algorithm: sha1
> [    0.755521] ima: No architecture policies found
> [    0.755534] evm: Initialising EVM extended attributes:
> [    0.755535] evm: security.selinux
> [    0.755536] evm: security.SMACK64
> [    0.755537] evm: security.SMACK64EXEC
> [    0.755537] evm: security.SMACK64TRANSMUTE
> [    0.755538] evm: security.SMACK64MMAP
> [    0.755538] evm: security.apparmor
> [    0.755539] evm: security.ima
> [    0.755540] evm: security.capability
> [    0.755540] evm: HMAC attrs: 0x1
> [    0.755854] PM:   Magic number: 7:296:165
> [    0.756076] acpi_cpufreq: overriding BIOS provided _PSD data
> [    0.869459] RAS: Correctable Errors collector initialized.
> [    0.871994] Freeing unused decrypted memory: 2036K
> [    0.872655] Freeing unused kernel image (initmem) memory: 4700K
> [    0.872664] Write protecting the kernel read-only data: 43008k
> [    0.872803] Freeing unused kernel image (rodata/data gap) memory: 8K
> [    0.911634] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    0.911649] Run /init as init process
> [    0.911650]   with arguments:
> [    0.911653]     /init
> [    0.911653]     splash
> [    0.911654]   with environment:
> [    0.911655]     HOME=/
> [    0.911656]     TERM=linux
> [    0.911657]     BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic
> [    1.158077] hid: raw HID events driver (C) Jiri Kosina
> [    1.207423] xhci_hcd 0000:03:00.3: xHCI Host Controller
> [    1.207433] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 1
> [    1.207807] xhci_hcd 0000:03:00.3: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000410
> [    1.208099] xhci_hcd 0000:03:00.3: xHCI Host Controller
> [    1.208101] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 2
> [    1.208104] xhci_hcd 0000:03:00.3: Host supports USB 3.1 Enhanced SuperSpeed
> [    1.208150] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.03
> [    1.208153] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.208154] usb usb1: Product: xHCI Host Controller
> [    1.208155] usb usb1: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.208157] usb usb1: SerialNumber: 0000:03:00.3
> [    1.208287] hub 1-0:1.0: USB hub found
> [    1.208303] hub 1-0:1.0: 2 ports detected
> [    1.208927] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.208947] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.03
> [    1.208949] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.208950] usb usb2: Product: xHCI Host Controller
> [    1.208952] usb usb2: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.208953] usb usb2: SerialNumber: 0000:03:00.3
> [    1.209312] hub 2-0:1.0: USB hub found
> [    1.209328] hub 2-0:1.0: 1 port detected
> [    1.209616] xhci_hcd 0000:03:00.4: xHCI Host Controller
> [    1.209621] xhci_hcd 0000:03:00.4: new USB bus registered, assigned bus number 3
> [    1.209992] xhci_hcd 0000:03:00.4: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000410
> [    1.210266] xhci_hcd 0000:03:00.4: xHCI Host Controller
> [    1.210268] xhci_hcd 0000:03:00.4: new USB bus registered, assigned bus number 4
> [    1.210270] xhci_hcd 0000:03:00.4: Host supports USB 3.1 Enhanced SuperSpeed
> [    1.210299] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.03
> [    1.210301] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.210302] usb usb3: Product: xHCI Host Controller
> [    1.210304] usb usb3: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.210305] usb usb3: SerialNumber: 0000:03:00.4
> [    1.210376] hub 3-0:1.0: USB hub found
> [    1.210391] hub 3-0:1.0: 3 ports detected
> [    1.210806] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.210822] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.03
> [    1.210824] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.210825] usb usb4: Product: xHCI Host Controller
> [    1.210826] usb usb4: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.210827] usb usb4: SerialNumber: 0000:03:00.4
> [    1.210955] hub 4-0:1.0: USB hub found
> [    1.210977] hub 4-0:1.0: 2 ports detected
> [    1.211913] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.211922] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 5
> [    1.213513] xhci_hcd 0000:04:00.0: USB3 root hub has no ports
> [    1.213518] xhci_hcd 0000:04:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
> [    1.213951] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.213955] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 6
> [    1.213959] xhci_hcd 0000:04:00.0: Host supports USB 3.0 SuperSpeed
> [    1.215218] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
> [    1.215224] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
> [    1.215944] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
> [    1.216817] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.03
> [    1.216823] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.216825] usb usb5: Product: xHCI Host Controller
> [    1.216826] usb usb5: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.216828] usb usb5: SerialNumber: 0000:04:00.0
> [    1.218442] hub 5-0:1.0: USB hub found
> [    1.218671] hub 5-0:1.0: 1 port detected
> [    1.218937] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.218962] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.03
> [    1.218964] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.218965] usb usb6: Product: xHCI Host Controller
> [    1.218967] usb usb6: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.218968] usb usb6: SerialNumber: 0000:04:00.0
> [    1.219597] hub 6-0:1.0: USB hub found
> [    1.219605] hub 6-0:1.0: config failed, hub doesn't have any ports! (err -19)
> [    1.260516] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
> [    1.260730] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0e/LNXVIDEO:00/input/input3
> [    1.280802] nvme 0000:01:00.0: platform quirk: setting simple suspend
> [    1.280878] nvme nvme0: pci function 0000:01:00.0
> [    1.311114] input: ELAN07B9:00 04F3:3276 Mouse as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input4
> [    1.311196] input: ELAN07B9:00 04F3:3276 Touchpad as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input6
> [    1.311253] hid-generic 0018:04F3:3276.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07B9:00 04F3:3276] on i2c-ELAN07B9:00
> [    1.341405] nvme nvme0: allocated 64 MiB host memory buffer.
> [    1.361715] nvme nvme0: 2/0/0 default/read/poll queues
> [    1.363986]  nvme0n1: p1 p2 p3
> [    1.449597] usb 1-2: new full-speed USB device number 2 using xhci_hcd
> [    1.457592] usb 5-1: new high-speed USB device number 2 using xhci_hcd
> [    1.481484] raid6: avx2x4   gen() 33058 MB/s
> [    1.498484] raid6: avx2x2   gen() 33684 MB/s
> [    1.515484] raid6: avx2x1   gen() 24796 MB/s
> [    1.515485] raid6: using algorithm avx2x2 gen() 33684 MB/s
> [    1.532484] raid6: .... xor() 20373 MB/s, rmw enabled
> [    1.532486] raid6: using avx2x2 recovery algorithm
> [    1.534473] xor: automatically using best checksumming function   avx       
> [    1.596214] usb 1-2: New USB device found, idVendor=0bda, idProduct=b85c, bcdDevice= 0.00
> [    1.596226] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    1.596229] usb 1-2: Product: Bluetooth Radio
> [    1.596232] usb 1-2: Manufacturer: Realtek
> [    1.596235] usb 1-2: SerialNumber: 00e04c000001
> [    1.624532] usb 5-1: New USB device found, idVendor=30c9, idProduct=009f, bcdDevice= 0.05
> [    1.624543] usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    1.624546] usb 5-1: Product: HP True Vision FHD Camera
> [    1.624549] usb 5-1: Manufacturer: DQWTK0ABIHSGM5
> [    1.624552] usb 5-1: SerialNumber: 01.00.00
> [    1.627607] Btrfs loaded, crc32c=crc32c-intel, zoned=yes, fsverity=yes
> [    1.638496] tsc: Refined TSC clocksource calibration: 2395.489 MHz
> [    1.638503] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2287921946e, max_idle_ns: 440795305334 ns
> [    1.638518] clocksource: Switched to clocksource tsc
> [    1.646217] BTRFS: device fsid 37b2f75c-c227-423d-a77d-861356b0370d devid 1 transid 492549 /dev/nvme0n1p3 scanned by btrfs (209)
> [    1.673177] BTRFS info (device nvme0n1p3): using crc32c (crc32c-intel) checksum algorithm
> [    1.673189] BTRFS info (device nvme0n1p3): using free space tree
> [    1.718218] BTRFS info (device nvme0n1p3): enabling ssd optimizations
> [    1.718223] BTRFS info (device nvme0n1p3): auto enabling async discard
> [    1.840852] systemd[1]: Inserted module 'autofs4'
> [    1.863092] systemd[1]: systemd 249.11-0ubuntu3.9 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
> [    1.863183] systemd[1]: Detected architecture x86-64.
> [    1.863387] systemd[1]: Hostname set to <REDACTED>.
> [    1.873462] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=1 'systemd'
> [    1.903790] block nvme0n1: the capability attribute has been deprecated.
> [    1.977091] systemd[1]: /lib/systemd/system/clamav-freshclam.service:11: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
> [    2.001575] systemd[1]: Queued start job for default target Graphical Interface.
> [    2.007183] systemd[1]: Created slice Slice /system/modprobe.
> [    2.007570] systemd[1]: Created slice Slice /system/systemd-fsck.
> [    2.007745] systemd[1]: Created slice User and Session Slice.
> [    2.007826] systemd[1]: Started ntp-systemd-netif.path.
> [    2.007904] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> [    2.008106] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
> [    2.008236] systemd[1]: Reached target User and Group Name Lookups.
> [    2.008277] systemd[1]: Reached target Remote File Systems.
> [    2.008316] systemd[1]: Reached target Slice Units.
> [    2.008359] systemd[1]: Reached target Mounting snaps.
> [    2.008407] systemd[1]: Reached target System Time Set.
> [    2.008475] systemd[1]: Reached target Local Verity Protected Volumes.
> [    2.009421] systemd[1]: Listening on Syslog Socket.
> [    2.009974] systemd[1]: Listening on fsck to fsckd communication Socket.
> [    2.010069] systemd[1]: Listening on initctl Compatibility Named Pipe.
> [    2.010282] systemd[1]: Listening on Journal Audit Socket.
> [    2.010379] systemd[1]: Listening on Journal Socket (/dev/log).
> [    2.010512] systemd[1]: Listening on Journal Socket.
> [    2.011060] systemd[1]: Listening on udev Control Socket.
> [    2.011254] systemd[1]: Listening on udev Kernel Socket.
> [    2.012041] systemd[1]: Mounting Huge Pages File System...
> [    2.012866] systemd[1]: Mounting POSIX Message Queue File System...
> [    2.013902] systemd[1]: Mounting Kernel Debug File System...
> [    2.014779] systemd[1]: Mounting Kernel Trace File System...
> [    2.020421] systemd[1]: Starting Journal Service...
> [    2.021480] systemd[1]: Starting Set the console keyboard layout...
> [    2.022573] systemd[1]: Starting Create List of Static Device Nodes...
> [    2.023551] systemd[1]: Starting Load Kernel Module chromeos_pstore...
> [    2.024585] systemd[1]: Starting Load Kernel Module configfs...
> [    2.025596] systemd[1]: Starting Load Kernel Module drm...
> [    2.026594] systemd[1]: Starting Load Kernel Module efi_pstore...
> [    2.031940] systemd[1]: Starting Load Kernel Module fuse...
> [    2.033960] systemd[1]: Starting Load Kernel Module pstore_blk...
> [    2.035199] systemd[1]: Starting Load Kernel Module pstore_zone...
> [    2.036790] pstore: Using crash dump compression: deflate
> [    2.039112] pstore: Registered efi_pstore as persistent store backend
> [    2.039799] systemd[1]: Starting Load Kernel Module ramoops...
> [    2.039950] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
> [    2.041040] systemd[1]: Starting Load Kernel Modules...
> [    2.041963] systemd[1]: Starting Remount Root and Kernel File Systems...
> [    2.049027] systemd[1]: Starting Coldplug All udev Devices...
> [    2.077102] systemd[1]: Mounted Huge Pages File System.
> [    2.077300] systemd[1]: Mounted POSIX Message Queue File System.
> [    2.077368] systemd[1]: Mounted Kernel Debug File System.
> [    2.077432] systemd[1]: Mounted Kernel Trace File System.
> [    2.077750] systemd[1]: Finished Create List of Static Device Nodes.
> [    2.078013] systemd[1]: modprobe@chromeos_pstore.service: Deactivated successfully.
> [    2.078214] systemd[1]: Finished Load Kernel Module chromeos_pstore.
> [    2.078418] systemd[1]: modprobe@configfs.service: Deactivated successfully.
> [    2.078630] systemd[1]: Finished Load Kernel Module configfs.
> [    2.078844] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
> [    2.079037] systemd[1]: Finished Load Kernel Module efi_pstore.
> [    2.079216] systemd[1]: modprobe@fuse.service: Deactivated successfully.
> [    2.079379] systemd[1]: Finished Load Kernel Module fuse.
> [    2.079550] systemd[1]: modprobe@pstore_blk.service: Deactivated successfully.
> [    2.079712] systemd[1]: Finished Load Kernel Module pstore_blk.
> [    2.079881] systemd[1]: modprobe@pstore_zone.service: Deactivated successfully.
> [    2.080037] systemd[1]: Finished Load Kernel Module pstore_zone.
> [    2.080192] systemd[1]: modprobe@ramoops.service: Deactivated successfully.
> [    2.080349] systemd[1]: Finished Load Kernel Module ramoops.
> [    2.090417] ACPI: bus type drm_connector registered
> [    2.095340] lp: driver loaded but no devices found
> [    2.096071] systemd[1]: Mounting FUSE Control File System...
> [    2.097583] systemd[1]: Mounting Kernel Configuration File System...
> [    2.097950] systemd[1]: modprobe@drm.service: Deactivated successfully.
> [    2.098158] systemd[1]: Finished Load Kernel Module drm.
> [    2.098507] systemd[1]: Finished Remount Root and Kernel File Systems.
> [    2.098657] systemd[1]: Condition check resulted in Platform Persistent Storage Archival being skipped.
> [    2.103620] systemd[1]: Starting Load/Save Random Seed...
> [    2.105049] ppdev: user-space parallel port driver
> [    2.110152] systemd[1]: Starting Create System Users...
> [    2.120865] systemd[1]: Finished Load Kernel Modules.
> [    2.127847] systemd[1]: Mounted FUSE Control File System.
> [    2.127933] systemd[1]: Mounted Kernel Configuration File System.
> [    2.128191] systemd[1]: Finished Load/Save Random Seed.
> [    2.128412] systemd[1]: Condition check resulted in First Boot Complete being skipped.
> [    2.129339] systemd[1]: Starting Apply Kernel Variables...
> [    2.134445] systemd[1]: Finished Create System Users.
> [    2.135993] systemd[1]: Starting Create Static Device Nodes in /dev...
> [    2.145937] systemd[1]: Finished Create Static Device Nodes in /dev.
> [    2.160580] systemd[1]: Starting Rule-based Manager for Device Events and Files...
> [    2.165402] systemd[1]: Finished Set the console keyboard layout.
> [    2.165577] systemd[1]: Reached target Preparation for Local File Systems.
> [    2.171786] systemd[1]: Mounting Mount unit for bare, revision 5...
> [    2.172769] systemd[1]: Mounting Mount unit for chromium, revision 2424...
> [    2.173743] systemd[1]: Mounting Mount unit for chromium, revision 2465...
> [    2.174770] systemd[1]: Mounting Mount unit for core20, revision 1852...
> [    2.177221] systemd[1]: Mounting Mount unit for core20, revision 1879...
> [    2.179313] loop0: detected capacity change from 0 to 8
> [    2.183127] loop1: detected capacity change from 0 to 129672
> [    2.190609] systemd[1]: Mounting Mount unit for cups, revision 872...
> [    2.196728] systemd[1]: Mounting Mount unit for firefox, revision 2645...
> [    2.200201] systemd[1]: Mounting Mount unit for firefox, revision 2667...
> [    2.204070] loop2: detected capacity change from 0 to 307680
> [    2.204361] systemd[1]: Mounting Mount unit for gnome-3-38-2004, revision 137...
> [    2.205004] loop3: detected capacity change from 0 to 305160
> [    2.205446] loop4: detected capacity change from 0 to 129712
> [    2.206370] loop5: detected capacity change from 0 to 112704
> [    2.207186] loop6: detected capacity change from 0 to 495632
> [    2.209146] systemd[1]: Mounting Mount unit for gnome-3-38-2004, revision 140...
> [    2.210459] systemd[1]: Mounting Mount unit for gtk-common-themes, revision 1535...
> [    2.211547] systemd[1]: Mounting Mount unit for snapd, revision 18933...
> [    2.212726] systemd[1]: Mounting Mount unit for snapd, revision 19122...
> [    2.214432] loop7: detected capacity change from 0 to 716168
> [    2.218708] loop9: detected capacity change from 0 to 495664
> [    2.220784] loop8: detected capacity change from 0 to 109032
> [    2.222888] systemd[1]: Mounting Mount unit for firefox, revision 2356 via mount-control...
> [    2.224891] systemd[1]: Started Journal Service.
> [    2.226433] loop10: detected capacity change from 0 to 716160
> [    2.242312] loop12: detected capacity change from 0 to 109032
> [    2.242505] loop11: detected capacity change from 0 to 187776
> [    2.248108] systemd-journald[296]: Received client request to flush runtime journal.
> [    2.506966] acpi-tad ACPI000E:00: Missing _PRW
> [    2.509940] input: Wireless hotkeys as /devices/virtual/input/input7
> [    2.628428] ccp 0000:03:00.2: enabling device (0000 -> 0002)
> [    2.640330] ccp 0000:03:00.2: tee enabled
> [    2.640338] ccp 0000:03:00.2: psp enabled
> [    2.666263] Adding 12000252k swap on /dev/nvme0n1p2.  Priority:-2 extents:1 across:12000252k SSFS
> [    2.735447] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [    2.735679] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    2.765692] AMD-Vi: AMD IOMMUv2 loaded and initialized
> [    2.820683] audit: type=1400 audit(1684044671.663:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=455 comm="apparmor_parser"
> [    2.841329] audit: type=1400 audit(1684044671.683:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=459 comm="apparmor_parser"
> [    2.841336] audit: type=1400 audit(1684044671.683:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=459 comm="apparmor_parser"
> [    2.843347] audit: type=1400 audit(1684044671.685:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=454 comm="apparmor_parser"
> [    2.843355] audit: type=1400 audit(1684044671.685:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=454 comm="apparmor_parser"
> [    2.858580] audit: type=1400 audit(1684044671.701:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/freshclam" pid=462 comm="apparmor_parser"
> [    2.866332] audit: type=1400 audit(1684044671.708:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=461 comm="apparmor_parser"
> [    2.866340] audit: type=1400 audit(1684044671.708:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=461 comm="apparmor_parser"
> [    2.866342] audit: type=1400 audit(1684044671.708:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=461 comm="apparmor_parser"
> [    2.957242] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    3.033646] input: HP WMI hotkeys as /devices/virtual/input/input8
> [    3.045403] input: ELAN07B9:00 04F3:3276 Mouse as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input9
> [    3.063154] input: ELAN07B9:00 04F3:3276 Touchpad as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input11
> [    3.064722] hid-multitouch 0018:04F3:3276.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07B9:00 04F3:3276] on i2c-ELAN07B9:00
> [    3.161979] mc: Linux media interface: v0.10
> [    3.169922] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
> [    3.169929] RAPL PMU: hw unit of domain package 2^-16 Joules
> [    3.177981] cryptd: max_cpu_qlen set to 1000
> [    3.181831] Bluetooth: Core ver 2.22
> [    3.181863] NET: Registered PF_BLUETOOTH protocol family
> [    3.181865] Bluetooth: HCI device and connection manager initialized
> [    3.181869] Bluetooth: HCI socket layer initialized
> [    3.181871] Bluetooth: L2CAP socket layer initialized
> [    3.181876] Bluetooth: SCO socket layer initialized
> [    3.225178] AVX2 version of gcm_enc/dec engaged.
> [    3.225200] AES CTR mode by8 optimization enabled
> [    3.249805] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    3.249914] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    3.251246] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    3.272867] usbcore: registered new interface driver btusb
> [    3.315187] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    3.317659] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC236: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    3.317668] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    3.317670] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    3.317671] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    3.317673] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    3.317674] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
> [    3.325243] Bluetooth: hci0: RTL: examining hci_ver=0b hci_rev=000b lmp_ver=0b lmp_subver=8852
> [    3.326026] rtw89_8852be 0000:02:00.0: enabling device (0000 -> 0003)
> [    3.331039] rtw89_8852be 0000:02:00.0: Firmware version 0.27.32.1, cmd version 0, type 1
> [    3.331046] rtw89_8852be 0000:02:00.0: Firmware version 0.27.32.1, cmd version 0, type 3
> [    3.331074] Bluetooth: hci0: RTL: rom_version status=0 version=1
> [    3.331076] Bluetooth: hci0: RTL: loading rtl_bt/rtl8852bu_fw.bin
> [    3.331963] Bluetooth: hci0: RTL: loading rtl_bt/rtl8852bu_config.bin
> [    3.332028] Bluetooth: hci0: RTL: cfg_sz 6, total sz 38955
> [    3.387340] videodev: Linux video capture interface: v2.00
> [    3.406927] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input13
> [    3.406987] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input14
> [    3.603390] usb 5-1: Found UVC 1.50 device HP True Vision FHD Camera (30c9:009f)
> [    3.702015] usbcore: registered new interface driver uvcvideo
> [    3.966931] rtw89_8852be 0000:02:00.0: chip rfe_type is 1
> [    4.164254] Bluetooth: hci0: RTL: fw version 0xdfb791cb
> [    4.338248] Bluetooth: hci0: Failed to read codec capabilities (-22)
> [    4.359246] Bluetooth: hci0: AOSP extensions version v0.96
> [    4.359256] Bluetooth: hci0: AOSP quality report is not supported
> [    5.711086] kvm_amd: TSC scaling supported
> [    5.711093] kvm_amd: Nested Virtualization enabled
> [    5.711095] kvm_amd: Nested Paging enabled
> [    5.711097] kvm_amd: SEV supported: 14 ASIDs
> [    5.711100] kvm_amd: Virtual VMLOAD VMSAVE supported
> [    5.711101] kvm_amd: Virtual GIF supported
> [    5.711101] kvm_amd: LBR virtualization supported
> [    5.719096] rtw89_8852be 0000:02:00.0 wlp2s0: renamed from wlan0
> [    5.729053] MCE: In-kernel MCE decoding enabled.
> [    5.807089] intel_rapl_common: Found RAPL domain package
> [    5.807095] intel_rapl_common: Found RAPL domain core
> [    5.852066] [drm] amdgpu kernel modesetting enabled.
> [    6.057264] amdgpu: Virtual CRAT table created for CPU
> [    6.057283] amdgpu: Topology: Add CPU node
> [    6.057448] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
> [    6.090211] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x1506 0x103C:0x8B2F 0xC4).
> [    6.153105] [drm] register mmio base: 0xFCC00000
> [    6.153110] [drm] register mmio size: 524288
> [    6.159437] [drm] add ip block number 0 <nv_common>
> [    6.159443] [drm] add ip block number 1 <gmc_v10_0>
> [    6.159445] [drm] add ip block number 2 <navi10_ih>
> [    6.159446] [drm] add ip block number 3 <psp>
> [    6.159448] [drm] add ip block number 4 <smu>
> [    6.159449] [drm] add ip block number 5 <dm>
> [    6.159450] [drm] add ip block number 6 <gfx_v10_0>
> [    6.159451] [drm] add ip block number 7 <sdma_v5_2>
> [    6.159453] [drm] add ip block number 8 <vcn_v3_0>
> [    6.159454] [drm] add ip block number 9 <jpeg_v3_0>
> [    6.159480] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
> [    6.159493] amdgpu: ATOM BIOS: 102-MENDOCINO-006
> [    6.220584] [drm] VCN(0) decode is enabled in VM mode
> [    6.220591] [drm] VCN(0) encode is enabled in VM mode
> [    6.243013] [drm] JPEG decode is enabled in VM mode
> [    6.244942] Console: switching to colour dummy device 80x25
> [    6.244989] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
> [    6.244993] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
> [    6.244997] amdgpu 0000:03:00.0: amdgpu: PCIE atomic ops is not supported
> [    6.245050] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [    6.245056] amdgpu 0000:03:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
> [    6.245058] amdgpu 0000:03:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
> [    6.245060] amdgpu 0000:03:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
> [    6.245065] [drm] Detected VRAM RAM=512M, BAR=512M
> [    6.245067] [drm] RAM width 128bits LPDDR5
> [    6.249679] [drm] amdgpu: 512M of VRAM memory ready
> [    6.249687] [drm] amdgpu: 3579M of GTT memory ready.
> [    6.249704] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [    6.250064] [drm] PCIE GART of 1024M enabled (table at 0x000000F41FC00000).
> [    6.250331] [drm] Loading DMUB firmware via PSP: version=0x06000800
> [    6.279629] [drm] use_doorbell being set to: [true]
> [    6.279701] [drm] Found VCN firmware Version ENC: 1.21 DEC: 2 VEP: 0 Revision: 10
> [    6.279713] amdgpu 0000:03:00.0: amdgpu: Will use PSP to load VCN firmware
> [    6.298474] kauditd_printk_skb: 59 callbacks suppressed
> [    6.298478] audit: type=1400 audit(1684044675.140:70): apparmor="DENIED" operation="open" class="file" profile="/usr/sbin/ntpd" name="/snap/bin/" pid=747 comm="ntpd" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> [    6.328101] audit: type=1400 audit(1684044675.169:71): apparmor="DENIED" operation="open" class="file" profile="/usr/sbin/ntpd" name="/etc/ssl/openssl.cnf" pid=771 comm="ntpd" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> [    6.385248] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    6.385254] Bluetooth: BNEP filters: protocol multicast
> [    6.385260] Bluetooth: BNEP socket layer initialized
> [    6.388921] Bluetooth: MGMT ver 1.22
> [    6.400531] [drm] reserve 0xa00000 from 0xf41e000000 for PSP TMR
> [    6.438617] NET: Registered PF_ALG protocol family
> [    6.542226] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
> [    6.551498] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is not available
> [    6.551505] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
> [    6.552638] amdgpu 0000:03:00.0: amdgpu: SMU is initialized successfully!
> [    6.553468] [drm] Display Core initialized with v3.2.223!
> [    6.553473] [drm] DP-HDMI FRL PCON supported
> [    6.555493] [drm] DMUB hardware initialized: version=0x06000800
> [    6.679135] audit: type=1400 audit(1684044675.521:72): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=745 comm="cupsd" capability=12  capname="net_admin"
> [    6.742623] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.826564] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> [    6.930911] Bluetooth: hci0: Failed to read codec capabilities (-22)
> [    6.956058] Bluetooth: hci0: AOSP extensions version v0.96
> [    6.956065] Bluetooth: hci0: AOSP quality report is not supported
> [    7.049623] [drm] Alt mode has timed out after 212 ms
> [    7.051300] [drm] kiq ring mec 2 pipe 1 q 0
> [    7.061154] [drm] VCN decode and encode initialized successfully(under DPG Mode).
> [    7.061180] [drm] JPEG decode initialized successfully.
> [    7.066786] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [    7.066840] amdgpu: sdma_bitmap: 3
> [    7.081463] memmap_init_zone_device initialised 131072 pages in 5ms
> [    7.081475] amdgpu: HMM registered 512MB device memory
> [    7.081625] amdgpu: SRAT table not found
> [    7.081626] amdgpu: Virtual CRAT table created for GPU
> [    7.081795] amdgpu: Topology: Add dGPU node [0x1506:0x1002]
> [    7.081798] kfd kfd: amdgpu: added device 1002:1506
> [    7.081824] amdgpu 0000:03:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 2, active_cu_number 2
> [    7.081921] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> [    7.081923] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
> [    7.081924] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
> [    7.081925] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
> [    7.081926] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
> [    7.081928] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
> [    7.081929] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
> [    7.081930] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
> [    7.081931] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
> [    7.081933] amdgpu 0000:03:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
> [    7.081934] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
> [    7.081935] amdgpu 0000:03:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 1
> [    7.081936] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on hub 1
> [    7.081937] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on hub 1
> [    7.081938] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 1
> [    7.093789] [drm] Initialized amdgpu 3.52.0 20150101 for 0000:03:00.0 on minor 0
> [    7.106582] [drm] DSC precompute is not needed.
> [    7.119367] fbcon: amdgpudrmfb (fb0) is primary device
> [    7.126938] Console: switching to colour frame buffer device 240x67
> [    7.126956] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    7.973239] loop13: detected capacity change from 0 to 8
> [    8.120779] audit: type=1400 audit(1684044676.962:73): apparmor="DENIED" operation="capable" class="cap" profile="/snap/snapd/19122/usr/lib/snapd/snap-confine" pid=749 comm="snap-confine" capability=12  capname="net_admin"
> [    8.120787] audit: type=1400 audit(1684044676.962:74): apparmor="DENIED" operation="capable" class="cap" profile="/snap/snapd/19122/usr/lib/snapd/snap-confine" pid=749 comm="snap-confine" capability=38  capname="perfmon"
> [    8.663394] Bluetooth: RFCOMM TTY layer initialized
> [    8.663404] Bluetooth: RFCOMM socket layer initialized
> [    8.663409] Bluetooth: RFCOMM ver 1.11
> [    9.402378] audit: type=1326 audit(1684044678.244:75): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=snap.cups.cupsd pid=1220 comm="cupsd" exe="/snap/cups/872/sbin/cupsd" sig=0 arch=c000003e syscall=93 compat=0 ip=0x7fbaf1f6239b code=0x50000
> [   10.440702] audit: type=1326 audit(1684044679.283:76): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=snap.cups.cupsd pid=1221 comm="cups-proxyd" exe="/snap/cups/872/sbin/cups-proxyd" sig=0 arch=c000003e syscall=314 compat=0 ip=0x7f2b74a8f73d code=0x50000
> [   11.418074] cups-proxyd[1221]: segfault at 18 ip 00005555a1dd2d6e sp 00007fffb60ddff0 error 4 in cups-proxyd[5555a1dcf000+7000] likely on CPU 1 (core 1, socket 0)
> [   11.418088] Code: 00 00 00 41 54 55 48 89 fd 53 0f 85 ed 00 00 00 48 8d 1d 5f 42 00 00 48 63 45 1c 48 8d 3d 69 3d 00 00 48 c1 e0 05 48 03 45 08 <48> 8b 50 18 8b 70 14 e8 06 d0 ff ff 44 8b 65 18 48 89 c7 45 85 e4
> [   11.761167] wlp2s0: authenticate with REDACTED
> [   12.012550] wlp2s0: send auth to REDACTED (try 1/3)
> [   12.015698] wlp2s0: authenticated
> [   12.016503] wlp2s0: associate with REDACTED (try 1/3)
> [   12.019964] wlp2s0: RX AssocResp from REDACTED (capab=0x511 status=0 aid=1)
> [   12.127085] wlp2s0: associated
> [   12.127134] wlp2s0: Limiting TX power to 24 (24 - 0) dBm as advertised by REDACTED
> [   12.181672] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
> [    0.000000] Linux version 6.3.2-060302-generic (kernel@sita) (x86_64-linux-gnu-gcc-12 (Ubuntu 12.2.0-17ubuntu1) 12.2.0, GNU ld (GNU Binutils for Ubuntu) 2.40) #202305111150 SMP PREEMPT_DYNAMIC Thu May 11 22:22:15 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   Hygon HygonGenuine
> [    0.000000]   Centaur CentaurHauls
> [    0.000000]   zhaoxin   Shanghai  
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
> [    0.000000] signal: max sigframe size: 1776
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009e7ffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000009e80000-0x0000000009ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a21dfff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x000000000a21e000-0x00000000b045efff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000b045f000-0x00000000b045ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000b0460000-0x00000000b078efff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000b078f000-0x00000000b0a5bfff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000b0a5c000-0x00000000b0ad0fff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000b0ad1000-0x00000000b5db9fff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000b5dba000-0x00000000bbdfdfff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000bbdfe000-0x00000000bcffefff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000bcfff000-0x00000000bdffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000be600000-0x00000000bfffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021e33ffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000021e340000-0x00000002601fffff] reserved
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] e820: update [mem 0xa0719018-0xa0723e57] usable ==> usable
> [    0.000000] e820: update [mem 0xa0719018-0xa0723e57] usable ==> usable
> [    0.000000] extended physical RAM map:
> [    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009e7ffff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000009e80000-0x0000000009ffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
> [    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a21dfff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x000000000a21e000-0x00000000a0719017] usable
> [    0.000000] reserve setup_data: [mem 0x00000000a0719018-0x00000000a0723e57] usable
> [    0.000000] reserve setup_data: [mem 0x00000000a0723e58-0x00000000b045efff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000b045f000-0x00000000b045ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000b0460000-0x00000000b078efff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000b078f000-0x00000000b0a5bfff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000b0a5c000-0x00000000b0ad0fff] ACPI data
> [    0.000000] reserve setup_data: [mem 0x00000000b0ad1000-0x00000000b5db9fff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000b5dba000-0x00000000bbdfdfff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000bbdfe000-0x00000000bcffefff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000bcfff000-0x00000000bdffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000be600000-0x00000000bfffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021e33ffff] usable
> [    0.000000] reserve setup_data: [mem 0x000000021e340000-0x00000002601fffff] reserved
> [    0.000000] efi: EFI v2.8 by American Megatrends
> [    0.000000] efi: ACPI=0xb0ad0000 ACPI 2.0=0xb0ad0014 SMBIOS=0xbba71000 SMBIOS 3.0=0xbba70000 MEMATTR=0xad04c018 ESRT=0xaf1c7718 MOKvar=0xbbbb6000 RNG=0xb0a73018 
> [    0.000000] random: crng init done
> [    0.000000] efi: Remove mem66: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
> [    0.000000] e820: remove [mem 0xe0000000-0xefffffff] reserved
> [    0.000000] efi: Remove mem67: MMIO range=[0xfd000000-0xfedfffff] (30MB) from e820 map
> [    0.000000] e820: remove [mem 0xfd000000-0xfedfffff] reserved
> [    0.000000] efi: Not removing mem68: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
> [    0.000000] efi: Remove mem69: MMIO range=[0xfee01000-0xffffffff] (17MB) from e820 map
> [    0.000000] e820: remove [mem 0xfee01000-0xffffffff] reserved
> [    0.000000] efi: Remove mem71: MMIO range=[0x240000000-0x2601fffff] (514MB) from e820 map
> [    0.000000] e820: remove [mem 0x240000000-0x2601fffff] reserved
> [    0.000000] SMBIOS 3.5.0 present.
> [    0.000000] DMI: HP HP Laptop 15z-fc000/8B2F, BIOS F.07 03/13/2023
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 2395.689 MHz processor
> [    0.000017] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.000019] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000028] last_pfn = 0x21e340 max_arch_pfn = 0x400000000
> [    0.000036] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
> [    0.000293] last_pfn = 0xbcfff max_arch_pfn = 0x400000000
> [    0.005032] esrt: Reserving ESRT space from 0x00000000af1c7718 to 0x00000000af1c7750.
> [    0.005039] e820: update [mem 0xaf1c7000-0xaf1c7fff] usable ==> reserved
> [    0.005061] Using GB pages for direct mapping
> [    0.005666] Secure boot disabled
> [    0.005667] RAMDISK: [mem 0xa0724000-0xa512dfff]
> [    0.005674] ACPI: Early table checksum verification disabled
> [    0.005679] ACPI: RSDP 0x00000000B0AD0014 000024 (v02 HPQOEM)
> [    0.005683] ACPI: XSDT 0x00000000B0ACF728 00013C (v01 HPQOEM SLIC-MPC 01072009 AMI  01000013)
> [    0.005690] ACPI: FACP 0x00000000B0AC3000 000114 (v06 HPQOEM SLIC-MPC 01072009 HP   00010013)
> [    0.005695] ACPI: DSDT 0x00000000B0AAB000 017ED6 (v02 HPQOEM 8B2F     01072009 ACPI 20200717)
> [    0.005699] ACPI: FACS 0x00000000B1B9A000 000040
> [    0.005701] ACPI: MSDM 0x00000000B0ACE000 000055 (v03 HPQOEM SLIC-MPC 00000001 HP   00010013)
> [    0.005705] ACPI: SSDT 0x00000000B0AC6000 007EFB (v02 HPQOEM 8B2F     00000002 ACPI 02000002)
> [    0.005708] ACPI: IVRS 0x00000000B0AC5000 0001A4 (v02 HPQOEM 8B2F     00000001 HP   00000001)
> [    0.005711] ACPI: SSDT 0x00000000B0AC4000 00008C (v02 HPQOEM 8B2F     01072009 ACPI 01072009)
> [    0.005714] ACPI: FIDT 0x00000000B0AAA000 00009C (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005717] ACPI: MCFG 0x00000000B0AA9000 00003C (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005720] ACPI: HPET 0x00000000B0AA8000 000038 (v01 HPQOEM 8B2F     01072009 HP   00000005)
> [    0.005723] ACPI: UEFI 0x00000000B1B99000 000048 (v01 HPQOEM 8B2F     01072009 HP   01000013)
> [    0.005726] ACPI: FPDT 0x00000000B0AA7000 000044 (v01 HPQOEM 8B2F     01072009 HP   01000013)
> [    0.005729] ACPI: VFCT 0x00000000B0A9C000 00AE84 (v01 HPQOEM 8B2F     00000001 HP   31504F47)
> [    0.005733] ACPI: SSDT 0x00000000B0A9B000 000060 (v01 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005736] ACPI: SSDT 0x00000000B0A9A000 000A44 (v02 HPQOEM 8B2F     00000001 ACPI 00000001)
> [    0.005739] ACPI: CRAT 0x00000000B0A99000 000468 (v01 HPQOEM 8B2F     00000001 HP   00000001)
> [    0.005742] ACPI: CDIT 0x00000000B0A98000 000029 (v01 HPQOEM 8B2F     00000001 HP   00000001)
> [    0.005745] ACPI: SSDT 0x00000000B0A97000 000BAB (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005748] ACPI: SSDT 0x00000000B0A94000 0029C4 (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005751] ACPI: SSDT 0x00000000B0A93000 00049F (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005754] ACPI: SSDT 0x00000000B0A92000 000695 (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005757] ACPI: SSDT 0x00000000B0A89000 00889F (v02 HPQOEM 8B2F     00000001 ACPI 20200717)
> [    0.005760] ACPI: WSMT 0x00000000B0A88000 000028 (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005763] ACPI: APIC 0x00000000B0A87000 0000E8 (v05 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005766] ACPI: SSDT 0x00000000B0A86000 000804 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005769] ACPI: SSDT 0x00000000B0A84000 0010AD (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005772] ACPI: SSDT 0x00000000B0A83000 000834 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005775] ACPI: SSDT 0x00000000B0A82000 0005E0 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005779] ACPI: SSDT 0x00000000B0A81000 0005E1 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005782] ACPI: SSDT 0x00000000B0A80000 0007B5 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005785] ACPI: SSDT 0x00000000B0A7E000 001F97 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005788] ACPI: SSDT 0x00000000B0A79000 0047F8 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005791] ACPI: SSDT 0x00000000B0A78000 000A10 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005794] ACPI: SSDT 0x00000000B0A77000 00008D (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005797] ACPI: SSDT 0x00000000B0A76000 000792 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005800] ACPI: SSDT 0x00000000B0A75000 000CC9 (v02 HPQOEM AmdTable 00000001 INTL 20200717)
> [    0.005803] ACPI: BGRT 0x00000000B0A74000 000038 (v01 HPQOEM 8B2F     01072009 HP   00010013)
> [    0.005805] ACPI: Reserving FACP table memory at [mem 0xb0ac3000-0xb0ac3113]
> [    0.005807] ACPI: Reserving DSDT table memory at [mem 0xb0aab000-0xb0ac2ed5]
> [    0.005808] ACPI: Reserving FACS table memory at [mem 0xb1b9a000-0xb1b9a03f]
> [    0.005809] ACPI: Reserving MSDM table memory at [mem 0xb0ace000-0xb0ace054]
> [    0.005809] ACPI: Reserving SSDT table memory at [mem 0xb0ac6000-0xb0acdefa]
> [    0.005810] ACPI: Reserving IVRS table memory at [mem 0xb0ac5000-0xb0ac51a3]
> [    0.005811] ACPI: Reserving SSDT table memory at [mem 0xb0ac4000-0xb0ac408b]
> [    0.005812] ACPI: Reserving FIDT table memory at [mem 0xb0aaa000-0xb0aaa09b]
> [    0.005813] ACPI: Reserving MCFG table memory at [mem 0xb0aa9000-0xb0aa903b]
> [    0.005813] ACPI: Reserving HPET table memory at [mem 0xb0aa8000-0xb0aa8037]
> [    0.005814] ACPI: Reserving UEFI table memory at [mem 0xb1b99000-0xb1b99047]
> [    0.005815] ACPI: Reserving FPDT table memory at [mem 0xb0aa7000-0xb0aa7043]
> [    0.005816] ACPI: Reserving VFCT table memory at [mem 0xb0a9c000-0xb0aa6e83]
> [    0.005817] ACPI: Reserving SSDT table memory at [mem 0xb0a9b000-0xb0a9b05f]
> [    0.005817] ACPI: Reserving SSDT table memory at [mem 0xb0a9a000-0xb0a9aa43]
> [    0.005818] ACPI: Reserving CRAT table memory at [mem 0xb0a99000-0xb0a99467]
> [    0.005819] ACPI: Reserving CDIT table memory at [mem 0xb0a98000-0xb0a98028]
> [    0.005820] ACPI: Reserving SSDT table memory at [mem 0xb0a97000-0xb0a97baa]
> [    0.005821] ACPI: Reserving SSDT table memory at [mem 0xb0a94000-0xb0a969c3]
> [    0.005821] ACPI: Reserving SSDT table memory at [mem 0xb0a93000-0xb0a9349e]
> [    0.005822] ACPI: Reserving SSDT table memory at [mem 0xb0a92000-0xb0a92694]
> [    0.005823] ACPI: Reserving SSDT table memory at [mem 0xb0a89000-0xb0a9189e]
> [    0.005824] ACPI: Reserving WSMT table memory at [mem 0xb0a88000-0xb0a88027]
> [    0.005825] ACPI: Reserving APIC table memory at [mem 0xb0a87000-0xb0a870e7]
> [    0.005825] ACPI: Reserving SSDT table memory at [mem 0xb0a86000-0xb0a86803]
> [    0.005826] ACPI: Reserving SSDT table memory at [mem 0xb0a84000-0xb0a850ac]
> [    0.005827] ACPI: Reserving SSDT table memory at [mem 0xb0a83000-0xb0a83833]
> [    0.005828] ACPI: Reserving SSDT table memory at [mem 0xb0a82000-0xb0a825df]
> [    0.005829] ACPI: Reserving SSDT table memory at [mem 0xb0a81000-0xb0a815e0]
> [    0.005830] ACPI: Reserving SSDT table memory at [mem 0xb0a80000-0xb0a807b4]
> [    0.005830] ACPI: Reserving SSDT table memory at [mem 0xb0a7e000-0xb0a7ff96]
> [    0.005831] ACPI: Reserving SSDT table memory at [mem 0xb0a79000-0xb0a7d7f7]
> [    0.005832] ACPI: Reserving SSDT table memory at [mem 0xb0a78000-0xb0a78a0f]
> [    0.005833] ACPI: Reserving SSDT table memory at [mem 0xb0a77000-0xb0a7708c]
> [    0.005834] ACPI: Reserving SSDT table memory at [mem 0xb0a76000-0xb0a76791]
> [    0.005834] ACPI: Reserving SSDT table memory at [mem 0xb0a75000-0xb0a75cc8]
> [    0.005835] ACPI: Reserving BGRT table memory at [mem 0xb0a74000-0xb0a74037]
> [    0.006014] No NUMA configuration found
> [    0.006015] Faking a node at [mem 0x0000000000000000-0x000000021e33ffff]
> [    0.006022] NODE_DATA(0) allocated [mem 0x21e315000-0x21e33ffff]
> [    0.006198] Zone ranges:
> [    0.006199]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.006201]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.006202]   Normal   [mem 0x0000000100000000-0x000000021e33ffff]
> [    0.006204]   Device   empty
> [    0.006205] Movable zone start for each node
> [    0.006207] Early memory node ranges
> [    0.006207]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
> [    0.006209]   node   0: [mem 0x0000000000100000-0x0000000009e7ffff]
> [    0.006210]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
> [    0.006211]   node   0: [mem 0x000000000a21e000-0x00000000b045efff]
> [    0.006212]   node   0: [mem 0x00000000b0460000-0x00000000b078efff]
> [    0.006213]   node   0: [mem 0x00000000bbdfe000-0x00000000bcffefff]
> [    0.006214]   node   0: [mem 0x0000000100000000-0x000000021e33ffff]
> [    0.006215] Initmem setup node 0 [mem 0x0000000000001000-0x000000021e33ffff]
> [    0.006221] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.006239] On node 0, zone DMA: 96 pages in unavailable ranges
> [    0.006430] On node 0, zone DMA32: 384 pages in unavailable ranges
> [    0.011409] On node 0, zone DMA32: 30 pages in unavailable ranges
> [    0.011420] On node 0, zone DMA32: 1 pages in unavailable ranges
> [    0.011844] On node 0, zone DMA32: 46703 pages in unavailable ranges
> [    0.020579] On node 0, zone Normal: 12289 pages in unavailable ranges
> [    0.020645] On node 0, zone Normal: 7360 pages in unavailable ranges
> [    0.020761] ACPI: PM-Timer IO Port: 0x808
> [    0.020771] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
> [    0.020786] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0-23
> [    0.020791] IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 24-55
> [    0.020793] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.020795] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
> [    0.020796] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> [    0.020801] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.020802] ACPI: HPET id: 0x10228201 base: 0xfed00000
> [    0.020812] e820: update [mem 0xad56d000-0xad580fff] usable ==> reserved
> [    0.020826] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> [    0.020846] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.020848] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
> [    0.020850] PM: hibernation: Registered nosave memory: [mem 0x09e80000-0x09ffffff]
> [    0.020851] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a21dfff]
> [    0.020853] PM: hibernation: Registered nosave memory: [mem 0xa0719000-0xa0719fff]
> [    0.020855] PM: hibernation: Registered nosave memory: [mem 0xa0723000-0xa0723fff]
> [    0.020856] PM: hibernation: Registered nosave memory: [mem 0xad56d000-0xad580fff]
> [    0.020858] PM: hibernation: Registered nosave memory: [mem 0xaf1c7000-0xaf1c7fff]
> [    0.020859] PM: hibernation: Registered nosave memory: [mem 0xb045f000-0xb045ffff]
> [    0.020861] PM: hibernation: Registered nosave memory: [mem 0xb078f000-0xb0a5bfff]
> [    0.020862] PM: hibernation: Registered nosave memory: [mem 0xb0a5c000-0xb0ad0fff]
> [    0.020862] PM: hibernation: Registered nosave memory: [mem 0xb0ad1000-0xb5db9fff]
> [    0.020863] PM: hibernation: Registered nosave memory: [mem 0xb5dba000-0xbbdfdfff]
> [    0.020865] PM: hibernation: Registered nosave memory: [mem 0xbcfff000-0xbdffffff]
> [    0.020865] PM: hibernation: Registered nosave memory: [mem 0xbe000000-0xbe5fffff]
> [    0.020866] PM: hibernation: Registered nosave memory: [mem 0xbe600000-0xbfffffff]
> [    0.020867] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xfedfffff]
> [    0.020868] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
> [    0.020868] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
> [    0.020870] [mem 0xc0000000-0xfedfffff] available for PCI devices
> [    0.020871] Booting paravirtualized kernel on bare hardware
> [    0.020875] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.020884] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:1
> [    0.021172] percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u1048576
> [    0.021181] pcpu-alloc: s217088 r8192 d28672 u1048576 alloc=1*2097152
> [    0.021184] pcpu-alloc: [0] 0 1 
> [    0.021214] Fallback order for Node 0: 0 
> [    0.021217] Built 1 zonelists, mobility grouping on.  Total pages: 1869380
> [    0.021218] Policy zone: Normal
> [    0.021220] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7
> [    0.021318] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic", will be passed to user space.
> [    0.022570] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
> [    0.023056] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
> [    0.023099] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
> [    0.023143] software IO TLB: area num 2.
> [    0.052651] Memory: 7111248K/7596864K available (20480K kernel code, 4170K rwdata, 22520K rodata, 4700K init, 17584K bss, 485356K reserved, 0K cma-reserved)
> [    0.052769] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> [    0.052811] ftrace: allocating 53634 entries in 210 pages
> [    0.064650] ftrace: allocated 210 pages with 4 groups
> [    0.065619] Dynamic Preempt: voluntary
> [    0.065663] rcu: Preemptible hierarchical RCU implementation.
> [    0.065664] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=2.
> [    0.065665] 	Trampoline variant of Tasks RCU enabled.
> [    0.065666] 	Rude variant of Tasks RCU enabled.
> [    0.065666] 	Tracing variant of Tasks RCU enabled.
> [    0.065667] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> [    0.065668] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    0.068163] NR_IRQS: 524544, nr_irqs: 512, preallocated irqs: 16
> [    0.068357] rcu: 	Offload RCU callbacks from CPUs: 0-1.
> [    0.068361] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.068521] Console: colour dummy device 80x25
> [    0.068524] printk: console [tty0] enabled
> [    0.068565] ACPI: Core revision 20221020
> [    0.068862] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
> [    0.068883] APIC: Switch to symmetric I/O mode setup
> [    0.069966] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.069972] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.069974] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.069975] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    0.069977] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
> [    0.070438] x2apic: IRQ remapping doesn't support X2APIC mode
> [    0.071210] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.075888] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x22884f07a29, max_idle_ns: 440795260743 ns
> [    0.075898] Calibrating delay loop (skipped), value calculated using timer frequency.. 4791.37 BogoMIPS (lpj=2395689)
> [    0.075901] pid_max: default: 32768 minimum: 301
> [    0.079350] LSM: initializing lsm=lockdown,capability,landlock,yama,integrity,apparmor
> [    0.079367] landlock: Up and running.
> [    0.079368] Yama: becoming mindful.
> [    0.079405] AppArmor: AppArmor initialized
> [    0.079449] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.079468] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.079684] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [    0.079828] LVT offset 1 assigned for vector 0xf9
> [    0.079872] LVT offset 2 assigned for vector 0xf4
> [    0.079884] process: using mwait in idle threads
> [    0.079888] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
> [    0.079889] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
> [    0.079898] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    0.079900] Spectre V2 : Mitigation: Retpolines
> [    0.079901] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> [    0.079902] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
> [    0.079903] Spectre V2 : Enabling Speculation Barrier for firmware calls
> [    0.079904] RETBleed: Mitigation: untrained return thunk
> [    0.079906] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    0.079908] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    0.091370] Freeing SMP alternatives memory: 44K
> [    0.194136] smpboot: CPU0: AMD Athlon Silver 7120U with Radeon Graphics (family: 0x17, model: 0xa0, stepping: 0x0)
> [    0.194270] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.194272] cblist_init_generic: Setting shift to 1 and lim to 1.
> [    0.194287] cblist_init_generic: Setting shift to 1 and lim to 1.
> [    0.194300] cblist_init_generic: Setting shift to 1 and lim to 1.
> [    0.194315] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    0.194322] ... version:                0
> [    0.194323] ... bit width:              48
> [    0.194324] ... generic registers:      6
> [    0.194324] ... value mask:             0000ffffffffffff
> [    0.194325] ... max period:             00007fffffffffff
> [    0.194326] ... fixed-purpose events:   0
> [    0.194326] ... event mask:             000000000000003f
> [    0.194419] rcu: Hierarchical SRCU implementation.
> [    0.194420] rcu: 	Max phase no-delay instances is 400.
> [    0.194871] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
> [    0.194893] smp: Bringing up secondary CPUs ...
> [    0.194893] x86: Booting SMP configuration:
> [    0.194893] .... node  #0, CPUs:      #1
> [    0.195970] smp: Brought up 1 node, 2 CPUs
> [    0.195970] smpboot: Max logical packages: 1
> [    0.195970] smpboot: Total of 2 processors activated (9582.75 BogoMIPS)
> [    0.197330] devtmpfs: initialized
> [    0.197330] x86/mm: Memory block size: 128MB
> [    0.198149] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a21dfff] (122880 bytes)
> [    0.198153] ACPI: PM: Registering ACPI NVS region [mem 0xb0ad1000-0xb5db9fff] (86937600 bytes)
> [    0.199298] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.199309] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> [    0.199379] pinctrl core: initialized pinctrl subsystem
> [    0.199518] PM: RTC time: 06:12:18, date: 2023-05-14
> [    0.200253] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.200498] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
> [    0.200606] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.200710] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.200726] audit: initializing netlink subsys (disabled)
> [    0.200789] audit: type=2000 audit(1684044737.130:1): state=initialized audit_enabled=0 res=1
> [    0.200930] thermal_sys: Registered thermal governor 'fair_share'
> [    0.200932] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.200933] thermal_sys: Registered thermal governor 'step_wise'
> [    0.200933] thermal_sys: Registered thermal governor 'user_space'
> [    0.200934] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.200940] EISA bus registered
> [    0.200952] cpuidle: using governor ladder
> [    0.200956] cpuidle: using governor menu
> [    0.200986] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
> [    0.200986] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.201039] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.201049] PCI: not using MMCONFIG
> [    0.201050] PCI: Using configuration type 1 for base access
> [    0.201051] PCI: Using configuration type 1 for extended access
> [    0.201229] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
> [    0.207550] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.207554] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [    0.207555] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.207556] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.207901] ACPI: Added _OSI(Module Device)
> [    0.207903] ACPI: Added _OSI(Processor Device)
> [    0.207904] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.207905] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.225755] ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP2.WLAN._STA], AE_ALREADY_EXISTS (20221020/dswload2-326)
> [    0.225772] fbcon: Taking over console
> [    0.225787] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20221020/psobject-220)
> [    0.225791] ACPI: Skipping parse of AML opcode: Method (0x0014)
> [    0.225980] ACPI BIOS Error (bug): Failure creating named object [\_SB.I2CA.TPNL], AE_ALREADY_EXISTS (20221020/dswload2-326)
> [    0.225986] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20221020/psobject-220)
> [    0.225991] ACPI: Skipping parse of AML opcode: Device (0x5B82)
> [    0.228265] ACPI: 22 ACPI AML tables successfully acquired and loaded
> [    0.230043] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    0.236624] ACPI: EC: EC started
> [    0.236626] ACPI: EC: interrupt blocked
> [    0.237737] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> [    0.237739] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle transactions
> [    0.237742] ACPI: Interpreter enabled
> [    0.237757] ACPI: PM: (supports S0 S4 S5)
> [    0.237758] ACPI: Using IOAPIC for interrupt routing
> [    0.238767] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.238805] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved as ACPI motherboard resource
> [    0.238818] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    0.238819] PCI: Ignoring E820 reservations for host bridge windows
> [    0.239163] ACPI: Enabled 2 GPEs in block 00 to 1F
> [    0.240147] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
> [    0.241778] ACPI: \_SB_.PCI0.GP17.PWRS: New power resource
> [    0.242022] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.242295] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.242522] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> [    0.242915] ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New power resource
> [    0.243562] ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New power resource
> [    0.244665] ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New power resource
> [    0.245495] ACPI: \_SB_.PCI0.GP19.PWRS: New power resource
> [    0.245977] ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New power resource
> [    0.251024] ACPI: \_SB_.PRWL: New power resource
> [    0.251046] ACPI: \_SB_.PRWB: New power resource
> [    0.251873] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.251880] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.251970] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug LTR DPC]
> [    0.252126] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
> [    0.252127] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
> [    0.252567] PCI host bridge to bus 0000:00
> [    0.252569] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
> [    0.252571] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
> [    0.252572] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
> [    0.252573] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [    0.252575] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
> [    0.252576] pci_bus 0000:00: root bus resource [mem 0xfa000000-0xfcffffff window]
> [    0.252577] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xf9ffffff window]
> [    0.252579] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xdfffffff window]
> [    0.252580] pci_bus 0000:00: root bus resource [mem 0x240000000-0x7fffffffff window]
> [    0.252582] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.252596] pci 0000:00:00.0: [1022:14b5] type 00 class 0x060000
> [    0.252696] pci 0000:00:00.2: [1022:14b6] type 00 class 0x080600
> [    0.252780] pci 0000:00:01.0: [1022:14b7] type 00 class 0x060000
> [    0.252838] pci 0000:00:02.0: [1022:14b7] type 00 class 0x060000
> [    0.252900] pci 0000:00:02.2: [1022:14ba] type 01 class 0x060400
> [    0.252991] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
> [    0.253130] pci 0000:00:02.3: [1022:14ba] type 01 class 0x060400
> [    0.253163] pci 0000:00:02.3: enabling Extended Tags
> [    0.253222] pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
> [    0.253378] pci 0000:00:08.0: [1022:14b7] type 00 class 0x060000
> [    0.253427] pci 0000:00:08.1: [1022:14b9] type 01 class 0x060400
> [    0.253449] pci 0000:00:08.1: enabling Extended Tags
> [    0.253484] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [    0.253599] pci 0000:00:08.3: [1022:14b9] type 01 class 0x060400
> [    0.253621] pci 0000:00:08.3: enabling Extended Tags
> [    0.253658] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
> [    0.253905] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
> [    0.254028] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
> [    0.254154] pci 0000:00:18.0: [1022:1724] type 00 class 0x060000
> [    0.254184] pci 0000:00:18.1: [1022:1725] type 00 class 0x060000
> [    0.254212] pci 0000:00:18.2: [1022:1726] type 00 class 0x060000
> [    0.254243] pci 0000:00:18.3: [1022:1727] type 00 class 0x060000
> [    0.254271] pci 0000:00:18.4: [1022:1728] type 00 class 0x060000
> [    0.254298] pci 0000:00:18.5: [1022:1729] type 00 class 0x060000
> [    0.254326] pci 0000:00:18.6: [1022:172a] type 00 class 0x060000
> [    0.254353] pci 0000:00:18.7: [1022:172b] type 00 class 0x060000
> [    0.254453] pci 0000:01:00.0: [2646:5016] type 00 class 0x010802
> [    0.254476] pci 0000:01:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
> [    0.254710] pci 0000:01:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
> [    0.254859] pci 0000:00:02.2: PCI bridge to [bus 01]
> [    0.254865] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
> [    0.254941] pci 0000:02:00.0: [10ec:b852] type 00 class 0x028000
> [    0.254961] pci 0000:02:00.0: reg 0x10: [io  0xf000-0xf0ff]
> [    0.254985] pci 0000:02:00.0: reg 0x18: [mem 0xfce00000-0xfcefffff 64bit]
> [    0.255103] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
> [    0.255367] pci 0000:00:02.3: PCI bridge to [bus 02]
> [    0.255372] pci 0000:00:02.3:   bridge window [io  0xf000-0xffff]
> [    0.255374] pci 0000:00:02.3:   bridge window [mem 0xfce00000-0xfcefffff]
> [    0.255460] pci 0000:03:00.0: [1002:1506] type 00 class 0x030000
> [    0.255472] pci 0000:03:00.0: reg 0x10: [mem 0x7fe0000000-0x7fefffffff 64bit pref]
> [    0.255480] pci 0000:03:00.0: reg 0x18: [mem 0x7ff0000000-0x7ff01fffff 64bit pref]
> [    0.255486] pci 0000:03:00.0: reg 0x20: [io  0xe000-0xe0ff]
> [    0.255491] pci 0000:03:00.0: reg 0x24: [mem 0xfcc00000-0xfcc7ffff]
> [    0.255500] pci 0000:03:00.0: enabling Extended Tags
> [    0.255512] pci 0000:03:00.0: BAR 0: assigned to efifb
> [    0.255554] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
> [    0.255672] pci 0000:03:00.1: [1002:1640] type 00 class 0x040300
> [    0.255680] pci 0000:03:00.1: reg 0x10: [mem 0xfccc8000-0xfcccbfff]
> [    0.255703] pci 0000:03:00.1: enabling Extended Tags
> [    0.255736] pci 0000:03:00.1: PME# supported from D1 D2 D3hot D3cold
> [    0.255814] pci 0000:03:00.2: [1022:1649] type 00 class 0x108000
> [    0.255828] pci 0000:03:00.2: reg 0x18: [mem 0xfcb00000-0xfcbfffff]
> [    0.255838] pci 0000:03:00.2: reg 0x24: [mem 0xfcccc000-0xfcccdfff]
> [    0.255846] pci 0000:03:00.2: enabling Extended Tags
> [    0.255947] pci 0000:03:00.3: [1022:1503] type 00 class 0x0c0330
> [    0.255959] pci 0000:03:00.3: reg 0x10: [mem 0xfca00000-0xfcafffff 64bit]
> [    0.255984] pci 0000:03:00.3: enabling Extended Tags
> [    0.256019] pci 0000:03:00.3: PME# supported from D0 D3hot D3cold
> [    0.256102] pci 0000:03:00.4: [1022:1504] type 00 class 0x0c0330
> [    0.256113] pci 0000:03:00.4: reg 0x10: [mem 0xfc900000-0xfc9fffff 64bit]
> [    0.256139] pci 0000:03:00.4: enabling Extended Tags
> [    0.256174] pci 0000:03:00.4: PME# supported from D0 D3hot D3cold
> [    0.256246] pci 0000:03:00.5: [1022:15e2] type 00 class 0x048000
> [    0.256254] pci 0000:03:00.5: reg 0x10: [mem 0xfcc80000-0xfccbffff]
> [    0.256276] pci 0000:03:00.5: enabling Extended Tags
> [    0.256309] pci 0000:03:00.5: PME# supported from D0 D3hot D3cold
> [    0.256378] pci 0000:03:00.6: [1022:15e3] type 00 class 0x040300
> [    0.256386] pci 0000:03:00.6: reg 0x10: [mem 0xfccc0000-0xfccc7fff]
> [    0.256409] pci 0000:03:00.6: enabling Extended Tags
> [    0.256441] pci 0000:03:00.6: PME# supported from D0 D3hot D3cold
> [    0.256521] pci 0000:00:08.1: PCI bridge to [bus 03]
> [    0.256524] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
> [    0.256527] pci 0000:00:08.1:   bridge window [mem 0xfc900000-0xfccfffff]
> [    0.256530] pci 0000:00:08.1:   bridge window [mem 0x7fe0000000-0x7ff01fffff 64bit pref]
> [    0.256573] pci 0000:04:00.0: [1022:1505] type 00 class 0x0c0330
> [    0.256588] pci 0000:04:00.0: reg 0x10: [mem 0xfcd00000-0xfcdfffff 64bit]
> [    0.256619] pci 0000:04:00.0: enabling Extended Tags
> [    0.256661] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
> [    0.256754] pci 0000:00:08.3: PCI bridge to [bus 04]
> [    0.256758] pci 0000:00:08.3:   bridge window [mem 0xfcd00000-0xfcdfffff]
> [    0.259226] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [    0.259275] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [    0.259316] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [    0.259367] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [    0.259413] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [    0.259451] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [    0.259489] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [    0.259527] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [    0.277628] Low-power S0 idle used by default for system suspend
> [    0.277802] ACPI: EC: interrupt unblocked
> [    0.277803] ACPI: EC: event unblocked
> [    0.277810] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> [    0.277812] ACPI: EC: GPE=0xb
> [    0.277813] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization complete
> [    0.277816] ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions and events
> [    0.277945] iommu: Default domain type: Translated 
> [    0.277945] iommu: DMA domain TLB invalidation policy: lazy mode 
> [    0.278210] SCSI subsystem initialized
> [    0.278220] libata version 3.00 loaded.
> [    0.278220] ACPI: bus type USB registered
> [    0.278220] usbcore: registered new interface driver usbfs
> [    0.278220] usbcore: registered new interface driver hub
> [    0.278220] usbcore: registered new device driver usb
> [    0.284903] pps_core: LinuxPPS API ver. 1 registered
> [    0.284905] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.284908] PTP clock support registered
> [    0.284934] EDAC MC: Ver: 3.0.0
> [    0.285010] efivars: Registered efivars operations
> [    0.286898] NetLabel: Initializing
> [    0.286898] NetLabel:  domain hash size = 128
> [    0.286898] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    0.286898] NetLabel:  unlabeled traffic allowed by default
> [    0.286913] mctp: management component transport protocol core
> [    0.286913] NET: Registered PF_MCTP protocol family
> [    0.286913] PCI: Using ACPI for IRQ routing
> [    0.294294] PCI: pci_cache_line_size set to 64 bytes
> [    0.294346] e820: reserve RAM buffer [mem 0x09e80000-0x0bffffff]
> [    0.294348] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
> [    0.294349] e820: reserve RAM buffer [mem 0xa0719018-0xa3ffffff]
> [    0.294350] e820: reserve RAM buffer [mem 0xad56d000-0xafffffff]
> [    0.294351] e820: reserve RAM buffer [mem 0xaf1c7000-0xafffffff]
> [    0.294352] e820: reserve RAM buffer [mem 0xb045f000-0xb3ffffff]
> [    0.294353] e820: reserve RAM buffer [mem 0xb078f000-0xb3ffffff]
> [    0.294354] e820: reserve RAM buffer [mem 0xbcfff000-0xbfffffff]
> [    0.294355] e820: reserve RAM buffer [mem 0x21e340000-0x21fffffff]
> [    0.294387] pci 0000:03:00.0: vgaarb: setting as boot VGA device
> [    0.294387] pci 0000:03:00.0: vgaarb: bridge control possible
> [    0.294387] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.294387] vgaarb: loaded
> [    0.294387] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    0.294387] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [    0.295929] clocksource: Switched to clocksource tsc-early
> [    0.296039] VFS: Disk quotas dquot_6.6.0
> [    0.296048] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.296143] AppArmor: AppArmor Filesystem Enabled
> [    0.296185] pnp: PnP ACPI init
> [    0.296293] system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
> [    0.297291] system 00:03: [io  0x04d0-0x04d1] has been reserved
> [    0.297295] system 00:03: [io  0x040b] has been reserved
> [    0.297297] system 00:03: [io  0x04d6] has been reserved
> [    0.297298] system 00:03: [io  0x0c00-0x0c01] has been reserved
> [    0.297300] system 00:03: [io  0x0c14] has been reserved
> [    0.297301] system 00:03: [io  0x0c50-0x0c51] has been reserved
> [    0.297302] system 00:03: [io  0x0c52] has been reserved
> [    0.297303] system 00:03: [io  0x0c6c] has been reserved
> [    0.297305] system 00:03: [io  0x0c6f] has been reserved
> [    0.297306] system 00:03: [io  0x0cd0-0x0cd1] has been reserved
> [    0.297307] system 00:03: [io  0x0cd2-0x0cd3] has been reserved
> [    0.297309] system 00:03: [io  0x0cd4-0x0cd5] has been reserved
> [    0.297310] system 00:03: [io  0x0cd6-0x0cd7] has been reserved
> [    0.297311] system 00:03: [io  0x0cd8-0x0cdf] has been reserved
> [    0.297312] system 00:03: [io  0x0800-0x089f] has been reserved
> [    0.297314] system 00:03: [io  0x0b00-0x0b0f] has been reserved
> [    0.297315] system 00:03: [io  0x0b20-0x0b3f] has been reserved
> [    0.297316] system 00:03: [io  0x0900-0x090f] has been reserved
> [    0.297317] system 00:03: [io  0x0910-0x091f] has been reserved
> [    0.297319] system 00:03: [mem 0xfec00000-0xfec00fff] could not be reserved
> [    0.297321] system 00:03: [mem 0xfec01000-0xfec01fff] could not be reserved
> [    0.297322] system 00:03: [mem 0xfedc0000-0xfedc0fff] has been reserved
> [    0.297324] system 00:03: [mem 0xfee00000-0xfee00fff] has been reserved
> [    0.297325] system 00:03: [mem 0xfed80000-0xfed8ffff] could not be reserved
> [    0.297327] system 00:03: [mem 0xfec10000-0xfec10fff] has been reserved
> [    0.297328] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
> [    0.298341] pnp: PnP ACPI: found 4 devices
> [    0.303952] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [    0.304096] NET: Registered PF_INET protocol family
> [    0.304276] IP idents hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.306306] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
> [    0.306349] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.306419] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [    0.306685] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
> [    0.306807] TCP: Hash tables configured (established 65536 bind 65536)
> [    0.306899] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
> [    0.306934] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
> [    0.306959] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
> [    0.307012] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.307023] NET: Registered PF_XDP protocol family
> [    0.307043] pci 0000:00:02.2: PCI bridge to [bus 01]
> [    0.307050] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
> [    0.307057] pci 0000:00:02.3: PCI bridge to [bus 02]
> [    0.307059] pci 0000:00:02.3:   bridge window [io  0xf000-0xffff]
> [    0.307063] pci 0000:00:02.3:   bridge window [mem 0xfce00000-0xfcefffff]
> [    0.307070] pci 0000:00:08.1: PCI bridge to [bus 03]
> [    0.307072] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
> [    0.307077] pci 0000:00:08.1:   bridge window [mem 0xfc900000-0xfccfffff]
> [    0.307080] pci 0000:00:08.1:   bridge window [mem 0x7fe0000000-0x7ff01fffff 64bit pref]
> [    0.307083] pci 0000:00:08.3: PCI bridge to [bus 04]
> [    0.307086] pci 0000:00:08.3:   bridge window [mem 0xfcd00000-0xfcdfffff]
> [    0.307092] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
> [    0.307094] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.307095] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
> [    0.307097] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
> [    0.307098] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
> [    0.307099] pci_bus 0000:00: resource 9 [mem 0xfa000000-0xfcffffff window]
> [    0.307101] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xf9ffffff window]
> [    0.307102] pci_bus 0000:00: resource 11 [mem 0xc0000000-0xdfffffff window]
> [    0.307104] pci_bus 0000:00: resource 12 [mem 0x240000000-0x7fffffffff window]
> [    0.307105] pci_bus 0000:01: resource 1 [mem 0xfcf00000-0xfcffffff]
> [    0.307107] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
> [    0.307108] pci_bus 0000:02: resource 1 [mem 0xfce00000-0xfcefffff]
> [    0.307110] pci_bus 0000:03: resource 0 [io  0xe000-0xefff]
> [    0.307111] pci_bus 0000:03: resource 1 [mem 0xfc900000-0xfccfffff]
> [    0.307112] pci_bus 0000:03: resource 2 [mem 0x7fe0000000-0x7ff01fffff 64bit pref]
> [    0.307114] pci_bus 0000:04: resource 1 [mem 0xfcd00000-0xfcdfffff]
> [    0.307355] pci 0000:03:00.1: D0 power state depends on 0000:03:00.0
> [    0.307469] pci 0000:00:08.1: can't derive routing for PCI INT A
> [    0.307471] pci 0000:00:08.1: PCI INT A: not connected
> [    0.307681] pci 0000:00:08.3: can't derive routing for PCI INT A
> [    0.307683] pci 0000:00:08.3: PCI INT A: not connected
> [    0.307748] PCI: CLS 64 bytes, default 64
> [    0.307762] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
> [    0.307801] Trying to unpack rootfs image as initramfs...
> [    0.307811] pci 0000:00:01.0: Adding to iommu group 0
> [    0.307825] pci 0000:00:02.0: Adding to iommu group 1
> [    0.307836] pci 0000:00:02.2: Adding to iommu group 2
> [    0.307847] pci 0000:00:02.3: Adding to iommu group 3
> [    0.307861] pci 0000:00:08.0: Adding to iommu group 4
> [    0.307870] pci 0000:00:08.1: Adding to iommu group 5
> [    0.307880] pci 0000:00:08.3: Adding to iommu group 6
> [    0.307895] pci 0000:00:14.0: Adding to iommu group 7
> [    0.307903] pci 0000:00:14.3: Adding to iommu group 7
> [    0.307934] pci 0000:00:18.0: Adding to iommu group 8
> [    0.307942] pci 0000:00:18.1: Adding to iommu group 8
> [    0.307952] pci 0000:00:18.2: Adding to iommu group 8
> [    0.307960] pci 0000:00:18.3: Adding to iommu group 8
> [    0.307968] pci 0000:00:18.4: Adding to iommu group 8
> [    0.307976] pci 0000:00:18.5: Adding to iommu group 8
> [    0.307984] pci 0000:00:18.6: Adding to iommu group 8
> [    0.307992] pci 0000:00:18.7: Adding to iommu group 8
> [    0.308002] pci 0000:01:00.0: Adding to iommu group 9
> [    0.308013] pci 0000:02:00.0: Adding to iommu group 10
> [    0.308038] pci 0000:03:00.0: Adding to iommu group 11
> [    0.308049] pci 0000:03:00.1: Adding to iommu group 12
> [    0.308059] pci 0000:03:00.2: Adding to iommu group 13
> [    0.308070] pci 0000:03:00.3: Adding to iommu group 14
> [    0.308080] pci 0000:03:00.4: Adding to iommu group 15
> [    0.308090] pci 0000:03:00.5: Adding to iommu group 16
> [    0.308100] pci 0000:03:00.6: Adding to iommu group 17
> [    0.308110] pci 0000:04:00.0: Adding to iommu group 18
> [    0.309079] pci 0000:00:00.2: can't derive routing for PCI INT A
> [    0.309086] pci 0000:00:00.2: PCI INT A: not connected
> [    0.309487] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
> [    0.309494] AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX GT [5] IA GA PC GA_vAPIC
> [    0.309501] AMD-Vi: Interrupt remapping enabled
> [    0.335815] AMD-Vi: Virtual APIC enabled
> [    0.336277] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    0.336279] software IO TLB: mapped [mem 0x000000009c719000-0x00000000a0719000] (64MB)
> [    0.336342] LVT offset 0 assigned for vector 0x400
> [    0.336387] perf: AMD IBS detected (0x000003ff)
> [    0.336399] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [    0.336974] Initialise system trusted keyrings
> [    0.336989] Key type blacklist registered
> [    0.338242] workingset: timestamp_bits=36 max_order=21 bucket_order=0
> [    0.338264] zbud: loaded
> [    0.338531] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.340408] fuse: init (API version 7.38)
> [    0.340692] integrity: Platform Keyring initialized
> [    0.340708] integrity: Machine keyring initialized
> [    0.343769] Key type asymmetric registered
> [    0.343771] Asymmetric key parser 'x509' registered
> [    0.343799] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
> [    0.344250] io scheduler mq-deadline registered
> [    0.345716] pcieport 0000:00:02.2: PME: Signaling with IRQ 33
> [    0.346255] pcieport 0000:00:02.2: AER: enabled with IRQ 33
> [    0.346419] pcieport 0000:00:02.3: PME: Signaling with IRQ 34
> [    0.348258] pcieport 0000:00:02.3: AER: enabled with IRQ 34
> [    0.348497] pcieport 0000:00:08.1: PME: Signaling with IRQ 35
> [    0.348696] pcieport 0000:00:08.3: PME: Signaling with IRQ 36
> [    0.350262] pcieport 0000:00:08.3: AER: enabled with IRQ 36
> [    0.350430] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    0.403466] ACPI: AC: AC Adapter [ACAD] (on-line)
> [    0.403555] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> [    0.403573] ACPI: button: Power Button [PWRB]
> [    0.403604] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
> [    0.403615] ACPI: button: Lid Switch [LID]
> [    0.403705] Estimated ratio of average max frequency by base frequency (times 1024): 1677
> [    0.403948] Monitor-Mwait will be used to enter C-1 state
> [    0.403954] ACPI: \_SB_.PLTF.P000: Found 3 idle states
> [    0.404060] ACPI: \_SB_.PLTF.P001: Found 3 idle states
> [    0.406429] thermal LNXTHERM:00: registered as thermal_zone0
> [    0.406436] ACPI: thermal: Thermal Zone [THRM] (29 C)
> [    0.406535] thermal LNXTHERM:01: registered as thermal_zone1
> [    0.406537] ACPI: thermal: Thermal Zone [TZ01] (20 C)
> [    0.407032] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    0.412275] Linux agpgart interface v0.103
> [    0.413827] loop: module loaded
> [    0.414098] tun: Universal TUN/TAP device driver, 1.6
> [    0.414118] PPP generic driver version 2.4.2
> [    0.414176] ACPI: battery: Slot [BAT0] (battery present)
> [    0.414220] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
> [    0.414222] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
> [    0.414906] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.415002] mousedev: PS/2 mouse device common for all mice
> [    0.415077] rtc_cmos 00:01: RTC can wake from S4
> [    0.415282] rtc_cmos 00:01: registered as rtc0
> [    0.415315] rtc_cmos 00:01: setting system clock to 2023-05-14T06:12:18 UTC (1684044738)
> [    0.415343] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    0.415349] i2c_dev: i2c /dev entries driver
> [    0.415395] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
> [    0.415406] device-mapper: uevent: version 1.0.3
> [    0.415433] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised: dm-devel@redhat.com
> [    0.415448] platform eisa.0: Probing EISA bus 0
> [    0.415453] platform eisa.0: EISA: Cannot allocate resource for mainboard
> [    0.415454] platform eisa.0: Cannot allocate resource for EISA slot 1
> [    0.415455] platform eisa.0: Cannot allocate resource for EISA slot 2
> [    0.415456] platform eisa.0: Cannot allocate resource for EISA slot 3
> [    0.415457] platform eisa.0: Cannot allocate resource for EISA slot 4
> [    0.415459] platform eisa.0: Cannot allocate resource for EISA slot 5
> [    0.415460] platform eisa.0: Cannot allocate resource for EISA slot 6
> [    0.415461] platform eisa.0: Cannot allocate resource for EISA slot 7
> [    0.415462] platform eisa.0: Cannot allocate resource for EISA slot 8
> [    0.415463] platform eisa.0: EISA: Detected 0 cards
> [    0.415464] amd_pstate: driver load is disabled, boot with specific mode to enable this
> [    0.416997] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.417058] efifb: probing for efifb
> [    0.417082] efifb: Ignoring BGRT: unexpected or invalid BMP data
> [    0.417083] efifb: framebuffer at 0x7fe0000000, using 3072k, total 3072k
> [    0.417085] efifb: mode is 1024x768x32, linelength=4096, pages=1
> [    0.417086] efifb: scrolling: redraw
> [    0.417087] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
> [    0.417171] Console: switching to colour frame buffer device 128x48
> [    0.417784] fb0: EFI VGA frame buffer device
> [    0.417913] drop_monitor: Initializing network drop monitor service
> [    0.465218] NET: Registered PF_INET6 protocol family
> [    0.492539] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
> [    0.738406] Freeing initrd memory: 75816K
> [    0.743775] Segment Routing with IPv6
> [    0.743794] In-situ OAM (IOAM) with IPv6
> [    0.743827] NET: Registered PF_PACKET protocol family
> [    0.743857] Key type dns_resolver registered
> [    0.744169] microcode: CPU0: patch_level=0x08a00006
> [    0.744170] microcode: CPU1: patch_level=0x08a00006
> [    0.744178] microcode: Microcode Update Driver: v2.2.
> [    0.744211] resctrl: L3 allocation detected
> [    0.744212] resctrl: MB allocation detected
> [    0.744213] resctrl: L3 monitoring detected
> [    0.744218] IPI shorthand broadcast: enabled
> [    0.745304] sched_clock: Marking stable (743394101, 1498289)->(762109820, -17217430)
> [    0.745427] registered taskstats version 1
> [    0.745497] Loading compiled-in X.509 certificates
> [    0.745972] Loaded X.509 cert 'Build time autogenerated kernel key: c011e1f473392ce75d54b5aa66314e39b5c0c1ca'
> [    0.746380] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
> [    0.746779] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
> [    0.746781] blacklist: Loading compiled-in revocation X.509 certificates
> [    0.746796] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
> [    0.746812] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
> [    0.746827] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
> [    0.746839] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
> [    0.746851] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
> [    0.746863] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
> [    0.746877] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
> [    0.746889] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
> [    0.746968] zswap: loaded using pool lzo/zbud
> [    0.748815] Key type .fscrypt registered
> [    0.748817] Key type fscrypt-provisioning registered
> [    0.751426] Key type encrypted registered
> [    0.751434] AppArmor: AppArmor sha1 policy hashing enabled
> [    0.751531] integrity: Loading X.509 certificate: UEFI:db
> [    0.751562] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
> [    0.751563] integrity: Loading X.509 certificate: UEFI:db
> [    0.751579] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
> [    0.751579] integrity: Loading X.509 certificate: UEFI:db
> [    0.751595] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
> [    0.751900] blacklist: Duplicate blacklisted hash bin:47ff1b63b140b6fc04ed79131331e651da5b2e2f170f5daef4153dc2fbc532b1
> [    0.751902] blacklist: Duplicate blacklisted hash bin:5391c3a2fb112102a6aa1edc25ae77e19f5d6f09cd09eeb2509922bfcd5992ea
> [    0.751941] blacklist: Duplicate blacklisted hash bin:80b4d96931bf0d02fd91a61e19d14f1da452e66db2408ca8604d411f92659f0a
> [    0.751969] blacklist: Duplicate blacklisted hash bin:992d359aa7a5f789d268b94c11b9485a6b1ce64362b0edb4441ccc187c39647b
> [    0.752006] blacklist: Duplicate blacklisted hash bin:c452ab846073df5ace25cca64d6b7a09d906308a1a65eb5240e3c4ebcaa9cc0c
> [    0.752031] blacklist: Duplicate blacklisted hash bin:e051b788ecbaeda53046c70e6af6058f95222c046157b8c4c1b9c2cfc65f46e5
> [    0.752266] ima: No TPM chip found, activating TPM-bypass!
> [    0.752268] Loading compiled-in module X.509 certificates
> [    0.752685] Loaded X.509 cert 'Build time autogenerated kernel key: c011e1f473392ce75d54b5aa66314e39b5c0c1ca'
> [    0.752687] ima: Allocated hash algorithm: sha1
> [    0.752695] ima: No architecture policies found
> [    0.752707] evm: Initialising EVM extended attributes:
> [    0.752708] evm: security.selinux
> [    0.752709] evm: security.SMACK64
> [    0.752710] evm: security.SMACK64EXEC
> [    0.752710] evm: security.SMACK64TRANSMUTE
> [    0.752711] evm: security.SMACK64MMAP
> [    0.752712] evm: security.apparmor
> [    0.752712] evm: security.ima
> [    0.752713] evm: security.capability
> [    0.752714] evm: HMAC attrs: 0x1
> [    0.753024] PM:   Magic number: 7:846:215
> [    0.753049] event_source software: hash matches
> [    0.753310] acpi_cpufreq: overriding BIOS provided _PSD data
> [    0.761412] RAS: Correctable Errors collector initialized.
> [    0.764031] Freeing unused decrypted memory: 2036K
> [    0.764677] Freeing unused kernel image (initmem) memory: 4700K
> [    0.765240] Write protecting the kernel read-only data: 43008k
> [    0.765377] Freeing unused kernel image (rodata/data gap) memory: 8K
> [    0.804225] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    0.804236] Run /init as init process
> [    0.804238]   with arguments:
> [    0.804240]     /init
> [    0.804241]     splash
> [    0.804242]   with environment:
> [    0.804242]     HOME=/
> [    0.804243]     TERM=linux
> [    0.804244]     BOOT_IMAGE=/@/boot/vmlinuz-6.3.2-060302-generic
> [    1.026826] hid: raw HID events driver (C) Jiri Kosina
> [    1.083546] xhci_hcd 0000:03:00.3: xHCI Host Controller
> [    1.083556] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 1
> [    1.083932] xhci_hcd 0000:03:00.3: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000410
> [    1.084272] xhci_hcd 0000:03:00.3: xHCI Host Controller
> [    1.084276] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 2
> [    1.084279] xhci_hcd 0000:03:00.3: Host supports USB 3.1 Enhanced SuperSpeed
> [    1.084318] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.03
> [    1.084320] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.084322] usb usb1: Product: xHCI Host Controller
> [    1.084323] usb usb1: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.084325] usb usb1: SerialNumber: 0000:03:00.3
> [    1.084432] hub 1-0:1.0: USB hub found
> [    1.084448] hub 1-0:1.0: 2 ports detected
> [    1.085031] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.085052] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.03
> [    1.085054] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.085056] usb usb2: Product: xHCI Host Controller
> [    1.085057] usb usb2: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.085058] usb usb2: SerialNumber: 0000:03:00.3
> [    1.086049] hub 2-0:1.0: USB hub found
> [    1.086424] hub 2-0:1.0: 1 port detected
> [    1.087406] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
> [    1.087412] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
> [    1.088767] xhci_hcd 0000:03:00.4: xHCI Host Controller
> [    1.088775] xhci_hcd 0000:03:00.4: new USB bus registered, assigned bus number 3
> [    1.089147] xhci_hcd 0000:03:00.4: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000410
> [    1.090641] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
> [    1.093961] xhci_hcd 0000:03:00.4: xHCI Host Controller
> [    1.093970] xhci_hcd 0000:03:00.4: new USB bus registered, assigned bus number 4
> [    1.093974] xhci_hcd 0000:03:00.4: Host supports USB 3.1 Enhanced SuperSpeed
> [    1.094012] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.03
> [    1.094014] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.094016] usb usb3: Product: xHCI Host Controller
> [    1.094017] usb usb3: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.094018] usb usb3: SerialNumber: 0000:03:00.4
> [    1.094617] hub 3-0:1.0: USB hub found
> [    1.094636] hub 3-0:1.0: 3 ports detected
> [    1.096952] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.096977] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.03
> [    1.096979] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.096981] usb usb4: Product: xHCI Host Controller
> [    1.096982] usb usb4: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.096983] usb usb4: SerialNumber: 0000:03:00.4
> [    1.097081] hub 4-0:1.0: USB hub found
> [    1.097096] hub 4-0:1.0: 2 ports detected
> [    1.098016] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.098023] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 5
> [    1.099715] xhci_hcd 0000:04:00.0: USB3 root hub has no ports
> [    1.099720] xhci_hcd 0000:04:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0000000200000410
> [    1.100244] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.100249] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 6
> [    1.100253] xhci_hcd 0000:04:00.0: Host supports USB 3.0 SuperSpeed
> [    1.100593] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.03
> [    1.100597] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.100598] usb usb5: Product: xHCI Host Controller
> [    1.100600] usb usb5: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.100601] usb usb5: SerialNumber: 0000:04:00.0
> [    1.100758] hub 5-0:1.0: USB hub found
> [    1.101561] hub 5-0:1.0: 1 port detected
> [    1.101781] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.101810] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.03
> [    1.101812] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.101814] usb usb6: Product: xHCI Host Controller
> [    1.101815] usb usb6: Manufacturer: Linux 6.3.2-060302-generic xhci-hcd
> [    1.101816] usb usb6: SerialNumber: 0000:04:00.0
> [    1.101955] hub 6-0:1.0: USB hub found
> [    1.101959] hub 6-0:1.0: config failed, hub doesn't have any ports! (err -19)
> [    1.123807] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
> [    1.124040] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0e/LNXVIDEO:00/input/input3
> [    1.136737] nvme 0000:01:00.0: platform quirk: setting simple suspend
> [    1.136849] nvme nvme0: pci function 0000:01:00.0
> [    1.177965] input: ELAN07B9:00 04F3:3276 Mouse as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input4
> [    1.178040] input: ELAN07B9:00 04F3:3276 Touchpad as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input6
> [    1.178084] hid-generic 0018:04F3:3276.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07B9:00 04F3:3276] on i2c-ELAN07B9:00
> [    1.196568] nvme nvme0: allocated 64 MiB host memory buffer.
> [    1.216789] nvme nvme0: 2/0/0 default/read/poll queues
> [    1.218922]  nvme0n1: p1 p2 p3
> [    1.328512] usb 1-2: new full-speed USB device number 2 using xhci_hcd
> [    1.337499] raid6: avx2x4   gen() 33134 MB/s
> [    1.344529] usb 5-1: new high-speed USB device number 2 using xhci_hcd
> [    1.354499] raid6: avx2x2   gen() 33956 MB/s
> [    1.371499] raid6: avx2x1   gen() 24874 MB/s
> [    1.371501] raid6: using algorithm avx2x2 gen() 33956 MB/s
> [    1.382535] tsc: Refined TSC clocksource calibration: 2395.489 MHz
> [    1.382543] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2287921946e, max_idle_ns: 440795305334 ns
> [    1.388500] raid6: .... xor() 20363 MB/s, rmw enabled
> [    1.388502] raid6: using avx2x2 recovery algorithm
> [    1.388516] clocksource: Switched to clocksource tsc
> [    1.389721] xor: automatically using best checksumming function   avx       
> [    1.484854] Btrfs loaded, crc32c=crc32c-intel, zoned=yes, fsverity=yes
> [    1.503917] BTRFS: device fsid 37b2f75c-c227-423d-a77d-861356b0370d devid 1 transid 492555 /dev/nvme0n1p3 scanned by btrfs (198)
> [    1.505275] usb 1-2: New USB device found, idVendor=0bda, idProduct=b85c, bcdDevice= 0.00
> [    1.505282] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    1.505283] usb 1-2: Product: Bluetooth Radio
> [    1.505285] usb 1-2: Manufacturer: Realtek
> [    1.505286] usb 1-2: SerialNumber: 00e04c000001
> [    1.523481] usb 5-1: New USB device found, idVendor=30c9, idProduct=009f, bcdDevice= 0.05
> [    1.523488] usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    1.523490] usb 5-1: Product: HP True Vision FHD Camera
> [    1.523491] usb 5-1: Manufacturer: DQWTK0ABIHSGM5
> [    1.523493] usb 5-1: SerialNumber: 01.00.00
> [    1.533774] BTRFS info (device nvme0n1p3): using crc32c (crc32c-intel) checksum algorithm
> [    1.533787] BTRFS info (device nvme0n1p3): using free space tree
> [    1.584475] BTRFS info (device nvme0n1p3): enabling ssd optimizations
> [    1.584482] BTRFS info (device nvme0n1p3): auto enabling async discard
> [    1.701193] systemd[1]: Inserted module 'autofs4'
> [    1.723457] systemd[1]: systemd 249.11-0ubuntu3.9 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
> [    1.723556] systemd[1]: Detected architecture x86-64.
> [    1.723761] systemd[1]: Hostname set to <REDACTED>.
> [    1.734351] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=1 'systemd'
> [    1.770331] block nvme0n1: the capability attribute has been deprecated.
> [    1.837416] systemd[1]: /lib/systemd/system/clamav-freshclam.service:11: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
> [    1.861893] systemd[1]: Queued start job for default target Graphical Interface.
> [    1.868256] systemd[1]: Created slice Slice /system/modprobe.
> [    1.868661] systemd[1]: Created slice Slice /system/systemd-fsck.
> [    1.868831] systemd[1]: Created slice User and Session Slice.
> [    1.868912] systemd[1]: Started ntp-systemd-netif.path.
> [    1.868985] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> [    1.869196] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
> [    1.869326] systemd[1]: Reached target User and Group Name Lookups.
> [    1.869370] systemd[1]: Reached target Remote File Systems.
> [    1.869408] systemd[1]: Reached target Slice Units.
> [    1.869451] systemd[1]: Reached target Mounting snaps.
> [    1.869519] systemd[1]: Reached target System Time Set.
> [    1.869587] systemd[1]: Reached target Local Verity Protected Volumes.
> [    1.870762] systemd[1]: Listening on Syslog Socket.
> [    1.871298] systemd[1]: Listening on fsck to fsckd communication Socket.
> [    1.871395] systemd[1]: Listening on initctl Compatibility Named Pipe.
> [    1.871599] systemd[1]: Listening on Journal Audit Socket.
> [    1.871702] systemd[1]: Listening on Journal Socket (/dev/log).
> [    1.871822] systemd[1]: Listening on Journal Socket.
> [    1.872357] systemd[1]: Listening on udev Control Socket.
> [    1.872599] systemd[1]: Listening on udev Kernel Socket.
> [    1.873591] systemd[1]: Mounting Huge Pages File System...
> [    1.874404] systemd[1]: Mounting POSIX Message Queue File System...
> [    1.875441] systemd[1]: Mounting Kernel Debug File System...
> [    1.876342] systemd[1]: Mounting Kernel Trace File System...
> [    1.882057] systemd[1]: Starting Journal Service...
> [    1.883107] systemd[1]: Starting Set the console keyboard layout...
> [    1.884156] systemd[1]: Starting Create List of Static Device Nodes...
> [    1.885135] systemd[1]: Starting Load Kernel Module chromeos_pstore...
> [    1.886161] systemd[1]: Starting Load Kernel Module configfs...
> [    1.887148] systemd[1]: Starting Load Kernel Module drm...
> [    1.889789] systemd[1]: Starting Load Kernel Module efi_pstore...
> [    1.892902] systemd[1]: Starting Load Kernel Module fuse...
> [    1.899418] systemd[1]: Starting Load Kernel Module pstore_blk...
> [    1.901420] pstore: Using crash dump compression: deflate
> [    1.910277] pstore: Registered efi_pstore as persistent store backend
> [    1.912311] systemd[1]: Starting Load Kernel Module pstore_zone...
> [    1.918634] systemd[1]: Starting Load Kernel Module ramoops...
> [    1.918801] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
> [    1.935523] systemd[1]: Starting Load Kernel Modules...
> [    1.938632] systemd[1]: Starting Remount Root and Kernel File Systems...
> [    1.940122] systemd[1]: Starting Coldplug All udev Devices...
> [    1.952366] systemd[1]: Mounted Huge Pages File System.
> [    1.952534] systemd[1]: Mounted POSIX Message Queue File System.
> [    1.952622] systemd[1]: Mounted Kernel Debug File System.
> [    1.952680] systemd[1]: Mounted Kernel Trace File System.
> [    1.953189] ACPI: bus type drm_connector registered
> [    1.956544] systemd[1]: Finished Create List of Static Device Nodes.
> [    1.956901] systemd[1]: modprobe@chromeos_pstore.service: Deactivated successfully.
> [    1.957085] systemd[1]: Finished Load Kernel Module chromeos_pstore.
> [    1.957277] systemd[1]: modprobe@configfs.service: Deactivated successfully.
> [    1.957446] systemd[1]: Finished Load Kernel Module configfs.
> [    1.957639] systemd[1]: modprobe@drm.service: Deactivated successfully.
> [    1.957815] systemd[1]: Finished Load Kernel Module drm.
> [    1.958004] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
> [    1.958168] systemd[1]: Finished Load Kernel Module efi_pstore.
> [    1.958334] systemd[1]: modprobe@fuse.service: Deactivated successfully.
> [    1.958493] systemd[1]: Finished Load Kernel Module fuse.
> [    1.958687] systemd[1]: modprobe@pstore_blk.service: Deactivated successfully.
> [    1.960337] lp: driver loaded but no devices found
> [    1.960601] systemd[1]: Finished Load Kernel Module pstore_blk.
> [    1.960974] systemd[1]: modprobe@pstore_zone.service: Deactivated successfully.
> [    1.962189] systemd[1]: Finished Load Kernel Module pstore_zone.
> [    1.964947] systemd[1]: modprobe@ramoops.service: Deactivated successfully.
> [    1.965151] systemd[1]: Finished Load Kernel Module ramoops.
> [    1.965452] systemd[1]: Finished Remount Root and Kernel File Systems.
> [    1.971681] systemd[1]: Mounting FUSE Control File System...
> [    1.972432] systemd[1]: Mounting Kernel Configuration File System...
> [    1.972527] systemd[1]: Condition check resulted in Platform Persistent Storage Archival being skipped.
> [    1.973455] systemd[1]: Starting Load/Save Random Seed...
> [    1.974867] ppdev: user-space parallel port driver
> [    1.978331] systemd[1]: Starting Create System Users...
> [    1.993846] systemd[1]: Started Journal Service.
> [    2.008627] systemd-journald[295]: Received client request to flush runtime journal.
> [    2.080587] loop0: detected capacity change from 0 to 129672
> [    2.080626] loop1: detected capacity change from 0 to 495632
> [    2.081453] loop2: detected capacity change from 0 to 8
> [    2.081654] loop3: detected capacity change from 0 to 112704
> [    2.082128] loop4: detected capacity change from 0 to 129712
> [    2.083456] loop5: detected capacity change from 0 to 307680
> [    2.086025] loop6: detected capacity change from 0 to 187776
> [    2.088006] loop7: detected capacity change from 0 to 716168
> [    2.091283] loop8: detected capacity change from 0 to 716160
> [    2.091286] loop9: detected capacity change from 0 to 305160
> [    2.094155] loop10: detected capacity change from 0 to 109032
> [    2.097172] loop11: detected capacity change from 0 to 109032
> [    2.099633] loop12: detected capacity change from 0 to 495664
> [    2.368973] acpi-tad ACPI000E:00: Missing _PRW
> [    2.377963] input: Wireless hotkeys as /devices/virtual/input/input7
> [    2.478134] ccp 0000:03:00.2: enabling device (0000 -> 0002)
> [    2.488907] ccp 0000:03:00.2: tee enabled
> [    2.488914] ccp 0000:03:00.2: psp enabled
> [    2.570422] Adding 12000252k swap on /dev/nvme0n1p2.  Priority:-2 extents:1 across:12000252k SSFS
> [    2.604894] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [    2.605110] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    2.722775] input: ELAN07B9:00 04F3:3276 Mouse as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input8
> [    2.760276] mc: Linux media interface: v0.10
> [    2.789419] videodev: Linux video capture interface: v2.00
> [    2.790167] Bluetooth: Core ver 2.22
> [    2.790190] NET: Registered PF_BLUETOOTH protocol family
> [    2.790191] Bluetooth: HCI device and connection manager initialized
> [    2.790196] Bluetooth: HCI socket layer initialized
> [    2.790198] Bluetooth: L2CAP socket layer initialized
> [    2.790202] Bluetooth: SCO socket layer initialized
> [    2.796153] audit: type=1400 audit(1684044740.879:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=461 comm="apparmor_parser"
> [    2.803780] input: ELAN07B9:00 04F3:3276 Touchpad as /devices/platform/AMDI0010:03/i2c-1/i2c-ELAN07B9:00/0018:04F3:3276.0001/input/input10
> [    2.803874] hid-multitouch 0018:04F3:3276.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07B9:00 04F3:3276] on i2c-ELAN07B9:00
> [    2.806546] audit: type=1400 audit(1684044740.890:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=460 comm="apparmor_parser"
> [    2.806556] audit: type=1400 audit(1684044740.890:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=460 comm="apparmor_parser"
> [    2.811362] audit: type=1400 audit(1684044740.894:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=462 comm="apparmor_parser"
> [    2.811370] audit: type=1400 audit(1684044740.894:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=462 comm="apparmor_parser"
> [    2.814958] audit: type=1400 audit(1684044740.898:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=463 comm="apparmor_parser"
> [    2.814966] audit: type=1400 audit(1684044740.898:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=463 comm="apparmor_parser"
> [    2.814969] audit: type=1400 audit(1684044740.898:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=463 comm="apparmor_parser"
> [    2.814971] audit: type=1400 audit(1684044740.898:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/{,usr/}sbin/dhclient" pid=463 comm="apparmor_parser"
> [    2.842930] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    2.857472] AMD-Vi: AMD IOMMUv2 loaded and initialized
> [    2.890039] usb 5-1: Found UVC 1.50 device HP True Vision FHD Camera (30c9:009f)
> [    2.896126] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
> [    2.896132] RAPL PMU: hw unit of domain package 2^-16 Joules
> [    2.918678] cryptd: max_cpu_qlen set to 1000
> [    2.919516] rtw89_8852be 0000:02:00.0: enabling device (0000 -> 0003)
> [    2.940220] usbcore: registered new interface driver uvcvideo
> [    2.954635] rtw89_8852be 0000:02:00.0: Firmware version 0.27.32.1, cmd version 0, type 1
> [    2.954643] rtw89_8852be 0000:02:00.0: Firmware version 0.27.32.1, cmd version 0, type 3
> [    2.955037] AVX2 version of gcm_enc/dec engaged.
> [    2.955059] AES CTR mode by8 optimization enabled
> [    3.000792] input: HP WMI hotkeys as /devices/virtual/input/input11
> [    3.003066] usbcore: registered new interface driver btusb
> [    3.052544] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    3.127654] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    3.127737] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    3.135879] Bluetooth: hci0: RTL: examining hci_ver=0b hci_rev=000b lmp_ver=0b lmp_subver=8852
> [    3.137472] Bluetooth: hci0: RTL: rom_version status=0 version=1
> [    3.137487] Bluetooth: hci0: RTL: loading rtl_bt/rtl8852bu_fw.bin
> [    3.138293] Bluetooth: hci0: RTL: loading rtl_bt/rtl8852bu_config.bin
> [    3.138360] Bluetooth: hci0: RTL: cfg_sz 6, total sz 38955
> [    3.209918] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    3.765822] rtw89_8852be 0000:02:00.0: chip rfe_type is 1
> [    3.969340] Bluetooth: hci0: RTL: fw version 0xdfb791cb
> [    4.143336] Bluetooth: hci0: Failed to read codec capabilities (-22)
> [    4.164332] Bluetooth: hci0: AOSP extensions version v0.96
> [    4.164342] Bluetooth: hci0: AOSP quality report is not supported
> [    5.482071] snd_hda_intel 0000:03:00.6: azx_get_response timeout, switching to polling mode: last cmd=0x800f0005
> [    5.484009] kvm_amd: TSC scaling supported
> [    5.484011] kvm_amd: Nested Virtualization enabled
> [    5.484012] kvm_amd: Nested Paging enabled
> [    5.484014] kvm_amd: SEV supported: 14 ASIDs
> [    5.484016] kvm_amd: Virtual VMLOAD VMSAVE supported
> [    5.484017] kvm_amd: Virtual GIF supported
> [    5.484018] kvm_amd: LBR virtualization supported
> [    5.526178] rtw89_8852be 0000:02:00.0 wlp2s0: renamed from wlan0
> [    5.531100] MCE: In-kernel MCE decoding enabled.
> [    5.573144] intel_rapl_common: Found RAPL domain package
> [    5.573150] intel_rapl_common: Found RAPL domain core
> [    5.603762] [drm] amdgpu kernel modesetting enabled.
> [    5.607213] amdgpu: Virtual CRAT table created for CPU
> [    5.607226] amdgpu: Topology: Add CPU node
> [    5.607367] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
> [    5.607438] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x1506 0x103C:0x8B2F 0xC4).
> [    5.669822] [drm] register mmio base: 0xFCC00000
> [    5.669827] [drm] register mmio size: 524288
> [    5.678093] [drm] add ip block number 0 <nv_common>
> [    5.678098] [drm] add ip block number 1 <gmc_v10_0>
> [    5.678100] [drm] add ip block number 2 <navi10_ih>
> [    5.678101] [drm] add ip block number 3 <psp>
> [    5.678102] [drm] add ip block number 4 <smu>
> [    5.678103] [drm] add ip block number 5 <dm>
> [    5.678105] [drm] add ip block number 6 <gfx_v10_0>
> [    5.678106] [drm] add ip block number 7 <sdma_v5_2>
> [    5.678107] [drm] add ip block number 8 <vcn_v3_0>
> [    5.678108] [drm] add ip block number 9 <jpeg_v3_0>
> [    5.678129] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
> [    5.678134] amdgpu: ATOM BIOS: 102-MENDOCINO-006
> [    5.693534] [drm] VCN(0) decode is enabled in VM mode
> [    5.693541] [drm] VCN(0) encode is enabled in VM mode
> [    5.696221] [drm] JPEG decode is enabled in VM mode
> [    5.697324] Console: switching to colour dummy device 80x25
> [    5.701539] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
> [    5.701548] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
> [    5.701552] amdgpu 0000:03:00.0: amdgpu: PCIE atomic ops is not supported
> [    5.701610] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [    5.701616] amdgpu 0000:03:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
> [    5.701619] amdgpu 0000:03:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
> [    5.701621] amdgpu 0000:03:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
> [    5.701626] [drm] Detected VRAM RAM=512M, BAR=512M
> [    5.701628] [drm] RAM width 128bits LPDDR5
> [    5.713160] [drm] amdgpu: 512M of VRAM memory ready
> [    5.713169] [drm] amdgpu: 3579M of GTT memory ready.
> [    5.713185] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [    5.713608] [drm] PCIE GART of 1024M enabled (table at 0x000000F41FC00000).
> [    5.713885] [drm] Loading DMUB firmware via PSP: version=0x06000800
> [    5.715871] [drm] use_doorbell being set to: [true]
> [    5.715931] [drm] Found VCN firmware Version ENC: 1.21 DEC: 2 VEP: 0 Revision: 10
> [    5.715941] amdgpu 0000:03:00.0: amdgpu: Will use PSP to load VCN firmware
> [    5.766134] [drm] reserve 0xa00000 from 0xf41e000000 for PSP TMR
> [    5.889919] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    5.889925] Bluetooth: BNEP filters: protocol multicast
> [    5.889930] Bluetooth: BNEP socket layer initialized
> [    5.891011] Bluetooth: MGMT ver 1.22
> [    5.904607] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
> [    5.913929] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is not available
> [    5.913936] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
> [    5.914886] NET: Registered PF_ALG protocol family
> [    5.915420] amdgpu 0000:03:00.0: amdgpu: SMU is initialized successfully!
> [    5.915820] [drm] Display Core initialized with v3.2.223!
> [    5.915825] [drm] DP-HDMI FRL PCON supported
> [    5.918203] [drm] DMUB hardware initialized: version=0x06000800
> [    6.063166] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.209432] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> [    6.228402] kauditd_printk_skb: 59 callbacks suppressed
> [    6.228406] audit: type=1400 audit(1684044744.311:70): apparmor="DENIED" operation="open" class="file" profile="/usr/sbin/ntpd" name="/snap/bin/" pid=758 comm="ntpd" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> [    6.242364] audit: type=1400 audit(1684044744.324:71): apparmor="DENIED" operation="open" class="file" profile="/usr/sbin/ntpd" name="/etc/ssl/openssl.cnf" pid=791 comm="ntpd" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> [    6.375295] Bluetooth: hci0: Failed to read codec capabilities (-22)
> [    6.396325] Bluetooth: hci0: AOSP extensions version v0.96
> [    6.396333] Bluetooth: hci0: AOSP quality report is not supported
> [    6.437837] [drm] Alt mode has timed out after 211 ms
> [    6.482536] snd_hda_intel 0000:03:00.6: No response from codec, disabling MSI: last cmd=0x800f0005
> [    6.513810] [drm] kiq ring mec 2 pipe 1 q 0
> [    6.517361] [drm] VCN decode and encode initialized successfully(under DPG Mode).
> [    6.517391] [drm] JPEG decode initialized successfully.
> [    6.639688] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [    6.639740] amdgpu: sdma_bitmap: 3
> [    6.644746] memmap_init_zone_device initialised 131072 pages in 1ms
> [    6.644758] amdgpu: HMM registered 512MB device memory
> [    6.644856] amdgpu: SRAT table not found
> [    6.644857] amdgpu: Virtual CRAT table created for GPU
> [    6.644969] amdgpu: Topology: Add dGPU node [0x1506:0x1002]
> [    6.644972] kfd kfd: amdgpu: added device 1002:1506
> [    6.644988] amdgpu 0000:03:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 2, active_cu_number 2
> [    6.645319] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> [    6.645321] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
> [    6.645323] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
> [    6.645324] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
> [    6.645325] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
> [    6.645326] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
> [    6.645327] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
> [    6.645328] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
> [    6.645330] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
> [    6.645331] amdgpu 0000:03:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
> [    6.645332] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
> [    6.645333] amdgpu 0000:03:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 1
> [    6.645335] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on hub 1
> [    6.645336] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on hub 1
> [    6.645337] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 1
> [    6.694749] audit: type=1400 audit(1684044744.723:72): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=752 comm="cupsd" capability=12  capname="net_admin"
> [    6.698800] [drm] Initialized amdgpu 3.52.0 20150101 for 0000:03:00.0 on minor 0
> [    6.721983] fbcon: amdgpudrmfb (fb0) is primary device
> [    6.723537] [drm] DSC precompute is not needed.
> [    6.795884] Console: switching to colour frame buffer device 240x67
> [    6.813986] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    7.485529] snd_hda_intel 0000:03:00.6: azx_get_response timeout, switching to single_cmd mode: last cmd=0x800f0005
> [    7.934562] loop13: detected capacity change from 0 to 8
> [   11.228665] azx_single_wait_for_response: 16226 callbacks suppressed
> [   11.447753] wlp2s0: authenticate with REDACTED
> [   11.642810] wlp2s0: send auth to REDACTED (try 1/3)
> [   11.646120] wlp2s0: authenticated
> [   11.647514] wlp2s0: associate with REDACTED (try 1/3)
> [   11.651471] wlp2s0: RX AssocResp from REDACTED (capab=0x511 status=0 aid=1)
> [   11.759108] wlp2s0: associated
> [   11.759171] wlp2s0: Limiting TX power to 24 (24 - 0) dBm as advertised by REDACTED
> [   11.791696] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
> [   13.550500] hdaudio hdaudioC1D0: no AFG or MFG node found
> [   13.550516] snd_hda_intel 0000:03:00.6: no codecs initialized
> [   14.325842] Bluetooth: RFCOMM TTY layer initialized
> [   14.325854] Bluetooth: RFCOMM socket layer initialized
> [   14.325860] Bluetooth: RFCOMM ver 1.11
> [   16.290500] kauditd_printk_skb: 10388 callbacks suppressed
> [   16.290517] audit: type=1326 audit(1684044754.373:76): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=snap.cups.cupsd pid=1341 comm="cups-proxyd" exe="/snap/cups/872/sbin/cups-proxyd" sig=0 arch=c000003e syscall=314 compat=0 ip=0x7f89d40d173d code=0x50000
> [   17.352347] cups-proxyd[1341]: segfault at 18 ip 0000556c040e3d6e sp 00007ffeb4224200 error 4 in cups-proxyd[556c040e0000+7000] likely on CPU 1 (core 1, socket 0)
> [   17.352362] Code: 00 00 00 41 54 55 48 89 fd 53 0f 85 ed 00 00 00 48 8d 1d 5f 42 00 00 48 63 45 1c 48 8d 3d 69 3d 00 00 48 c1 e0 05 48 03 45 08 <48> 8b 50 18 8b 70 14 e8 06 d0 ff ff 44 8b 65 18 48 89 c7 45 85 e4
