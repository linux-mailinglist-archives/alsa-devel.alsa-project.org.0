Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B756FF9B4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 20:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6838B1EC;
	Thu, 11 May 2023 20:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6838B1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683831480;
	bh=yUDbWbBE3kBi9xJaKDyOEqNG79T01VjOIg5UPYhO/s4=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WLCDiE7hhMzMEMC+DP4aA+y4+hA2eK5xCekaCK/gI7NSNgsi8njdhGLP38r35q/Oo
	 JdSyRTGoZ+BJ5ygtw6/KVgdGnX47dVxFbCC8GJ4urZPRW5+Pn62qR5N9gb0KfBRm/E
	 jl2qLZS3g7laUwdrjmMOH2WnA9DlwVPql5CWKr+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69221F805DF; Thu, 11 May 2023 20:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B17A6F805D8;
	Thu, 11 May 2023 20:54:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FB63F8052E; Thu, 11 May 2023 17:12:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from 7of9.schinagl.nl (7of9.schinagl.nl [185.238.129.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5B0BF80310
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 17:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B0BF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=schinagl.nl header.i=@schinagl.nl header.a=rsa-sha256
 header.s=7of9 header.b=Gm7V+xvZ
Received: from [10.2.12.48] (unknown [10.2.12.48])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by 7of9.schinagl.nl (Postfix) with ESMTPSA id E4AA418CA2D0
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 17:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
	t=1683817943; bh=yUDbWbBE3kBi9xJaKDyOEqNG79T01VjOIg5UPYhO/s4=;
	h=Date:To:From:Subject;
	b=Gm7V+xvZO/YW7XTHr3PyCyQwaO/OotVzr2EaUMftPbYo15jZ1wBd5onhY7nB1zV4C
	 Lhx5Zv2GhlIafbpf/JFwdmr76WnRSR9SfcdT05cakTLb5Ko8WuFjyxCB6lK8PuWh5a
	 9cC/XVGg5gnRcDcmRzsuUDHxoZyBZuc7y7fAHQTQ=
Message-ID: <64d95eb0-dbdb-cff8-a8b1-988dc22b24cd@schinagl.nl>
Date: Thu, 11 May 2023 17:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: alsa-devel@alsa-project.org
Content-Language: nl, en-US
From: Olliver Schinagl <oliver@schinagl.nl>
Subject: snd_hda_codec_cirrus kernel oops
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: oliver@schinagl.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SSMC7FCUFLQILALID7TO7U5SKPUQOQXB
X-Message-ID-Hash: SSMC7FCUFLQILALID7TO7U5SKPUQOQXB
X-Mailman-Approved-At: Thu, 11 May 2023 18:54:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSMC7FCUFLQILALID7TO7U5SKPUQOQXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey list,

I've noticed the following crash since the last few days, causing audio 
to no longer to work. It could be related to me updating the firmware 
(bios) not too long ago (I load Mac OS every few months via an external 
drive) which caused the firmware to be updated. Or, it was a kernel 
update, that came along every few weeks.

I'll try to find my archlinux bugzilla stuff, to report it there as 
well, but I don't think they are actively patching the sound stuff.

The last commit I'm seeing on `patch_cirrus.c` seems to be from aug 
2022, so that can't be it, though incidentally, the change is with 
regards to support for iMac 12,1 model, which is interesting as the 
number is the same.

I understand you guys probably get tons of bug reports, but best to 
leave it here, just in case.

[   90.497004] CPU: 3 PID: 343 Comm: modprobe Not tainted 6.3.1-arch2-1 
#1 4c16b0b90f71a940c7f1bb2eb00cdd9db2a83452
[   90.497008] Hardware name: Apple Inc. 
MacBookPro12,1/Mac-E43C1C25D4880AD6, BIOS 481.0.0.0.0 01/12/2023
[   90.497010] RIP: 0010:get_line_out_pfx+0x2dd/0x3e0 
[snd_hda_codec_generic]
[   90.497019] Code: f9 01 0f 84 20 fe ff ff 48 c7 c2 4d 45 f9 c0 41 83 
f9 02 0f 85 fe fd ff ff e9 0a fe ff ff 48 c7 c7 6e 45
f9 c0 e8 13 26 32 e6 <0f> 0b 48 c7 c2 dd 45 f9 c0 e9 f0 fd ff ff 8b 91 
10 0b 00 00 48 8b
[   90.497021] RSP: 0018:ffffa50740cebad8 EFLAGS: 00010282
[   90.497023] RAX: 0000000000000000 RBX: ffff90ea048d1cf0 RCX: 
0000000000000027
[   90.497025] RDX: ffff90ed5eda1688 RSI: 0000000000000001 RDI: 
ffff90ed5eda1680
[   90.497027] RBP: 0000000000000004 R08: 0000000000000000 R09: 
ffffa50740ceb968
[   90.497028] R10: 0000000000000003 R11: ffffffffa90ca208 R12: 
ffffffffc0f948c0
[   90.497030] R13: ffff90ea13961000 R14: ffff90ea13940000 R15: 
0000000010000013
[   90.497032] FS:  00007f1db7091740(0000) GS:ffff90ed5ed80000(0000) 
knlGS:0000000000000000
[   90.497034] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   90.497036] CR2: 000056301fb6f000 CR3: 00000001018ec002 CR4: 
00000000003706e0
[   90.497038] Call Trace:
[   90.497040]  <TASK>
[   90.497043]  snd_hda_gen_parse_auto_config+0xa54/0x2d50 
[snd_hda_codec_generic 81639eb673de159e5e532c3e233834b733e4a85d]
[   90.497066]  ? snd_hda_parse_pin_defcfg+0xaf7/0xda0 [snd_hda_codec 
5b5014cb067d97e046acd84ac2db87d5fa068fb6]
[   90.497086]  cs_parse_auto_config+0x3b/0xa0 [snd_hda_codec_cirrus 
9ac52229b60afb26837192841054ac3dbe8aecc3]
[   90.497094]  patch_cs4208+0x155/0x1a0 [snd_hda_codec_cirrus 
9ac52229b60afb26837192841054ac3dbe8aecc3]
[   90.497101]  ? snd_hdac_regmap_init+0x24/0x50 [snd_hda_core 
b180f4281d829fe0e1d0ef6f041e0fc5adf64817]
[   90.497128]  hda_codec_driver_probe+0x98/0x150 [snd_hda_codec 
5b5014cb067d97e046acd84ac2db87d5fa068fb6]
[   90.497143]  really_probe+0x19b/0x3e0
[   90.497149]  ? __pfx___driver_attach+0x10/0x10
[   90.497152]  __driver_probe_device+0x78/0x160
[   90.497156]  driver_probe_device+0x1f/0x90
[   90.497159]  __driver_attach+0xd2/0x1c0
[   90.497163]  bus_for_each_dev+0x85/0xd0
[   90.497166]  bus_add_driver+0x116/0x220
[   90.497170]  driver_register+0x59/0x100
[   90.497173]  ? __pfx_init_module+0x10/0x10 [snd_hda_codec_cirrus 
9ac52229b60afb26837192841054ac3dbe8aecc3]
[   90.497179]  do_one_initcall+0x5a/0x240
[   90.497184]  do_init_module+0x4a/0x200
[   90.497190]  __do_sys_init_module+0x17f/0x1b0
[   90.497195]  do_syscall_64+0x5d/0x90
[   90.497213]  ? do_user_addr_fault+0x1e0/0x720
[   90.497217]  ? exc_page_fault+0x7c/0x180
[   90.497222]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   90.497225] RIP: 0033:0x7f1db6b21f9e
[   90.497242] Code: 48 8b 0d bd ed 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 
66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8a ed 0c 00 f7 d8 64 89 01 48
[   90.497244] RSP: 002b:00007fff2ac9ec58 EFLAGS: 00000246 ORIG_RAX: 
00000000000000af
[   90.497246] RAX: ffffffffffffffda RBX: 00005614a9a07e00 RCX: 
00007f1db6b21f9e
[   90.497248] RDX: 00005614a8e1dcb2 RSI: 0000000000010660 RDI: 
00005614a9a6cdb0
[   90.497250] RBP: 00005614a8e1dcb2 R08: 0000000000010660 R09: 
0000000000000000
[   90.497251] R10: 000000000005d8a1 R11: 0000000000000246 R12: 
0000000000040000
[   90.497253] R13: 00005614a9a07c50 R14: 0000000000000000 R15: 
00005614a9a0bbb0
[   90.497270]  </TASK>
[   90.497271] ---[ end trace 0000000000000000 ]---
[   90.497273] ------------[ cut here ]------------
[   90.497274] BUG?
[   90.497284] WARNING: CPU: 3 PID: 343 at 
sound/pci/hda/hda_generic.c:1238 get_line_out_pfx+0x2dd/0x3e0 
[snd_hda_codec_generic]
[   90.497293] Modules linked in: snd_hda_codec_cirrus(+) brcmfmac(+) 
snd_hda_codec_generic ledtrig_audio brcmutil iTCO_wdt snd_hda_intel 
mei_pxp mei_hdcp snd_intel_dspcfg btusb irqbypass snd_intel_sdw_acpi 
btrtl intel_pmc_bxt snd_hda_codec btbcm drm_buddy spi_intel_platform 
btintel snd_hda_core spi_intel iTCO_vendor_support rapl btmtk cfg80211 
applesmc i2c_i801 mei_me joydev i2c_algo_bit intel_cstate snd_hwdep ttm 
i2c_smbus pcspkr mei intel_uncore intel_pch_thermal bluetooth lpc_ich 
snd_pcm thunderbolt mmc_core drm_display_helper snd_timer snd acpi_als 
ecdh_generic cec mousedev bcm5974 rfkill intel_gtt 
industrialio_triggered_buffer soundcore sbs kfifo_buf video 
apple_mfi_fastcharge sbshc industrialio wmi apple_bl mac_hid 
dm_multipath sg loop crypto_user fuse bpf_preload ip_tables x_tables 
usbhid crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic 
gf128mul ghash_clmulni_intel sha512_ssse3 aesni_intel crypto_simd cryptd 
applespi crc16 xhci_pci spi_pxa2xx_pci spi_pxa2xx_platform 
xhci_pci_renesas dw_dmac hid_apple
[   90.497374]  tg3 libphy vfat fat btrfs blake2b_generic xor raid6_pq 
libcrc32c crc32c_generic crc32c_intel dm_crypt cbc encrypted_keys 
trusted asn1_encoder tee dm_mod
[   90.497388] CPU: 3 PID: 343 Comm: modprobe Tainted: G        W 
   6.3.1-arch2-1 #1 4c16b0b90f71a940c7f1bb2eb00cdd9db2a83452
