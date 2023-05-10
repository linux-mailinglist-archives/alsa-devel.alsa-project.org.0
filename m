Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D56FE35C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7090BE87;
	Wed, 10 May 2023 19:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7090BE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740495;
	bh=7qHOgYt27kecYK/jNt6JALeAnX0xg1cYpaCeaJEtuXU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fjJ1z96WmzRmxxFQoU72cssHEX+6GsLHaPDc/9C8XB+lB7thgqurxaAh8rUE245pu
	 EB9XJynQziXcobBZUCU4rD8br+BsDk6jQHb4jeD6TN2/U70dhcARE9itPoLRHuhNS7
	 T7XdZNnYnNgJp2wG2ryzcVsfEyoIJVDEADwt87/k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AA9F8056F;
	Wed, 10 May 2023 19:39:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E21E4F8055A; Wed, 10 May 2023 19:39:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 24CC2F80310
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CC2F80310
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 103CF24099;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tSc-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 00/14] ALSA: emu10k1: various improvements to the DSP-based
 mixer code
Date: Wed, 10 May 2023 19:39:03 +0200
Message-Id: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 36TONO6SUYMQRJKI5VBRD4LBOB4YN4LQ
X-Message-ID-Hash: 36TONO6SUYMQRJKI5VBRD4LBOB4YN4LQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36TONO6SUYMQRJKI5VBRD4LBOB4YN4LQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (14):
  ALSA: emu10k1: make tone control switch mono
  ALSA: emu10k1: roll up loops in DSP setup code for Audigy
  ALSA: emu10k1: fix+optimize E-MU stereo capture DSP code
  ALSA: emu10k1: simplify snd_emu10k1_audigy_dsp_convert_32_to_2x16()
  ALSA: emu10k1: apply channel delay hack to all E-MU cards
  ALSA: emu10k1: simplify tone control switch DSP code
  ALSA: emu10k1: properly assert DSP init constraints
  ALSA: emu10k1: polish audigy GPR allocation
  ALSA: emu10k1: fix non-zero mixer control defaults in highres mode
  ALSA: emu10k1: validate min/max values of translated controls
  ALSA: emu10k1: omit non-applicable mixer controls for E-MU cards
  ALSA: emu10k1: skip mic capture PCM for cards without AC97 codec
  ALSA: emu10k1: enable bit-exact playback, part 1: DSP attenuation
  ALSA: emu10k1: enable bit-exact playback, part 2: voice attenuation

 Documentation/sound/cards/audigy-mixer.rst  |   2 +-
 Documentation/sound/cards/sb-live-mixer.rst |   2 +-
 include/sound/emu10k1.h                     |  10 +-
 include/uapi/sound/emu10k1.h                |   8 +-
 sound/pci/emu10k1/emu10k1.c                 |   8 +-
 sound/pci/emu10k1/emufx.c                   | 763 +++++++++-----------
 sound/pci/emu10k1/emumixer.c                |  15 +-
 sound/pci/emu10k1/emupcm.c                  |   4 +-
 8 files changed, 369 insertions(+), 443 deletions(-)

-- 
2.40.0.152.g15d061e6df

