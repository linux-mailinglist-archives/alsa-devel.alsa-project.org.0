Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46022295C45
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 11:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42F617B8;
	Thu, 22 Oct 2020 11:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42F617B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603360349;
	bh=u8Ug0Sis7rt3w9Xz/Y9z0ONlTZx7KqpW8UmbP0ft6jo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wj4sbJj8rK8+bbrq7zxYTWw8AHKqUpiNrT0g2MGNm5VSbGszTTr3zplUNKqQD6LD1
	 GfnZx6Ufu4LBivObI00TXy/MiFMKFc/CFSWNUBNPEBtZv8aoA6Y10MXN4HuqKakmR9
	 uIkopBJsSig0rPKuEfTvkR06WAu7jNgLiq4WdbzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD77F800CE;
	Thu, 22 Oct 2020 11:50:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8E9FF804A9; Thu, 22 Oct 2020 11:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DB7BF80247
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 11:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB7BF80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="G2SoQpON"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FlxBKD1V"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BD8B5C010D;
 Thu, 22 Oct 2020 05:50:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Oct 2020 05:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=6BHBolasL6AWLQMU1Q79xtHYTVSi6GRqnV5yGU5u1bY=; b=G2SoQpON
 +S6bFzg7pDzYLNs9U8EN6+k9OZJKfHTiqTG1HIq/0mOI//xMX4D0/yovv7G+fecM
 ox1NVDe3qdN2NkEGXhPmNaj2ik4uiGxyQi1Nfhg8zetyVic7pFifRP2tFXEkMfho
 Bmxy+xkUqLhXL+tG1m6opWHwOkX9c/r43ta/h8R8KBNre8Cozs1L0ag76CWh/HEE
 myEOcfjWnTo29Bl2sFWMEo7gh7kMMltkT9vLa2lYTILdU3vWRm2FXnER+vQdYvTq
 ySLQinewqJWdbrtn1PU2rN8cgeFA3OEMjpidmRShQRm3h2FSMxJdRBwyQJaydk1i
 ojgDRyJe890fSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=6BHBolasL6AWLQMU1Q79xtHYTVSi6
 GRqnV5yGU5u1bY=; b=FlxBKD1VsefiOYh3FaBdulr3toW7MJoBWWvQOSeAdoYlX
 mdR6ePWJ+A/U0iiHR1Bglj9JO8GkWvBWGFSJ4LdwB3h3CogrpTqUXnO93oBE6P6t
 XT4yotgdgPAmVJSYYYdWgZWFZe4tgK4p8gL7KKJn8cchQ56LEsh2qPyy4burirOM
 B2X3CC6GQKxl8uOxmAUlclbPlws5jKK5r5zav/PCcQMKd/iSwLTnIAxBTTr774CS
 M4mGTDZ4QpYXvu2LJou1ty9mPtb+4P9VotGbbFO2hM6mIpu16ygGGremppy5Ef+v
 1CDUdZFcrREDSVtaj5p9SG0Ypviwrw1ZDXYqogsgA==
X-ME-Sender: <xms:9FWRX9MTBCxF2Dtpy2-hj_SJtWa7FpxG65ZNPct2hQULVFmtcdthkQ>
 <xme:9FWRX_8eBvDO8iWDv8cDOuEUVtu-FZT7JIux4yFs4s3OAPuWl_0N-e6Mn86vMcLKa
 TO4aCOOCHi_H79tYjU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeejgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpefgvdeutddvvedvvddvtdehvedvleeghfeghfeluedvhfehudfhheffuefhjeffgeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeine
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9FWRX8Sk6F7QOATCjwGEmiR-cIrG59bYL_qT0sCzOP_CRMdRsCvjeg>
 <xmx:9FWRX5urqY6GePE47ubL7kv44-1AGr2-g_nkA5BYPRVBuwEzPYmNUQ>
 <xmx:9FWRX1cXkwdS8ziYCNsqxu6Nz1NptpNGKy-lKv2d8INp382_xGfqTg>
 <xmx:9VWRX9QTOvzxYFzhPkqUT9zRvVItwNMzhgUYWITSUUYJG5kqGDHtKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E04E13280064;
 Thu, 22 Oct 2020 05:50:43 -0400 (EDT)
Date: Thu, 22 Oct 2020 11:50:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Context expectations in ALSA
Message-ID: <20201022095041.44jytaelnlako54w@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gvzixar4mrubl242"
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Dom Cobley <dom@raspberrypi.com>
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


--gvzixar4mrubl242
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

