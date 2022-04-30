Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E27516024
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 21:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABE61F7;
	Sat, 30 Apr 2022 21:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABE61F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651347278;
	bh=23AP/G/AlhYtIydcLH5ennjXVKNhVLa4O+1GrfJ3Gzw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DrJDCXAE0K3qGlPw94ppWRldWgIvZbWmp+8aI/U4SZMgznZl5HLq1AEztfntMLWG3
	 ms+bQfNqJbc8XwvvmQ5corVZiN3b+NwhsVdklVox8VNcJs/ayhzaLMcYpa3/bSN4HK
	 OdORKSPD8csjuL8xkBvxFTNCnhPYYm4upGV7c2eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4455F8012B;
	Sat, 30 Apr 2022 21:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50411F8012A; Sat, 30 Apr 2022 21:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEEB6F800E9
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 21:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEEB6F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="G53zhjox"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=39GrQWmkZ+YjAD7XxF6O6MKjllRIm9u5hW3pNItTxOA=; b=G53zhjoxT+zmssO/muK3gwagRT
 vCyYcvUkkwwYNPE6LkrDNpqlwrv8aBTl12r6bA+YymCqawfWmO61/lYk2xVRNsrK8da8VynnDKpm1
 cKTJ1Cai//W/daBoEO/YspjstwTJ//y48alWvk492qtualg/T7ZP1IzyTBwcgRorLm7ev/JOpFMDm
 G8mFr/NP11n6X15prYk7OOL2xWJEqNHJWDQQdFktRPz989INgDeSCkfYFS1oNff5rqjve6BV8xcrj
 bV1VNbx5rJAjfkZ+ERALjFi9sYCdsG+UjLLpS0Z5/2jC9dUoJvbpaUBFus5CgiLIOJgSXAcXnYacC
 loiLeI4g==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nksqG-00F0XW-GA; Sat, 30 Apr 2022 19:33:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda - fix unused Realtek function when PM is not enabled
Date: Sat, 30 Apr 2022 12:33:18 -0700
Message-Id: <20220430193318.29024-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
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

When CONFIG_PM is not enabled, alc_shutup() is not needed,
so move it inside the #ifdef CONFIG_PM guard.
Also drop some contiguous #endif / #ifdef CONFIG_PM for simplicity.

Fixes this build warning:
sound/pci/hda/patch_realtek.c:886:20: warning: unused function 'alc_shutup'

Fixes: 08c189f2c552 ("ALSA: hda - Use generic parser codes for Realtek driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
---
 sound/pci/hda/patch_realtek.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -937,6 +937,9 @@ static int alc_init(struct hda_codec *co
 	return 0;
 }
 
+#define alc_free	snd_hda_gen_free
+
+#ifdef CONFIG_PM
 static inline void alc_shutup(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
@@ -950,9 +953,6 @@ static inline void alc_shutup(struct hda
 		alc_shutup_pins(codec);
 }
 
-#define alc_free	snd_hda_gen_free
-
-#ifdef CONFIG_PM
 static void alc_power_eapd(struct hda_codec *codec)
 {
 	alc_auto_setup_eapd(codec, false);
@@ -966,9 +966,7 @@ static int alc_suspend(struct hda_codec
 		spec->power_hook(codec);
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int alc_resume(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
