Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C903A4686C2
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 18:46:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FAED229B;
	Sat,  4 Dec 2021 18:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FAED229B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638640016;
	bh=SKTOiEnCRSF1blw0CzZe+GV1RIbwCYCpvBVjjm5D05I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKQLZttSlwDNvjelr/4lSRZEvzvdAtBl1v+XBvHKzYRARoKO86pUeB/qX+vvWgLQP
	 /5s3poVtQwte1QniWUvIJ9maUis8Vq0m7C+5P3RLZgGZeRFsOl5IFAyRhOvI+ZDAUU
	 Wd547ob/r+ZI2zry/FW4pU+txfXrK7NZ2BaJJpbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FAC1F80482;
	Sat,  4 Dec 2021 18:45:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D78BF80134; Sat,  4 Dec 2021 18:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A89F80134;
 Sat,  4 Dec 2021 18:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A89F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m0MsmUYr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD69460EAB;
 Sat,  4 Dec 2021 17:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CC5C341C0;
 Sat,  4 Dec 2021 17:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638639935;
 bh=SKTOiEnCRSF1blw0CzZe+GV1RIbwCYCpvBVjjm5D05I=;
 h=From:To:Cc:Subject:Date:From;
 b=m0MsmUYrwuVUwKl6MZElcwxrLizu/pvR3AR8zk2PHOHYKVJxiWKhKJHu6p271XZaf
 gNYpo6z4q2n5vFU7JbZ24L6EhTEl+SGo78rEKizqJvj2z18XyZ43sVMlajy28z8T3M
 aLWaL07Bbrekg9klx6pKn5wvOuPj43pJMAYGReJnnQdTxfCsGn7vKFwtmnUT8BbypD
 2j2WABgRJUFkfYYGbU7iwInvTSEffsHgCqNDyZ8sY17MTG4ZiH2jPzqYvNGXslHJa2
 zU/JEuwUxtdf6ixCzLw6wlaxAioKp10v0jUHTbzxIXUy1I5uJeoOqs6jaFHjhMzS1i
 s71zdUjirwvug==
From: Arnd Bergmann <arnd@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] ASoC: SOF: Intel: move CODEC_PROBE_RETRIES definition
Date: Sat,  4 Dec 2021 18:44:47 +0100
Message-Id: <20211204174529.1122697-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Bard Liao <bard.liao@intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Arnd Bergmann <arnd@arndb.de>

The macro is defined in an #ifdef but used outside:

sound/soc/sof/intel/hda-codec.c: In function 'hda_codec_probe':
sound/soc/sof/intel/hda-codec.c:132:42: error: 'CODEC_PROBE_RETRIES' undeclared (first use in this function)
  132 |         } while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
      |                                          ^~~~~~~~~~~~~~~~~~~

Move it to a place where it can be seen unconditionally.

Fixes: 046aede2f847 ("ASoC: SOF: Intel: Retry codec probing if it fails")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/hda-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 13cd96e6724a..4324178b3ca6 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -20,9 +20,10 @@
 #include "../../codecs/hdac_hda.h"
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
+#define CODEC_PROBE_RETRIES 3
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #define IDISP_VID_INTEL	0x80860000
-#define CODEC_PROBE_RETRIES 3
 
 /* load the legacy HDA codec driver */
 static int request_codec_module(struct hda_codec *codec)
-- 
2.29.2

