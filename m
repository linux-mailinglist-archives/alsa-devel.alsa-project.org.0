Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2427E0AB
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 07:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4411802;
	Wed, 30 Sep 2020 07:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4411802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601445240;
	bh=AYbpHaMB/6P4Ajqha84YfTAge0QDKPctBt/nF/u/tSo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hORT6Gz64UowXZifBf/xxcxkiAv/2h0zNITJP0cxkM2zP7C3EL544ZF+GmjHx4qkg
	 CaZo5t41K4OBMgeoStat+ooXPwm6x4roIETDN83/JAl8Xyn8qNr+2rY2uhAnd30lVR
	 E/IBNT2szAR2yK4DREHbg42xuhLrc1bhhtbFie+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A07F801F9;
	Wed, 30 Sep 2020 07:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71FCFF801ED; Wed, 30 Sep 2020 07:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD29DF800DF
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 07:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD29DF800DF
Received: from [117.136.57.143] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kNV23-0006H0-7r; Wed, 30 Sep 2020 05:52:04 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda - Don't register a cb func if it is registered
 already
Date: Wed, 30 Sep 2020 13:51:46 +0800
Message-Id: <20200930055146.5665-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
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

If the caller of enable_callback_mst() passes a cb func, the callee
function will malloc memory and link this cb func to the list
unconditionally. This will introduce problem if caller is in the
hda_codec_ops.init() since the init() will be repeatedly called in the
codec rt_resume().

So far, the patch_hdmi.c and patch_ca0132.c call enable_callback_mst()
in the hda_codec_ops.init().

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_jack.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 02cc682caa55..ded4813f8b54 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -275,6 +275,18 @@ int snd_hda_jack_detect_state_mst(struct hda_codec *codec,
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_detect_state_mst);
 
+static bool func_is_already_in_callback_list(struct hda_jack_tbl *jack,
+					     hda_jack_callback_fn func)
+{
+	struct hda_jack_callback *cb;
+
+	for (cb = jack->callback; cb; cb = cb->next) {
+		if (cb->func == func)
+			return true;
+	}
+	return false;
+}
+
 /**
  * snd_hda_jack_detect_enable_mst - enable the jack-detection
  * @codec: the HDA codec
@@ -297,7 +309,7 @@ snd_hda_jack_detect_enable_callback_mst(struct hda_codec *codec, hda_nid_t nid,
 	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
 	if (!jack)
 		return ERR_PTR(-ENOMEM);
-	if (func) {
+	if (func && !func_is_already_in_callback_list(jack, func)) {
 		callback = kzalloc(sizeof(*callback), GFP_KERNEL);
 		if (!callback)
 			return ERR_PTR(-ENOMEM);
-- 
2.17.1

