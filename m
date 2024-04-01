Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC1893A00
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23AC211E;
	Mon,  1 Apr 2024 12:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23AC211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966195;
	bh=8MW5OpbtrrbMHpzNgoIW9QJ0VF5eypkJ+yrIiV87rno=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k7P27PxERgUXAEDq+xDKuwMKysJaeio/71CGCdMjXNILExgVu72fXNlLq40IehXeJ
	 RfeV9a7Pu8GRptF7S+yivRbG0tlqKQN8Ao6x9uMUmCQduFhzD8MF278C0OQm1BKgLF
	 AAlg7lSC3Jp6DV3dHs8BiCbB/sWVtbo3yB817vH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2FCDF805AD; Mon,  1 Apr 2024 12:08:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B54F8068D;
	Mon,  1 Apr 2024 12:08:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAC5DF80639; Mon,  1 Apr 2024 12:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 980AEF80571
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 980AEF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Sig8/kRl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966063; x=1712570863;
	i=oswald.buddenhagen@gmx.de;
	bh=zA1ok5yBOL2LLratQpzNUsGGXC5oTQ+6wOZiBM6xqhY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Sig8/kRlYOCtXdwFn4izq125Do47EKWPeSLKa0VDFuMxhdGPh0De2iWmwZNSf7gY
	 o8/Z8YKV0Vy3Vzm0EYWX2PVaTEWXS1v55rWB5kCjolztlrFYWkyjbvFfGTt4xzqwK
	 0JBTQKICtgGLHAKzkp4sZU83VMHunZRvqW5XQDJ6yWMdef0DdiLgtJIglrZW0N0oL
	 cR98r2RzBLVIBRnF6EeGA/a/BxGIyS098xl1Yq12kSdvfDzaz56sIU+tKQTrxLC9e
	 zVGqKffntqwd4EDdk7dsFu4PXz8h/z6NE7AQc2DA4kzmyjHmVqSBgK2BKj8H+InC3
	 kw5L/gds3m9x0HQswg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1sjKdG0pWv-00sKx2; Mon, 01
 Apr 2024 12:07:43 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7dk-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 00/18] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
Date: Mon,  1 Apr 2024 12:07:24 +0200
Message-ID: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TH5zHCELIGe+1edxNeulP0ibw7gWPR8n0RMn7Hy/N7AKnMRdVxD
 tfGJIGaS9P2V/Du1KjGb+VYKBx089mNjNHLQiQTBXoSJOSrTCepemNuzEyKPhcKccjrRniP
 td8dQrf6nnbbMtvPmczJA7rxJzE+bj3pRlEIr1BOKdI8n2wd/tAVrJb2jRF4EZAa2daHqaS
 G1HeM8CeMOAqQx1IB/Pqg==
UI-OutboundReport: notjunk:1;M01:P0:mnboBamyI/E=;YvEHpHMtAf4XT/vGGH1tSat0dAM
 EV4BpdbFcxd71lz7Vjbo0AcRkmaKj6qolvkA845ok3IXka/NMZh5xBLFwyHGnyeZu/TBve0Cg
 pQImrk2MV4jI29rBqypFfB5XzmL/KRI5imPycmE+GcHUmhndsEYW9W7fGfgVd943LPC5fPUgX
 YHXMGuz+uQpdme/l14oneqpFAjOvhCBhFWxis/wnl5g/33gKs8GYBpxdFCG96WlCDzbZQFzbf
 laqrhATeaArwrvNNV2bHjcNQd9+kFBs9Pf24eVowboHhb2UrcjtB7ftAO92cQYuNJEnPDHTU+
 wj+DWq+2hL40lHz7+cK/sxvumPhUeRqg2nLnwrhTzr56IQbQ08tQpu1lBJT9St1noCoGfxBEM
 1yCS/ZV5m9fIr5/rp8VnPYdAdbZd80F0Q/zZdFmN108qA1n/dxubnXO+qlULkJlIEESOA0pTp
 DksejJrr/gVEEIWKCZBOcGV4Sp3pzlNN0qsguBfU1XuIENmZnoyXCL0cpWNCOxjGV6wB0DsKZ
 HCp9ufy8TMUnXzCUG4QEhi4F7NYZwRl30s5jO8XA+vZd186ceOlsRIr4JV+OZ7sTIY0kr9pR9
 fEbXozFSc14Rf7Lmbo4txoJYiMkydzYBQkelkczGAZ82PYueEHBlq80yHPXY54FyvRyl9U8+f
 XN7XkfVNJLckzUcHjpHZ+C/GK/DUZ6AySHL4YSkA3pZbrSSHhPSibgKznnb8UBhqhu7sdW3qD
 Ky1F8a9srgl/Tphpg3CfEFiI9ZM6L09k5CAHFk4neInrWn7CaLhf2rDyF81dkolTW7xNl7hqp
 4FBUxUn3YwQIx2ua0hpuBqn98wCnyHKcr5Rg9GWK2n8+g=
Message-ID-Hash: J3NSWUL7JOK67YS4YMGEKTB2LHFRGJPS
X-Message-ID-Hash: J3NSWUL7JOK67YS4YMGEKTB2LHFRGJPS
X-MailFrom: oswald.buddenhagen@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3NSWUL7JOK67YS4YMGEKTB2LHFRGJPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

this fixes the regression i introduced (though arguably, i just made it br=
oken
in a different way), and then some more.

Oswald Buddenhagen (18):
  ALSA: emux: fix /proc teardown at module unload
  ALSA: emux: prune unused parameter from snd_soundfont_load_guspatch()
  ALSA: emux: fix validation of snd_emux.num_ports
  ALSA: emux: fix init of patch_info.truesize in load_data()
  ALSA: emu10k1: prune vestiges of
    SNDRV_SFNT_SAMPLE_{BIDIR,REVERSE}_LOOP support
  ALSA: emux: centralize & improve patch info validation
  ALSA: emux: improve patch ioctl data validation
  ALSA: emu10k1: move patch loader assertions into low-level functions
  ALSA: emu10k1: fix sample signedness issues in wavetable loader
  ALSA: emu10k1: fix playback of 8-bit wavetable samples
  ALSA: emu10k1: make wavetable sample playback start position exact
  ALSA: emu10k1: shrink blank space in front of wavetable samples
  ALSA: emu10k1: merge conditions in patch loader
  ALSA: emu10k1: fix wavetable offset recalculation
  ALSA: emu10k1: de-duplicate size calculations for 16-bit samples
  ALSA: emu10k1: improve cache behavior documentation
  ALSA: emu10k1: fix playback of short wavetable samples
  ALSA: emux: simplify snd_sf_list.callback handling

 include/sound/emu10k1.h              |  32 +++--
 include/sound/soundfont.h            |   2 +-
 sound/isa/sb/emu8000_patch.c         |  13 --
 sound/pci/emu10k1/emu10k1_callback.c |  10 +-
 sound/pci/emu10k1/emu10k1_patch.c    | 207 +++++++++++----------------
 sound/pci/emu10k1/memory.c           |  55 +++++--
 sound/synth/emux/emux.c              |   6 +-
 sound/synth/emux/emux_hwdep.c        |   3 +-
 sound/synth/emux/emux_oss.c          |   3 +-
 sound/synth/emux/emux_proc.c         |   1 +
 sound/synth/emux/emux_seq.c          |   6 +-
 sound/synth/emux/soundfont.c         |  73 +++++++---
 12 files changed, 216 insertions(+), 195 deletions(-)

=2D-
2.42.0.419.g70bf8a5751