[   90.497391] Hardware name: Apple Inc. 
MacBookPro12,1/Mac-E43C1C25D4880AD6, BIOS 481.0.0.0.0 01/12/2023
[   90.497392] RIP: 0010:get_line_out_pfx+0x2dd/0x3e0 
[snd_hda_codec_generic]
[   90.497401] Code: f9 01 0f 84 20 fe ff ff 48 c7 c2 4d 45 f9 c0 41 83 
f9 02 0f 85 fe fd ff ff e9 0a fe ff ff 48 c7 c7 6e 45 f9 c0 e8 13 26 32 
e6 <0f> 0b 48 c7 c2 dd 45 f9 c0 e9 f0 fd ff ff 8b 91 10 0b 00 00 48 8b
[   90.497403] RSP: 0018:ffffa50740cebad8 EFLAGS: 00010282
[   90.497418] RAX: 0000000000000000 RBX: ffff90ea048d1cf0 RCX: 
0000000000000027
[   90.497420] RDX: ffff90ed5eda1688 RSI: 0000000000000001 RDI: 
ffff90ed5eda1680
[   90.497422] RBP: 0000000000000004 R08: 0000000000000000 R09: 
ffffa50740ceb968
[   90.497423] R10: 0000000000000003 R11: ffffffffa90ca208 R12: 
0000000000000004
[   90.497425] R13: ffff90ea13961000 R14: ffff90ea13940000 R15: 
ffffffffc0f945dd
[   90.497427] FS:  00007f1db7091740(0000) GS:ffff90ed5ed80000(0000) 
knlGS:0000000000000000
[   90.497429] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   90.497430] CR2: 000056301fb6f000 CR3: 00000001018ec002 CR4: 
00000000003706e0
[   90.497432] Call Trace:
[   90.497433]  <TASK>
[   90.497435]  snd_hda_gen_parse_auto_config+0x9a5/0x2d50 
[snd_hda_codec_generic 81639eb673de159e5e532c3e233834b733e4a85d]
[   90.497444]  ? snd_hda_parse_pin_defcfg+0xaf7/0xda0 [snd_hda_codec 
5b5014cb067d97e046acd84ac2db87d5fa068fb6]
[   90.497463]  cs_parse_auto_config+0x3b/0xa0 [snd_hda_codec_cirrus 
9ac52229b60afb26837192841054ac3dbe8aecc3]
[   90.497469]  patch_cs4208+0x155/0x1a0 [snd_hda_codec_cirrus 
9ac52229b60afb26837192841054ac3dbe8aecc3]
[   90.497476]  ? snd_hdac_regmap_init+0x24/0x50 [snd_hda_core 
b180f4281d829fe0e1d0ef6f041e0fc5adf64817]
[   90.497489]  hda_codec_driver_probe+0x98/0x150 [snd_hda_codec 
5b5014cb067d97e046acd84ac2db87d5fa068fb6]
[   90.497516]  really_probe+0x19b/0x3e0
[   90.497520]  ? __pfx___driver_attach+0x10/0x10
[   90.497523]  __driver_probe_device+0x78/0x160
[   90.497527]  driver_probe_device+0x1f/0x90
[   90.497530]  __driver_attach+0xd2/0x1c0
[   90.497533]  bus_for_each_dev+0x85/0xd0
[   90.497537]  bus_add_driver+0x116/0x220
[   90.497540]  driver_register+0x59/0x100
[   90.497543]  ? __pfx_init_module+0x10/0x10 [snd_hda_codec_cirrus 
9ac52229b60afb26837192841054ac3dbe8aecc3]
[   90.497549]  do_one_initcall+0x5a/0x240
[   90.497553]  do_init_module+0x4a/0x200
[   90.497570]  __do_sys_init_module+0x17f/0x1b0
[   90.497576]  do_syscall_64+0x5d/0x90
[   90.497579]  ? do_user_addr_fault+0x1e0/0x720
[   90.497583]  ? exc_page_fault+0x7c/0x180
[   90.497587]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   90.497589] RIP: 0033:0x7f1db6b21f9e
[   90.497595] Code: 48 8b 0d bd ed 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 
66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8a ed 0c 00 f7 d8 64 89 01 48
[   90.497596] RSP: 002b:00007fff2ac9ec58 EFLAGS: 00000246 ORIG_RAX: 
00000000000000af
[   90.497599] RAX: ffffffffffffffda RBX: 00005614a9a07e00 RCX: 
00007f1db6b21f9e
[   90.497601] RDX: 00005614a8e1dcb2 RSI: 0000000000010660 RDI: 
00005614a9a6cdb0
[   90.497602] RBP: 00005614a8e1dcb2 R08: 0000000000010660 R09: 
0000000000000000
[   90.497604] R10: 000000000005d8a1 R11: 0000000000000246 R12: 
0000000000040000
[   90.497605] R13: 00005614a9a07c50 R14: 0000000000000000 R15: 
00005614a9a0bbb0
[   90.497609]  </TASK>
[   90.497610] ---[ end trace 0000000000000000 ]---
[   90.512670] bcm5974: bad trackpad package, length: 8
[   90.569769] input: HDA Intel PCH Mic as 
/devices/pci0000:00/0000:00:1b.0/sound/card1/input9
[   90.569831] input: HDA Intel PCH Line as 
/devices/pci0000:00/0000:00:1b.0/sound/card1/input10
[   90.569886] input: HDA Intel PCH Headphone as 
/devices/pci0000:00/0000:00:1b.0/sound/card1/input11
[   90.569926] input: HDA Intel PCH SPDIF as 
/devices/pci0000:00/0000:00:1b.0/sound/card1/input12
[   90.569977] input: HDA Intel PCH SPDIF In as 
/devices/pci0000:00/0000:00:1b.0/sound/card1/input13
