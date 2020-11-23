Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4DB2C01C3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF05950;
	Mon, 23 Nov 2020 09:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF05950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121739;
	bh=B+OXKs6jj6nmx9tm+T5dFwf0zQ+mZtjIrIBXwuoPRFw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V7sHUcjwE5zWJUdTudAyEZ8xmtQPi7GwNrNm+3zeao8I0iGXiAF5nBUjwWXjaf4cj
	 UcC1pfEQnjaJ+WI6NjKtCktw3iv7x2/6wNQkAzChAOlKRG5XyeIZfiKM0UwX4IkyLS
	 XUxkqs+nGbdyedyyoVuLnJHWY4MUO7Txb9e90+sM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 123E7F80506;
	Mon, 23 Nov 2020 09:54:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69406F80506; Mon, 23 Nov 2020 09:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3CD6F80255
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3CD6F80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C84A0ACBD;
 Mon, 23 Nov 2020 08:53:56 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/41] USB audio refactoring for better implicit feedback
 support
Date: Mon, 23 Nov 2020 09:53:06 +0100
Message-Id: <20201123085347.19667-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

here is a largish patch set for USB-audio.  Its main goal is to
address the long-standing issues wrt the implicit feedback mode.
With the current driver, when the implicit fb is used, the full duplex
doesn't work properly unless you start both streams *very* carefully.
This patch set tries to ease such the configuration mismatch and fix
many other bugs.

In short, with this patch set applied, USB-audio driver will try to
restrict the hw_params to match with the already opened counter-part
stream automatically.  So individual aplay and arecord invocation
should work now, as well as PulseAudio.

Also, the patch set includes more fixes, e.g. the generic detection of
the implicit feedback mode on UAC2/3, and the fix for the sample rate
selection on UAC2/3, as well as a few more quirks to follow the new
implicit fb model.

The latest patches are available in topic/usb-audio-refactoring
branch.

I specially thank Keith Milner and Dylan Robinson for their time spent
for lots of testing.  Without their patient help, I couldn't finish
those patches, as I myself don't own such devices.


Takashi

===

Dylan Robinson (1):
  ALSA: usb-audio: Fix MOTU M-Series quirks

Takashi Iwai (40):
  ALSA: usb-audio: Handle discrete rates properly in hw constraints
  ALSA: usb-audio: Don't call usb_set_interface() at trigger callback
  ALSA: usb-audio: Check valid altsetting at parsing rates for UAC2/3
  ALSA: usb-audio: Check implicit feedback EP generically for UAC2
  ALSA: usb-audio: Add snd_usb_get_endpoint() helper
  ALSA: usb-audio: Set and clear sync EP link properly
  ALSA: usb-audio: Improve some debug prints
  ALSA: usb-audio: Track implicit fb sync endpoint in audioformat list
  ALSA: usb-audio: Move snd_usb_autoresume() call out of setup_hw_info()
  ALSA: usb-audio: Add hw constraint for implicit fb sync
  ALSA: usb-audio: Simplify hw_params rules
  ALSA: usb-audio: Drop debug.h
  ALSA: usb-audio: Avoid doubly initialization for implicit fb
  ALSA: usb-audio: Create endpoint objects at parsing phase
  ALSA: usb-audio: Drop keep_interface flag again
  ALSA: usb-audio: Add snd_usb_get_host_interface() helper
  ALSA: usb-audio: Don't set altsetting before initializing sample rate
  ALSA: usb-audio: Pass snd_usb_audio object to quirk functions
  ALSA: usb-audio: Simplify snd_usb_init_sample_rate() arguments
  ALSA: usb-audio: Simplify snd_usb_init_pitch() arguments
  ALSA: usb-audio: Stop both endpoints properly at error
  ALSA: usb-audio: Set callbacks via snd_usb_endpoint_set_callback()
  ALSA: usb-audio: Always set up the parameters after resume
  ALSA: usb-audio: Fix EP matching for continuous rates
  ALSA: usb-audio: Refactor endpoint management
  ALSA: usb-audio: Fix possible stall of implicit fb packet ring-buffer
  ALSA: usb-audio: Constify audioformat pointer references
  ALSA: usb-audio: Use atomic_t for endpoint use_count
  ALSA: usb-audio: Refactoring endpoint URB deactivation
  ALSA: usb-audio: Drop unneeded snd_usb_substream fields
  ALSA: usb-audio: Unify the code for the next packet size calculation
  ALSA: usb-audio: Simplify rate_min/max and rates set up
  ALSA: usb-audio: Replace slave/master terms
  ALSA: usb-audio: Use unsigned char for iface and altsettings fields
  ALSA: usb-audio: Show sync endpoint information in proc outputs
  ALSA: usb-audio: Quirk for BOSS GT-001
  ALSA: usb-audio: Factor out the implicit feedback quirk code
  ALSA: usb-audio: Add generic implicit fb parsing
  ALSA: usb-audio: Add implicit_fb module option
  ALSA: usb-audio: Fix quirks for other BOSS devices

 Documentation/sound/alsa-configuration.rst |    5 +
 sound/usb/Makefile                         |    1 +
 sound/usb/card.c                           |   14 +-
 sound/usb/card.h                           |   53 +-
 sound/usb/clock.c                          |  152 ++--
 sound/usb/clock.h                          |   11 +-
 sound/usb/debug.h                          |   16 -
 sound/usb/endpoint.c                       |  943 +++++++++++++----------
 sound/usb/endpoint.h                       |   57 +-
 sound/usb/format.c                         |  125 +++-
 sound/usb/helper.c                         |   10 +
 sound/usb/helper.h                         |    3 +
 sound/usb/implicit.c                       |  402 ++++++++++
 sound/usb/implicit.h                       |   14 +
 sound/usb/mixer.c                          |   46 --
 sound/usb/pcm.c                            | 1117 ++++++++++------------------
 sound/usb/pcm.h                            |    7 +-
 sound/usb/proc.c                           |   35 +-
 sound/usb/quirks-table.h                   |    8 -
 sound/usb/quirks.c                         |   60 +-
 sound/usb/quirks.h                         |   10 +-
 sound/usb/stream.c                         |   24 +-
 sound/usb/usbaudio.h                       |    5 +-
 23 files changed, 1696 insertions(+), 1422 deletions(-)
 delete mode 100644 sound/usb/debug.h
 create mode 100644 sound/usb/implicit.c
 create mode 100644 sound/usb/implicit.h

-- 
2.16.4

