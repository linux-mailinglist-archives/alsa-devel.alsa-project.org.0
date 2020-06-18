Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E81FF045
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21E03176D;
	Thu, 18 Jun 2020 13:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21E03176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478666;
	bh=vx/2RbW02N9DJ/6PpZU0uTHA/B1rL3YHp1rc9B697hM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AHbJeO7DsleiSnkc0xxGmc4AijuYiIstFHo8V8+gKjvrbmdRpalzztq2uAIDfljAc
	 ZaoU5lx+eAf2FhJzgRSz1bZUL+KHcgvkTzAWfLGzrY7HaOfNop3jUtYSLfDjvm/M5S
	 ayVnefW4O9POUlObA2x0dni+0dRJ9jrPtO7nlBQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69050F80171;
	Thu, 18 Jun 2020 13:09:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63B84F802BC; Thu, 18 Jun 2020 13:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24E89F80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24E89F80101
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 654AAAD4B;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ALSA: hda: Use LED classdev for mute controls
 consistently
Date: Thu, 18 Jun 2020 13:08:29 +0200
Message-Id: <20200618110842.27238-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
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

this is a patch set inspired by the recent patch Kai-Heng posted about
the HD-audio mic-mute LED control.  Currently HD-audio driver deals
with the mute and mic-mute LED in several different ways: primarily
with the direct callback of vmaster hook and capture sync hook, while
another with the LED class device binding.  The latter has been used
for binding with the platform device LEDs like Thinkpad, Dell,
Huawei.  And, yet, recently we added our own LED classdev for the
mic-mute LED on some HP systems although they are controlled directly
with the callback; it's exposed, however, for the DMIC that is
governed by a different ASoC driver.

This patch set is an attempt to sort out and make them consistent:
namely, 
* All LEDs are now controlled via LED class device
* The generic driver provides helper functions to easily build up the
  LED class dev and the relevant mixer controls
* Conversion of the existing framework and clean ups

The patches are lightly tested in my side with a couple of machines
and also through hda-emu tests.  Some devices receive new kcontrols
for the mute LED behavior (that have been missing so far), but
anything else look good though my tests.


thanks,

Takashi

===

Takashi Iwai (13):
  ALSA: hda: generic: Always call led-trigger for mic mute LED
  ALSA: hda: generic: Add a helper for mic-mute LED with LED classdev
  ALSA: hda/realtek: Convert to cdev-variant of mic-mute LED controls
  ALSA: hda/conexant: Convert to cdev-variant of mic-mute LED controls
  ALSA: hda/sigmatel: Convert to cdev-variant of mic-mute LED controls
  ALSA: hda: generic: Drop unused snd_hda_gen_fixup_micmute_led()
  ALSA: hda: generic: Drop the old mic-mute LED hook
  ALSA: hda: generic: Add vmaster mute LED helper
  ALSA: hda/realtek: Use the new vmaster mute LED helper
  ALSA: hda/conexant: Use the new vmaster mute LED helper
  ALSA: hda/sigmatel: Use the new vmaster mute LED helper
  ALSA: hda/realtek: Unify LED helper code
  ALSA: hda: Let LED cdev handling suspend/resume

 sound/pci/hda/Kconfig           |   9 ++
 sound/pci/hda/hda_generic.c     | 134 ++++++++++++++++--------
 sound/pci/hda/hda_generic.h     |  13 ++-
 sound/pci/hda/patch_conexant.c  |  47 ++++-----
 sound/pci/hda/patch_realtek.c   | 220 +++++++++++++++++++---------------------
 sound/pci/hda/patch_sigmatel.c  |  22 ++--
 sound/pci/hda/thinkpad_helper.c |  19 +---
 7 files changed, 248 insertions(+), 216 deletions(-)

-- 
2.16.4

