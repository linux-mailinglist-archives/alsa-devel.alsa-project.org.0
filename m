Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147A89849B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18D62C96;
	Thu,  4 Apr 2024 12:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18D62C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225071;
	bh=iKewCbD6i9YIkGriI6CZtcrR5iExDBlhCJU2lt++jhI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f7pWVHS9sKi2TJwaPOHQyCW3As8VET5L2+38gKE4STY0awxan1Xawc0v5+mAeUzJ9
	 6k6lPcjvqjMJc3JGRQzmXBvKqmkb/l4/EyGaX07vU317YFVsXn6LOdBSKi7BuWXlBn
	 cpC2q7o/woGnevXdmW5qb4Nd7SUdZJQukDPNVoH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A072F80672; Thu,  4 Apr 2024 12:03:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF04AF8065E;
	Thu,  4 Apr 2024 12:03:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5631F8016E; Thu,  4 Apr 2024 12:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96532F80571
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96532F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=hMjrWO74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=KF2wicju+OzPOoW9CcIFH8VTS7pHwx8PoNXL4KIBXY0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hMjrWO74NPpBiCvlhTPZb/AS/902gd3VNRdPLgb0uMQjurfntPtauZ9fvz75AEdr
	 YvOEwhGJZJQIIkj9Ql1PYTo09nPhbDwjVbUTa4Qb6SiI7lwuB3Mck6vnMFiI64th/
	 QRcA11rzOlIQupBjK+ShCgi7ZO89uBfqSEJcZ02KkHZCgbtJ/Gpb+MKR/hhJ+/NwM
	 nuXn4ARo1NIaNVmuQgKPTm7vctfEAieAyKSYwQ4DiovAhviQTeXO2XRLD5W2EheE9
	 /WnYnCIfVn/0QwkQVShzZRUFtcNFRH6w4tGZM/YkKG3sSVt9ZmoteNP+3AK6EhRv7
	 WxXqtYxPyWuF0GZtKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Kr-1rwQUq0dd5-005Jdt; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-REy-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 00/17] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
Date: Thu,  4 Apr 2024 12:00:31 +0200
Message-ID: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wPgOCy3iqpDzJcyBR6TiEaKwC8UEEliDnRFnQgVje79Hp5FO9FU
 dqSraAAqVpUUhxsdHV/DYy0eRDmt/9+bZB3mR5PUlE6nz/OP5Dsco2glWMFT9tDv/xeFcX2
 cRcu4DFHRIcYgIiAUVFm7HxHEsp5pNYFjp/JD0u8Dboo0Hx2pyOr9F9ef0hn4wOGUCtGDSQ
 6Ko/9pMYhMduY++xAZmEA==
UI-OutboundReport: notjunk:1;M01:P0:kIwmSKD44Ds=;zB+I3FkDIEmUcBIhTEFFtuIshZK
 li8Q2fRpz9tT8qH01D65KtFOQsJQ7F2sOdhB6iCROor82rAmxd/CpNRRrptQS/I8/I984hjI3
 dmllQILzMG7s9iRkHZmi/dgQa62YLJhSs0eJP66PQr26j0hxRbxTu0icCcpvrVGX4szBGxCIf
 i9hyyNIuHya8zlgqrA78DBFgqeR6zxs8JpwVofZ06DNlCnrcpcNQCJVxfvKcGcyAgAgPw8MzW
 KcvW2gbpqJh0n4Y3P2/Y5vE8yXBUC/V9gIrV3y5pAmI1KJmB4Dw1Wbi76FWrxUKQS1i0z6uDk
 pQLL9Pv4VywyXupHuKUI7KuNRZ6oe6y5r1+cfaf2qPqBtso8VvUmMpJbPsPc+pwLuR1zcSjEA
 wlLb2b1HIo6ReL0HRto9/W+4thWmb7JRcOF6vHHjlyn6IYSAJOv6o1VW5biYZE7Ky4YTZwqyM
 SYyHHh9z8TnMjpPkpyzRvHEUYVZ6oh/LYRhsZwByo3RpoA7LnHVZiKYq+772MSSCgU5uvE2Lg
 Wm6ZxRwwsgqP4DDDmERc213s4pIG/jHcQXTgwc1f1hb+jtfB5v+Ja0OnaOANW9TrVydl1LQmn
 yqTldIWfZIFdX7VwKelf+irfFFB/P43OsLd4UKfWIEAnAPHDCc2URo/xCyI/6OMlHHFtfvfGm
 Zp2McngGTHy8LLVUalmUPvAjfiMLtSb1QBxp0qumtXIsgqgSo3xZ0BLsKHKRa/hkoIzUQInCe
 BnKQxOXPjfiy+b0Zq9Mwcfr7D1qYtXadcU/a5sAQt6AcQbhh2RHKps93XDYCx0S/0iGdpwBNV
 g3woPuML42C48soGrGFhSaWuE/4rJs6lXWe7+Nm+LSH1o=
Message-ID-Hash: 5WZQMT5DRKIDN3T3TCYRFAKQQVD44QYL
X-Message-ID-Hash: 5WZQMT5DRKIDN3T3TCYRFAKQQVD44QYL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WZQMT5DRKIDN3T3TCYRFAKQQVD44QYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=2D--
This patch series needs to be applied on top of the patch titled
"Revert "ALSA: emu10k1: fix synthesizer sample playback position and
caching"".

Oswald Buddenhagen (17):
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
  ALSA: emu10k1: merge conditions in patch loader
  ALSA: emu10k1: fix wavetable offset recalculation
  ALSA: emu10k1: de-duplicate size calculations for 16-bit samples
  ALSA: emu10k1: improve cache behavior documentation
  ALSA: emu10k1: fix wavetable playback position and caching, take 2
  ALSA: emu10k1: shrink blank space in front of wavetable samples
  ALSA: emux: simplify snd_sf_list.callback handling

 include/sound/emu10k1.h              |  32 +++--
 include/sound/soundfont.h            |   2 +-
 sound/isa/sb/emu8000_patch.c         |  13 --
 sound/pci/emu10k1/emu10k1_callback.c |  13 +-
 sound/pci/emu10k1/emu10k1_patch.c    | 207 +++++++++++----------------
 sound/pci/emu10k1/memory.c           |  55 +++++--
 sound/synth/emux/emux.c              |   6 +-
 sound/synth/emux/emux_hwdep.c        |   3 +-
 sound/synth/emux/emux_oss.c          |   3 +-
 sound/synth/emux/emux_proc.c         |   1 +
 sound/synth/emux/emux_seq.c          |   6 +-
 sound/synth/emux/soundfont.c         |  73 +++++++---
 12 files changed, 219 insertions(+), 195 deletions(-)


base-commit: ed93395844979f6bf2e1fbfcda38d1718289b426
prerequisite-patch-id: b7769e1c8649b86fd9e0b259e11bfd8e468393e5
=2D-
2.42.0.419.g70bf8a5751

