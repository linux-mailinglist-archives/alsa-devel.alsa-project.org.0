Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9779352C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 08:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8885083A;
	Wed,  6 Sep 2023 08:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8885083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693980871;
	bh=zva5yqmUTyfe01I58kddKcTQ2K8vPMcp8akjPW0A2e8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jR65QsNSL5/i+OAqGscYcS7nUadYZG0G8Q+P1IFeP88kggAhtMvLe5UyI2oA5WAS1
	 OGWndtnWoo4rCOYWfSmiVlljw9vvxN6tz/f3erKxJ9Nc1s40scbg7bGrLKSbV17FRk
	 iH9/3JLimBl3V0nTspom0DoYussTD9JQAsLC6QwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E693F80549; Wed,  6 Sep 2023 08:13:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4701BF8047D;
	Wed,  6 Sep 2023 08:13:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65622F80494; Wed,  6 Sep 2023 08:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEF5EF80236
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 08:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF5EF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wEKuigTg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Pdtq5CJU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BCF722437;
	Wed,  6 Sep 2023 06:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693980610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xdRDi5mtaCUJf5leM0kpyY2RGuxnrhxdzXOeSIODiTM=;
	b=wEKuigTgWaKVIOo1tcgXvoQpUNRlStYyixf5JWz39/bUoqNuP+DisKQBLILRkM2OtauJdn
	2RVsD4jhgtdd04ZUesvsLN6XYWVvxHOmoQCYCywDgEPDtFOGrerNAi1d74/nF+VQkmJu/H
	EWUsAicW0MbJLOziBIeY10AL7EsamYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693980610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xdRDi5mtaCUJf5leM0kpyY2RGuxnrhxdzXOeSIODiTM=;
	b=Pdtq5CJUqDaHxtEVL8nw15Vp5zejZQtR/lxAsA0M0RTBFd22T3E8kBkx+HIiBwWksksp1r
	BaSaWkkQC+avYUCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBE8E1333E;
	Wed,  6 Sep 2023 06:10:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id H7DBNMEX+GRSHAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 06 Sep 2023 06:10:09 +0000
