Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F385EA7C8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71EB15E0;
	Mon, 26 Sep 2022 15:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71EB15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200782;
	bh=WpH0jkHZ0P646OfFVaZSwBlHkImzBeq+wpIJpbOk+/I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S/X/8YeyJouGVdR1E8oFeTamkUtjnQm92na8O/wjYKsprb3LtU2+Z49ur/Gsmbyb5
	 OUi/MjJsClK2BFWCq52YlNyET317Icr5jcvZFrMwCi6fUjrC8MS8E0y2xN+Q18SNDE
	 UktKN8XwtfWxhnnocBDHfvgdpWzf171Tiw/fJr6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3418F80587;
	Mon, 26 Sep 2022 15:56:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00476F80571; Mon, 26 Sep 2022 15:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69DE2F80424
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69DE2F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="sP5rEyfA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="v/JFLLwa"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A91901F889;
 Mon, 26 Sep 2022 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=t3VnEK8pe7loTqNAmSyWDYkAo2MTa/UPUIT9FgnYtHY=;
 b=sP5rEyfAcnPGvbUPToCceRBYScXSaWLQ0bj4Qi2n+53+wCoXK2bwKXeSKksQtfBkXli5nu
 76KwzBcFSIEDa24UVVZzxVDVk2LOEA1u7+Q5oexW2+y2e0PHQSIh17+BhvjqS+rIS8XtuD
 eTeoc9mbrnoDNIpmxOAdJC9KeTn/OlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=t3VnEK8pe7loTqNAmSyWDYkAo2MTa/UPUIT9FgnYtHY=;
 b=v/JFLLwadE4RhC3UONKa6UXsTllc/fs6/F+HQywmZI+PxgkEJ/dd+aQ5p2x/hEergNGr3E
 ppCqK26GrFvGQRCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59734139BD;
 Mon, 26 Sep 2022 13:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8df8FHevMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11] ALSA: PCM state reference optimization
Date: Mon, 26 Sep 2022 15:55:47 +0200
Message-Id: <20220926135558.26580-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Felipe Balbi <balbi@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

this is a patch set for simplifying the reference to the current PCM
state by having the local copy in runtime instead of relying on
runtime->status indirection.  This also hardens against the attack by
modifying the mmapped status record.

The first patch does the basic job in the core PCM side, and the
second patch flips the PCM status mmap to read-only for hardening,
while the remaining patches are for drivers to follow the core
change.

The conversions are straightforward.  In most places, it's just
replacing runtime->status->state with runtime->state.


Takashi

===

Takashi Iwai (11):
  ALSA: pcm: Avoid reference to status->state
  ALSA: pcm: Make mmap status read-only
  ALSA: aloop: Replace runtime->status->state reference to
    runtime->state
  ALSA: firewire: Replace runtime->status->state reference to
    runtime->state
  ALSA: hda: Replace runtime->status->state reference to runtime->state
  ALSA: asihpi: Replace runtime->status->state reference to
    runtime->state
  ALSA: usb-audio: Replace runtime->status->state reference to
    runtime->state
  ALSA: usx2y: Replace runtime->status->state reference to
    runtime->state
  ASoC: intel: Replace runtime->status->state reference to
    runtime->state
  ASoC: sh: Replace runtime->status->state reference to runtime->state
  usb: gadget: Replace runtime->status->state reference to
    runtime->state

 drivers/usb/gadget/function/u_uac1_legacy.c |   4 +-
 include/sound/pcm.h                         |  20 ++-
 sound/core/oss/pcm_oss.c                    |  42 +++----
 sound/core/pcm.c                            |   9 +-
 sound/core/pcm_compat.c                     |   4 +-
 sound/core/pcm_lib.c                        |  16 +--
 sound/core/pcm_native.c                     | 128 ++++++++++----------
 sound/drivers/aloop.c                       |   4 +-
 sound/firewire/bebob/bebob_pcm.c            |   4 +-
 sound/firewire/dice/dice-pcm.c              |   4 +-
 sound/firewire/digi00x/digi00x-pcm.c        |   4 +-
 sound/firewire/fireface/ff-pcm.c            |   4 +-
 sound/firewire/fireworks/fireworks_pcm.c    |   4 +-
 sound/firewire/motu/motu-pcm.c              |   4 +-
 sound/firewire/oxfw/oxfw-pcm.c              |   8 +-
 sound/firewire/tascam/tascam-pcm.c          |   4 +-
 sound/hda/hdmi_chmap.c                      |   2 +-
 sound/pci/asihpi/asihpi.c                   |   2 +-
 sound/soc/intel/skylake/skl-pcm.c           |   4 +-
 sound/soc/sh/rz-ssi.c                       |   2 +-
 sound/usb/pcm.c                             |   4 +-
 sound/usb/usx2y/usbusx2yaudio.c             |   3 +-
 sound/usb/usx2y/usx2yhwdeppcm.c             |   3 +-
 23 files changed, 150 insertions(+), 133 deletions(-)

===

Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>

-- 
2.35.3

