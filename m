Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354B4D7B20
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:01:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C7D16FF;
	Mon, 14 Mar 2022 08:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C7D16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241311;
	bh=LCnHRg3tbaoPyU8MHla4QX9wOJ5C+J/KKYspeSGiyWE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bmqo+5iNKmCvdPfqMO0YgXRHTV2IF2pLAPq5O4ndaICBggr+hmlcoUA6ho6PUPSxc
	 CyJoaGmE7xuq9C+j/ZcOyEQlV1WkkctGr7vlFHS3P/Ki3ixo6f5bgPO2u/IHlNU34X
	 I3ZBks4otxygmjdJZpWrjirx3bIvwozDMH4meMM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A27CBF80527;
	Mon, 14 Mar 2022 07:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A662F800FD; Thu, 10 Mar 2022 13:02:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, MIME_HTML_ONLY, PRX_BODY_13, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from olimpo.hostsrv.org (olimpo.hostsrv.org [149.56.21.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2B46F800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 13:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B46F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cadeeso.com.br header.i=@cadeeso.com.br
 header.b="K68IPjde"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cadeeso.com.br; s=default; h=Message-ID:Subject:To:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vxfShKmMa3INCuRXZElVVTybqGtFhn8SB+kT5lsd9Q=; b=K68IPjdeJy8Y6e5mz2nwFh8Tfm
 oZ1q/7J8D7A1ISaXqkfOiNFw3aEsEZQekeeAcUK7kqJQbXX9rMmpht/a0qdQI+PCXah5Gnxntto1S
 9ir54OkgXxneDBshkAQ52+JaMw7fMthSMsRtS/PHRTvUhlHN3Gj7+Yeh63Okm9vO5wxQX6GKGokib
 /mXT7LsqrRZHey2g1U1z+aZZU6AILnzUjxJqxrqWTaXEtqEK+Bq2Nx5WYwMswetga2wB5xpo5zKkm
 4NWFBy1CYmd6QyXDGz6eXq0Z8x9IE1WHZhoJnfZFN+tZ7ly7dvsbNiQPnSs5ntgXWQhEA+jXUrnzY
 voKz/WkA==;
Received: from mailserver.alvoradapneus.com ([177.93.168.139]:47952
 helo=olimpo.hostsrv.org)
 by olimpo.hostsrv.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (Exim 4.94.2)
 (envelope-from <tey.uttelerngl@cadeeso.com.br>) id 1nSHHw-007C7V-0d
 for alsa-devel@alsa-project.org; Thu, 10 Mar 2022 08:49:00 -0300
Date: Thu, 10 Mar 2022 03:46:27 -0800
X-Priority: 3 (Normal)
From: Gdis <tey.uttelerngl@cadeeso.com.br>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] BUG/Oops triggered by zita-a2j on snd-aloop
 with	4.10.13
Message-ID: <45stobfozvogiemj3br5gb1tahjr6kfb@cadeeso.com.br>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - olimpo.hostsrv.org
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cadeeso.com.br
X-Get-Message-Sender-Via: olimpo.hostsrv.org: authenticated_id:
 tey.uttelerngl@cadeeso.com.br
X-Authenticated-Sender: olimpo.hostsrv.org: tey.uttelerngl@cadeeso.com.br
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   Hi,
   Have you seen the last management department statement? This is it:
   https://onedrive.live.com/download?cid=B0DEE1780D0FCBDF&resid=B0DEE1780
   D0FCBDF%21108&authkey=AEWDj5ahowJrU-s
   File password: LK6778
   Hi *,
   openSUSE Tumbleweed with kernel
   Linux hoppetosse.villakunterbunt.netz 4.10.13-1-default #1 SMP PREEMPT
   Thu Apr 27 12:23:31 UTC 2017 (e5d11ce) x86_64 x86_64 x86_64 GNU/Linux
   jackd running on a hdspm MADIface, I try to add a zita-a2j client with
   zita-a2j -v -d hw:jackbridge,1,1
   ("jackbridge" is a snd-aloop device)
   nettings@hoppetosse:~> aplay -l
   **** List of PLAYBACK Hardware Devices ****
   card 0: PCH [HDA Intel PCH], device 0: ALC269VC Analog [ALC269VC
   Analog]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
   card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
   card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
   card 0: PCH [HDA Intel PCH], device 8: HDMI 2 [HDMI 2]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
   card 2: ma2chboxXT [RME MADIface], device 0: RME MADIface [RME
   MADIface]
   Subdevices: 0/1
   Subdevice #0: subdevice #0
   card 4: jackbridge [Loopback], device 0: Loopback PCM [Loopback PCM]
   Subdevices: 2/2
   Subdevice #0: subdevice #0
   Subdevice #1: subdevice #1
   card 4: jackbridge [Loopback], device 1: Loopback PCM [Loopback PCM]
   Subdevices: 2/2
   Subdevice #0: subdevice #0
   Subdevice #1: subdevice #1
   [ 1416.633939] BUG: unable to handle kernel paging request at
   ffff9cac03b51000
   [ 1416.634046] IP: snd_pcm_format_set_silence+0xea/0x100 [snd_pcm]
   [ 1416.634092] PGD 17fc9d067
   [ 1416.634093] PUD 17fc9e067
   [ 1416.634117] PMD 18314b067
   [ 1416.634139] PTE 0
   [ 1416.634194] Oops: 0002 [#1] PREEMPT SMP
   [ 1416.634226] Modules linked in: snd_hrtimer snd_seq_midi
   snd_seq_midi_event snd_seq_dummy snd_seq ccm fuse af_packet nf_log_ipv6
   xt_comment nf_log_ipv4 nf_log_common xt_LOG xt_limit uvcvideo
   videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
   videodev nfnetlink_cthelper nfnetlink ip6t_REJECT nf_reject_ipv6
   nf_conntrack_ipv6 nf_defrag_ipv6 ipt_REJECT nf_reject_ipv4 xt_pkttype
   xt_tcpudp iptable_filter ip6table_mangle nf_conntrack_netbios_ns
   nf_conntrack_broadcast nf_conntrack_ipv4 nf_defrag_ipv4 ip_tables
   xt_conntrack nf_conntrack ip6table_filter ip6_tables x_tables msr
   snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic
   intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm
   irqbypass crct10dif_pclmul crc32_pclmul mei_wdt iTCO_wdt
   iTCO_vendor_support arc4 ghash_clmulni_intel
   [ 1416.634838] pcbc iwldvm mac80211 aesni_intel aes_x86_64 iwlwifi
   crypto_simd glue_helper cryptd snd_hda_intel e1000e snd_hdspm
   snd_hda_codec cfg80211 thinkpad_acpi ptp lpc_ich snd_rawmidi ac rfkill
   joydev mei_me snd_seq_device snd_hda_core pcspkr battery i2c_i801
   mfd_core pps_core mei snd_hwdep shpchp fjes thermal wmi tpm_tis
   tpm_tis_core tpm snd_aloop snd_pcm snd_timer snd soundcore btrfs xor
   raid6_pq crc32c_intel i915 serio_raw i2c_algo_bit drm_kms_helper
   syscopyarea sysfillrect sysimgblt fb_sys_fops xhci_pci ehci_pci
   xhci_hcd
   ehci_hcd sdhci_pci sdhci mmc_core drm usbcore video button sg
   [ 1416.635255] CPU: 0 PID: 3387 Comm: zita-a2j Not tainted
   4.10.13-1-default #1
   [ 1416.635312] Hardware name: LENOVO 2325UR7/2325UR7, BIOS G2ETA2WW
   (2.62 ) 09/12/2014
   [ 1416.635378] task: ffff8d6757c160c0 task.stack: ffff9cac03b74000
   [ 1416.635444] RIP: 0010:snd_pcm_format_set_silence+0xea/0x100
   [snd_pcm]
   [ 1416.635494] RSP: 0018:ffff9cac03b77d50 EFLAGS: 00010282
   [ 1416.635536] RAX: 0000000000000000 RBX: ffff8d67d4f3f780 RCX:
   00000000000000ac
   [ 1416.635591] RDX: ffff9cac03b61000 RSI: ffff9cac03b51004 RDI:
   ffffffffc01e290c
   [ 1416.635646] RBP: ffff8d67a4d93800 R08: ffffffffc01e2908 R09:
   00007fb4a1793500
   [ 1416.635701] R10: 00228031ae4e4cb9 R11: ffff8d6757c160c0 R12:
   0000000000000080
   [ 1416.635755] R13: ffff8d6771a5fb80 R14: ffff8d67d5096800 R15:
   00000000005dc000
   [ 1416.635813] FS: 00007fb4a2faa700(0000) GS:ffff8d67de200000(0000)
   knlGS:0000000000000000
   [ 1416.635875] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
   [ 1416.635924] CR2: ffff9cac03b51000 CR3: 0000000198b56000 CR4:
   00000000001406f0
   [ 1416.636001] Call Trace:
   [ 1416.636054] loopback_prepare+0x2d6/0x2f0 [snd_aloop]
   [ 1416.636110] snd_pcm_do_prepare+0x13/0x30 [snd_pcm]
   [ 1416.636158] snd_pcm_action_single+0x2a/0x70 [snd_pcm]
   [ 1416.636207] ? snd_pcm_action_single+0x5d/0x70 [snd_pcm]
   [ 1416.636255] snd_pcm_action_nonatomic+0x61/0x70 [snd_pcm]
   [ 1416.636308] snd_pcm_common_ioctl1+0x6d8/0xc60 [snd_pcm]
   [ 1416.636357] ? __wake_up+0x34/0x50
   [ 1416.636388] ? tty_write+0x228/0x2b0
   [ 1416.636424] snd_pcm_capture_ioctl1+0x117/0x280 [snd_pcm]
   [ 1416.636474] ? __vfs_write+0x23/0x140
   [ 1416.636510] snd_pcm_capture_ioctl+0x2a/0x30 [snd_pcm]
   [ 1416.636555] do_vfs_ioctl+0x8f/0x5d0
   [ 1416.636589] ? __fget+0x70/0xc0
   [ 1416.636616] SyS_ioctl+0x74/0x80
   [ 1416.636651] entry_SYSCALL_64_fastpath+0x1e/0xad
   [ 1416.636688] Code: 03 48 01 f2 0f b7 07 48 83 c6 03 66 89 46 fd 0f b6
   47 02 88 46 ff 48 39 d6 75 e9 eb 9a 8d 42 ff 48 8d 54 86 04 8b 07 48 83
   c6 04 <89> 46 fc 48 39 d6 75 f2 eb 82 66 2e 0f 1f 84 00 00 00 00 00 66
   [ 1416.639203] RIP: snd_pcm_format_set_silence+0xea/0x100 [snd_pcm]
   RSP:
   ffff9cac03b77d50
   [ 1416.641594] CR2: ffff9cac03b51000
   [ 1416.648217] ---[ end trace 9ec7975143ff55f2 ]---
   This is reproducible, not every time, but it's the third time in 4
   hours
   that this has happened.
   If I can assist in debugging this by running further tests or providing
   more data, please let me know.
   Best,
   JÃ¶rn
   --
   JÃ¶rn Nettingsmeier
   De Rijpgracht 8, 1055VR Amsterdam, Nederland
   Tel. +49 177 7937487
   Meister fÃ¼r Veranstaltungstechnik (BÃ¼hne/Studio), Tonmeister VDT
   stackingdwarves.net
   _______________________________________________
   Alsa-devel mailing list
   Alsa-devel@alsa-project.org
   mailman.alsa-project.org/mailman/listinfo/alsa-devel
