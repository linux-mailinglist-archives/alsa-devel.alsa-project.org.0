Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC4295695
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 05:04:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63FBF174A;
	Thu, 22 Oct 2020 05:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63FBF174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603335866;
	bh=vx9LdQQFy2zmIpKAxkp0B+clZO3yh+1U9DusaMvniGU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OUO7FeYuz2wTkYmfxuq0Z6+pF4KJAQB4dsiulZVFuV1M6YvFfZaJKoyWnSYjyrTfC
	 MawDp8RF0ZGrsWHAU7XSH7PbuHrqCY/jb2BVwsUAgN2iDGbnd1B7AISb8/y38qf8/m
	 Iic4xktU6Q+IbogK3v4wQTTlnh2ku2eQ7Er3x5Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 794A6F804AA;
	Thu, 22 Oct 2020 05:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 174FEF804A9; Thu, 22 Oct 2020 05:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DCFFF80247
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 05:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DCFFF80247
Received: from 1.general.hwang4.uk.vpn ([10.172.195.16]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kVQsF-0000Iu-MN; Thu, 22 Oct 2020 03:02:44 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, dan.carpenter@oracle.com,
 stable@vger.kernel.org
Subject: [PATCH] ALSA: hda - Fix the return value if cb func is already
 registered
Date: Thu, 22 Oct 2020 11:02:21 +0800
Message-Id: <20201022030221.22393-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
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

If the cb function is already registered, should return the pointer
of the structure hda_jack_callback which contains this cb func, but
instead it returns the NULL.

Now fix it by replacing func_is_already_in_callback_list() with
find_callback_from_list().

Fixes: f4794c6064a8 ("ALSA:hda - Don't register a cb func if it is registered already")
Reported-and-suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_jack.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index ded4813f8b54..588059428d8f 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -275,16 +275,21 @@ int snd_hda_jack_detect_state_mst(struct hda_codec *codec,
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_detect_state_mst);
 
-static bool func_is_already_in_callback_list(struct hda_jack_tbl *jack,
-					     hda_jack_callback_fn func)
+static struct hda_jack_callback *
+find_callback_from_list(struct hda_jack_tbl *jack,
+			hda_jack_callback_fn func)
 {
 	struct hda_jack_callback *cb;
 
+	if (!func)
+		return NULL;
+
 	for (cb = jack->callback; cb; cb = cb->next) {
 		if (cb->func == func)
-			return true;
+			return cb;
 	}
-	return false;
+
+	return NULL;
 }
 
 /**
@@ -309,7 +314,10 @@ snd_hda_jack_detect_enable_callback_mst(struct hda_codec *codec, hda_nid_t nid,
 	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
 	if (!jack)
 		return ERR_PTR(-ENOMEM);
-	if (func && !func_is_already_in_callback_list(jack, func)) {
+
+	callback = find_callback_from_list(jack, func);
+
+	if (func && !callback) {
 		callback = kzalloc(sizeof(*callback), GFP_KERNEL);
 		if (!callback)
 			return ERR_PTR(-ENOMEM);
-- 
2.25.1

