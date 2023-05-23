Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740D70E642
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA3A84B;
	Tue, 23 May 2023 22:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA3A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872605;
	bh=yP97bmsqJKh2Tb6S2gEB/gJ5irACU4kCA7Nv/ew1vkY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Cl6XpJN9AJr+rlx5CY1wgU+pXRmgeSikVboiVWNUdW4/P+9NALxaTzNG/Rs4je//6
	 +ZCmXvR4Mo71wG5lsvnVWyMvFYNldIOTu2qX1y9c8pFOs+rar+yN5ijDui4UFfFjKv
	 0IjX6Kljq4a0jcJ+AKJvirbjJ1GDpUEqGl5fiMV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46E02F8026A; Tue, 23 May 2023 22:07:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1889F80425;
	Tue, 23 May 2023 22:07:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A935BF805BA; Tue, 23 May 2023 22:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 394C5F8026A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394C5F8026A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0D31924051;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHl-zP1-00; Tue, 23 May 2023 22:07:09 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/3] ALSA: emu10k1: multi-channel playback related
 improvements
Date: Tue, 23 May 2023 22:07:06 +0200
Message-Id: <20230523200709.236023-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B4Y6XEK4X7FRBTYKTBKZDSQJR3V7IN7Z
X-Message-ID-Hash: B4Y6XEK4X7FRBTYKTBKZDSQJR3V7IN7Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4Y6XEK4X7FRBTYKTBKZDSQJR3V7IN7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (3):
  ALSA: emu10k1: don't limit multi-channel playback to two periods
  ALSA: emu10k1: add synchronized start of multi-channel playback
  ALSA: emu10k1: make channel count of multi-channel playback flexible

 include/sound/emu10k1.h    |  10 +++-
 sound/pci/emu10k1/emupcm.c | 115 +++++++++++++++++++++++++++++--------
 sound/pci/emu10k1/io.c     |  82 ++++++++++++++++++++++++++
 3 files changed, 181 insertions(+), 26 deletions(-)

-- 
2.40.0.152.g15d061e6df

