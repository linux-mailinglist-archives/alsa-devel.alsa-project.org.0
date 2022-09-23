Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC485E75A2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023691E2;
	Fri, 23 Sep 2022 10:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023691E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663921429;
	bh=aXAxOUEiuU47bpyJk/zXgB8Q9YqFZrurigyFxHN1QXE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rH4q8Ds3DXFGjMhl8gEihpzRF88YdnRA0GktrMwlUZ2xVO+ewN779QoHVfEeXP+qw
	 D2l6y0LMAa0YgfuHpudJlzaDf9GBtvTVJHBUVp+62jutia0BXOki8XjA6H1EfaVx+g
	 qstJiVtMNMFBaDpJ7zELe5978Q1g0lSCdOwIff2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA6BF80431;
	Fri, 23 Sep 2022 10:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC5AF80269; Fri, 23 Sep 2022 10:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DCDEF801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 10:22:44 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3455EA003F;
 Fri, 23 Sep 2022 10:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3455EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663921364; bh=qJpFTfGAb/k0+6Eg9rWRa9UDCpoTpTN0iGcvoG1fNxQ=;
 h=From:To:Cc:Subject:Date:From;
 b=bLfAqnXP5kRe3lOP1VOcy9Mkdc3DdqjOIR0mEgLqkU/Qy1Z193zUvABDEIjVKuFNP
 Rv9jTa22Ah55mGhlVQqFH3obx6pCEof9RDg4W6srln4jroViymyATh7ybjnXYKQxNq
 uD1t1QZIo7eQiHBt4NS0jaInw89PounhfcWbcKRY=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 23 Sep 2022 10:22:41 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/hdmi: Limit the maximal count of PCM devices to 8
Date: Fri, 23 Sep 2022 10:22:36 +0200
Message-Id: <20220923082236.61024-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

The current hardware has up to 4 converters. Save little space.
The limit 8 is enough even for a more improved hardware.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index ac520c62ee70..d90c9286ac6d 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -151,7 +151,7 @@ struct hdmi_spec {
 	 */
 	int dev_num;
 	struct snd_array pins; /* struct hdmi_spec_per_pin */
-	struct hdmi_pcm pcm_rec[16];
+	struct hdmi_pcm pcm_rec[8];
 	struct mutex pcm_lock;
 	struct mutex bind_lock; /* for audio component binding */
 	/* pcm_bitmap means which pcms have been assigned to pins*/
@@ -2288,8 +2288,8 @@ static int generic_hdmi_build_pcms(struct hda_codec *codec)
 		pstr = &info->stream[SNDRV_PCM_STREAM_PLAYBACK];
 		pstr->substreams = 1;
 		pstr->ops = generic_ops;
-		/* pcm number is less than 16 */
-		if (spec->pcm_used >= 16)
+		/* pcm number is less than pcm_rec array size */
+		if (spec->pcm_used >= ARRAY_SIZE(spec->pcm_rec))
 			break;
 		/* other pstr fields are set in open */
 	}
-- 
2.35.3
