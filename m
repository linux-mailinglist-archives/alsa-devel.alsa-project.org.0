Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264633F6DD
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:32:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F368616E5;
	Wed, 17 Mar 2021 18:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F368616E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616002324;
	bh=n2sA8MYB3thyDn4lhSykeRf1xGa2KnDUhQIrgKjHZ8I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sjSsHeh1Nvq5vIooz1JcgKWIiS8A5muafdGbgItjE6x3KfxMNfIdPoUFIvP/Z6I1W
	 9aeY/E1sFPI2uFRtQlsHyM6Lsecn8UW8vV7GHs7gzacUKNgO8CrTDXDM6yrlxZX4JV
	 R7vIH16rLa4illn6ordUx1kiARBb2gNCGURVzy30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D212F80254;
	Wed, 17 Mar 2021 18:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6842F80253; Wed, 17 Mar 2021 18:30:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DE3F8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:29:58 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 36305A0042;
 Wed, 17 Mar 2021 18:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 36305A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616002194; bh=um8iBwhpHXZgZ99XMHEtko5xE2xv9TLCDLS/OJPEYuY=;
 h=From:To:Cc:Subject:Date:From;
 b=HEOMSc/7E5Y1qNPISR+WUv5CmTlFSL6rG+Rt/5cGZKPxYoN9g3GsSjKaSZxx9OC6k
 d+DdBXa8kbc/IzmLMyEpbWQZcfRqoCnBPuNgOotV4Fj583sIoU5EdIKuzHfgtXMwz4
 1IQCJTFNEjnWzb/MM+gUBfOGoo5xPYstfF1q1P0A=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Mar 2021 18:29:50 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v4 0/6] ALSA: control - add generic LED API
Date: Wed, 17 Mar 2021 18:29:39 +0100
Message-Id: <20210317172945.842280-1-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>
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
control among the ALSA drivers. A new control layer registration
is introduced which allows to run additional operations on
top of the elementary ALSA sound controls.

A new control access group (three bits in the access flags)
was introduced to carry the LED group information for
the sound controls. The low-level sound drivers can just
mark those controls using this access group. This information
is not exported to the user space, but user space can
manage the LED sound control associations through sysfs
(last patch) per Mark's request. It makes things fully
configurable in the kernel and user space (UCM).

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
for the recent hardware (ASoC codecs including SoundWire).

# lsmod | grep snd_ctl_led
snd_ctl_led            24576  0

The sound driver implementation is really easy:

1) call snd_ctl_led_request() when control LED layer should be
   automatically activated
   / it calls module_request("snd-ctl-led") on demand /
2) mark all related kcontrols with
	SNDRV_CTL_ELEM_ACCESS_SPK_LED or
	SNDRV_CTL_ELEM_ACCESS_MIC_LED

v4 changes:
  - the LED access flags are private to kernel now (no user space
    API change)
  - fixes (kctl management, sysfs cleanup)
  - add the sysfs LED marking kcontrol management
    - https://lore.kernel.org/alsa-devel/28fffebd-1ce9-7480-0f2f-ed8369abddf1@perex.cz/
v3 changes:
  - reorder the controls_rwsem use to fix the remaining mutex issue
    card->controls_rwsem <-> snd_ctl_layer_rwsem
v2 changes:
  - fix the locking - remove the controls_rwsem read lock
    in the element get (the consistency is already protected
    with the global snd_ctl_led_mutex and possible partial
    value writes are catched with the next value change
    notification callback)
  - rename state to brightness and show the brightness
    unsigned integer value instead the text on/off string
    (sync with the LED core routines)
  - remove snd_ctl_led_hello() function (CI warning)
  - make snd_ctl_led_get_by_access() function static (CI warning)
  - move snd_ctl_layer_rwsem lock before the registraction
    callback call in snd_ctl_register_layer() - optimization
v1:
  - https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/
Original RFC:
  - https://lore.kernel.org/alsa-devel/20210207201157.869972-1-perex@perex.cz/

Cc: Hans de Goede <hdegoede@redhat.com>

Jaroslav Kysela (6):
  ALSA: control - introduce snd_ctl_notify_one() helper
  ALSA: control - add layer registration routines
  ALSA: control - add generic LED trigger module as the new control
    layer
  ALSA: HDA - remove the custom implementation for the audio LED trigger
  ALSA: control - add sysfs support to the LED trigger module
  ALSA: led control - add sysfs kcontrol LED marking layer

 include/sound/control.h         |  35 +-
 sound/core/Kconfig              |   6 +
 sound/core/Makefile             |   2 +
 sound/core/control.c            | 182 ++++++--
 sound/core/control_led.c        | 770 ++++++++++++++++++++++++++++++++
 sound/pci/hda/Kconfig           |   4 +-
 sound/pci/hda/hda_codec.c       |  69 +--
 sound/pci/hda/hda_generic.c     | 162 ++-----
 sound/pci/hda/hda_generic.h     |  15 +-
 sound/pci/hda/hda_local.h       |  16 +-
 sound/pci/hda/patch_ca0132.c    |   4 +-
 sound/pci/hda/patch_realtek.c   |   2 +-
 sound/pci/hda/patch_sigmatel.c  |   6 +-
 sound/pci/hda/thinkpad_helper.c |   2 +-
 14 files changed, 1011 insertions(+), 264 deletions(-)
 create mode 100644 sound/core/control_led.c

-- 
2.29.2