We currently have an issue reported by lockdep on the RaspberryPi and
its HDMI audio output where, at startup, we end up scheduling in atomic
context.

This is caused by the HDMI driver polling some status bit that reports
that the infoframes have been properly sent, and calling usleep_range
between each iteration[1], and that is done in our trigger callback that
seems to be run with a spinlock taken and the interrupt disabled
(snd_pcm_action_lock_irq) as part of snd_pcm_start_lock_irq. This is the
entire stack trace:

# aplay --channels=3D2 -D 'iec958:CARD=3Dvc4hdmi0,DEV=3D0' /root/test-tone.=
wav
Playing WAVE '/root/test-tone.wav' : Signed 16 bit Little Endian, Rate 4410=
0 Hz, Stereo
[   14.732730] BUG: sleeping function called from invalid context at driver=
s/gpu/drm/vc4/vc4_hdmi.c:276
[   14.742005] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 140=
, name: aplay
[   14.749955] CPU: 0 PID: 140 Comm: aplay Not tainted 5.9.0-rc5-v7l+ #66
[   14.756578] Hardware name: BCM2711
[   14.760026] Backtrace:=20
[   14.762524] [<c020d250>] (dump_backtrace) from [<c020d5f4>] (show_stack+=
0x20/0x24)
[   14.770209]  r7:c167c9e4 r6:600e0093 r5:00000000 r4:c167c9e4
[   14.775960] [<c020d5d4>] (show_stack) from [<c0703164>] (dump_stack+0xb8=
/0xd8)
[   14.783297] [<c07030ac>] (dump_stack) from [<c025108c>] (___might_sleep+=
0x138/0x17c)
[   14.791159]  r10:00000084 r9:f0979b00 r8:c10ffd50 r7:00000010 r6:0000000=
0 r5:00000114
[   14.799105]  r4:c10fe000 r3:600e0093
[   14.802736] [<c0250f54>] (___might_sleep) from [<c0251140>] (__might_sle=
ep+0x70/0xb0)
[   14.810680]  r4:c0e8f5f4
[   14.813256] [<c02510d0>] (__might_sleep) from [<c0840724>] (vc4_hdmi_sto=
p_packet+0x120/0x330)
[   14.821907]  r6:ef21f280 r5:00000003 r4:73e746f9
[   14.826598] [<c0840604>] (vc4_hdmi_stop_packet) from [<c084422c>] (vc4_h=
dmi_write_infoframe+0x140/0x5d0)
[   14.836220]  r9:f0979b00 r8:c10ffd50 r7:ef219900 r6:ef248840 r5:00000000=
 r4:ef21f280
[   14.844084] [<c08440ec>] (vc4_hdmi_write_infoframe) from [<c0844718>] (v=
c4_hdmi_set_audio_infoframe+0x5c/0x80)
[   14.854236]  r10:efac7738 r9:ef3ea240 r8:00000001 r7:ef219900 r6:ef24884=
0 r5:ef21f040
[   14.862180]  r4:ef21f280
[   14.864756] [<c08446bc>] (vc4_hdmi_set_audio_infoframe) from [<c0844774>=
] (vc4_hdmi_audio_trigger+0x38/0x238)
[   14.874815]  r4:00000001
[   14.877392] [<c084473c>] (vc4_hdmi_audio_trigger) from [<c0a155f0>] (snd=
_soc_pcm_dai_trigger+0x64/0xcc)
[   14.886923]  r5:efac5a00 r4:00000000
[   14.890555] [<c0a1558c>] (snd_soc_pcm_dai_trigger) from [<c0a18c70>] (so=
c_pcm_trigger+0x70/0xac)
[   14.899472]  r9:ef3ea240 r8:c1133540 r7:00000003 r6:ef219900 r5:ef219900=
 r4:00000001
