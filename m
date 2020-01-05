Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A481613088F
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:09:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C13B17D7;
	Sun,  5 Jan 2020 16:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C13B17D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236958;
	bh=JWZ7fbSwux910SmxdY0oywtBDIZmjufBr04yEzsLpzI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GnM7EEfWo3OQV3yAJOn3pV2SPjQayhD9oBPPiv9jRzLS0f662XVD793Xf5/dPa7Mc
	 yBTo+tXQVT9RAeQWjUzgeKEsCJvMretRQxRpvnb31sg6QtakVQYl3bSIHabW12oab3
	 uIp8qEBsL8VsjkkIEdyFjg3Z80Fed00AQl1++434=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCC3EF802FF;
	Sun,  5 Jan 2020 15:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78731F8028D; Sun,  5 Jan 2020 15:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A859CF80292
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A859CF80292
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39D9CB28C
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:47 +0100
Message-Id: <20200105144823.29547-33-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 32/68] ALSA: asihpi: More constifications
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apply const prefix to each possible place: the static tables for
formats, parameters, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c  | 4 ++--
 sound/pci/asihpi/hpimsgx.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 1fdb9f9f0ae0..a9540c2c4a1a 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -300,7 +300,7 @@ static void print_hwparams(struct snd_pcm_substream *substream,
 
 #define INVALID_FORMAT	(__force snd_pcm_format_t)(-1)
 
-static snd_pcm_format_t hpi_to_alsa_formats[] = {
+static const snd_pcm_format_t hpi_to_alsa_formats[] = {
 	INVALID_FORMAT,		/* INVALID */
 	SNDRV_PCM_FORMAT_U8,	/* HPI_FORMAT_PCM8_UNSIGNED        1 */
 	SNDRV_PCM_FORMAT_S16,	/* HPI_FORMAT_PCM16_SIGNED         2 */
@@ -2073,7 +2073,7 @@ static int snd_asihpi_meter_info(struct snd_kcontrol *kcontrol,
 }
 
 /* linear values for 10dB steps */
-static int log2lin[] = {
+static const int log2lin[] = {
 	0x7FFFFFFF, /* 0dB */
 	679093956,
 	214748365,
diff --git a/sound/pci/asihpi/hpimsgx.c b/sound/pci/asihpi/hpimsgx.c
index 5fb0b98bec30..f7427f8eb630 100644
--- a/sound/pci/asihpi/hpimsgx.c
+++ b/sound/pci/asihpi/hpimsgx.c
@@ -17,7 +17,7 @@ Extended Message Function With Response Caching
 #include "hpimsgx.h"
 #include "hpidebug.h"
 
-static struct pci_device_id asihpi_pci_tbl[] = {
+static const struct pci_device_id asihpi_pci_tbl[] = {
 #include "hpipcida.h"
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
