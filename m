Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F166921F82A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2DE1672;
	Tue, 14 Jul 2020 19:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2DE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747711;
	bh=93bSbjzor0WVqy+Nps358qQNb0s4BCwdvutLZeYDTBM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gAmQ9tGCzhLRIxpyeUxB3lmGEIX9pXifhiQiu1dsJn72cnXyIGHwnfo+fy6vvKYY0
	 ltqn6wWdjPt65VTAwYmqkNp0npA8DHMXqS7cQ/qCc1Hss/RsXhagTJA/jtnio9ilRU
	 CZZ+WNfLsfXMkiVKh4PkOnqxdU9OMlvljcH8A6BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7842CF802BE;
	Tue, 14 Jul 2020 19:26:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 285F0F802BE; Tue, 14 Jul 2020 19:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB089F8016F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB089F8016F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F090BACFF
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ALSA: Replace words for inclusive terminalogy guideline
Date: Tue, 14 Jul 2020 19:26:21 +0200
Message-Id: <20200714172631.25371-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

Hi,

this is a patch set to replace some words and sentences for adapting
the recent inclusive terminology guidelines.


Takashi

===

Takashi Iwai (10):
  ALSA: Replace the word "slave" in vmaster API
  ALSA: ac97: Replace the words white/blacklist
  ALSA: bt87x: Replace the words white/blacklist
  ALSA: ctxfi: Replace the word blacklist
  ALSA: es1968: Replace the words white/blacklist
  ALSA: hda: Replace the words white/blacklist
  ALSA: intel8x0: Replace the words white/blacklist
  ALSA: nm256: Replace the words blacklist
  ALSA: via82xx: Replace the words whitelist
  ALSA: usb-audio: Replace blacklist word

 include/sound/control.h         |  45 +++----
 include/sound/hda_codec.h       |   2 +-
 sound/core/vmaster.c            | 261 ++++++++++++++++++++--------------------
 sound/pci/ac97/ac97_patch.c     |  34 +++---
 sound/pci/bt87x.c               |  14 +--
 sound/pci/ca0106/ca0106_mixer.c |  18 +--
 sound/pci/ctxfi/ctatc.c         |   2 +-
 sound/pci/es1968.c              |  20 +--
 sound/pci/hda/hda_codec.c       |  94 +++++++--------
 sound/pci/hda/hda_generic.c     |  20 +--
 sound/pci/hda/hda_generic.h     |   2 +-
 sound/pci/hda/hda_intel.c       |  26 ++--
 sound/pci/hda/hda_local.h       |  10 +-
 sound/pci/hda/patch_ca0132.c    |  10 +-
 sound/pci/hda/patch_realtek.c   |   6 +-
 sound/pci/hda/patch_sigmatel.c  |   2 +-
 sound/pci/ice1712/juli.c        |  16 +--
 sound/pci/ice1712/quartet.c     |  12 +-
 sound/pci/intel8x0.c            |   6 +-
 sound/pci/nm256/nm256.c         |   8 +-
 sound/pci/via82xx.c             |   6 +-
 sound/ppc/awacs.c               |  12 +-
 sound/usb/6fire/control.c       |   2 +-
 sound/usb/quirks-table.h        |   2 +-
 24 files changed, 316 insertions(+), 314 deletions(-)

-- 
2.16.4

