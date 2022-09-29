Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DCD5EEF41
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54473161F;
	Thu, 29 Sep 2022 09:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54473161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437133;
	bh=bNdkDxRXzfWOWhxmB+lqUMZQdW0uIEm9AerSsnfSlLA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mEYJDkhNm5EH6fi/Tpu0df/KH8BcEDKkZDPtt9HsqKCztI1VjU2v1hzYThOZxxdM9
	 FCJ34Pc2qNyMIq6Hdn92uykHzPTQI6llJpKHLn99lVSjiJ0JOEaju8jt2excH+SP8v
	 eBXI2iF736fwU7pxhkUHfUfWK7t8ku/6Nz0oLcvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D710DF80566;
	Thu, 29 Sep 2022 09:36:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E2FF80551; Thu, 29 Sep 2022 09:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 833E4F80539
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 833E4F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hxlY8TyI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="gvxpv/+w"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24A021F92A;
 Thu, 29 Sep 2022 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuHXkgben/SjRIEmb6r0yxDNy0aRfoQnRqx/MO77mzw=;
 b=hxlY8TyIV399mVmkgjivptU6RXEyM0cRUl8XF6ltuZPSxpfYBQmVq/NB0lbagVBCFfKW1n
 fkWb75KL5EbBCEtsgieoWlpHE6cbH5LF+VInviQh+vjaW0Pubm3pyNCCJ7hpSoGXo0I3ZE
 m2737KbJ03ypg1T4TQ2LTeVG/b6zet4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuHXkgben/SjRIEmb6r0yxDNy0aRfoQnRqx/MO77mzw=;
 b=gvxpv/+w76NG4E0u//MS2BcYZxy+mqSTB0YuT8rE1fI9ESPvcpJZyB82Ypu+4HAsWpHVH1
 vHAJp6/moHYjnMDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AFF41348E;
 Thu, 29 Sep 2022 07:35:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UE7JAdtKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ALSA: hda/sigmatel: Add model option to codec driver, too
Date: Thu, 29 Sep 2022 09:35:43 +0200
Message-Id: <20220929073545.1085-7-tiwai@suse.de>
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

This patch adds the equivalent model option to IDT/Sigmatel codec
driver, so that user can optionally specify the option for the codec
instead of snd-hda-intel or SOF drivers.

That is, you can pass the boot option like
  snd_hda_codec_idt.model=foobar
or
  snd_hda_codec_idt.model=103c:3610
for applying a quirk no matter whether you use snd-hda-intel or SOF.

The model option of snd-hda-intel or SOF is still effective.  When the
option is given for both, the option for the controller driver wins.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_sigmatel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 7f340f18599c..f3143f8b59f0 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -17,6 +17,7 @@
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/hda_codec.h>
@@ -26,6 +27,11 @@
 #include "hda_jack.h"
 #include "hda_generic.h"
 
+/* codec-specific model option -- equivalent with snd-hda-intel.model option */
+static char *codec_model;
+module_param_named(model, codec_model, charp, 0444);
+MODULE_PARM_DESC(model, "Use the given board model.");
+
 enum {
 	STAC_REF,
 	STAC_9200_OQO,
@@ -4494,6 +4500,11 @@ static int alloc_stac_spec(struct hda_codec *codec)
 	codec->no_trigger_sense = 1; /* seems common with STAC/IDT codecs */
 	spec->gen.dac_min_mute = true;
 	codec->patch_ops = stac_patch_ops;
+
+	/* assign optional modelname; freed at snd_hda_codec_dev_release() */
+	if (!codec->modelname && codec_model)
+		codec->modelname = kstrdup(codec_model, GFP_KERNEL);
+
 	return 0;
 }
 
-- 
2.35.3

