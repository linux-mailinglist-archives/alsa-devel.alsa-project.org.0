Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC63DCD17
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 20:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0713317F2;
	Sun,  1 Aug 2021 20:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0713317F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627842582;
	bh=A00WfK5N4icy0lRZuZ3qnesubbicLn66ySTQ/Pf7umE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nuKY5bNeGbX4durSk9FXhuEXnu9pSbpQW69ggVV/NHgLdWXeSC6NvwwsHmAvoDsm9
	 RrlMsjVjD5kqpLBD4f5d5zdesNaKEySQnpMR7Cvrtm8gZBirbFovfLhKfEq3nhqMbe
	 rQk8Zeut+dfae9Nj8UleSbBN8rcvi7BpAK/uRXrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DAC1F8032C;
	Sun,  1 Aug 2021 20:28:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20CB7F802E8; Sun,  1 Aug 2021 20:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A05F8012E
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 20:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A05F8012E
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud9.xs4all.net with ESMTPA
 id AGBom4xWa4JsbAGBpmj7lt; Sun, 01 Aug 2021 20:27:58 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id ECC371626FA
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 20:27:55 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id e5PWFyXbBpMP for <alsa-devel@alsa-project.org>;
 Sun,  1 Aug 2021 20:27:55 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id F049515F770
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 20:27:54 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id DDC3A16042F; Sun,  1 Aug 2021 20:27:54 +0200 (CEST)
Date: Sun, 1 Aug 2021 20:27:54 +0200
From: folkert <folkert@vanheusden.com>
To: alsa-devel@alsa-project.org
Subject: aconnect occasionally causes kernel oopses
Message-ID: <20210801182754.GP890690@belle.intranet.vanheusden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfB2hsoy4qgSj5cA1O0RNQCQbsmLMTwR1KGJGbHO/2ZQKT4EvQnzEtgEa5bqMl04+C1PSwNKuLCJmxIrXqtY1C9I/XlAAvobLic3WIUIoecRzL/HtUefp
 Z7CJxgbGU10+LQ/jcQ2ZOr93QlWywlovsTrCUOFjx3zdGAGlD/UW1+25m0FlFEtiF7pQFA0SOuV4qULWbloolX6WukDLFahiTO4bUyPp44I8SSzS1R5RYg59
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[zo aug  1 20:24:51 2021] BUG: unable to handle page fault for address: 000=
03c366982f750
[zo aug  1 20:24:51 2021] #PF: supervisor read access in kernel mode
[zo aug  1 20:24:51 2021] #PF: error_code(0x0000) - not-present page
[zo aug  1 20:24:51 2021] PGD 0 P4D 0=20
[zo aug  1 20:24:51 2021] Oops: 0000 [#1] SMP NOPTI
[zo aug  1 20:24:51 2021] CPU: 2 PID: 59575 Comm: aconnect Not tainted 5.11=
=2E0-25-generic #27-Ubuntu
[zo aug  1 20:24:51 2021] Hardware name: HP HP Laptop 17-by2xxx/865A, BIOS =
F.58 06/16/2020
[zo aug  1 20:24:51 2021] RIP: 0010:check_and_subscribe_port+0x151/0x210 [s=
nd_seq]
[zo aug  1 20:24:51 2021] Code: 49 39 c5 0f 84 39 ff ff ff 41 0f b6 3e eb 0=
c 48 8b 00 49 39 c5 0f 84 27 ff ff ff 48 8d 70 b0 48 8d 48 a0 45 84 c0 48 0=
f 45 ce <40> 3a 39 75 e0 0f b6 51 01 41 38 56 01 75 d6 0f b6 51 02 41 38 56
[zo aug  1 20:24:51 2021] RSP: 0018:ffffa57dc9e03cf8 EFLAGS: 00010246 [zo a=
ug  1 20:24:51 2021] RAX: 00003c366982f7b0 RBX: 0000000000000000 RCX: 00003=
c366982f750
[zo aug  1 20:24:51 2021] RDX: 0000000000000089 RSI: 00003c366982f760 RDI: =
0000000000000080
[zo aug  1 20:24:51 2021] RBP: ffffa57dc9e03d38 R08: 0000000000000000 R09: =
ffff8945226312c0
[zo aug  1 20:24:51 2021] R10: ffff89458b7dda00 R11: ffff89460f08d270 R12: =
ffff894522631200
[zo aug  1 20:24:51 2021] R13: ffff8945226312c0 R14: ffff894506dd2080 R15: =
ffff8945226312d8
[zo aug  1 20:24:51 2021] FS:  00007f7fd9633480(0000) GS:ffff894756500000(0=
000) knlGS:0000000000000000
[zo aug  1 20:24:51 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[zo aug  1 20:24:51 2021] CR2: 00003c366982f750 CR3: 00000001d8318006 CR4: =
00000000003706e0
[zo aug  1 20:24:51 2021] Call Trace:
[zo aug  1 20:24:51 2021]  snd_seq_port_connect+0x113/0x180 [snd_seq]
[zo aug  1 20:24:51 2021]  snd_seq_ioctl_subscribe_port+0xb9/0x180 [snd_seq]
[zo aug  1 20:24:51 2021]  ? snd_seq_port_get_subscription+0xbb/0xd0 [snd_s=
eq]
[zo aug  1 20:24:51 2021]  ? __check_object_size.part.0+0x3a/0x150
[zo aug  1 20:24:51 2021]  snd_seq_ioctl+0xe8/0x1b0 [snd_seq]
[zo aug  1 20:24:51 2021]  __x64_sys_ioctl+0x91/0xc0
[zo aug  1 20:24:51 2021]  do_syscall_64+0x38/0x90
[zo aug  1 20:24:51 2021]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[zo aug  1 20:24:51 2021] RIP: 0033:0x7f7fd98b8ecb
[zo aug  1 20:24:51 2021] Code: ff ff ff 85 c0 79 8b 49 c7 c4 ff ff ff ff 5=
b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 0=
0 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d 1f 0d 00 f7 d8 64 89 01 48
[zo aug  1 20:24:51 2021] RSP: 002b:00007ffdc3e3f038 EFLAGS: 00000246 ORIG_=
RAX: 0000000000000010
[zo aug  1 20:24:51 2021] RAX: ffffffffffffffda RBX: 00007f7fd998b354 RCX: =
00007f7fd98b8ecb
[zo aug  1 20:24:51 2021] RDX: 00007ffdc3e3f050 RSI: 0000000040505330 RDI: =
0000000000000003
[zo aug  1 20:24:51 2021] RBP: 00007ffdc3e3f120 R08: 00000000ffffffff R09: =
0000000000000000
[zo aug  1 20:24:51 2021] R10: 00007f7fd993dac0 R11: 0000000000000246 R12: =
00007ffdc3e3f050
[zo aug  1 20:24:51 2021] R13: 00007ffdc3e3f0de R14: 0000000000000000 R15: =
00007ffdc3e3f0dc
[zo aug  1 20:24:51 2021] Modules linked in: snd_hrtimer snd_usb_audio snd_=
usbmidi_lib snd_seq_dummy ch341 usbserial ccm xt_CHECKSUM xt_MASQUERADE xt_=
conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_n=
at nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_counter nf_tables libcrc3=
2c nfnetlink bridge stp llc rfcomm cmac algif_hash algif_skcipher af_alg bn=
ep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd_sof_pci snd_sof_intel_h=
da_common snd_hda_codec_realtek snd_soc_hdac_hda snd_hda_codec_generic snd_=
sof_intel_hda snd_sof_intel_byt snd_sof_intel_ipc snd_sof snd_sof_xtensa_ds=
p snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi ledtrig_audio snd_=
hda_intel snd_intel_dspcfg soundwire_intel soundwire_generic_allocation sou=
ndwire_cadence snd_hda_codec snd_hda_core snd_hwdep soundwire_bus snd_soc_c=
ore snd_compress ac97_bus snd_pcm_dmaengine snd_pcm mei_hdcp rtw88_8723de r=
tw88_8723d snd_seq_midi x86_pkg_temp_thermal intel_powerclamp snd_seq_midi_=
event coretemp intel_rapl_msr rtw88_pci [zo aug  1 20:24:51 2021]  kvm_inte=
l snd_rawmidi rtw88_core kvm uvcvideo videobuf2_vmalloc rapl intel_cstate m=
ac80211 videobuf2_memops snd_seq joydev btusb btrtl videobuf2_v4l2 snd_seq_=
device snd_timer btbcm input_leds btintel videobuf2_common videodev hp_wmi =
efi_pstore mc sparse_keymap serio_raw snd wmi_bmof intel_wmi_thunderbolt cf=
g80211 mei_me bluetooth soundcore ee1004 libarc4 processor_thermal_device p=
rocessor_thermal_rfim processor_thermal_mbox mei ecdh_generic processor_the=
rmal_rapl intel_rapl_common ecc intel_pch_thermal int340x_thermal_zone inte=
l_soc_dts_iosf acpi_pad hp_wireless int3400_thermal acpi_tad acpi_thermal_r=
el mac_hid sch_fq_codel msr parport_pc ppdev lp parport sunrpc ip_tables x_=
tables autofs4 dm_crypt i915 crct10dif_pclmul crc32_pclmul i2c_algo_bit gha=
sh_clmulni_intel aesni_intel drm_kms_helper crypto_simd syscopyarea cryptd =
sysfillrect glue_helper sysimgblt fb_sys_fops cec psmouse nvme rc_core inte=
l_lpss_pci intel_lpss nvme_core i2c_i801 r8169 idma64 i2c_smbus ahci realtek
[zo aug  1 20:24:51 2021]  libahci drm virt_dma xhci_pci xhci_pci_renesas w=
mi pinctrl_cannonlake video
[zo aug  1 20:24:51 2021] CR2: 00003c366982f750
[zo aug  1 20:24:51 2021] ---[ end trace 000787e3cd09f39d ]---
[zo aug  1 20:24:52 2021] RIP: 0010:check_and_subscribe_port+0x151/0x210 [s=
nd_seq]
[zo aug  1 20:24:52 2021] Code: 49 39 c5 0f 84 39 ff ff ff 41 0f b6 3e eb 0=
c 48 8b 00 49 39 c5 0f 84 27 ff ff ff 48 8d 70 b0 48 8d 48 a0 45 84 c0 48 0=
f 45 ce <40> 3a 39 75 e0 0f b6 51 01 41 38 56 01 75 d6 0f b6 51 02 41 38 56
[zo aug  1 20:24:52 2021] RSP: 0018:ffffa57dc9e03cf8 EFLAGS: 00010246
[zo aug  1 20:24:52 2021] RAX: 00003c366982f7b0 RBX: 0000000000000000 RCX: =
00003c366982f750
[zo aug  1 20:24:52 2021] RDX: 0000000000000089 RSI: 00003c366982f760 RDI: =
0000000000000080
[zo aug  1 20:24:52 2021] RBP: ffffa57dc9e03d38 R08: 0000000000000000 R09: =
ffff8945226312c0
[zo aug  1 20:24:52 2021] R10: ffff89458b7dda00 R11: ffff89460f08d270 R12: =
ffff894522631200
[zo aug  1 20:24:52 2021] R13: ffff8945226312c0 R14: ffff894506dd2080 R15: =
ffff8945226312d8
[zo aug  1 20:24:52 2021] FS:  00007f7fd9633480(0000) GS:ffff894756500000(0=
000) knlGS:0000000000000000
[zo aug  1 20:24:52 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[zo aug  1 20:24:52 2021] CR2: 00003c366982f750 CR3: 00000001d8318006 CR4: =
00000000003706e0
