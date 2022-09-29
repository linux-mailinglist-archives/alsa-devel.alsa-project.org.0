Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D91795EEF42
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725221632;
	Thu, 29 Sep 2022 09:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725221632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437146;
	bh=GfpdYj36xvqhYENPTPuVE9MgIrktoltAjMJddzC8fOY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N7eA947tY0wbV5XULVgsHOx93llf+2ijRDuPhaJeMTMWAsOBH7WkWJ2Y3HUs4ks9w
	 Qhf1JIEry+h/KrFvoxOplsug9tNhLDe+XtaiYN/IDR0ZLPMBUJXY5noxNdKGL1n7wI
	 wY4EwO4Uqs9pb0tGW4VFrgN0j4EzVyyzSyey5xQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 599E2F80570;
	Thu, 29 Sep 2022 09:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ED33F80539; Thu, 29 Sep 2022 09:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C14F804F1
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C14F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KzWpOtcz"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UIMGxHfg"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E26C1F919;
 Thu, 29 Sep 2022 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAfnPHJ1H89TtOAUWzbySJIFphztr6xSuVREkF3uLN8=;
 b=KzWpOtcz4nO8ub893+H9+/zRDdaayBhTsSStucnBabZE6fIzX2C/hVLB+1nhwXcAbsVS8d
 MJsv3oTy3rWVSvIV4+9c9vnwd45b0JECVjbWQLbFaaLIWDugg5jBCVqikUZJsuc5Tfi0sq
 +pJYXcuwejYIk53LlCvd1SDrH5d98mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAfnPHJ1H89TtOAUWzbySJIFphztr6xSuVREkF3uLN8=;
 b=UIMGxHfgbxhO/uGl000GsLhUv5ZgGPfuQzXRFuF5u7fA+Fd7cgYhQaUy0pwgmGxU6i6Wel
 gYD6jvz95X3zUrBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC7B11348E;
 Thu, 29 Sep 2022 07:35:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UAsWOdlKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ALSA: hda/cs8409: Add model option to codec driver, too
Date: Thu, 29 Sep 2022 09:35:41 +0200
Message-Id: <20220929073545.1085-5-tiwai@suse.de>
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

This patch adds the equivalent model option to CS8409 codec driver, so
that user can optionally specify the option for the codec instead of
snd-hda-intel or SOF drivers.

That is, you can pass the boot option like
  snd_hda_codec_cs8409.model=foobar
or
  snd_hda_codec_cs8409.model=1028:0c43
for applying a quirk no matter whether you use snd-hda-intel or SOF.

The model option of snd-hda-intel or SOF is still effective.  When the
option is given for both, the option for the controller driver wins.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_cs8409.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 754aa8ddd2e4..13aef05383a4 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -9,10 +9,16 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <sound/core.h>
 #include <linux/mutex.h>
 #include <linux/iopoll.h>
 
+/* codec-specific model option -- equivalent with snd-hda-intel.model option */
+static char *codec_model;
+module_param_named(model, codec_model, charp, 0444);
+MODULE_PARM_DESC(model, "Use the given board model.");
+
 #include "patch_cs8409.h"
 
 /******************************************************************************
@@ -66,6 +72,10 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
 	snd_hda_gen_spec_init(&spec->gen);
 
+	/* assign optional modelname; freed at snd_hda_codec_dev_release() */
+	if (!codec->modelname && codec_model)
+		codec->modelname = kstrdup(codec_model, GFP_KERNEL);
+
 	return spec;
 }
 
-- 
2.35.3

