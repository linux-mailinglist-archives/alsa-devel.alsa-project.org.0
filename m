Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F36A118C30
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 191F8171D;
	Tue, 10 Dec 2019 16:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 191F8171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990762;
	bh=m9iQuQnXL2jalbhlfzNl95Rfe7Hu7c5cvU45RX5MJHU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LONjXv6e/vuJCJpObkmQNvcLlRq2o7k2QotjY0qr0C6008cp8SARlr51PhFgeepz6
	 K+eH0ynlsdOspmty5THlsBb/D6F9bM8P9S95O77sSF55v2FnnIcXKv8Hg4oKtX+kXr
	 XyTAJverfWVMfm2Flt/VG3pJZ7Z1kKu7MaMogsrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D919BF800F3;
	Tue, 10 Dec 2019 16:10:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 394DFF8020C; Tue, 10 Dec 2019 16:10:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tschil.ethgen.ch (tschil.ethgen.ch [5.9.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF48F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF48F800F3
Received: from [192.168.17.4] (helo=ikki.ket)
 by tschil.ethgen.ch with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus@ethgen.ch>)
 id 1ieh9p-0005no-OF; Tue, 10 Dec 2019 16:10:37 +0100
Received: from klaus by ikki.ket with local (Exim 4.93-RC7)
 (envelope-from <klaus@ethgen.ch>)
 id 1ieh9p-0001SK-Ap; Tue, 10 Dec 2019 16:10:37 +0100
Date: Tue, 10 Dec 2019 16:10:37 +0100
From: Klaus Ethgen <Klaus@ethgen.ch>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210151036.GB23758@ikki.ethgen.ch>
References: <20191202184759.GB29478@ikki.ethgen.ch>
 <s5hy2vsjbm3.wl-tiwai@suse.de>
 <20191207200643.GA10092@ikki.ethgen.ch>
 <s5h4kybciir.wl-tiwai@suse.de>
 <20191208173127.GE4433@ikki.ethgen.ch>
 <s5hmuc2asa7.wl-tiwai@suse.de>
 <20191209085716.GA12935@ikki.ethgen.ch>
 <s5h4ky9hmro.wl-tiwai@suse.de>
 <20191210143245.GA30160@ikki.ethgen.ch>
 <s5ho8wgw8an.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5ho8wgw8an.wl-tiwai@suse.de>
OpenPGP: id=79D0B06F4E20AF1C;
 url=http://www.ethgen.ch/~klaus/79D0B06F4E20AF1C.txt; preference=signencrypt
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] CPU hook snd_hda_intel
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
Content-Type: multipart/mixed; boundary="===============7324771261487639021=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7324771261487639021==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi Takashi,

Am Di den 10. Dez 2019 um 15:43 schrieb Takashi Iwai:
> > There is also a issue with a swapper thread in ath9k code but the one
> > with the biggest CPU hook is still alsa.
> 
> Do you see the relevant kernel messages, e.g. switch to polling mode?

Nope.

