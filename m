Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02812F5B9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255071799;
	Fri,  3 Jan 2020 09:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255071799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041431;
	bh=5qfd2n8neHDbQiEaSydPbEp9BnuSZSyf+9w9hS1GARM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VdUOtNk8kK56PNVuNr0d+2LLACHA72R79aA5XDAUYRqZUEi2NLaw0qqAzM0nFjnQH
	 quDQlfCj6dsxljL/7rXN5qDhVmH1iqqFQfYj1KgSWm2rw+E7vO8MSM00LmZ40ao44v
	 REgu7s++YWBTSS+1P7iLF304+UQLNEUdD+snCK/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03342F804E5;
	Fri,  3 Jan 2020 09:19:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F1E8F802C3; Fri,  3 Jan 2020 09:18:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95361F802DD
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95361F802DD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC659B283
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:03 +0100
Message-Id: <20200103081714.9560-48-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 47/58] ALSA: ca0106: Constify snd_ca0106_details
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

The snd_ca0106_details table entries are referred only as read-only.
Let's make them const.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ca0106/ca0106.h       | 2 +-
 sound/pci/ca0106/ca0106_main.c  | 6 +++---
 sound/pci/ca0106/ca0106_mixer.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ca0106/ca0106.h b/sound/pci/ca0106/ca0106.h
index 986905cfcc4c..62a22ca3b9de 100644
--- a/sound/pci/ca0106/ca0106.h
+++ b/sound/pci/ca0106/ca0106.h
@@ -663,7 +663,7 @@ struct snd_ca0106_details {
 // definition of the chip-specific record
 struct snd_ca0106 {
 	struct snd_card *card;
-	struct snd_ca0106_details *details;
+	const struct snd_ca0106_details *details;
 	struct pci_dev *pci;
 
 	unsigned long port;
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index d3bd27ddb049..487b1aaafa1e 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -156,7 +156,7 @@ MODULE_PARM_DESC(subsystem, "Force card subsystem model.");
 
 #include "ca0106.h"
 
-static struct snd_ca0106_details ca0106_chip_details[] = {
+static const struct snd_ca0106_details ca0106_chip_details[] = {
 	 /* Sound Blaster X-Fi Extreme Audio. This does not have an AC97. 53SB079000000 */
 	 /* It is really just a normal SB Live 24bit. */
 	 /* Tested:
@@ -503,7 +503,7 @@ static void restore_spdif_bits(struct snd_ca0106 *chip, int idx)
 }
 
 static int snd_ca0106_channel_dac(struct snd_ca0106 *chip,
-				  struct snd_ca0106_details *details,
+				  const struct snd_ca0106_details *details,
 				  int channel_id)
 {
 	switch (channel_id) {
@@ -1593,7 +1593,7 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 					 struct snd_ca0106 **rchip)
 {
 	struct snd_ca0106 *chip;
-	struct snd_ca0106_details *c;
+	const struct snd_ca0106_details *c;
 	int err;
 	static const struct snd_device_ops ops = {
 		.dev_free = snd_ca0106_dev_free,
diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index 729d757c900a..c771995b12b9 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -654,7 +654,7 @@ static const int spi_dmute_bit[] = {
 };
 
 static struct snd_kcontrol_new
-snd_ca0106_volume_spi_dac_ctl(struct snd_ca0106_details *details,
+snd_ca0106_volume_spi_dac_ctl(const struct snd_ca0106_details *details,
 			      int channel_id)
 {
 	struct snd_kcontrol_new spi_switch = {0};
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
