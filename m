Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6672852AF1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 09:23:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D4BA4D;
	Tue, 13 Feb 2024 09:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D4BA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707812622;
	bh=XAMhbmUcATFfnTda4dRLNPSx+g8AnUQd/2dP9pSQ/HE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tPxPFWKvoOT2l3mdceC/lAR8KuEDHBZilG/86ouDvueXQS6GBLXmRkNP6kxvCqNWY
	 vhwrpIPW7jFlkcYMOyZP8K64itIRSiZvK9YqzX+0nphW6AjKQ/e9f2A9Gp47GVToH/
	 LVT+n0cmiqg5bXQI9VcS70wtbZt9s9fN8Hs/NlXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B797F8057B; Tue, 13 Feb 2024 09:23:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F067F805A0;
	Tue, 13 Feb 2024 09:23:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98B4F80238; Tue, 13 Feb 2024 09:18:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 88BF3F8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 09:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88BF3F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vrHxeXBk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1MEjBjis;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vrHxeXBk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1MEjBjis
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 624D021E66;
	Tue, 13 Feb 2024 08:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707812260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWMvHya5wJ1bDu3if4pLgg6tvU1oRaiQcDu2+hRwqeg=;
	b=vrHxeXBkXXnaHCtItHIVDDob97ERKqOPMuSBuPfks146Fnj4DWLzb/YeETJ35O4PAWu11c
	+CdSNxoAUOtlWQ9aZzQ52CCf6KNJdRDZXq+A72VIfC8bAH6vn4gnDwGEJyZ54kp1mNDg/D
	B92nf3cRzeLexstmglSR7SXkVX0Cx+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707812260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWMvHya5wJ1bDu3if4pLgg6tvU1oRaiQcDu2+hRwqeg=;
	b=1MEjBjisuWSdnR9xwFNpj6ZBsKxvdvXGBaygo+Hts8q3G639MJACq+rOD5msW6MjFl24vC
	m0MF+pn8ueoyKADA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707812260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWMvHya5wJ1bDu3if4pLgg6tvU1oRaiQcDu2+hRwqeg=;
	b=vrHxeXBkXXnaHCtItHIVDDob97ERKqOPMuSBuPfks146Fnj4DWLzb/YeETJ35O4PAWu11c
	+CdSNxoAUOtlWQ9aZzQ52CCf6KNJdRDZXq+A72VIfC8bAH6vn4gnDwGEJyZ54kp1mNDg/D
	B92nf3cRzeLexstmglSR7SXkVX0Cx+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707812260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWMvHya5wJ1bDu3if4pLgg6tvU1oRaiQcDu2+hRwqeg=;
	b=1MEjBjisuWSdnR9xwFNpj6ZBsKxvdvXGBaygo+Hts8q3G639MJACq+rOD5msW6MjFl24vC
	m0MF+pn8ueoyKADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B7571370C;
	Tue, 13 Feb 2024 08:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id veccAaQly2VrRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 08:17:40 +0000
Date: Tue, 13 Feb 2024 09:17:39 +0100
Message-ID: <87bk8kkcbg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ted Chang <tedchang2010@gmail.com>,
    stable@vger.kernel.org,
	regressions@lists.linux.dev,
	venkataprasad.potturu@amd.com,
	"perex@perex.cz" <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	linux@leemhuis.info,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] Acp5x probing regression introduced between kernel
 6.7.2 -> 6.7.4
In-Reply-To: 
 <CAD_nV8B=KSyOrASsbth=RmDV9ZUCipxhdJY3jY02C2jQ6Y34iA@mail.gmail.com>
References: 
 <CAD_nV8BG0t7US=+C28kQOR==712MPfZ9m-fuKksgoZCgrEByCw@mail.gmail.com>
	<CAD_nV8B=KSyOrASsbth=RmDV9ZUCipxhdJY3jY02C2jQ6Y34iA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,amd.com,perex.cz,alsa-project.org,kernel.org,leemhuis.info];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: 6UCGMWW5SLRJQULQHDK4PTA7PJZHLHEY
