Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7772DB27
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510B6827;
	Tue, 13 Jun 2023 09:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510B6827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686642018;
	bh=Aj6vaq24Ij7dbtgJ4h8y6IiCXQwfg5sF2KVCXO1hvYA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S9IWdjkLteFW+eecl6RZ8l8DS2fnDUs4DzCNzrDjUFZAklOvvunSknz0VoKwkig2Z
	 5BMEgU8qte9AAi+f05/sC5xTUtmRnCn4dbZs2dTuTKf34ZWEPFMINToGW28WXZfQdx
	 qotM9WfkDRMzBCvgmF9PJocZdFx5sk/7lGJVrWdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E02E3F80589; Tue, 13 Jun 2023 09:38:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1323BF80149;
	Tue, 13 Jun 2023 09:38:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 012B9F8057E; Tue, 13 Jun 2023 09:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C78E5F8025E
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C78E5F8025E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 779C324154;
	Tue, 13 Jun 2023 03:38:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8ybe-dRL-00; Tue, 13 Jun 2023 09:38:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/8] ALSA: emu10k1: add support for high-bitrate modes of E-MU
 cards
Date: Tue, 13 Jun 2023 09:38:14 +0200
Message-Id: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WZGNIAGOM2VP6SPPYSIVX7XNMLPTGNHC
X-Message-ID-Hash: WZGNIAGOM2VP6SPPYSIVX7XNMLPTGNHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZGNIAGOM2VP6SPPYSIVX7XNMLPTGNHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series is what all the work was about: support the "dual-/quad-pumped"
modes of the E-MU cards.

Oswald Buddenhagen (8):
  ALSA: emu10k1: introduce alternative E-MU D.A.S. mode
  ALSA: emu10k1: improve mixer control naming in E-MU D.A.S. mode
  ALSA: emu10k1: set the "no filtering" bits on PCM voices
  ALSA: emu10k1: make playback in E-MU D.A.S. mode 32-bit
  ALSA: add snd_ctl_add_locked()
  ALSA: emu10k1: add support for 2x/4x word clocks in E-MU D.A.S. mode
  ALSA: emu10k1: add high-rate capture in E-MU D.A.S. mode
  ALSA: emu10k1: add high-rate playback in E-MU D.A.S. mode

 include/sound/control.h          |   1 +
 include/sound/emu10k1.h          |  11 +
 sound/core/control.c             |  31 ++
 sound/pci/emu10k1/emu10k1.c      |  29 +-
 sound/pci/emu10k1/emu10k1_main.c |  19 +-
 sound/pci/emu10k1/emufx.c        | 109 +++-
 sound/pci/emu10k1/emumixer.c     | 901 +++++++++++++++++++++++++++----
 sound/pci/emu10k1/emupcm.c       | 422 +++++++++++++--
 sound/pci/emu10k1/emuproc.c      |   5 +
 sound/pci/emu10k1/io.c           |  30 +-
 sound/pci/emu10k1/voice.c        |   6 +
 11 files changed, 1383 insertions(+), 181 deletions(-)

-- 
2.40.0.152.g15d061e6df

