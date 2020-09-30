Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEF27E7AD
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 13:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B06E817E3;
	Wed, 30 Sep 2020 13:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B06E817E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601465520;
	bh=7Ozdgib8Iva8w4IOAM8YO1I4lp2MsOdvJ/FNECURGWs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vtzwwo6lW3tpcUAbCvxhX2UABmKK058E1HqmlkZq8DP/pj+vJLSDIB3APAF8T5OdS
	 YU1WhD4R/06iyS7pkgYziD6ZDwhPPY0J+eZggs0vXkkkcXAXpg1wXytDGFZ3op4TVE
	 JHdjm2P5lk3VZ66sjvNxlIjEOxDXANK7QlAfChe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B21C3F80110;
	Wed, 30 Sep 2020 13:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4963F801ED; Wed, 30 Sep 2020 13:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DBB0F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 13:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DBB0F80110
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34640AD33;
 Wed, 30 Sep 2020 11:30:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/ca0132: Move unsol callback setups to parser
Date: Wed, 30 Sep 2020 13:30:08 +0200
Message-Id: <20200930113008.9307-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Hui Wang <hui.wang@canonical.com>
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

The setup of unsolicited event callbacks should be done only once at
the parser phase, not in the init phase that is called multiple times
at each resume.

This patch moves the unsol setup code in ca0132 codec driver to the
more appropriate place.

Reported-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 9779978e4bc7..2e3ae9975946 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8538,7 +8538,7 @@ static void amic_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 		ca0132_select_mic(codec);
 }
 
-static void ca0132_init_unsol(struct hda_codec *codec)
+static void ca0132_setup_unsol(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 	snd_hda_jack_detect_enable_callback(codec, spec->unsol_tag_hp, hp_callback);
@@ -9368,7 +9368,6 @@ static int ca0132_init(struct hda_codec *codec)
 	if (ca0132_quirk(spec) == QUIRK_AE5 || ca0132_quirk(spec) == QUIRK_AE7)
 		ae5_register_set(codec);
 
-	ca0132_init_unsol(codec);
 	ca0132_init_params(codec);
 	ca0132_init_flags(codec);
 
@@ -9933,6 +9932,8 @@ static int patch_ca0132(struct hda_codec *codec)
 	if (err < 0)
 		goto error;
 
+	ca0132_setup_unsol(codec);
+
 	return 0;
 
  error:
-- 
2.16.4

