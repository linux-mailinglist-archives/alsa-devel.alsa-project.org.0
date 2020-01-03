Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146C12F5C3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B9217CF;
	Fri,  3 Jan 2020 09:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B9217CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041709;
	bh=caHLSYPXCFrTZbm550fLufCBu2RmlfsO2coouyz+MTA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d3GNsCrp+OljqmdK0ABv+X64YR0wEB8UfwekdQfrQ9EsnJIRfNAIXYBAHGbwrCIvG
	 iB3ymJXdo6AsyIWCZKhBRjGXOTZzUjBnCiXwApNRAQf3Qmpu/cQe7w1DmGmPGI/67r
	 taP8qJ8U5JpErmaGwxBgxRPAp0FiUkMG89UNIYdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CCFF80551;
	Fri,  3 Jan 2020 09:19:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22BE1F803DE; Fri,  3 Jan 2020 09:18:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09339F802E7
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09339F802E7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08EF1B284
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:04 +0100
Message-Id: <20200103081714.9560-49-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 48/58] ALSA: ice17xx: Constify
	snd_ice1712_card_info
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

The snd_ice1712_card_info objects are referred only as read-only.
Let's make them const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1712.c |  6 +++---
 sound/pci/ice1712/ice1712.h |  2 +-
 sound/pci/ice1712/ice1724.c | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 5202e4c06fc4..884d0cdec08c 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2218,7 +2218,7 @@ static const struct snd_kcontrol_new snd_ice1712_mixer_pro_peak = {
 /*
  * list of available boards
  */
-static struct snd_ice1712_card_info *card_tables[] = {
+static const struct snd_ice1712_card_info *card_tables[] = {
 	snd_ice1712_hoontech_cards,
 	snd_ice1712_delta_cards,
 	snd_ice1712_ews_cards,
@@ -2242,7 +2242,7 @@ static int snd_ice1712_read_eeprom(struct snd_ice1712 *ice,
 {
 	int dev = ICE_I2C_EEPROM_ADDR;	/* I2C EEPROM device address */
 	unsigned int i, size;
-	struct snd_ice1712_card_info * const *tbl, *c;
+	const struct snd_ice1712_card_info * const *tbl, *c;
 
 	if (!modelname || !*modelname) {
 		ice->eeprom.subvendor = 0;
@@ -2587,7 +2587,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 	struct snd_card *card;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
-	struct snd_ice1712_card_info * const *tbl, *c;
+	const struct snd_ice1712_card_info * const *tbl, *c;
 
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
diff --git a/sound/pci/ice1712/ice1712.h b/sound/pci/ice1712/ice1712.h
index 88145708a8a7..cd02710d8271 100644
--- a/sound/pci/ice1712/ice1712.h
+++ b/sound/pci/ice1712/ice1712.h
@@ -316,7 +316,7 @@ struct snd_ice1712 {
 	struct snd_info_entry *proc_entry;
 
 	struct snd_ice1712_eeprom eeprom;
-	struct snd_ice1712_card_info *card_info;
+	const struct snd_ice1712_card_info *card_info;
 
 	unsigned int pro_volumes[20];
 	unsigned int omni:1;		/* Delta Omni I/O */
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 4630a8c42aa9..f4d69b8197ed 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2170,13 +2170,13 @@ static const struct snd_kcontrol_new snd_vt1724_mixer_pro_peak = {
  *
  */
 
-static struct snd_ice1712_card_info no_matched;
+static const struct snd_ice1712_card_info no_matched;
 
 
 /*
   ooAoo cards with no controls
 */
-static unsigned char ooaoo_sq210_eeprom[] = {
+static const unsigned char ooaoo_sq210_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x4c,	/* 49MHz crystal, no mpu401, no ADC,
 					   1xDACs */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
@@ -2196,7 +2196,7 @@ static unsigned char ooaoo_sq210_eeprom[] = {
 };
 
 
-static struct snd_ice1712_card_info snd_vt1724_ooaoo_cards[] = {
+static const struct snd_ice1712_card_info snd_vt1724_ooaoo_cards[] = {
 	{
 		.name = "ooAoo SQ210a",
 		.model = "sq210a",
@@ -2206,7 +2206,7 @@ static struct snd_ice1712_card_info snd_vt1724_ooaoo_cards[] = {
 	{ } /* terminator */
 };
 
-static struct snd_ice1712_card_info *card_tables[] = {
+static const struct snd_ice1712_card_info *card_tables[] = {
 	snd_vt1724_revo_cards,
 	snd_vt1724_amp_cards,
 	snd_vt1724_aureon_cards,
@@ -2276,7 +2276,7 @@ static int snd_vt1724_read_eeprom(struct snd_ice1712 *ice,
 {
 	const int dev = 0xa0;		/* EEPROM device address */
 	unsigned int i, size;
-	struct snd_ice1712_card_info * const *tbl, *c;
+	const struct snd_ice1712_card_info * const *tbl, *c;
 
 	if (!modelname || !*modelname) {
 		ice->eeprom.subvendor = 0;
@@ -2590,7 +2590,7 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 	struct snd_card *card;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
-	struct snd_ice1712_card_info * const *tbl, *c;
+	const struct snd_ice1712_card_info * const *tbl, *c;
 
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
