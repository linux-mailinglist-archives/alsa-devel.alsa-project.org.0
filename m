Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD11CDD76
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 16:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64191165E;
	Mon, 11 May 2020 16:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64191165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589208131;
	bh=SS4Uxzh2oT0noh8vYu7A7QVgTS9trSBe1+PwLiY6INk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDwlRYKtRbrbQLOu2tppLSpYQn74acEQ0Z9qGKchovyO7NjyjtR6WpmPqlFraeM8I
	 KbSLIpc48A0toPpnT205MdHz+UUCSjjJBNZpRT7fQAjde/7PI9m6mxXs52Wm+9/prn
	 LpNVBHlPXddscXJGzZ2UAbEWfw6WMnOLwrZ5sus8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C85F80254;
	Mon, 11 May 2020 16:39:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74DA2F8022D; Mon, 11 May 2020 16:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23785F80157
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 16:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23785F80157
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E461AF13
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:39:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/3] topology: Add missing ATTRIBUTE_UNUSED
Date: Mon, 11 May 2020 16:39:31 +0200
Message-Id: <20200511143931.31528-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200511143931.31528-1-tiwai@suse.de>
References: <20200511143931.31528-1-tiwai@suse.de>
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

... to shut up the compiler warnings.

Fixes: b6c9afb4f59b ("topology: implement snd_tplg_decode")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/topology/pcm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index 61159d33357c..b15b95045ab5 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -2053,20 +2053,22 @@ next:
 }
 
 /* decode dai from the binary input */
-int tplg_decode_dai(snd_tplg_t *tplg,
-		    size_t pos,
-		    struct snd_soc_tplg_hdr *hdr,
-		    void *bin, size_t size)
+int tplg_decode_dai(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
+		    size_t pos ATTRIBUTE_UNUSED,
+		    struct snd_soc_tplg_hdr *hdr ATTRIBUTE_UNUSED,
+		    void *bin ATTRIBUTE_UNUSED,
+		    size_t size ATTRIBUTE_UNUSED)
 {
 	SNDERR("not implemented");
 	return -ENXIO;
 }
 
 /* decode cc from the binary input */
-int tplg_decode_cc(snd_tplg_t *tplg,
-		   size_t pos,
-		   struct snd_soc_tplg_hdr *hdr,
-		   void *bin, size_t size)
+int tplg_decode_cc(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
+		   size_t pos ATTRIBUTE_UNUSED,
+		   struct snd_soc_tplg_hdr *hdr ATTRIBUTE_UNUSED,
+		   void *bin ATTRIBUTE_UNUSED,
+		   size_t size ATTRIBUTE_UNUSED)
 {
 	SNDERR("not implemented");
 	return -ENXIO;
-- 
2.16.4

