Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7081DFA23
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 20:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF4017D9;
	Sat, 23 May 2020 20:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF4017D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590257491;
	bh=BK8HAdLjFXGObR2hRfPvjyhE6vfmJkJ+GrrLtYOVciU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dO+31CcyrWm4dWar13VSGMQcw2tLK3rcbI6oYE+CVozJPJjuEAxkknIWjCb3pr/mx
	 HiFoRKyqi7rHfUu889T2plIydHzNnlthLsj1CME9R0PtV7t7gxH4wcUxZDOMsurZg4
	 r36/iTIo0/DF0HNg8KmqiO5JrWfyJ67qTZsSrB6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27665F801F8;
	Sat, 23 May 2020 20:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37358F801D8; Sat, 23 May 2020 20:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.215])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 197C8F800EE
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 20:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197C8F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=freedom.nl header.i=@freedom.nl
 header.b="jGW0Hnq3"; 
 dkim=pass (1024-bit key) header.d=freedom.nl header.i=@freedom.nl
 header.b="FGChJb+P"
Received: from smtp.freedom.nl (unknown [10.10.3.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by outbound.soverin.net (Postfix) with ESMTPS id 3D2AA61224;
 Sat, 23 May 2020 18:09:39 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [116.202.65.211]) by
 soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedom.nl; s=default;
 t=1590257378; bh=BK8HAdLjFXGObR2hRfPvjyhE6vfmJkJ+GrrLtYOVciU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jGW0Hnq3/XMBTtWwNxSIMxKymhJO1jTM9epDr9DrVSepYh4ge4eS6ZpB5+XR7MXI3
 FqSjwL/KlJxXGPIz8tYFxHQqjDV1Xtxy+u9MWSa46GZfUDVIP0o4yHmbNigo0fFH9t
 OtA/6F3amgTDBd9Z1gn6NK8Y2IYFaLq1WVLbnMs4=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedom.nl; s=default;
 t=1590257379; bh=BK8HAdLjFXGObR2hRfPvjyhE6vfmJkJ+GrrLtYOVciU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FGChJb+P4PUdP1P4zdCkiNuNXTe+MxwmCuTvKm5GXpLh6J6mkUkd7IuKscEQxBOHt
 d5lmZjhLdy2Dz8R/CenSKTp/QJpW1CAeuHU3RYW4zwdh9KftldJXF6WnV7z7s3cFlq
 E1MtkyzTP9tpfToZ+h48gDFqBnp9lGIRBJwNTIAU=
From: Erwin Burema <e.burema@freedom.nl>
To: alsa-devel@alsa-project.org, Alexander Tsoy <alexander@tsoy.me>
Subject: Re: [PATCH] Add duplex sound support for USB devices using implicit
 feedback
Date: Sat, 23 May 2020 20:09:31 +0200
Message-ID: <1674042.U9NR2fmVFg@alpha-wolf>
In-Reply-To: <6103f3aba91020ea345e9146da82e52823b7c298.camel@tsoy.me>
References: <2410739.SCZni40SNb@alpha-wolf>
 <6103f3aba91020ea345e9146da82e52823b7c298.camel@tsoy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.3 at c03mi01
X-Virus-Status: Clean
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>
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

On zaterdag 23 mei 2020 19:53:49 CEST Alexander Tsoy wrote:
> =D0=92 =D0=92=D1=81, 10/05/2020 =D0=B2 20:29 +0200, Erwin Burema =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > For USB sound devices using implicit feedback the endpoint used for
> > this feedback should be able to be opened twice, once for required
> > feedback and second time for audio data. This way these devices can
> > be put in duplex audio mode. Since this only works if the settings of
> > the endpoint don't change a check is included for this.
> >=20
> > This fixes bug 207023 ("MOTU M2 regression on duplex audio") and
> > should also fix bug 103751 ("M-Audio Fast Track Ultra usb audio
> > device will not operate full-duplex")
> >=20
> > Signed-off-by: Erwin Burema <e.burema@gmail.com>
> > ---
>=20
> This patch seems to cause kernel panic on my system. This happens
> during boot when gdm (with pulseaudio) is starting up.
>

That's interesting, not running gnome (and thus also not running gdm,=20
currently KDE with SDDM) here so would need to take some time troubleshooti=
ng.=20
Suspect I missed something in the check if both input and output are simila=
rly=20
configured.

Will see if I can reproduce it and where exactly it goes wrong, in the=20
meantime would it be possible to test if 5.6 or later show the same issue=20
since I intially developed the patch against that release?

> $ grep CONFIG_IRQ_FORCED_THREADING /boot/config-5.4.42-gentoo
> CONFIG_IRQ_FORCED_THREADING=3Dy
>=20
> $ grep threadirqs /proc/cmdline
> BOOT_IMAGE=3D/vmlinuz-5.4.42-gentoo root=3D/dev/mapper/vg_system-root ro
> rd.md.uuid=3Dcdf11511:cf0ca8c5:cc165dc3:3d3d248f
> rd.luks.uuid=3Da5a6e532-af4e-49b2-8178-95e54c293799 rd.lvm.lv=3Dvg_system=
/root
> rd.lvm.lv=3Dvg_system/swap rd.lvm.lv=3Dvg_system/usr
> resume=3D/dev/mapper/vg_system-swap
> rootflags=3Drelatime,logbufs=3D8,logbsize=3D256k rootfstype=3Dxfs
> init=3D/lib/systemd/systemd noautogroup loglevel=3D5 console=3DttyS1,1152=
00
> console=3Dtty0 threadirqs mgag200.modeset=3D1
>=20
> [   60.563598] BUG: unable to handle page fault for address:
> ffffb80602983ff0 [   60.570478] #PF: supervisor write access in kernel mo=
de
> [   60.575701] #PF: error_code(0x0002) - not-present page
> [   60.580833] PGD 813498067 P4D 813498067 PUD 813499067 PMD 80e0e0067 PT=
E 0
> [   60.587619] Oops: 0002 [#1] PREEMPT SMP NOPTI
> [   60.591979] CPU: 4 PID: 242 Comm: irq/34-xhci_hcd Tainted: G          =
 O=20
>   T 5.4.42-gentoo #1 [   60.600585] Hardware name: Supermicro H8SCM/H8SCM,
> BIOS 3.5b       03/18/2016 [   60.607723] RIP: 0010:__memcpy+0x12/0x20
> [   60.611646] Code: c1 e2 20 48 09 c2 48 31 d3 e9 71 ff ff ff 90 90 90 90
> 90 90 90 90 90 90 0f 1f 44 00 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07
> <f3> 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4 [ =20
> 60.630401] RSP: 0018:ffffb806004a3c80 EFLAGS: 00010046
> [   60.635628] RAX: ffffb80602983ff0 RBX: 0000000000000010 RCX:
> 000000000000000a [   60.642759] RDX: 0000000000000000 RSI: ffff9d5f6659b0=
00
> RDI: ffffb80602983ff0 [   60.649883] RBP: ffff9d5f62c38c00 R08:
> 0000000000000002 R09: 0000000000000000 [   60.657017] R10: 00000000000000=
02
> R11: 0000000000000001 R12: 0000000000000050 [   60.664160] R13:
> 0000000000000000 R14: 0000000000079ff0 R15: ffff9d608c1d4908 [   60.67129=
3]
> FS:  0000000000000000(0000) GS:ffff9d6096b00000(0000)
> knlGS:0000000000000000 [   60.679380] CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> [   60.685125] CR2: ffffb80602983ff0 CR3: 000000080f55c000 CR4:
> 00000000000406e0 [   60.692258] Call Trace:
> [   60.694719]  retire_capture_urb+0x201/0x270 [snd_usb_audio]
> [   60.700288]  snd_complete_urb+0x1b7/0x270 [snd_usb_audio]
> [   60.705686]  __usb_hcd_giveback_urb+0x77/0xe0
> [   60.710054]  xhci_giveback_urb_in_irq.isra.0+0x6d/0x100
> [   60.715278]  xhci_td_cleanup+0xc4/0xe0
> [   60.719032]  xhci_irq+0x825/0x1780
> [   60.722438]  ? __schedule+0x2c3/0x650
> [   60.726105]  ? irq_finalize_oneshot.part.0+0xd0/0xd0
> [   60.731071]  irq_forced_thread_fn+0x25/0x70
> [   60.735257]  irq_thread+0xea/0x170
> [   60.738672]  ? wake_threads_waitq+0x30/0x30
> [   60.742859]  kthread+0xf8/0x130
> [   60.746005]  ? irq_thread_check_affinity+0x90/0x90
> [   60.750805]  ? kthread_park+0x90/0x90
> [   60.754473]  ret_from_fork+0x22/0x40
> [   60.758053] Modules linked in: ebtable_filter ebtables bridge stp llc
> netconsole wireguard ip6_udp_tunnel udp_tunnel xt_limit xt_comment
> xt_recent xt_multiport xt_MASQUERADE iptable_nat nf_nat
> nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6table_raw
> iptable_raw snd_seq_midi snd_seq_midi_event amd64_edac_mod kvm_amd kvm
> pcspkr irqbypass uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4=
l2
> videodev snd_hda_codec_hdmi videobuf2_common snd_hda_intel joydev
> snd_intel_nhlt snd_hda_codec snd_usb_audio sp5100_tco snd_usbmidi_lib
> snd_rawmidi snd_hwdep e1000e snd_hda_core snd_pcm nfsd tcp_yeah tcp_vegas
> sch_fq_codel uas amdgpu crc32c_intel mgag200 drm_vram_helper gpu_sched ttm
> vhost_scsi target_core_mod configfs vhost_net tun tap vhost vhba(O) jc42
> ipmi_si ipmi_devintf ipmi_msghandler fuse eeprom [   60.828924] CR2:
> ffffb80602983ff0
> [   60.832245] ---[ end trace 1945ea8b50798a03 ]---
> [   60.836862] RIP: 0010:__memcpy+0x12/0x20
> [   60.840797] Code: c1 e2 20 48 09 c2 48 31 d3 e9 71 ff ff ff 90 90 90 90
> 90 90 90 90 90 90 0f 1f 44 00 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07
> <f3> 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4 [ =20
> 60.859553] RSP: 0018:ffffb806004a3c80 EFLAGS: 00010046
> [   60.864778] RAX: ffffb80602983ff0 RBX: 0000000000000010 RCX:
> 000000000000000a [   60.871911] RDX: 0000000000000000 RSI: ffff9d5f6659b0=
00
> RDI: ffffb80602983ff0 [   60.879036] RBP: ffff9d5f62c38c00 R08:
> 0000000000000002 R09: 0000000000000000 [   60.886168] R10: 00000000000000=
02
> R11: 0000000000000001 R12: 0000000000000050 [   60.893301] R13:
> 0000000000000000 R14: 0000000000079ff0 R15: ffff9d608c1d4908 [   60.90045=
3]
> FS:  0000000000000000(0000) GS:ffff9d6096b00000(0000)
> knlGS:0000000000000000 [   60.908538] CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> [   60.914276] CR2: ffffb80602983ff0 CR3: 000000080f55c000 CR4:
> 00000000000406e0 [   60.921411] Kernel panic - not syncing: Fatal excepti=
on
> in interrupt [   60.927783] Kernel Offset: 0x21000000 from
> 0xffffffff81000000 (relocation range:
> 0xffffffff80000000-0xffffffffbfffffff) [   60.938554] ---[ end Kernel pan=
ic
> - not syncing: Fatal exception in interrupt ]---