Date: Wed, 06 Sep 2023 08:10:09 +0200
Message-ID: <877cp3esse.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
In-Reply-To: <ZPelHaX/Lt++kkOm@linaro.org>
References: <ZPelHaX/Lt++kkOm@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: N6N2UDT3GDHGGR6KCTSCBHJ2DL4QY7HB
X-Message-ID-Hash: N6N2UDT3GDHGGR6KCTSCBHJ2DL4QY7HB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6N2UDT3GDHGGR6KCTSCBHJ2DL4QY7HB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Sep 2023 00:01:01 +0200,
Antonio Terceiro wrote:
> 
> Hi,
> 
> I'm using an arm64 workstation, and wanted to add a sound card to it. I bought
> one who was pretty popular around where I live, and it is supported by the
> snd-cmipci driver.
> 
> It's this one:
> 
> 0005:02:00.0 Multimedia audio controller: C-Media Electronics Inc CMI8738/CMI8768 PCI Audio (rev 10)
> 
> After building a mailine kernel (post-v6.5, pre-rc1) on Debian testing arm64
> with localmodconfig + CONFIG_SND_CMIPCI=m, it crashes with "Unable to handle
> kernel paging request at virtual address fffffbfffe80000c", and the system
> never finishes to boot. The login manager never shows up and the serial console
> never gets to a login prompt. I observed the same issue on a 6.3 Debian kernel,
> after rebuilding with CONFIG_SND_CMIPCI=m.
> 
> If I stop the module from being automatically loaded by adding
> `blacklist snd-cmipci` to /etc/modprobe.d/snd-cmipci.conf (or if I
> remove the card from the PCIe slot), I get the system to boot. But tring
> to load the module manually causes the same crash (I only tested this
> with the card on):
> 
> [  +4,501093] snd_cmipci 0005:02:00.0: stream 512 already in tree
> [  +0,000155] Unable to handle kernel paging request at virtual address fffffbfffe80000c
> [  +0,007927] Mem abort info:
> [  +0,002793]   ESR = 0x0000000096000006
> [  +0,003743]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  +0,005307]   SET = 0, FnV = 0
> [  +0,003049]   EA = 0, S1PTW = 0
> [  +0,003134]   FSC = 0x06: level 2 translation fault
> [  +0,004872] Data abort info:
> [  +0,002873]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> [  +0,005479]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  +0,005047]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  +0,000003] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000080519fe9000
> [  +0,000004] [fffffbfffe80000c] pgd=000008051a979003, p4d=000008051a979003, pud=000008051a97a003, pmd=0000000000000000
> [  +0,000009] Internal error: Oops: 0000000096000006 [#1] SMP
> [  +0,028142] Modules linked in: snd_cmipci(+) snd_mpu401_uart snd_opl3_lib xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user xfrm_algo xt_addrtype nft_compat br_netfilter nft_masq nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc nf_tables nfnetlink uvcvideo videobuf2_vmalloc videobuf2_memops uvc videobuf2_v4l2 videodev videobuf2_common snd_seq_dummy snd_hrtimer snd_seq qrtr rfkill overlay ftdi_sio usbserial snd_usb_audio snd_usbmidi_lib snd_pcm aes_ce_blk aes_ce_cipher snd_hwdep polyval_ce snd_rawmidi polyval_generic snd_seq_device joydev snd_timer ghash_ce hid_generic gf128mul snd usbhid sha2_ce ipmi_ssif soundcore hid mc sha256_arm64 ipmi_devintf arm_spe_pmu ipmi_msghandler sha1_ce sbsa_gwdt binfmt_misc nls_ascii nls_cp437 vfat fat xgene_hwmon cppc_cpufreq arm_cmn arm_dsu_pmu evdev nfsd auth_rpcgss nfs_acl lockd grace dm_mod fuse loop efi_pstore dax sunrpc configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 btrfs efivarfs raid10 raid
 456 async_raid6_recov async_memcpy
> [  +0,000142]  async_pq async_xor async_tx libcrc32c crc32c_generic xor xor_neon raid6_pq raid1 raid0 multipath linear md_mod nvme nvme_core ast t10_pi drm_shmem_helper xhci_pci drm_kms_helper xhci_hcd crc64_rocksoft crc64 drm crc_t10dif usbcore crct10dif_generic igb crct10dif_ce crct10dif_common usb_common i2c_algo_bit i2c_designware_platform i2c_designware_core
> [  +0,121670] CPU: 0 PID: 442 Comm: kworker/0:4 Not tainted 6.5.0+ #2
> [  +0,006259] Hardware name: ADLINK AVA Developer Platform/AVA Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 09/08/2022
> [  +0,012506] Workqueue: events work_for_cpu_fn
> [  +0,004353] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  +0,006953] pc : logic_inl+0xa0/0xd8
> [  +0,003570] lr : snd_cmipci_probe+0x7a4/0x1140 [snd_cmipci]
> [  +0,005578] sp : ffff80008287bc70
> [  +0,003303] x29: ffff80008287bc70 x28: ffff08008af9d6a0 x27: 0000000000000000
> [  +0,007128] x26: ffffc4818263c228 x25: 0000000000000000 x24: 0000000000000001
> [  +0,007127] x23: ffff07ff81a9e000 x22: ffff07ff81a9e0c0 x21: ffff08008af9d080
> [  +0,007127] x20: ffffc4818263c000 x19: 0000000000000000 x18: ffffffffffffffff
> [  +0,007127] x17: 0000000000000000 x16: ffffc4819ac3cd38 x15: ffff80008287ba80
> [  +0,007127] x14: 0000000000000001 x13: ffff80008287bbc4 x12: 0000000000000000
> [  +0,007126] x11: ffff07ff834616d0 x10: ffffffffffffffc0 x9 : ffffc4819a61dd18
> [  +0,007127] x8 : 0000000000000228 x7 : 0000000000000001 x6 : 00000000000000ff
> [  +0,007127] x5 : ffffc4819adb7998 x4 : 0000000000000000 x3 : 00000000000000ff
> [  +0,007127] x2 : 0000000000ffbffe x1 : 000000000000000c x0 : fffffbfffe80000c
> [  +0,007126] Call trace:
> [  +0,002436]  logic_inl+0xa0/0xd8
> [  +0,003221]  local_pci_probe+0x48/0xb8
> [  +0,003744]  work_for_cpu_fn+0x24/0x40
> [  +0,003741]  process_one_work+0x170/0x3a8
> [  +0,004002]  worker_thread+0x23c/0x460
> [  +0,003742]  kthread+0xe8/0xf8
> [  +0,003047]  ret_from_fork+0x10/0x20
> [  +0,003569] Code: d2bfd000 f2df7fe0 f2ffffe0 8b000020 (b9400000) 
> [  +0,006083] ---[ end trace 0000000000000000 ]---
> 
> Because this sound card chipset seems to be popular (pretty much all PCI cards
> I can find to buy locally use that), I'm thinking this might be specific to
> arm64, otherwise someone would have seen this before.

There is only one change in this driver code itself since 6.5 (commit
b6ba0aa46138), and judging from the stack trace, it's unrelated with
your problem.   It's more likely a regression in the lower level code,
e.g. PCI layer or arch/arm64 stuff.

Could you try git bisect?


thanks,

Takashi
