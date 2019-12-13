Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895211DFFD
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 09:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3B2176F;
	Fri, 13 Dec 2019 09:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3B2176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576227275;
	bh=2AGEJQEm9l9Ku5X4vGd6s6EO9yy4BkMGUZfMndiZoac=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uhPBN97bw6ONqKnfbG4y8FV/g4XEn+iNc4XHqX4wHy/2zXGA41wO+KIFne5XIMF4H
	 iHxtYRF+xIGqOy2c8SY50byE+/BYM1mU10rxkQabG6rIEVeHGduHD+vWCLJGRH+9O9
	 hCx15C3gGmL3RnSbeHNuZ9V3DQI1B7rC5TuDHm5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2E8F80265;
	Fri, 13 Dec 2019 09:51:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7635F801F4; Fri, 13 Dec 2019 09:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B71F8014F
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 09:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B71F8014F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47C22AE3F
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 08:51:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 13 Dec 2019 09:51:09 +0100
Message-Id: <20191213085111.22855-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191213085111.22855-1-tiwai@suse.de>
References: <20191213085111.22855-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/3] ALSA: hda/ca0132 - Keep power on during
	processing DSP response
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We need to keep power on while processing the DSP response via unsol
event.  Each snd_hda_codec_read() call does the power management, so
it should work normally, but still it's safer to keep the power up for
the whole function.

Fixes: a73d511c4867 ("ALSA: hda/ca0132: Add unsol handler for DSP and jack detection")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index b7a1abb3e231..c3d34ff3d9ec 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7588,12 +7588,14 @@ static void ca0132_process_dsp_response(struct hda_codec *codec,
 	struct ca0132_spec *spec = codec->spec;
 
 	codec_dbg(codec, "ca0132_process_dsp_response\n");
+	snd_hda_power_up_pm(codec);
 	if (spec->wait_scp) {
 		if (dspio_get_response_data(codec) >= 0)
 			spec->wait_scp = 0;
 	}
 
 	dspio_clear_response_queue(codec);
+	snd_hda_power_down_pm(codec);
 }
 
 static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
