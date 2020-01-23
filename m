Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FB145F9E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 01:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430501681;
	Thu, 23 Jan 2020 01:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430501681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579737766;
	bh=y7brN2jlgWQRQ+UA6J15PZQ+hJCZt0nxCqMc6oJbhe4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mgk8oAe19A1reEIJNIqpZ3DyAzPNbsxG69T+wyD7ZRgO1MLXJ1a8042ox144wWVFH
	 1t4JYZ2aLrtLao0pFRyea2BSh6C4hM8ZPK227L50yD7zvwFYQCxpHKVqOSdaHDW6iQ
	 U17v/ZdUTjrXU1DvMddRbGt8BGe+MFDbrt3fGkIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9095F8020C;
	Thu, 23 Jan 2020 01:01:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 446AEF8020C; Thu, 23 Jan 2020 01:00:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BDF5F8007E
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 01:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BDF5F8007E
Received: from [82.43.126.140] (helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iuPvX-0001QC-2I; Thu, 23 Jan 2020 00:00:51 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Thu, 23 Jan 2020 00:00:50 +0000
Message-Id: <20200123000050.2831088-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: cs46xx: fix spelling mistake "to" ->
	"too"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 2c5c9d4c1d94..6b536fc23ca6 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -1293,7 +1293,7 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 	if (src_scb == NULL) {
 		if (ins->nsrc_scb >= DSP_MAX_SRC_NR) {
 			dev_err(chip->card->dev,
-				"dsp_spos: to many SRC instances\n!");
+				"dsp_spos: too many SRC instances\n!");
 			return NULL;
 		}
 
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
