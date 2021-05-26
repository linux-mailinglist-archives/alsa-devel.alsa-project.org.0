Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CCD391CB2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 18:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8F491719;
	Wed, 26 May 2021 18:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8F491719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622045279;
	bh=GGSSX+GEzRASnedGSGIWfAGWXbXqcavGdGXq4Gaw5xA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=trdzRjRnRwtyRp0tVrrH8kRhAONB9S63Iy7u+N0PaO/IitaKBRYUM/wrjbFzDaz9o
	 8lqCwnc98Nu4KDyN84Y1o71X1/JKalPStwUv+SrieIL05+RQX049GGg/5mJ/XXCBrH
	 OEsTj9xjSRlkuzN2mK1bVuptdnsStB+wlQ8CI8qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7FA6F80264;
	Wed, 26 May 2021 18:06:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75377F80260; Wed, 26 May 2021 18:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B66FCF800B1
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 18:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B66FCF800B1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1llw2y-0006jH-K7; Wed, 26 May 2021 16:06:16 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Connor McAdams <conmanx360@gmail.com>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ALSA: hda/ca0132: Make a const array static,
 makes object smaller
Date: Wed, 26 May 2021 17:06:16 +0100
Message-Id: <20210526160616.3764119-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
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

Don't populate the const array dsp_dma_stream_ids the stack but instead
make it static. Makes the object code smaller by 21 bytes.

Before:
   text    data     bss     dec     hex filename
 189012   70376     192  259580   3f5fc ./sound/pci/hda/patch_ca0132.o

After:
   text    data     bss     dec     hex filename
 188927   70440     192  259559   3f5e7 ./sound/pci/hda/patch_ca0132.o

(gcc version 10.3.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 49b4fdd2feab..b66e7bdbf483 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7598,7 +7598,7 @@ static void ca0132_alt_free_active_dma_channels(struct hda_codec *codec)
  */
 static void ca0132_alt_start_dsp_audio_streams(struct hda_codec *codec)
 {
-	const unsigned int dsp_dma_stream_ids[] = { 0x0c, 0x03, 0x04 };
+	static const unsigned int dsp_dma_stream_ids[] = { 0x0c, 0x03, 0x04 };
 	struct ca0132_spec *spec = codec->spec;
 	unsigned int i, tmp;
 
-- 
2.31.1

