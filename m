Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F472CF28
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 414C36C0;
	Mon, 12 Jun 2023 21:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 414C36C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597325;
	bh=o88f4fW1Dmyqkam5xFbh8mFRpXkpK4R8YKrvN5GtliE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SODUgGJGw6T3WATUaRimc4qh01d5TknHNE2bAvSwX31vziOsFiNPt0yI+QSZcha7Z
	 Opy8q5p0ymuWNFfUdHlu4HE35dRzqSQ74W++TpCR0GMff3tMyBpxnaZlAdweFxc+KP
	 wt1WJIEndSeruUYlPYTvOejBMvSuTnw2zQzDoBbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06045F8055A; Mon, 12 Jun 2023 21:13:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB70F80552;
	Mon, 12 Jun 2023 21:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A6E7F80548; Mon, 12 Jun 2023 21:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C33D2F80149
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33D2F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C3F7223FC6;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WJl-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/9] ALSA: emu10k1: improvements related to the switchable
 word clock of E-MU cards
Date: Mon, 12 Jun 2023 21:13:16 +0200
Message-Id: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOCSHHSMOH5K6WPXDQNKLZDPM3W74HNO
X-Message-ID-Hash: WOCSHHSMOH5K6WPXDQNKLZDPM3W74HNO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOCSHHSMOH5K6WPXDQNKLZDPM3W74HNO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (9):
  ALSA: emu10k1: split off E-MU fallback clock from clock source
  ALSA: emu10k1: make available E-MU clock sources card-specific
  ALSA: emu10k1: query rate of external clock sources on E-MU cards
  ALSA: emu10k1: fix sample rates for E-MU cards at 44.1 kHz word clock
  ALSA: emu10k1: fix synthesizer pitch for E-MU cards at 44.1 kHz
  ALSA: timer: minimize open-coded access to hw.resolution
  ALSA: emu10k1: fix timer for E-MU cards at 44.1 kHz word clock
  ALSA: emu10k1: add support for 12 kHz capture on Audigy
  ALSA: emu10k1: actually show some S/PDIF status in /proc for E-MU
    cards

 include/sound/emu10k1.h              |  11 +-
 include/sound/emux_synth.h           |   2 +-
 sound/core/timer.c                   |  18 +-
 sound/pci/emu10k1/emu10k1_callback.c |  10 ++
 sound/pci/emu10k1/emu10k1_main.c     |   7 +-
 sound/pci/emu10k1/emu10k1_synth.c    |   1 -
 sound/pci/emu10k1/emumixer.c         | 242 ++++++++++++++++-----------
 sound/pci/emu10k1/emupcm.c           | 125 +++++++-------
 sound/pci/emu10k1/emuproc.c          |  51 +++---
 sound/pci/emu10k1/io.c               |  72 ++++++++
 sound/pci/emu10k1/timer.c            |  20 ++-
 sound/synth/emux/emux_synth.c        |   3 +-
 12 files changed, 374 insertions(+), 188 deletions(-)

-- 
2.40.0.152.g15d061e6df

