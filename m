Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC86EBA35
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD0EEE0;
	Sat, 22 Apr 2023 18:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD0EEE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682179882;
	bh=oeERniX7QecnX9q8B7HtNdQTCWxVGYIaoP9/NXazD8g=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P/goAqkcgpDCa/AT0LbTTwhVozNSe5UcjrGYyrcto9hfRG1TiOnFk7K1bF40HqRB4
	 DdkmbjxgQ/XbKrSoxnoHmMDOrXxuIAFXIxUT6iqQOV+A4c9b9UePaP7RWK9Kv8heZH
	 YviKTzhf1rXx6DjbXEujYjrXjbFPCy2VLjw47ejw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B619EF8053D;
	Sat, 22 Apr 2023 18:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C88DAF8052E; Sat, 22 Apr 2023 18:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82D40F800AC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D40F800AC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7BC4A23FF1;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-naJ-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ALSA: emu10k1: improvements mostly related to #defines
Date: Sat, 22 Apr 2023 18:10:14 +0200
Message-Id: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XQJ23NKZWKAH363M5VHFJZATKAT6GBPA
X-Message-ID-Hash: XQJ23NKZWKAH363M5VHFJZATKAT6GBPA
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQJ23NKZWKAH363M5VHFJZATKAT6GBPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mostly adding, removing, and otherwise massaging numerous #defines and
code using them, and surrounding comments.

Oswald Buddenhagen (7):
  ALSA: emu10k1: comment updates
  ALSA: emu10k1: fix lineup of EMU_HANA_* defines
  ALSA: emu10k1: eliminate some unused defines
  ALSA: emu10k1: remove some bogus defines
  ALSA: emu10k1: pull in some register definitions from kX-project
  ALSA: emu10k1: fixup DSP defines
  ALSA: emu10k1: use more existing defines instead of open-coded numbers

 include/sound/emu10k1.h              | 685 +++++++++++++--------------
 include/uapi/sound/emu10k1.h         | 147 ++++--
 sound/pci/emu10k1/emu10k1.c          |  11 -
 sound/pci/emu10k1/emu10k1_callback.c |  15 +-
 sound/pci/emu10k1/emu10k1_main.c     | 125 ++---
 sound/pci/emu10k1/emufx.c            |  18 +-
 sound/pci/emu10k1/emumixer.c         |  13 +-
 sound/pci/emu10k1/emupcm.c           |  39 +-
 sound/pci/emu10k1/io.c               |  26 +-
 sound/pci/emu10k1/p16v.c             |  29 +-
 sound/pci/emu10k1/p16v.h             |   2 +-
 sound/pci/emu10k1/p17v.h             |   4 +-
 12 files changed, 554 insertions(+), 560 deletions(-)

-- 
2.40.0.152.g15d061e6df