[   14.907336] [<c0a18c00>] (soc_pcm_trigger) from [<c09fbd84>] (snd_pcm_do=
_start+0x3c/0x40)
[   14.915633]  r5:c0c749dc r4:00000000
[   14.919264] [<c09fbd48>] (snd_pcm_do_start) from [<c09fa390>] (snd_pcm_a=
ction_single+0x48/0x88)
[   14.928094] [<c09fa348>] (snd_pcm_action_single) from [<c09fc830>] (snd_=
pcm_action+0x6c/0x78)
[   14.936746]  r7:00000003 r6:c0c749dc r5:00000000 r4:ef219900
[   14.942493] [<c09fc7c4>] (snd_pcm_action) from [<c09fd7ec>] (snd_pcm_act=
ion_lock_irq+0x38/0x50)
[   14.951320]  r7:00000030 r6:00000003 r5:c0c749dc r4:ef219900
[   14.957069] [<c09fd7b4>] (snd_pcm_action_lock_irq) from [<c09ffd2c>] (sn=
d_pcm_ioctl+0x930/0x14e4)
[   14.966073]  r7:00000030 r6:00000000 r5:0085ee60 r4:ef219900
[   14.971823] [<c09ff3fc>] (snd_pcm_ioctl) from [<c043accc>] (sys_ioctl+0x=
e4/0x9e4)
[   14.979420]  r10:efac7738 r9:00000004 r8:c1133540 r7:0085ee60 r6:0000562=
4 r5:c1133540
[   14.987364]  r4:00004142
[   14.989940] [<c043abe8>] (sys_ioctl) from [<c0200040>] (ret_fast_syscall=
+0x0/0x28)
[   14.997621] Exception stack(0xc10fffa8 to 0xc10ffff0)
[   15.002749] ffa0:                   00869260 b6fa8000 00000004 00004142 =
0085ee60 00000001
[   15.011050] ffc0: 00869260 b6fa8000 00005624 00000036 00000000 00000000 =
00001589 00001589
[   15.019350] ffe0: b6fa8504 bedb59fc b6f2ff68 b6da515c
[   15.024479]  r10:00000036 r9:c10fe000 r8:c0200204 r7:00000036 r6:0000562=
4 r5:b6fa8000
[   15.032423]  r4:00869260

We could switch to a udelay instead, but the idea of busy-waiting for up
to a 100ms while having the interrupt disabled doesn't sound ideal
either.

It looks like the snd_soc_dai_link structure has a nonatomic flag that
seems to be made to address more or less that issue, taking a mutex
instead of a spinlock. However setting that flag results in another
lockdep issue, since the dmaengine controller doing the DMA transfer
would call snd_pcm_period_elapsed on completion, in a tasklet, this time
taking a mutex in an atomic context which is just as bad as the initial
issue. This is the stacktrace this time:

# aplay --channels=3D2 -D 'iec958:CARD=3Dvc4hdmi0,DEV=3D0' /root/test-tone.=
wav
Playing WAVE '/root/test-tone.wav' : Signed 16 bit Little Endian, Rate 4410=
0 Hz, Stereo
[   43.078900] BUG: sleeping function called from invalid context at kernel=
/locking/mutex.c:281
[   43.087485] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, na=
me: swapper/0
[   43.095452] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.9.0-rc5-v7l+ #67
[   43.102252] Hardware name: BCM2711
[   43.105701] Backtrace:=20
[   43.108199] [<c020d250>] (dump_backtrace) from [<c020d5f4>] (show_stack+=
0x20/0x24)
[   43.115884]  r7:c167c9e4 r6:600e0113 r5:00000000 r4:c167c9e4
[   43.121636] [<c020d5d4>] (show_stack) from [<c0703164>] (dump_stack+0xb8=
/0xd8)
[   43.128972] [<c07030ac>] (dump_stack) from [<c025108c>] (___might_sleep+=
0x138/0x17c)
[   43.136833]  r10:c1600000 r9:00000006 r8:00000000 r7:c1601d70 r6:0000000=
0 r5:00000119
[   43.144777]  r4:c1600000 r3:600e0113
[   43.148409] [<c0250f54>] (___might_sleep) from [<c0251140>] (__might_sle=
ep+0x70/0xb0)
[   43.156353]  r4:c0e32994
[   43.158930] [<c02510d0>] (__might_sleep) from [<c0baf508>] (mutex_lock+0=
x2c/0x74)
[   43.166524]  r6:efbfaa84 r5:ef26f548 r4:ef219998
[   43.171216] [<c0baf4dc>] (mutex_lock) from [<c09fa82c>] (_snd_pcm_stream=
_lock_irqsave+0x2c/0x40)
[   43.180130]  r5:ef26f548 r4:ef219900
[   43.183765] [<c09fa800>] (_snd_pcm_stream_lock_irqsave) from [<c0a03848>=
] (snd_pcm_period_elapsed+0x20/0xa4)
[   43.193743] [<c0a03828>] (snd_pcm_period_elapsed) from [<c0a067d4>] (dma=
engine_pcm_dma_complete+0x54/0x58)
[   43.203539]  r7:c1601d70 r6:efbfaa84 r5:ef26f548 r4:00000000
[   43.209290] [<c0a06780>] (dmaengine_pcm_dma_complete) from [<c07885e8>] =
(vchan_complete+0x238/0x240)
[   43.218567] [<c07883b0>] (vchan_complete) from [<c0228f9c>] (tasklet_act=
ion_common.constprop.0+0x84/0x12c)
[   43.228365]  r10:c1600000 r9:00000006 r8:00000000 r7:dac802e0 r6:efbfaa8=
4 r5:00000000
[   43.236309]  r4:efbfaa80
[   43.238886] [<c0228f18>] (tasklet_action_common.constprop.0) from [<c022=
906c>] (tasklet_action+0x28/0x30)
[   43.248596]  r9:00000040 r8:ef80b800 r7:00000101 r6:00000006 r5:00000007=
 r4:c1603098
