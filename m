Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C775604A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 12:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38009E0F;
	Mon, 17 Jul 2023 12:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38009E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689589314;
	bh=2axuIK7OXHPTH+RoZmG0aTyeNC+hmA2Jl1CUPkF4gPg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NG1iw0J/pXiEgCNl5rxUvjGTRRaKSdXleNG+C8M0zWzWoYM73PQR/BQjqLDyNFj5s
	 4PpFOinQJWh/a7l0iOx07lKZEyLlHAfxBvoKoRKPBAoytj6atAv3diiuqB5JM1g1rO
	 ZqwdW8BSlRxeohBoK26T3znKBv8IK3/sca0GWRy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 000E4F8057F; Mon, 17 Jul 2023 12:20:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB03EF80570;
	Mon, 17 Jul 2023 12:20:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66BDEF8056F; Mon, 17 Jul 2023 12:20:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8918AF8053B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 12:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8918AF8053B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0CB6023FBC;
	Mon, 17 Jul 2023 06:20:37 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qLLLI-hAZ-00; Mon, 17 Jul 2023 12:20:36 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 0/6] ALSA: emu10k1: add support for high-bitrate modes of
 E-MU cards
Date: Mon, 17 Jul 2023 12:20:30 +0200
Message-Id: <20230717102036.404260-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LZ66BUB2KHS2JV7AYQQWG6A3JJFNIOQS
X-Message-ID-Hash: LZ66BUB2KHS2JV7AYQQWG6A3JJFNIOQS
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZ66BUB2KHS2JV7AYQQWG6A3JJFNIOQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series is what all the work was about: support the "dual-/quad-pumped"
modes of the E-MU cards.
---

i'm posting this so the final version (unless some actual bugs are found) is on
record, without expectation of it being applied. i'll document its availability
on the wiki and the related bug report instead.

the first three patches appear uncontroversial, and you may apply them if you
want to. however, the added value is somewhat limited without the last three
patches, so it's probably not worth bloating the driver with them.

---
v3:
- rebased onto pulled ahead series
---
This patch series needs to be applied on top of the patch titled "ALSA:
add snd_ctl_add_locked()".

Oswald Buddenhagen (6):
  ALSA: emu10k1: introduce alternative E-MU D.A.S. mode
  ALSA: emu10k1: improve mixer control naming in E-MU D.A.S. mode
  ALSA: emu10k1: make playback in E-MU D.A.S. mode 32-bit
  ALSA: emu10k1: add support for 2x/4x word clocks in E-MU D.A.S. mode
  ALSA: emu10k1: add high-rate capture in E-MU D.A.S. mode
  ALSA: emu10k1: add high-rate playback in E-MU D.A.S. mode

 include/sound/emu10k1.h          |  11 +
 sound/pci/emu10k1/emu10k1.c      |  29 +-
 sound/pci/emu10k1/emu10k1_main.c |  30 +-
 sound/pci/emu10k1/emufx.c        | 109 +++-
 sound/pci/emu10k1/emumixer.c     | 902 +++++++++++++++++++++++++++----
 sound/pci/emu10k1/emupcm.c       | 417 ++++++++++++--
 sound/pci/emu10k1/emuproc.c      |   5 +
 sound/pci/emu10k1/io.c           |  30 +-
 sound/pci/emu10k1/voice.c        |   6 +
 9 files changed, 1351 insertions(+), 188 deletions(-)


base-commit: 3c04ccbdf86e7e93e06e68f1915e39eb55afb0d0
prerequisite-patch-id: 45677e4f73ea654bda3258c1143c8027173e4b5c
-- 
2.40.0.152.g15d061e6df