X-Message-ID-Hash: 6UCGMWW5SLRJQULQHDK4PTA7PJZHLHEY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UCGMWW5SLRJQULQHDK4PTA7PJZHLHEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Feb 2024 15:32:45 +0100,
Ted Chang wrote:
> 
> 
> Hi everyone,
> Takashi Iwai suggested that I test OBS home:tiwai:bsc1219789 repo. His comment
> suggest he reverted commit
> c3ab23a10771bbe06300e5374efa809789c65455 ASoC: amd: Add new dmi entries for
> acp5x platform. My audio seems to work again
> 
> [    7.420289] acpi_cpufreq: overriding BIOS provided _PSD data
> [    7.439331] snd_pci_acp5x 0000:04:00.5: enabling device (0000 -> 0002)
> [    7.574796] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
> [    7.574980] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio client
> [    7.577788] kvm_amd: TSC scaling supported
> [    7.577794] kvm_amd: Nested Virtualization enabled
> [    7.577796] kvm_amd: Nested Paging enabled
> [    7.577799] kvm_amd: SEV enabled (ASIDs 1 - 14)
> [    7.577802] kvm_amd: SEV-ES disabled (ASIDs 0 - 0)
> [    7.577824] kvm_amd: Virtual VMLOAD VMSAVE supported
> [    7.577825] kvm_amd: Virtual GIF supported
> [    7.577827] kvm_amd: LBR virtualization supported
> [    7.589223] MCE: In-kernel MCE decoding enabled.
> [    7.590386] snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    7.591577] cs35l41 spi-VLV1776:00: supply VA not found, using dummy regulator
> [    7.591644] cs35l41 spi-VLV1776:00: supply VP not found, using dummy regulator
> [    7.595880] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input17
> [    7.596790] input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input18
> 
> https://build.opensuse.org/project/show/home:tiwai:bsc1219789
> 
> Now I'm building a test kernel with the revert of the suspected backport patch.
> It's being built in OBS home:tiwai:bsc1219789 repo.  Please give it a try later once after the build finishes (takes an hour or so).
> 
> So the culprit was the stable commit 4b6986b170f2f23e390bbd2d50784caa9cb67093, which is the upstream commit c3ab23a10771bbe06300e5374efa809789c65455
>     ASoC: amd: Add new dmi entries for acp5x platform

Greg, could you revert the commit
4b6986b170f2f23e390bbd2d50784caa9cb67093 on 6.7.y?

Apparently it caused the regression on Steam Deck, the driver probe
failed with that backport alone.


thanks,

Takashi