[   43.256459] [<c0229044>] (tasklet_action) from [<c0201284>] (__do_softir=
q+0x18c/0x47c)
[   43.264498] [<c02010f8>] (__do_softirq) from [<c0228de4>] (irq_exit+0xd0=
/0xf8)
[   43.271829]  r10:c1051f40 r9:c1600000 r8:ef80b800 r7:00000001 r6:0000000=
0 r5:00000000
[   43.279774]  r4:ffffe000
[   43.282349] [<c0228d14>] (irq_exit) from [<c0287c54>] (__handle_domain_i=
rq+0x70/0xc0)
[   43.290294]  r5:00000000 r4:c148ee80
[   43.293927] [<c0287be4>] (__handle_domain_irq) from [<c071d8b4>] (gic_ha=
ndle_irq+0x4c/0x88)
[   43.302403]  r9:c1600000 r8:c1601ed0 r7:f0803000 r6:f0802000 r5:f080200c=
 r4:c16058d8
[   43.310266] [<c071d868>] (gic_handle_irq) from [<c0200abc>] (__irq_svc+0=
x5c/0x7c)
[   43.317856] Exception stack(0xc1601ed0 to 0xc1601f18)
[   43.322983] 1ec0:                                     c0208b84 00000000 =
19bf8000 600e0093
[   43.331283] 1ee0: c1600000 00000000 c1604e34 c1604e7c c16d20e5 c0e30cac =
c1051f40 c1601f2c
[   43.339582] 1f00: ffffe000 c1601f20 c1600000 c0208b88 600e0013 ffffffff
[   43.346297]  r9:c1600000 r8:c16d20e5 r7:c1601f04 r6:ffffffff r5:600e0013=
 r4:c0208b88
[   43.354164] [<c0208b54>] (arch_cpu_idle) from [<c0bb23c8>] (default_idle=
_call+0x3c/0x184)
[   43.362469] [<c0bb238c>] (default_idle_call) from [<c025b5f8>] (do_idle+=
0x110/0x170)
[   43.370327]  r5:00000000 r4:c1600000
[   43.373958] [<c025b4e8>] (do_idle) from [<c025b950>] (cpu_startup_entry+=
0x28/0x2c)
[   43.381641]  r9:00000193 r8:effff900 r7:c1604e00 r6:00000000 r5:c160ec50=
 r4:000000d7
[   43.389503] [<c025b928>] (cpu_startup_entry) from [<c0baa65c>] (rest_ini=
t+0x108/0x110)
[   43.397542] [<c0baa554>] (rest_init) from [<c1000cc8>] (arch_call_rest_i=
nit+0x18/0x1c)
[   43.405575]  r5:c1051f40 r4:c16e7078
[   43.409205] [<c1000cb0>] (arch_call_rest_init) from [<c1001538>] (start_=
kernel+0x7f4/0x834)
[   43.417682] [<c1000d44>] (start_kernel) from [<00000000>] (0x0)


So, I'm not really sure what I'm supposed to do here. The drivers
involved don't appear to be doing anything extraordinary, but the issues
lockdep report are definitely valid too. What are the expectations in
terms of context from ALSA when running the callbacks, and how can we
fix it?

Thanks!
Maxime

1: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/gpu/drm/vc4/vc4_hdmi.c#n234

--gvzixar4mrubl242
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5FV8QAKCRDj7w1vZxhR
xd+YAP4qhrOcrrRABpAqke0n1wCMBK8Tuns2MtNAWplJyBAUMgEAwG0fqoF3xPd8
CLTH9Y/74KG7s9Y9hIQtMjrtoEZebgk=
=FjFM
-----END PGP SIGNATURE-----

--gvzixar4mrubl242--