Here is the relevant logs starting from undocking event up to the sleep
that I mentioned fixing the issue:
   Dec 10 15:19:12 chua kernel: [14611.133847] ACPI: \_SB_.GDCK: undocking
   Dec 10 15:19:12 chua kernel: [14611.137923] usb 1-4: USB disconnect, device number 5
   Dec 10 15:19:13 chua kernel: [14611.360780] thinkpad_acpi: woke up due to a hot-unplug request...
   Dec 10 15:19:13 chua kernel: [14611.361034] thinkpad_acpi: undocked
   Dec 10 15:19:13 chua kernel: [14611.361509] ACPI: \_SB_.GDCK: undocking
   Dec 10 15:19:16 chua kernel: [14614.688138] Monitor-Mwait will be used to enter C-3 state
   Dec 10 15:19:16 chua kernel: [14614.909277] sd 0:0:0:0: [sda] Synchronizing SCSI cache
   Dec 10 15:19:16 chua kernel: [14614.910426] sd 0:0:0:0: [sda] Stopping disk
   Dec 10 15:19:17 chua kernel: [14615.279585] e1000e: eth0 NIC Link is Down
   Dec 10 15:19:17 chua kernel: [14615.995311] sd 0:0:0:0: [sda] Starting disk
   Dec 10 15:19:18 chua kernel: [14616.840213] BTRFS warning (device dm-3): excessive commit interval 600
   Dec 10 15:19:18 chua kernel: [14616.840217] BTRFS info (device dm-3): disk space caching is enabled
   [more of the last two lines]
   Dec 10 15:19:19 chua kernel: [14617.856624] e1000e: eth0 NIC Link is Down
   Dec 10 15:19:26 chua kernel: [14624.416815] wlan0: authenticate with 1a:e8:29:62:36:fc
   Dec 10 15:19:26 chua kernel: [14624.422409] wlan0: send auth to 1a:e8:29:62:36:fc (try 1/3)
   Dec 10 15:19:26 chua kernel: [14624.450142] wlan0: authenticated
   Dec 10 15:19:26 chua kernel: [14624.450480] wlan0: associate with 1a:e8:29:62:36:fc (try 1/3)
   Dec 10 15:19:26 chua kernel: [14624.455014] wlan0: RX AssocResp from 1a:e8:29:62:36:fc (capab=0x411 status=0 aid=3)
   Dec 10 15:19:26 chua kernel: [14624.455363] wlan0: associated
   Dec 10 15:19:26 chua kernel: [14624.460321] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
   Dec 10 15:19:42 chua kernel: [14640.895731] e1000e: eth0 NIC Link is Down
   Dec 10 15:19:52 chua kernel: [14650.415684] e1000e: eth0 NIC Link is Down
   Dec 10 15:19:55 chua kernel: [14653.332765] wlan0: authenticate with 1a:e8:29:62:36:fc
   Dec 10 15:19:55 chua kernel: [14653.337337] wlan0: send auth to 1a:e8:29:62:36:fc (try 1/3)
   Dec 10 15:19:55 chua kernel: [14653.397026] wlan0: send auth to 1a:e8:29:62:36:fc (try 2/3)
   Dec 10 15:19:55 chua kernel: [14653.463283] wlan0: send auth to 1a:e8:29:62:36:fc (try 3/3)
   Dec 10 15:19:55 chua kernel: [14653.522603] wlan0: authentication with 1a:e8:29:62:36:fc timed out
   Dec 10 15:20:34 chua kernel: [14692.783662] e1000e: eth0 NIC Link is Down
   Dec 10 15:23:36 chua kernel: [14874.223723] perf: interrupt took too long (2597 > 2500), lowering kernel.perf_event_max_sample_rate to 77000
   Dec 10 15:23:36 chua kernel: [14874.227937] perf: interrupt took too long (3335 > 3246), lowering kernel.perf_event_max_sample_rate to 59000
   Dec 10 15:23:36 chua kernel: [14874.232928] perf: interrupt took too long (4169 > 4168), lowering kernel.perf_event_max_sample_rate to 47000
   Dec 10 15:23:36 chua kernel: [14874.241582] perf: interrupt took too long (5233 > 5211), lowering kernel.perf_event_max_sample_rate to 38000
   Dec 10 15:23:36 chua kernel: [14874.252231] perf: interrupt took too long (6548 > 6541), lowering kernel.perf_event_max_sample_rate to 30000
   Dec 10 15:23:36 chua kernel: [14874.267034] perf: interrupt took too long (8211 > 8185), lowering kernel.perf_event_max_sample_rate to 24000
   Dec 10 15:23:36 chua kernel: [14874.295426] perf: interrupt took too long (10276 > 10263), lowering kernel.perf_event_max_sample_rate to 19000
   Dec 10 15:23:37 chua kernel: [14875.392080] perf: interrupt took too long (12851 > 12845), lowering kernel.perf_event_max_sample_rate to 15000
   Dec 10 15:24:09 chua kernel: [14907.880874] e1000e: eth0 NIC Link is Down
   Dec 10 15:24:12 chua kernel: [14910.754897] wlan0: authenticate with 1a:e8:29:e1:1c:4b
   Dec 10 15:24:12 chua kernel: [14910.759170] wlan0: send auth to 1a:e8:29:e1:1c:4b (try 1/3)
   Dec 10 15:24:12 chua kernel: [14910.764932] wlan0: authenticated
   Dec 10 15:24:12 chua kernel: [14910.765477] wlan0: associate with 1a:e8:29:e1:1c:4b (try 1/3)
   Dec 10 15:24:12 chua kernel: [14910.778257] wlan0: RX AssocResp from 1a:e8:29:e1:1c:4b (capab=0x431 status=0 aid=8)
   Dec 10 15:24:12 chua kernel: [14910.778651] wlan0: associated
   Dec 10 15:24:12 chua kernel: [14910.785585] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
   Dec 10 15:33:47 chua kernel: [15485.695970] wlan0: deauthenticating from 1a:e8:29:e1:1c:4b by local choice (Reason: 3=DEAUTH_LEAVING)
   Dec 10 15:33:48 chua kernel: [15486.359726] e1000e: eth0 NIC Link is Down
   Dec 10 15:33:49 chua kernel: [15487.208769] e1000e: eth0 NIC Link is Down
   Dec 10 15:33:49 chua kernel: [15487.717376] ath9k: ath9k: Driver unloaded
   Dec 10 15:33:50 chua kernel: [15488.357624] PM: suspend entry (deep)
   Dec 10 15:33:55 chua kernel: [15488.381517] Filesystems sync: 0.023 seconds
   Dec 10 15:33:55 chua kernel: [15488.381942] Freezing user space processes ... (elapsed 0.001 seconds) done.
   Dec 10 15:33:55 chua kernel: [15488.383328] OOM killer disabled.
   Dec 10 15:33:55 chua kernel: [15488.383329] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
   Dec 10 15:33:55 chua kernel: [15488.384424] printk: Suspending console(s) (use no_console_suspend to debug)
   Dec 10 15:33:55 chua kernel: [15488.386563] sd 0:0:0:0: [sda] Synchronizing SCSI cache
   Dec 10 15:33:55 chua kernel: [15488.387436] sd 0:0:0:0: [sda] Stopping disk
   Dec 10 15:33:55 chua kernel: [15488.407871] serial 00:05: disabled
   Dec 10 15:33:55 chua kernel: [15488.409065] e1000e: EEE TX LPI TIMER: 00000000
   Dec 10 15:33:55 chua kernel: [15488.497441] snd_hdac_bus_update_rirb: 58 callbacks suppressed
   Dec 10 15:33:55 chua kernel: [15488.497449] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497453] snd_hda_intel 0000:00:1b.0: spurious response 0x7fffffff:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497457] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497461] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497464] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497468] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497471] snd_hda_intel 0000:00:1b.0: spurious response 0x7fffffff:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497475] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497478] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.497481] snd_hda_intel 0000:00:1b.0: spurious response 0x0:0x0, last cmd=0x11f0900
   Dec 10 15:33:55 chua kernel: [15488.554013] ACPI: EC: interrupt blocked
   Dec 10 15:33:55 chua kernel: [15488.566977] ACPI: Preparing to enter system sleep state S3
   Dec 10 15:33:55 chua kernel: [15488.583067] ACPI: EC: event blocked
   Dec 10 15:33:55 chua kernel: [15488.583069] ACPI: EC: EC stopped
   Dec 10 15:33:55 chua kernel: [15488.583070] PM: Saving platform NVS memory
   Dec 10 15:33:55 chua kernel: [15488.583426] Disabling non-boot CPUs ...
   Dec 10 15:33:55 chua kernel: [15488.584808] smpboot: CPU 1 is now offline

