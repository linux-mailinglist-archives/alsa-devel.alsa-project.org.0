Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A713E95C0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 18:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB5D5175E;
	Wed, 11 Aug 2021 18:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB5D5175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628698629;
	bh=O//oYOIkayYPDW0xuQz4kCPNZwl4Yl5oUdfseBre0kE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dik/FPnEV/KDt+4smnvjw4R/nthtEQjzqjP93v6yxM9ztLeeVEQ5EEHDn5pxKKzJF
	 ZpMba8utgUxkyNICpyHlKIaboKsyFcyO7PzK4PygT72Wj3IuCrVwgarPMEygbIYy22
	 lDnKPMIa4FXvGDemsGbX38GsXKFe5Z6pN49ILojo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC0C5F8032D;
	Wed, 11 Aug 2021 18:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5625F802D2; Wed, 11 Aug 2021 18:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CC14F800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 18:15:31 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 37419A003F;
 Wed, 11 Aug 2021 18:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 37419A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1628698530; bh=YiD1eu/LlWmc/H4j0aIcYoiuVvtpVAPZekg6jiYXLbw=;
 h=From:To:Cc:Subject:Date:From;
 b=C0qyN6A01cXdLhtVeJztf66hl+UTHpI8XwtFR7qkq0MfnfmHRRWbguOTE6FEq454o
 DizdMTreNQH62ElQia2aIW0MtvJlHmERAsOUaBrwIAv49CBZ8nVi0SK9Yo3fXXlvXM
 A7tG5qcGpDjRtImgn8d7MgvaxzMYCCLvcY5SGaEM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 11 Aug 2021 18:15:26 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda - fix the 'Capture Switch' value change
 notifications
Date: Wed, 11 Aug 2021 18:14:41 +0200
Message-Id: <20210811161441.1325250-1-perex@perex.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, stable@kernel.org
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

The original code in the cap_put_caller() function does not
handle correctly the positive values returned from the passed
function for multiple iterations. It means that the change
notifications may be lost.

Fixes: 352f7f914ebb ("ALSA: hda - Merge Realtek parser code to generic parser")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213851
Cc: <stable@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/hda_generic.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index e97d00585e8e..481d8f8d3396 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3460,7 +3460,7 @@ static int cap_put_caller(struct snd_kcontrol *kcontrol,
 	struct hda_gen_spec *spec = codec->spec;
 	const struct hda_input_mux *imux;
 	struct nid_path *path;
-	int i, adc_idx, err = 0;
+	int i, adc_idx, ret, err = 0;
 
 	imux = &spec->input_mux;
 	adc_idx = kcontrol->id.index;
@@ -3470,9 +3470,13 @@ static int cap_put_caller(struct snd_kcontrol *kcontrol,
 		if (!path || !path->ctls[type])
 			continue;
 		kcontrol->private_value = path->ctls[type];
-		err = func(kcontrol, ucontrol);
-		if (err < 0)
+		ret = func(kcontrol, ucontrol);
+		if (ret < 0) {
+			err = ret;
 			break;
+		}
+		if (ret > 0)
+			err = 1;
 	}
 	mutex_unlock(&codec->control_mutex);
 	if (err >= 0 && spec->cap_sync_hook)
-- 
2.31.1
