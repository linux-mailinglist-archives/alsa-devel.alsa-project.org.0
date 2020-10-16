Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CD290DDC
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Oct 2020 00:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C07E181F;
	Sat, 17 Oct 2020 00:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C07E181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602888667;
	bh=n2hH1dbSWLZ53WML8MizqGSk6xp92MprNloLrboWdxY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VpNSRMl/Z52dHcjaH9oNa6KNVo4HFMLeL7eRYA7xaVBQI3ZmE03hkocPtRExrg27s
	 F3gE4+oz4TxLZo1FQ8OqSIt838WrE10KXxjqsKoO7Hmd33DHEZbywICRZ3XEDvDKap
	 RMHTyKHBvvUCwTj1qW2BIRMHLuQGZTqdeeYCb0po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20242F8012A;
	Sat, 17 Oct 2020 00:49:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9682EF8020D; Sat, 17 Oct 2020 00:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5396DF800B8
 for <alsa-devel@alsa-project.org>; Sat, 17 Oct 2020 00:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5396DF800B8
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kTYXB-0001gz-A3; Fri, 16 Oct 2020 22:49:13 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Connor McAdams <conmanx360@gmail.com>, alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/ca0132: make some const arrays static,
 makes object smaller
Date: Fri, 16 Oct 2020 23:49:13 +0100
Message-Id: <20201016224913.687724-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Don't populate const arrays on the stack but instead make them
static. Makes the object code smaller by 57 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 173256	  38016	    192	 211464	  33a08	sound/pci/hda/patch_ca0132.o

After:
   text	   data	    bss	    dec	    hex	filename
 172879	  38336	    192	 211407	  339cf	sound/pci/hda/patch_ca0132.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/hda/patch_ca0132.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 2b38b2a716a1..e0c38f2735c6 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7910,8 +7910,12 @@ static void ae7_post_dsp_asi_stream_setup(struct hda_codec *codec)
 
 static void ae7_post_dsp_pll_setup(struct hda_codec *codec)
 {
-	const unsigned int addr[] = { 0x41, 0x45, 0x40, 0x43, 0x51 };
-	const unsigned int data[] = { 0xc8, 0xcc, 0xcb, 0xc7, 0x8d };
+	static const unsigned int addr[] = {
+		0x41, 0x45, 0x40, 0x43, 0x51
+	};
+	static const unsigned int data[] = {
+		0xc8, 0xcc, 0xcb, 0xc7, 0x8d
+	};
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(addr); i++) {
@@ -7925,10 +7929,12 @@ static void ae7_post_dsp_pll_setup(struct hda_codec *codec)
 static void ae7_post_dsp_asi_setup_ports(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
-	const unsigned int target[] = { 0x0b, 0x04, 0x06, 0x0a, 0x0c, 0x11,
-					0x12, 0x13, 0x14 };
-	const unsigned int data[]   = { 0x12, 0x00, 0x48, 0x05, 0x5f, 0xff,
-					0xff, 0xff, 0x7f };
+	static const unsigned int target[] = {
+		0x0b, 0x04, 0x06, 0x0a, 0x0c, 0x11, 0x12, 0x13, 0x14
+	};
+	static const unsigned int data[] = {
+		0x12, 0x00, 0x48, 0x05, 0x5f, 0xff, 0xff, 0xff, 0x7f
+	};
 	unsigned int i;
 
 	mutex_lock(&spec->chipio_mutex);
-- 
2.27.0