> > Let me add that this time I encountered the issue after taking the
> > laptop from the docking station.
> 
> ... this can be the cause: the hardware doesn't react to the pin jack
> sense request for the dock that isn't present any longer.
> Or something goes wrong here, repeating, etc.

I think, it might have to do with that as I often use the dock.

However, I think, I even seen the problem after I did a fresh boot far
away from the dock.

> > After sending it to sleep and waking it up again, the problem is gone
> > (as it often can be solved).
> 
> So the problem is very likely some flaky hardware response.

Anything you think can be done against that?

Regards
   Klaus
-- 
Klaus Ethgen                                       http://www.ethgen.ch/
pub  4096R/4E20AF1C 2011-05-16            Klaus Ethgen <Klaus@Ethgen.ch>
Fingerprint: 85D4 CA42 952C 949B 1753  62B3 79D0 B06F 4E20 AF1C

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Charset: ISO-8859-1

iQGzBAABCgAdFiEEMWF28vh4/UMJJLQEpnwKsYAZ9qwFAl3vtWcACgkQpnwKsYAZ
9qztZwv/TPzOoc7wPSfFLMXZ8nd/bbtxGEAjFrUuCaOm9QX5QyuAKDRVV3HPT+/E
O0vkA5r9Fj3sLBAJZ6pUhdpIJ2U9RkH7kzo/H2njjmPcv8QAwNV5+/yguXeA1vjK
zckjIsgbdyv/jFxNyXHpD0NHfD2buzHqHL5qGLu8mbIZ6S60miSguVW6gzuFdS3I
zh90pxOO1dEvfUdtd0sljRYVo6HRN9ACu+x/Q2FVoaEVPHym28b/6k2pznk9lig7
Bw2nVrllAtICFvvhQGgwyhjDIUGKGNWcydgR2rDUXSeJK4dXvMkV/BRR/YqZrZpe
6Jb1U9v4fz0M1X3KTz8YhuwxatZ1Bm1S0VamE9shXh5v9X7nXjUK10fD9kudlLky
Cw9c7JuZNhD72au0xR0/eHKTdi9ly4NZe5Nr2NtorkpP2mDKUoMB7xdvYhcr0sFG
nVDRodlDOeTp7zVj6BtJEDHQaFq/KrpHUjAj5UcTFt0pocYpSxDa/mMXIr7ZFxqx
5aQEfReX
=wF7K
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

--===============7324771261487639021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7324771261487639021==--
