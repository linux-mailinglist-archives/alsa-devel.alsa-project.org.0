Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3E9701E68
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 19:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1654DF2;
	Sun, 14 May 2023 19:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1654DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684083922;
	bh=UvU/vCC7h14/rhMi/CokChNfvwsPzHEYZm94p1hftHk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e1Cau1a3la3cChP8ErrQ3bJZ0iTyuXRUt+0UIDtzTQHol+Frrrkze1mSI9Qj++WqS
	 +2dNiTstg0vF4xObnFNsv0LXxRmFaeqrK7aNcuLIwPkQCn4Pz+ufF9kOTTxZwm/uz0
	 jbdl7IGpXy1jsFFuDAuLzjdHKp9UP4ij+f35NFG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 478E6F80580; Sun, 14 May 2023 19:03:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF41F8057C;
	Sun, 14 May 2023 19:03:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A882F8025A; Sun, 14 May 2023 19:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2E53F80272
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 19:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E53F80272
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 980FC2425A;
	Sun, 14 May 2023 13:03:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyF7z-InS-00; Sun, 14 May 2023 19:03:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 0/7] ALSA: emu10k1: various improvements to the DSP-based
 mixer code
Date: Sun, 14 May 2023 19:03:16 +0200
Message-Id: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQFHTPEDNFLRSQH3CKPF75HDZCW2AGWE
X-Message-ID-Hash: MQFHTPEDNFLRSQH3CKPF75HDZCW2AGWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQFHTPEDNFLRSQH3CKPF75HDZCW2AGWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (7):
  ALSA: emu10k1: polish audigy GPR allocation
  ALSA: emu10k1: fix non-zero mixer control defaults in highres mode
  ALSA: emu10k1: validate min/max values of translated controls
  ALSA: emu10k1: omit non-applicable mixer controls for E-MU cards
  ALSA: emu10k1: skip mic capture PCM for cards without AC97 codec
  ALSA: emu10k1: enable bit-exact playback, part 1: DSP attenuation
  ALSA: emu10k1: enable bit-exact playback, part 2: voice attenuation

 Documentation/sound/cards/audigy-mixer.rst  |   2 +-
 Documentation/sound/cards/sb-live-mixer.rst |   2 +-
 include/sound/emu10k1.h                     |   9 +-
 include/uapi/sound/emu10k1.h                |   8 +-
 sound/pci/emu10k1/emu10k1.c                 |   8 +-
 sound/pci/emu10k1/emufx.c                   | 491 +++++++++++---------
 sound/pci/emu10k1/emumixer.c                |  15 +-
 sound/pci/emu10k1/emupcm.c                  |   4 +-
 8 files changed, 291 insertions(+), 248 deletions(-)

-- 
2.40.0.152.g15d061e6df

