Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7387318933
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 12:16:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3716016F1;
	Thu, 11 Feb 2021 12:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3716016F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613042163;
	bh=+sPt2/1ZJwglE2p7OcVuHt+rkpYSxjhEoVcDpRmI3Ps=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SIVd16rm9EWnj7917n9D9S+JAlsBX3Tu1ON/Tq40ZjPdyMXw9WGEJn/6trMECtWAd
	 6mBcJ5SmqmA6xfJhdQTwjS2/ZYSANE01oaDkQxllkdt2F3TZDurZISI12ZdmvwD/3b
	 eCD+WnYvaH+HK5bFipZj3oXnabvbM5IMmgmh4ImA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09502F801EC;
	Thu, 11 Feb 2021 12:14:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1608FF801D5; Thu, 11 Feb 2021 12:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98512F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 12:14:23 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2BC03A0042;
 Thu, 11 Feb 2021 12:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2BC03A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613042062; bh=uTRj5pUBKkon3Vbn8La4wjU4VGVOaRJnX/vj5h52194=;
 h=From:To:Cc:Subject:Date:From;
 b=BkcsbuEiTDmzbxuxIGOTZmMim+Z3tRvPRCz4UHug7i5Acd+qMjvWXCuc8fMsq032H
 zsI0TYU92kOER4AvCFKC31gtFYa8vpVu4JmHWgltsHpPeHG4qlItKzBA0rDlNZkFO3
 lOEvYjo1638+XGEpe6AUWDw0fkYdbCixYrn0zF+U=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Feb 2021 12:14:17 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH 0/5] ALSA: control - add generic LED trigger code
Date: Thu, 11 Feb 2021 12:13:55 +0100
Message-Id: <20210211111400.1131020-1-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Perry Yuan <Perry.Yuan@dell.com>
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

This patchset tries to resolve the diversity in the audio LED
control among the ALSA drivers.

A new control layer registration is introduced which allows
to run additional operations on top of the elementary ALSA
sound controls.

A new control access group (three bits in the access flags)
was introduced to carry the LED group information for
the sound controls. The low-level sound drivers can just
mark those controls using this access group. This information
is exported to the user space and eventually the user space
can create sound controls which can belong to a LED group.

The actual state ('route') evaluation is really easy
(the minimal value check for all channels / controls / cards).
If there's more complicated logic for a given hardware,
the card driver may eventually export a new read-only
sound control for the LED group and do the logic itself.

The new LED trigger control code is completely separated
and possibly optional (there's no symbol dependency).
The full code separation allows eventually to move this
LED trigger control to the user space in future.
Actually it replaces the already present functionality
in the kernel space (HDA drivers) and allows a quick adoption
for the recent hardware (SoundWire ASoC codecs).

# lsmod | grep snd_ctl_led
snd_ctl_led            16384  0

The sound driver implementation is really easy:

1) call snd_ctl_led_request() when control LED layer should be
   automatically activated
   / it calls module_request("snd-ctl-led") on demand /
2) mark all related kcontrols with
	SNDRV_CTL_ELEM_ACCESS_SPK_LED or
	SNDRV_CTL_ELEM_ACCESS_MIC_LED

Original RFC: https://lore.kernel.org/alsa-devel/20210207201157.869972-1-perex@perex.cz/

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Perry Yuan <Perry.Yuan@dell.com>

Jaroslav Kysela (5):
  ALSA: control - introduce snd_ctl_notify_one() helper
  ALSA: control - add layer registration routines
  ALSA: control - add generic LED trigger module as the new control
    layer
  ALSA: HDA - remove the custom implementation for the audio LED trigger
  ALSA: control - add sysfs support to the LED trigger module

 include/sound/control.h         |  27 ++-
 include/uapi/sound/asound.h     |   6 +-
 sound/core/Kconfig              |   6 +
 sound/core/Makefile             |   2 +
 sound/core/control.c            | 173 ++++++++++++--
 sound/core/control_led.c        | 407 ++++++++++++++++++++++++++++++++
 sound/pci/hda/Kconfig           |   4 +-
 sound/pci/hda/hda_codec.c       |  69 +-----
 sound/pci/hda/hda_generic.c     | 162 ++-----------
 sound/pci/hda/hda_generic.h     |  15 +-
 sound/pci/hda/hda_local.h       |  16 +-
 sound/pci/hda/patch_ca0132.c    |   4 +-
 sound/pci/hda/patch_realtek.c   |   2 +-
 sound/pci/hda/patch_sigmatel.c  |   6 +-
 sound/pci/hda/thinkpad_helper.c |   2 +-
 15 files changed, 638 insertions(+), 263 deletions(-)
 create mode 100644 sound/core/control_led.c

-- 
2.29.2
