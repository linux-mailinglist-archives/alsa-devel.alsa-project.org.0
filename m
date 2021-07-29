Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CE3DA0D7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B1F21F0E;
	Thu, 29 Jul 2021 12:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B1F21F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553312;
	bh=wMk6T1it0hsabWV9j0rmt42BG9nquOwHn5acnJOM8Ak=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I8jYB0yYaw1nXyMY8iLUJ/O9917aFDdbCAtlo3v0bfd/AozjYqLEonYLGiXR+MNXd
	 ZPoXbq1Wns4MdG594dyaIF3AgYv9ukKvj8GIbDZZqcPtKvuRTgirRKNh+85uS1/pMi
	 BUg5oktf/q26cy7XuZAh/EC0e0njdCXLLtQu+ZiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B26F8051F;
	Thu, 29 Jul 2021 12:04:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D22DF804AF; Thu, 29 Jul 2021 12:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FEDDF802E7
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FEDDF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KXrUkG6n"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yXrQotTZ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E8C7822416
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c9t6vRtfbBHjEpeUxV9uVlXB0/gd1zGUaaOvx4Wxzpo=;
 b=KXrUkG6nagXAauyljcb/Iw2ydx63cAMTmzJ4zyvCtvTdq/luHeRdMQZA70x+zRyapznf7M
 1quEtZpqE4kKhRYoAJOKMaiZ2J+/t0q+uJZeSJNw7wzj88cqOrCtw9YZ+dHS4HrvfmSlSF
 S07J4FoyadqNb5k5CFu1tPztCtLi/xs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c9t6vRtfbBHjEpeUxV9uVlXB0/gd1zGUaaOvx4Wxzpo=;
 b=yXrQotTZL9DjFuJicAD1iF/QPJWh+FfDApxx+FFjr4wg6K4rn+a9lXJFotop51AbdyKnDW
 6wUe31dBfZIZ8VDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BA7F5A3BCF;
 Thu, 29 Jul 2021 07:38:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/15] ALSA: usb-audio: Introduce and convert to quirk_flags
Date: Thu, 29 Jul 2021 09:38:46 +0200
Message-Id: <20210729073855.19043-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As more and more device-specific workarounds came up and gathered in
various places, it becomes harder to manage.  Now it's time to clean
up and collect workarounds more consistently and make them more easily
applicable.

This patch set introduces a new bitmap flags, quirk_flags, to contain
various device-specific quirks.  Those are separate one from the
quirks in quirks-table.h; the quirks-table.h entries are for more
intrusive stuff that needs the descriptor override, while the new
quirk_flags is for easier ones that are tied with the vendor:product
IDs.


Takashi

===

Takashi Iwai (15):
  ALSA: usb-audio: Introduce quirk_flags field
  ALSA: usb-audio: Move media-controller API quirk into quirk_flags
  ALSA: usb-audio: Move txfr_quirk handling to quirk_flags
  ALSA: usb-audio: Move tx_length quirk handling to quirk_flags
  ALSA: usb-audio: Move playback_first flag into quirk_flags
  ALSA: usb-audio: Move clock setup quirk into quirk_flags
  ALSA: usb-audio: Move ITF-USB DSD quirk handling into quirk_flags
  ALSA: usb-audio: Move control message delay quirk into quirk_flags
  ALSA: usb-audio: Move interface setup delay into quirk_flags
  ALSA: usb-audio: Move rate validation quirk into quirk_flags
  ALSA: usb-audio: Move autosuspend quirk into quirk_flags
  ALSA: usb-audio: Move ignore_ctl_error check into quirk_flags
  ALSA: usb-audio: Move generic DSD raw detection into quirk_flags
  ALSA: usb-audio: Add quirk_flags module option
  ALSA: doc: Add the description of quirk_flags option for snd-usb-audio

 Documentation/sound/alsa-configuration.rst |  26 +-
 sound/usb/card.c                           |  42 ++-
 sound/usb/clock.c                          |  15 +-
 sound/usb/endpoint.c                       |  14 +-
 sound/usb/format.c                         |   6 +-
 sound/usb/implicit.c                       |   6 +-
 sound/usb/mixer.c                          |   6 +-
 sound/usb/mixer.h                          |   3 +-
 sound/usb/mixer_maps.c                     |  22 --
 sound/usb/quirks-table.h                   |  70 +---
 sound/usb/quirks.c                         | 359 +++++++++++----------
 sound/usb/quirks.h                         |   5 +-
 sound/usb/stream.c                         |   4 +-
 sound/usb/usbaudio.h                       |  65 +++-
 14 files changed, 341 insertions(+), 302 deletions(-)

-- 
2.26.2

