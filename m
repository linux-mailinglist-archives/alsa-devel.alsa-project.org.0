Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A801577774
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 19:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941CB1743;
	Sun, 17 Jul 2022 19:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941CB1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658078635;
	bh=0lqHsVjH0uTNpBDZw9/mhf/zNoJPbMZdzKqHYlA9Pu0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bcKOPQXF2TmkKNqxQnJM5daamcGaYybt1dGgQWHRKo74Tu0QRS3lUCMuhqYO8PrWw
	 p+1Bd7RFf597mbARAbjFupt/Du5p1HALSUYYgVzJeR57dCdlMM31PTDCud4lTqGH23
	 7kbJmRZs2F8+AnzQABnWucWOKfD12Wq/qx0OgKzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E33F80171;
	Sun, 17 Jul 2022 19:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA174F800F5; Sun, 17 Jul 2022 19:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C84CBF800F5
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 19:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C84CBF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="d8r8feou"
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3DA6D1C0002;
 Sun, 17 Jul 2022 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1658078565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ELW64QdsT7z5rgjIy9jRPA9JDF4KWeYsB4h4aLZP1h0=;
 b=d8r8feouYKdbkxdY9qG6pMCRue9muaEjHYxtuVtUY+N2auPvMenRudqc1wnL4R7rj4wpVC
 qHN2UVetC2xps57FI49yw6LopG2uAcEJVEgp1rjcm1XKdyPNVKWenUdDFOfp31/v4Jd/Vl
 5wMLitIa2Odyce0WkcO9XgW0AH3hQjj8rysGQWCIFMXJnrlT99wGKvfe5eEG/vpiUYfNEy
 +QklGEfsvE4zIV3BjYSdhKcKcS7rJ1JmIlwMP9nVdR2ElDgsVN8P21peZcTB6uWJHuuChd
 UvzMqyGcNWNsbpmJ8tqwLGU0CwZX5Mz5blPaDxa+NiABusJDqx4qmrP5l6z3aA==
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] alsactl/info.c: fix conditionals on __ALSA_PCM_H
 and __ALSA_RAWMIDI_H
Date: Sun, 17 Jul 2022 19:22:40 +0200
Message-Id: <20220717172240.1386150-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Commit bbc74a61ac7c35e506c3d7f76ecf943cb55736a6 ("alsactl: implement
'info' command") implemented an alsactl info command. In this
implementation, there was an attempt to properly address optional
features from alsa-lib by using conditions on __ALSA_PCM_H,
__ALSA_RAWMIDI_H.

Unfortunately, this attempt does not work entirely: only the code
inside pcm_device_list(), rawmidi_device_list() was conditionally
compiled, but their very prototype also use type definitions provided
in pcm.h and rawmidi.h. So really, it's the entire function that needs
to be conditionally implemented.

Also, snd_rawmidi_stream_name() was not handled properly, for the same
reason.

This commit implements pcm_device_list() only if __ALSA_PCM_H is
defined, and implements snd_rawmidi_stream_name() and
rawmidi_device_list() only if __ALSA_RAWMIDI_H is defined.

general_card_info() is modified to not call the PCM or raw MIDI
functions when support is not available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 alsactl/info.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/alsactl/info.c b/alsactl/info.c
index 253539d..9bd72af 100644
--- a/alsactl/info.c
+++ b/alsactl/info.c
@@ -22,9 +22,9 @@
 #include "aconfig.h"
 #include "alsactl.h"
 
+#ifdef __ALSA_PCM_H
 static int pcm_device_list(snd_ctl_t *ctl, snd_pcm_stream_t stream, bool *first)
 {
-#ifdef __ALSA_PCM_H
 	int err, dev, idx;
 	unsigned int count;
 	snd_pcm_info_t *pcminfo;
@@ -76,10 +76,12 @@ static int pcm_device_list(snd_ctl_t *ctl, snd_pcm_stream_t stream, bool *first)
 						idx, snd_pcm_info_get_subdevice_name(pcminfo));
 		}
 	}
-#endif
+
 	return 0;
 }
+#endif
 
+#ifdef __ALSA_RAWMIDI_H
 static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
 {
 	if (stream == SND_RAWMIDI_STREAM_INPUT)
@@ -91,7 +93,6 @@ static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
 
 static int rawmidi_device_list(snd_ctl_t *ctl, snd_rawmidi_stream_t stream, bool *first)
 {
-#ifdef __ALSA_RAWMIDI_H
 	int err, dev, idx;
 	unsigned int count;
 	snd_rawmidi_info_t *info;
@@ -143,9 +144,10 @@ static int rawmidi_device_list(snd_ctl_t *ctl, snd_rawmidi_stream_t stream, bool
 						idx, snd_rawmidi_info_get_subdevice_name(info));
 		}
 	}
-#endif
+
 	return 0;
 }
+#endif
 
 static int hwdep_device_list(snd_ctl_t *ctl)
 {
@@ -227,17 +229,21 @@ int general_card_info(int cardno)
 	}
 	err = card_info(ctl);
 
+#ifdef __ALSA_PCM_H
 	first = true;
 	if (err >= 0)
 		err = pcm_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
 	if (err >= 0)
 		err = pcm_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
+#endif
 
+#ifdef __ALSA_RAWMIDI_H
 	first = true;
 	if (err >= 0)
 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
 	if (err >= 0)
 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
+#endif
 
 	if (err >= 0)
 		err = hwdep_device_list(ctl);
-- 
2.36.1

