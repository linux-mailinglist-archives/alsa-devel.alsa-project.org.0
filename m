Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27A5EEF37
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8EF1640;
	Thu, 29 Sep 2022 09:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8EF1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437064;
	bh=RbPVhJcqhuKo4Lr3CPR4cpU3xz2CDH+l5VXOkws6klE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAp/6Ar/Kti+sHnuvZyMxpiSwYBNMy+b3ToVie6ZOrT/ybr9S4c5Fjt05P+ZUL+my
	 OLy3CRpeKW0lAdIsYst2zcCP9/hl8/eBT5IqOyg8/ViXtqOr6QMk8KXwSjZ3FTjy2t
	 bnNsQrH2S2slxnlWbX963490oHsrQ4sn0Sjh55dk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF620F80542;
	Thu, 29 Sep 2022 09:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E22F80542; Thu, 29 Sep 2022 09:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F80DF80537
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F80DF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ep1bZ/RI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="D+uwLUcp"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C4E61F8D7;
 Thu, 29 Sep 2022 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k0Wu1ao03eUEa03hvfuX+8nm1JAJbHDAanqS0wihNw=;
 b=ep1bZ/RIkVeJ0oSfgeu5jJPjKOcSpZKqrlNnd14D4tlQtKuP4iYtjZfifEcDFSd1O3I5r2
 q1S8WOk3rljhJAl2RwPMP1vBSOMMvwUENaCbQxw0ZjMg/n/YU0t90WvUUpvU8qyfe62xmi
 N8Ma99r48FWw65BjmPvmeeEP6CqeglU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k0Wu1ao03eUEa03hvfuX+8nm1JAJbHDAanqS0wihNw=;
 b=D+uwLUcpFrM1Sucj9RxXaxtpX9tGGjtZH5N4nIUkpZNX+LhbQecvkyUqxdtDE1g7C5kSG2
 LKOdLpOfebty+LAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FF5D1348E;
 Thu, 29 Sep 2022 07:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gLKGHtpKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ALSA: hda/analog: Add model option to codec driver, too
Date: Thu, 29 Sep 2022 09:35:42 +0200
Message-Id: <20220929073545.1085-6-tiwai@suse.de>
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

This patch adds the equivalent model option to Analog codec driver, so
that user can optionally specify the option for the codec instead of
snd-hda-intel or SOF drivers.

That is, you can pass the boot option like
  snd_hda_codec_analog.model=foobar
or
  snd_hda_codec_analog.model=103c:2a82
for applying a quirk no matter whether you use snd-hda-intel or SOF.

The model option of snd-hda-intel or SOF is still effective.  When the
option is given for both, the option for the controller driver wins.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_analog.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
index 8afe6000f7da..1a6efa79309f 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/pci/hda/patch_analog.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 
 #include <sound/core.h>
 #include <sound/hda_codec.h>
@@ -18,6 +19,10 @@
 #include "hda_jack.h"
 #include "hda_generic.h"
 
+/* codec-specific model option -- equivalent with snd-hda-intel.model option */
+static char *codec_model;
+module_param_named(model, codec_model, charp, 0444);
+MODULE_PARM_DESC(model, "Use the given board model.");
 
 struct ad198x_spec {
 	struct hda_gen_spec gen;
@@ -203,6 +208,11 @@ static int alloc_ad_spec(struct hda_codec *codec)
 	codec->spec = spec;
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->patch_ops = ad198x_auto_patch_ops;
+
+	/* assign optional modelname; freed at snd_hda_codec_dev_release() */
+	if (!codec->modelname && codec_model)
+		codec->modelname = kstrdup(codec_model, GFP_KERNEL);
+
 	return 0;
 }
 
-- 
2.35.3

