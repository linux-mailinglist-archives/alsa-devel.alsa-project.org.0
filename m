Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FED5EEF34
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00345161E;
	Thu, 29 Sep 2022 09:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00345161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437058;
	bh=Jzo5+IRAgeILzE6U7oKAiZ8P4/AmWnpvBw/MrybUGIs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q1cEnNFO7XJ2++B419C1ah16mlEoksiZpK32Wdc59B+SBdCoabj1JOTPr0tjfSl2Y
	 IhtppZoKiqxwXptLw/HLgD6lQvBnM4FkIVQpy4xSf9EnwNiZWtNw1+qc4NbF+a2Vm5
	 bUaCJ9IZXRwNexuuULRH9SLzP/agRZ8H1qD/5HMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30250F8053D;
	Thu, 29 Sep 2022 09:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62551F8053B; Thu, 29 Sep 2022 09:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42A6AF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A6AF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cZuTKJon"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YCEtSlv5"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC05E1F8D7;
 Thu, 29 Sep 2022 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y80Ayjl17PZYBNqDnDHhsBIlrgYlGzp6bV3XVVGLXzw=;
 b=cZuTKJon0YoHQmxDpiNHoOwlL2DjV8hE0s3Pp4Q1/cERU0XnD7I3HtZ4PcX7/WwZEIKBKI
 D68V8XgvlqMlKV8wUyuP/eGHsX9S1GmPK/ev+nevKM326OEUHg4hLPuw/spuf1QAtBfIpB
 +CN6MrAsEu1wmBnHhLBK93aij1izdeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y80Ayjl17PZYBNqDnDHhsBIlrgYlGzp6bV3XVVGLXzw=;
 b=YCEtSlv5J1hFo5zUxfipw0cdeezgyIAnd3VMe6D2lGysQFVPZpB7ZpQV+x04UJAdH8mJ4t
 7vxTYpatTsafzzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3D3C1348E;
 Thu, 29 Sep 2022 07:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IPJIJ9hKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ALSA: hda/cirrus: Add model option to codec driver, too
Date: Thu, 29 Sep 2022 09:35:39 +0200
Message-Id: <20220929073545.1085-3-tiwai@suse.de>
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

This patch adds the equivalent model option to Cirrus codec driver, so
that user can optionally specify the option for the codec instead of
snd-hda-intel or SOF drivers.

That is, you can pass the boot option like
  snd_hda_codec_cirrus.model=foobar
or
  snd_hda_codec_cirrus.model=106b:5e00
for applying a quirk.

The model option of snd-hda-intel or SOF is still effective.  When the
option is given for both, the option for the controller driver wins.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_cirrus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 6807b4708a17..c70c72c85831 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <sound/core.h>
 #include <linux/pci.h>
 #include <sound/tlv.h>
@@ -17,6 +18,11 @@
 #include "hda_jack.h"
 #include "hda_generic.h"
 
+/* codec-specific model option -- equivalent with snd-hda-intel.model option */
+static char *codec_model;
+module_param_named(model, codec_model, charp, 0444);
+MODULE_PARM_DESC(model, "Use the given board model.");
+
 /*
  */
 
@@ -581,6 +587,10 @@ static struct cs_spec *cs_alloc_spec(struct hda_codec *codec, int vendor_nid)
 	codec->power_save_node = 1;
 	snd_hda_gen_spec_init(&spec->gen);
 
+	/* assign optional modelname; freed at snd_hda_codec_dev_release() */
+	if (!codec->modelname && codec_model)
+		codec->modelname = kstrdup(codec_model, GFP_KERNEL);
+
 	return spec;
 }
 
-- 
2.35.3

