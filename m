Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF9A5EEF32
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E319315C3;
	Thu, 29 Sep 2022 09:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E319315C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437039;
	bh=wFwH3HagtYKMjlj352JFNByNP5gYt/beqObaDPq5gdg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShLPmyt7xoivfVlMom6z9AW4uLn5ePelk2vbggNSCGBMJb+PjQc9aAeeFF07hamh/
	 39cJDBJOZpHTciQNFsb2SDVBrwrE4SZkKEK3DybnLi5SmkkD4TaXd4mbA7/RpQvHHN
	 xz6aNhpAw5sAX7wEfqT1/5x0eV567khZ7U4ptoSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95FCFF80095;
	Thu, 29 Sep 2022 09:36:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D0ACF8053C; Thu, 29 Sep 2022 09:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A42BF800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A42BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WnRIR3oW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5OPOT4iK"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D930721B9B;
 Thu, 29 Sep 2022 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ihg9bap9gIGjE0kK7NEFdJh1PD6QWEL0SClbwV/dBcA=;
 b=WnRIR3oWGpTVAkIgKiODOPqzb9zdmpBR6X2/Gp49Q7cBZIi4nmG9QnNorl+HAJZb/x0RGI
 NKGfDUynd2yC147vJMkedq0PDbqaoWr1KFVk9Lp99AMbP7VSFRvfoA33tFjKY2CgEZWci2
 qT39t5kEUbd+rXvVqSivf7l7HY+KJB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ihg9bap9gIGjE0kK7NEFdJh1PD6QWEL0SClbwV/dBcA=;
 b=5OPOT4iK+kY4hTRpie3MGAzhQ6F827rpb/Pw1KdmGOETyEHdPEYjCc69m1sC4gwIDcnPSL
 e5HtM8R4wITprKCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8C281348E;
 Thu, 29 Sep 2022 07:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gPJRLNdKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ALSA: hda/realtek: Add model option to codec driver, too
Date: Thu, 29 Sep 2022 09:35:38 +0200
Message-Id: <20220929073545.1085-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220929073545.1085-1-tiwai@suse.de>
References: <20220929073545.1085-1-tiwai@suse.de>
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

The model option of snd-hda-intel or SOF driver is useful for testing
/ debugging quirks.  Since many devices have multiple codecs and the
quirk is rather codec-specific, it's often difficult to pass the model
to the proper target.

This patch adds the equivalent model option to Realek codec driver, so
that user can optionally specify the option for the codec instead of
snd-hda-intel or SOF drivers.

That is, you can pass the boot option like
  snd_hda_codec_realtek.model=foobar
or
  snd_hda_codec_realtek.model=103c:89c6
for applying a quirk.

The model option of snd-hda-intel or SOF is still effective.  When the
option is given for both, the option for the controller driver wins.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3dc19174670e..351eb582ad8c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -16,6 +16,7 @@
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <sound/core.h>
@@ -27,6 +28,11 @@
 #include "hda_generic.h"
 #include "hda_component.h"
 
+/* codec-specific model option -- equivalent with snd-hda-intel.model option */
+static char *codec_model;
+module_param_named(model, codec_model, charp, 0444);
+MODULE_PARM_DESC(model, "Use the given board model.");
+
 /* keep halting ALC5505 DSP, for power saving */
 #define HALT_REALTEK_ALC5505
 
@@ -1207,6 +1213,11 @@ static int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
 		kfree(spec);
 		return err;
 	}
+
+	/* assign optional modelname; freed at snd_hda_codec_dev_release() */
+	if (!codec->modelname && codec_model)
+		codec->modelname = kstrdup(codec_model, GFP_KERNEL);
+
 	return 0;
 }
 
-- 
2.35.3