> 
> On the other note, I am not the recipient of your reply email Ciao, Thorsten. I had to grab the emails from the MAINTAINER list.
> 
> On Sun, Feb 11, 2024 at 6:34 AM Ted Chang <tedchang2010@gmail.com> wrote:
> 
>     Hi kernel maintainers,
>    
>     I noticed 6.7.4  has introduced a regression for the steam deck. The LCD
>     steam deck can no longer probe the acp5x audio chipset anymore. This
>     regression does not affect the 6.8.x series.  I did not test kernel 6.7.3
>     because Opensuse tumbleweed skipped the update on my machine.
>    
>     Steps to reproduce the problem
>     1. Obtain a steam deck
>     2. Install kernel 6.7.4
>     3. Boot the device and you will see dummy output in gnome shell
>    
>     Observed kernel logs.
>    
>     [    8.755614] cs35l41 spi-VLV1776:00: supply VA not found, using dummy regulator
>     [    8.760506] cs35l41 spi-VLV1776:00: supply VP not found, using dummy regulator
>     [    8.777148] cs35l41 spi-VLV1776:00: Cirrus Logic CS35L41 (35a40), Revision: B2
>     [    8.777471] cs35l41 spi-VLV1776:01: supply VA not found, using dummy regulator
>     [    8.777532] cs35l41 spi-VLV1776:01: supply VP not found, using dummy regulator
>     [    8.777709] cs35l41 spi-VLV1776:01: Reset line busy, assuming shared reset
>     [    8.788465] cs35l41 spi-VLV1776:01: Cirrus Logic CS35L41 (35a40), Revision: B2
>     [    8.877280] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
>     [    8.877595] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio client
>     [    8.889913] snd_acp_pci 0000:04:00.5: enabling device (0000 -> 0002)
>     [    8.890063] snd_acp_pci 0000:04:00.5: Unsupported device revision:0x50
>     [    8.890129] snd_acp_pci: probe of 0000:04:00.5 failed with error -22
>     [    8.906136] snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu]
> 
>     No kernel module in use shown.
>    
>     04:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD]
>     ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 50)
>     Subsystem: Valve Software Device [1e44:1776]
>     Flags: fast devsel, IRQ 70, IOMMU group 4
>     Memory at 80380000 (32-bit, non-prefetchable) [size=256K]
>     Capabilities: <access denied>
>     Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x,
>     snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, snd_pci_ps,
>     snd_sof_amd_renoir, snd_sof_amd_rembrandt, snd_sof_amd_vangogh,
>     snd_sof_amd_acp63
> 
>     Information for package kernel-default:
>     ---------------------------------------
>     Repository     : openSUSE-Tumbleweed-Oss
>     Name           : kernel-default
>     Version        : 6.7.4-1.1
>     Arch           : x86_64
>     Vendor         : openSUSE
>     Installed Size : 240.3 MiB
>     Installed      : Yes
>     Status         : up-to-date
>     Source package : kernel-default-6.7.4-1.1.nosrc
>     Upstream URL   : https://www.kernel.org/
>     Summary        : The Standard Kernel
>     Description    : 
>         The standard kernel for both uniprocessor and multiprocessor systems.
> 
>         Source Timestamp: 2024-02-06 05:32:37 +0000
>         GIT Revision: 01735a3e65287585dd830a6a3d33d909a4f9ae7f
>         GIT Branch: stable
>     
>     Handle 0x0000, DMI type 0, 26 bytes
>     BIOS Information
>                   Vendor: Valve
>                   Version: F7A0120
>                   Release Date: 12/01/2023
>                   Address: 0xE0000
>                   Runtime Size: 128 kB
>                   BIOS Revision: 1.20
>                   Firmware Revision: 1.16
>     
>     #regzbot introduced: v6.7.2..v6.7.4
> 
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.5.3
> !!################################
> 
> !!Script ran on: Mon Feb 12 14:07:16 UTC 2024
> 
> 
> !!Linux Distribution
> !!------------------
> 
> Welcome to openSUSE Tumbleweed 20240209 - Kernel \r (\l). NAME="openSUSE Tumbleweed" ID="opensuse-tumbleweed" ID_LIKE="opensuse suse" PRETTY_NAME="openSUSE Tumbleweed" CPE_NAME="cpe:2.3:o:opensuse:tumbleweed:20240209:*:*:*:*:*:*:*" #CPE_NAME="cpe:/o:opensuse:tumbleweed:20240209" BUG_REPORT_URL="https://bugzilla.opensuse.org" SUPPORT_URL="https://bugs.opensuse.org" HOME_URL="https://www.opensuse.org" DOCUMENTATION_URL="https://en.opensuse.org/Portal:Tumbleweed"
> 
> 
> !!DMI Information
> !!---------------
> 
> Manufacturer:      Valve
> Product Name:      Jupiter
> Product Version:   1
> Firmware Version:  F7A0120
> System SKU:        
> Board Vendor:      Valve
> Board Name:        Jupiter
> 
> 
> !!ACPI Device Status Information
> !!---------------
> 
> /sys/bus/acpi/devices/AMDI0010:00/status 	 15
> /sys/bus/acpi/devices/AMDI0010:01/status 	 15
> /sys/bus/acpi/devices/AMDI0010:02/status 	 15
> /sys/bus/acpi/devices/AMDI0010:03/status 	 15
> /sys/bus/acpi/devices/AMDI0020:00/status 	 15
> /sys/bus/acpi/devices/AMDI0030:00/status 	 15
> /sys/bus/acpi/devices/AMDI0062:00/status 	 15
> /sys/bus/acpi/devices/FTS3528:00/status 	 15
> /sys/bus/acpi/devices/LNXVIDEO:01/status 	 15
> /sys/bus/acpi/devices/MSFT0101:00/status 	 15
> /sys/bus/acpi/devices/NVTN2020:00/status 	 15
> /sys/bus/acpi/devices/PNP0103:00/status 	 15
> /sys/bus/acpi/devices/PNP0C09:00/status 	 15
> /sys/bus/acpi/devices/PNP0C0A:00/status 	 31
> /sys/bus/acpi/devices/PNP0C0C:00/status 	 11
> /sys/bus/acpi/devices/PNP0C0F:00/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:01/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:02/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:03/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:04/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:05/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:06/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:07/status 	 9
> /sys/bus/acpi/devices/PRP0001:00/status 	 15
> /sys/bus/acpi/devices/PRP0001:01/status 	 15
> /sys/bus/acpi/devices/VLV0100:00/status 	 15
> /sys/bus/acpi/devices/VLV1776:00/status 	 15
> /sys/bus/acpi/devices/VLV1776:01/status 	 15
> 
> 
> !!Kernel Information
> !!------------------
> 
> Kernel release:    #1 SMP PREEMPT_DYNAMIC Mon Feb 12 09:36:35 UTC 2024 (e1978fc)
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         x86_64
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.7.4-1.ge1978fc-default
> Library version:    
> Utilities version:  1.2.11
> 
> 
> !!Loaded ALSA modules
> !!-------------------
> 
> snd_hda_intel (card 0)
> snd_soc_acp5x_mach (card 1)
> 
> 
> !!Sound Servers on this system
> !!----------------------------
> 
> PipeWire:
>       Installed - Yes (/usr/bin/pipewire)
>       Running - Yes
> 
> Jack2:
>       Installed - Yes (/usr/bin/jackdbus)
>       Running - Yes
> 
> No sound servers found.
> 
> 
> !!Soundcards recognised by ALSA
> !!-----------------------------
> 
>  0 [Generic        ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0x803c0000 irq 72
>  1 [acp5x          ]: acp5x - acp5x
>                       Valve-Jupiter-1
> 
> 
> !!PCI Soundcards installed in the system
> !!--------------------------------------
> 
> 04:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt Radeon High Definition Audio Controller [1002:1640]
> 	Subsystem: Valve Software Device [1e44:1776]
> 
> 
> !!Loaded sound module options
> !!---------------------------
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : Y
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 1
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> !!Module: snd_soc_acp5x_mach
> 	* : 
> 
> 
> !!Sysfs card info
> !!---------------
> 
> !!Card: /sys/class/sound/card0
> Driver: /sys/bus/pci/drivers/snd_hda_intel
> Tree:
> 	/sys/class/sound/card0
> 	|-- controlC0
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- device -> ../../../0000:04:00.1
> 	|-- hwC0D0
> 	|   |-- afg
> 	|   |-- chip_name
> 	|   |-- clear
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- driver_pin_configs
> 	|   |-- hints
> 	|   |-- init_pin_configs
> 	|   |-- init_verbs
> 	|   |-- mfg
> 	|   |-- modelname
> 	|   |-- power
> 	|   |-- power_off_acct
> 	|   |-- power_on_acct
> 	|   |-- reconfig
> 	|   |-- revision_id
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   |-- subsystem_id
> 	|   |-- uevent
> 	|   |-- user_pin_configs
> 	|   |-- vendor_id
> 	|   `-- vendor_name
> 	|-- id
> 	|-- input17
> 	|   |-- capabilities
> 	|   |-- device -> ../../card0
> 	|   |-- event11
> 	|   |-- id
> 	|   |-- inhibited
> 	|   |-- modalias
> 	|   |-- name
> 	|   |-- phys
> 	|   |-- power
> 	|   |-- properties
> 	|   |-- subsystem -> ../../../../../../../class/input
> 	|   |-- uevent
> 	|   `-- uniq
> 	|-- input18
> 	|   |-- capabilities
> 	|   |-- device -> ../../card0
> 	|   |-- event12
> 	|   |-- id
> 	|   |-- inhibited
> 	|   |-- modalias
> 	|   |-- name
> 	|   |-- phys
> 	|   |-- power
> 	|   |-- properties
> 	|   |-- subsystem -> ../../../../../../../class/input
> 	|   |-- uevent
> 	|   `-- uniq
> 	|-- input19
> 	|   |-- capabilities
> 	|   |-- device -> ../../card0
> 	|   |-- event13
> 	|   |-- id
> 	|   |-- inhibited
> 	|   |-- modalias
> 	|   |-- name
> 	|   |-- phys
> 	|   |-- power
> 	|   |-- properties
> 	|   |-- subsystem -> ../../../../../../../class/input
> 	|   |-- uevent
> 	|   `-- uniq
> 	|-- input20
> 	|   |-- capabilities
> 	|   |-- device -> ../../card0
> 	|   |-- event14
> 	|   |-- id
> 	|   |-- inhibited
> 	|   |-- modalias
> 	|   |-- name
> 	|   |-- phys
> 	|   |-- power
> 	|   |-- properties
> 	|   |-- subsystem -> ../../../../../../../class/input
> 	|   |-- uevent
> 	|   `-- uniq
> 	|-- number
> 	|-- pcmC0D3p
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- pcmC0D7p
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- pcmC0D8p
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- pcmC0D9p
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- power
> 	|   |-- async
> 	|   |-- autosuspend_delay_ms
> 	|   |-- control
> 	|   |-- runtime_active_kids
> 	|   |-- runtime_active_time
> 	|   |-- runtime_enabled
> 	|   |-- runtime_status
> 	|   |-- runtime_suspended_time
> 	|   `-- runtime_usage
> 	|-- subsystem -> ../../../../../../class/sound
> 	`-- uevent
> 
> !!Card: /sys/class/sound/card1
> Driver: /sys/bus/platform/drivers/acp5x_mach
> Tree:
> 	/sys/class/sound/card1
> 	|-- controlC1
> 	|   |-- dev
> 	|   |-- device -> ../../card1
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- device -> ../../../acp5x_mach.0
> 	|-- id
> 	|-- input21
> 	|   |-- capabilities
> 	|   |-- device -> ../../card1
> 	|   |-- event15
> 	|   |-- id
> 	|   |-- inhibited
> 	|   |-- modalias
> 	|   |-- name
> 	|   |-- phys
> 	|   |-- power
> 	|   |-- properties
> 	|   |-- subsystem -> ../../../../../../../../class/input
> 	|   |-- uevent
> 	|   `-- uniq
> 	|-- number
> 	|-- pcmC1D0c
> 	|   |-- dev
> 	|   |-- device -> ../../card1
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- pcmC1D0p
> 	|   |-- dev
> 	|   |-- device -> ../../card1
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- pcmC1D1p
> 	|   |-- dev
> 	|   |-- device -> ../../card1
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- power
> 	|   |-- async
> 	|   |-- autosuspend_delay_ms
> 	|   |-- control
> 	|   |-- runtime_active_kids
> 	|   |-- runtime_active_time
> 	|   |-- runtime_enabled
> 	|   |-- runtime_status
> 	|   |-- runtime_suspended_time
> 	|   `-- runtime_usage
> 	|-- subsystem -> ../../../../../../../class/sound
> 	`-- uevent
> 
> 
> !!HDA-Intel Codec information
> !!---------------------------
> --startcollapse--
> 
> Codec: ATI R6xx HDMI
> Address: 0
> AFG Function Id: 0x1 (unsol 0)
> Vendor Id: 0x1002aa01
> Subsystem Id: 0x00aa0100
> Revision Id: 0x100800
> No Modem Function Group found
> Default PCM:
>     rates [0x70]: 32000 44100 48000
>     bits [0x2]: 16
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D3 CLKSTOP EPSS
>   Power: setting=D0, actual=D0, Clock-stop-OK
> GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
> Node 0x02 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x02
> Node 0x04 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x05 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x04
> Node 0x06 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x07 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x06
> Node 0x08 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x09 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x08
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  7 Feb 12 06:02 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116, 11 Feb 12 06:02 /dev/snd/controlC1
> crw-rw----+ 1 root audio 116,  6 Feb 12 06:02 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  2 Feb 12 06:02 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  3 Feb 12 06:02 /dev/snd/pcmC0D7p
> crw-rw----+ 1 root audio 116,  4 Feb 12 06:02 /dev/snd/pcmC0D8p
> crw-rw----+ 1 root audio 116,  5 Feb 12 06:02 /dev/snd/pcmC0D9p
> crw-rw----+ 1 root audio 116,  9 Feb 12 06:02 /dev/snd/pcmC1D0c
> crw-rw----+ 1 root audio 116,  8 Feb 12 06:02 /dev/snd/pcmC1D0p
> crw-rw----+ 1 root audio 116, 10 Feb 12 06:02 /dev/snd/pcmC1D1p
> crw-rw----+ 1 root audio 116,  1 Feb 12 06:02 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Feb 12 06:02 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  80 Feb 12 06:02 .
> drwxr-xr-x 3 root root 300 Feb 12 06:02 ..
> lrwxrwxrwx 1 root root  12 Feb 12 06:02 pci-0000:04:00.1 -> ../controlC0
> lrwxrwxrwx 1 root root  12 Feb 12 06:02 pci-0000:04:00.5-platform-acp5x_mach.0 -> ../controlC1
> 
> 
> !!Aplay/Arecord output
> !!--------------------
> 
> APLAY
> 
> **** List of PLAYBACK Hardware Devices ****
> card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: Generic [HD-Audio Generic], device 7: HDMI 1 [HDMI 1]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: Generic [HD-Audio Generic], device 8: HDMI 2 [HDMI 2]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: Generic [HD-Audio Generic], device 9: HDMI 3 [HDMI 3]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: acp5x [acp5x], device 0: Playback/Capture nau8821-hifi-0 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: acp5x [acp5x], device 1: CS35L41 Stereo Playback multicodec-1 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> card 1: acp5x [acp5x], device 0: Playback/Capture nau8821-hifi-0 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> !!Amixer output
> !!-------------
> 
> !!-------Mixer controls for card Generic
> 
> Card sysdefault:0 'Generic'/'HD-Audio Generic at 0x803c0000 irq 72'
>   Mixer name	: 'ATI R6xx HDMI'
>   Components	: 'HDA:1002aa01,00aa0100,00100800'
>   Controls      : 28
>   Simple ctrls  : 4
> Simple mixer control 'IEC958',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'IEC958',1
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'IEC958',2
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'IEC958',3
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> 
> !!-------Mixer controls for card acp5x
> 
> Card sysdefault:1 'acp5x'/'Valve-Jupiter-1'
>   Mixer name	: ''
>   Components	: ''
>   Controls      : 208
>   Simple ctrls  : 78
> Simple mixer control 'Headphone',0
>   Capabilities: volume pswitch pswitch-joined
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 3
>   Front Left: 2 [67%] [-3.00dB] Playback [off]
>   Front Right: 2 [67%] [-3.00dB] Playback [off]
> Simple mixer control 'Headphone Bypass',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 15
>   Front Left: 0 [0%] [-99999.99dB]
>   Front Right: 0 [0%] [-99999.99dB]
> Simple mixer control 'Headphone Crosstalk',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 255
>   Front Left: 0 [0%] [-99999.99dB]
>   Front Right: 0 [0%] [-99999.99dB]
> Simple mixer control 'Frontend PGA',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 37
>   Front Left: 27 [73%] [26.00dB]
>   Front Right: 27 [73%] [26.00dB]
> Simple mixer control 'Mic',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 255
>   Front Left: 252 [99%] [22.94dB]
>   Front Right: 252 [99%] [22.94dB]
> Simple mixer control 'ADC DRC Attack Time',0
>   Capabilities: enum
>   Items: 'Ts' '3Ts' '7Ts' '15Ts' '31Ts' '63Ts' '127Ts' '255Ts' '511Ts' '1023Ts' '2047Ts' '4095Ts' '8191Ts'
>   Item0: '63Ts'
> Simple mixer control 'ADC DRC Decay Time',0
>   Capabilities: enum
>   Items: '63Ts' '127Ts' '255Ts' '511Ts' '1023Ts' '2047Ts' '4095Ts' '8191Ts' '16383Ts' '32757Ts' '65535Ts'
>   Item0: '8191Ts'
> Simple mixer control 'ADC DRC Expansion Slope',0
>   Capabilities: enum
>   Items: '1:1' '2:1' '4:1'
>   Item0: '4:1'
> Simple mixer control 'ADC DRC Higher Region',0
>   Capabilities: enum
>   Items: '0' '1:2' '1:4' '1:8' '1:16' '' '' '1:1'
>   Item0: '1:1'
> Simple mixer control 'ADC DRC KNEE3',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 63
>   Mono: 45 [71%] [-36.00dB]
> Simple mixer control 'ADC DRC KNEE4',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 63
>   Mono: 48 [76%] [-50.00dB]
> Simple mixer control 'ADC DRC Limiter Slope',0
>   Capabilities: enum
>   Items: '0' '1:2' '1:4' '1:8' '1:16' '1:32' '1:64' '1:1'
>   Item0: '1:1'
> Simple mixer control 'ADC DRC Lower Region',0
>   Capabilities: enum
>   Items: '0' '1:2' '1:4' '1:8' '1:16' '' '' '1:1'
>   Item0: '1:1'
> Simple mixer control 'ADC DRC Noise Gate',0
>   Capabilities: enum
>   Items: '1:1' '2:1' '4:1' '8:1'
>   Item0: '4:1'
> Simple mixer control 'ADC DRC Peak Detection Attack Time',0
>   Capabilities: enum
>   Items: 'Ts' '3Ts' '7Ts' '15Ts' '31Ts' '63Ts' '127Ts' '255Ts' '' '511Ts'
>   Item0: '15Ts'
> Simple mixer control 'ADC DRC Peak Detection Release Time',0
>   Capabilities: enum
>   Items: '63Ts' '127Ts' '255Ts' '511Ts' '1023Ts' '2047Ts' '4095Ts' '8191Ts' '' '16383Ts'
>   Item0: '1023Ts'
> Simple mixer control 'ADC Decimation Rate',0
>   Capabilities: enum
>   Items: '32' '64' '128' '256'
>   Item0: '64'
> Simple mixer control 'ADC Phase',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'Analog PCM',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 20
>   Front Left: 17 [85%] [17.50dB]
>   Front Right: 17 [85%] [17.50dB]
> Simple mixer control 'DAC Oversampling Rate',0
>   Capabilities: enum
>   Items: '64' '256' '128' '' '32'
>   Item0: '64'
> Simple mixer control 'DMIC Enable',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'DRC Enable',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Digital',0
>   Capabilities: pvolume
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 207
>   Mono:
>   Front Left: Playback 192 [93%] [30.00dB]
>   Front Right: Playback 192 [93%] [30.00dB]
> Simple mixer control 'Digital PCM',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 913
>   Front Left: 870 [95%] [6.62dB]
>   Front Right: 870 [95%] [6.62dB]
> Simple mixer control 'Headset Mic',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Int Mic',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'Left ASP TX1 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'VMON'
> Simple mixer control 'Left ASP TX2 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'IMON'
> Simple mixer control 'Left ASP TX3 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'Zero'
> Simple mixer control 'Left ASP TX4 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'Zero'
> Simple mixer control 'Left Amp Gain ZC',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Left Analog PCM',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 20
>   Mono: 17 [85%] [17.50dB]
> Simple mixer control 'Left Aux Noise Gate CH1',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Left Aux Noise Gate CH1 Entry Delay',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 15
>   Mono: 3 [20%]
> Simple mixer control 'Left Aux Noise Gate CH1 Threshold',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Left Aux Noise Gate CH2',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Left Aux Noise Gate CH2 Entry Delay',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 15
>   Mono: 3 [20%]
> Simple mixer control 'Left Aux Noise Gate CH2 Threshold',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Left DRE',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Left DSP RX1 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'ASPRX1'
> Simple mixer control 'Left DSP RX2 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'ASPRX1'
> Simple mixer control 'Left DSP1 Firmware',0
>   Capabilities: enum
>   Items: 'MBC/VSS' 'MasterHiFi' 'Tx' 'Tx Speaker' 'Rx' 'Rx ANC' 'Voice Ctrl' 'ASR Assist' 'Dbg Trace' 'Protection' 'Calibration' 'Diagnostic' 'Misc'
>   Item0: 'Protection'
> Simple mixer control 'Left DSP1 Preload',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'Left Digital PCM',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 913
>   Mono: 870 [95%] [6.62dB]
> Simple mixer control 'Left HW Noise Gate Delay',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Left HW Noise Gate Enable',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 63
>   Mono: 0 [0%]
> Simple mixer control 'Left HW Noise Gate Threshold',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Left Invert Class D',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Left LRCLK Force',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Left PCM Soft Ramp',0
>   Capabilities: enum
>   Items: 'Off' '.5ms' '1ms' '2ms' '4ms' '8ms' '15ms' '30ms'
>   Item0: 'Off'
> Simple mixer control 'Left PCM Source',0
>   Capabilities: enum
>   Items: 'ASP' 'DSP'
>   Item0: 'DSP'
> Simple mixer control 'Left SCLK Force',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right ASP TX1 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'VMON'
> Simple mixer control 'Right ASP TX2 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'IMON'
> Simple mixer control 'Right ASP TX3 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'Zero'
> Simple mixer control 'Right ASP TX4 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'Zero'
> Simple mixer control 'Right Amp Gain ZC',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right Analog PCM',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 20
>   Mono: 17 [85%] [17.50dB]
> Simple mixer control 'Right Aux Noise Gate CH1',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right Aux Noise Gate CH1 Entry Delay',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 15
>   Mono: 3 [20%]
> Simple mixer control 'Right Aux Noise Gate CH1 Threshold',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Right Aux Noise Gate CH2',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right Aux Noise Gate CH2 Entry Delay',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 15
>   Mono: 3 [20%]
> Simple mixer control 'Right Aux Noise Gate CH2 Threshold',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Right DRE',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right DSP RX1 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'ASPRX2'
> Simple mixer control 'Right DSP RX2 Source',0
>   Capabilities: enum
>   Items: 'Zero' 'ASPRX1' 'ASPRX2' 'VMON' 'IMON' 'VPMON' 'VBSTMON' 'DSPTX1' 'DSPTX2'
>   Item0: 'ASPRX2'
> Simple mixer control 'Right DSP1 Firmware',0
>   Capabilities: enum
>   Items: 'MBC/VSS' 'MasterHiFi' 'Tx' 'Tx Speaker' 'Rx' 'Rx ANC' 'Voice Ctrl' 'ASR Assist' 'Dbg Trace' 'Protection' 'Calibration' 'Diagnostic' 'Misc'
>   Item0: 'Protection'
> Simple mixer control 'Right DSP1 Preload',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> Simple mixer control 'Right Digital PCM',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 913
>   Mono: 870 [95%] [6.62dB]
> Simple mixer control 'Right HW Noise Gate Delay',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Right HW Noise Gate Enable',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 63
>   Mono: 0 [0%]
> Simple mixer control 'Right HW Noise Gate Threshold',0
>   Capabilities: volume volume-joined
>   Playback channels: Mono
>   Capture channels: Mono
>   Limits: 0 - 7
>   Mono: 3 [43%]
> Simple mixer control 'Right Invert Class D',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right LRCLK Force',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> Simple mixer control 'Right PCM Soft Ramp',0
>   Capabilities: enum
>   Items: 'Off' '.5ms' '1ms' '2ms' '4ms' '8ms' '15ms' '30ms'
>   Item0: 'Off'
> Simple mixer control 'Right PCM Source',0
>   Capabilities: enum
>   Items: 'ASP' 'DSP'
>   Item0: 'DSP'
> Simple mixer control 'Right SCLK Force',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [off]
> 
> 
> !!Alsactl output
> !!--------------
> 
> --startcollapse--
> --endcollapse--
> 
> 
> !!All Loaded Modules
> !!------------------
> 
> ac
> acpi_cpufreq
> aesni_intel
> af_alg
> af_packet
> algif_hash
> algif_skcipher
> amdgpu
> amdxcp
> battery
> binfmt_misc
> blake2b_generic
> bluetooth
> bnep
> br_netfilter
> bridge
> btbcm
> btintel
> btmtk
> btrfs
> btrtl
> btusb
> button
> ccm
> ccp
> cdc_acm
> cec
> cfg80211
> cmac
> configfs
> cqhci
> crc32_pclmul
> crc32c_intel
> crct10dif_pclmul
> cryptd
> crypto_simd
> cs_dsp
> dmi_sysfs
> drm_buddy
> drm_display_helper
> drm_exec
> drm_suballoc_helper
> drm_ttm_helper
> dwc3
> dwc3_pci
> ecdh_generic
> edac_mce_amd
> efi_pstore
> efivarfs
> fat
> ff_memless
> fuse
> gf128mul
> ghash_clmulni_intel
> gpu_sched
> hid_generic
> hid_lenovo
> hid_multitouch
> hid_steam
> i2c_algo_bit
> i2c_hid
> i2c_hid_acpi
> i2c_piix4
> intel_rapl_common
> intel_rapl_msr
> ip6_udp_tunnel
> ip_tables
> irqbypass
> joydev
> kvm
> kvm_amd
> l2tp_core
> l2tp_netlink
> l2tp_ppp
> libarc4
> libcrc32c
> llc
> mac80211
> mmc_core
> msr
> nf_conntrack
> nf_conntrack_netlink
> nf_defrag_ipv4
> nf_defrag_ipv6
> nf_nat
> nf_reject_ipv4
> nf_reject_ipv6
> nf_tables
> nfnetlink
> nft_chain_nat
> nft_compat
> nft_ct
> nft_fib
> nft_fib_inet
> nft_fib_ipv4
> nft_fib_ipv6
> nft_reject
> nft_reject_inet
> nls_cp437
> nls_iso8859_1
> nvme
> nvme_auth
> nvme_core
> nvme_fabrics
> overlay
> pcspkr
> polyval_clmulni
> polyval_generic
> ppp_generic
> pppox
> qrtr
> raid6_pq
> rc_core
> regmap_spi
> rfcomm
> rfkill
> roles
> rtw88_8822c
> rtw88_8822ce
> rtw88_core
> rtw88_pci
> sdhci
> sdhci_pci
> serio_raw
> sha1_ssse3
> sha256_ssse3
> sha512_ssse3
> slhc
> snd
> snd_acp5x_i2s
> snd_acp5x_pcm_dma
> snd_acp_config
> snd_acp_legacy_common
> snd_acp_pci
> snd_compress
> snd_hda_codec
> snd_hda_codec_hdmi
> snd_hda_core
> snd_hda_intel
> snd_hrtimer
> snd_hwdep
> snd_intel_dspcfg
> snd_intel_sdw_acpi
> snd_pci_acp3x
> snd_pci_acp5x
> snd_pci_acp6x
> snd_pci_ps
> snd_pcm
> snd_pcm_dmaengine
> snd_rn_pci_acp3x
> snd_rpl_pci_acp6x
> snd_seq
> snd_seq_device
> snd_seq_dummy
> snd_soc_acp5x_mach
> snd_soc_acpi
> snd_soc_core
> snd_soc_cs35l41
> snd_soc_cs35l41_lib
> snd_soc_cs35l41_spi
> snd_soc_nau8821
> snd_soc_wm_adsp
> snd_sof
> snd_sof_amd_acp
> snd_sof_amd_acp63
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_vangogh
> snd_sof_pci
> snd_sof_utils
> snd_sof_xtensa_dsp
> snd_timer
> soundcore
> sp5100_tco
> spi_amd
> stp
> t10_pi
> thermal
> tiny_power_button
> ttm
> udp_tunnel
> uhid
> uinput
> ulpi
> usbcore
> usbhid
> veth
> vfat
> video
> wdat_wdt
> wmi
> x_tables
> xfrm_algo
> xfrm_user
> xhci_hcd
> xhci_pci
> xhci_pci_renesas
> xhci_plat_hcd
> xor
> xt_MASQUERADE
> xt_addrtype
> xt_conntrack
> xt_nat
> xt_tcpudp
> 
> 
> !!Sysfs Files
> !!-----------
> 
> /sys/class/sound/hwC0D0/init_pin_configs:
> 0x03 0x185600f0
> 0x05 0x185600f0
> 0x07 0x185600f0
> 0x09 0x185600f0
> 
> /sys/class/sound/hwC0D0/driver_pin_configs:
> 
> /sys/class/sound/hwC0D0/user_pin_configs:
> 
> /sys/class/sound/hwC0D0/init_verbs:
> 
> /sys/class/sound/hwC0D0/hints:
> 
> 
> !!ALSA/HDA dmesg
> !!--------------
> 
> [    5.372143] [drm] Display Core v3.2.259 initialized on DCN 3.0.1
> [    5.372147] [drm] DP-HDMI FRL PCON supported
> [    5.372816] [drm] DMUB hardware initialized: version=0x0300000A
> --
> [    7.420289] acpi_cpufreq: overriding BIOS provided _PSD data
> [    7.439331] snd_pci_acp5x 0000:04:00.5: enabling device (0000 -> 0002)
> [    7.574796] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
> [    7.574980] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio client
> [    7.577788] kvm_amd: TSC scaling supported
> --
> [    7.589223] MCE: In-kernel MCE decoding enabled.
> [    7.590386] snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    7.591577] cs35l41 spi-VLV1776:00: supply VA not found, using dummy regulator
> [    7.591644] cs35l41 spi-VLV1776:00: supply VP not found, using dummy regulator
> [    7.595880] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input17
> [    7.596790] input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input18
> [    7.598360] rtw_8822ce 0000:03:00.0: enabling device (0000 -> 0003)
> --
> [    7.606251] cs35l41 spi-VLV1776:01: supply VP not found, using dummy regulator
> [    7.606272] input: HD-Audio Generic HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input19
> [    7.606496] cs35l41 spi-VLV1776:01: Reset line busy, assuming shared reset
> --
> [    7.621258] rtw_8822ce 0000:03:00.0: Firmware version 9.9.15, H2C version 15
> [    7.623206] input: HD-Audio Generic HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input20
> [    7.639677] systemd-journald[653]: Received client request to flush runtime journal.
> --
> [    7.661306] hub 4-0:1.0: 1 port detected
> [    7.677805] input: acp5x Headset Jack as /devices/pci0000:00/0000:00:08.1/0000:04:00.5/acp5x_mach.0/sound/card1/input21
> [    7.697118] audit: type=1400 audit(1707746521.586:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=829 comm="apparmor_parser"
> 
> 
> !!Packages installed
> !!--------------------
> 
> alsa-plugins-upmix-1.2.7.1-4.7.x86_64
> alsa-ucm-conf-1.2.11-1.1.noarch
> alsa-oss-32bit-1.1.8-5.5.x86_64
> alsa-plugins-1.2.7.1-4.7.x86_64
> alsa-plugins-speexrate-1.2.7.1-4.7.x86_64
> alsa-utils-1.2.11-1.1.x86_64
> alsa-oss-1.1.8-5.5.x86_64
> 
> 
