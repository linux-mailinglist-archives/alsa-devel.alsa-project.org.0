Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F16021F82F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1499D1681;
	Tue, 14 Jul 2020 19:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1499D1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747815;
	bh=/Ec1m6Vu3z+qtVDzzSbglEej/cdDVJwf2udxiQ3Q3gk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoK2igZ4cwBTYechx8o9NZ5YjQJnauyUFu3utCqP8jEkRY6zsuelM0rqcAfKiaylS
	 7iJk4vwUEJXkNvqvn9U6TaoEylWAgmvs5pX52YkGkR5ONYu3siBhVDuqbjZHOCzt3M
	 hoDZwfT78bj+CuL3DFKxtvpT5VyjlJJHqFoXcO6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846D8F802E2;
	Tue, 14 Jul 2020 19:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33FAF802E2; Tue, 14 Jul 2020 19:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 226C9F801F2
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226C9F801F2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22F8DAD60
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ALSA: bt87x: Replace the words white/blacklist
Date: Tue, 14 Jul 2020 19:26:24 +0200
Message-Id: <20200714172631.25371-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
words "whitelist" and "blacklist" appropriately.

Only comment or variable renames, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/bt87x.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 6567504665b9..54cb223caa2f 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -30,7 +30,7 @@ static int index[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = -2}; /* Exclude the
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
 static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;	/* Enable this card */
 static int digital_rate[SNDRV_CARDS];	/* digital input rate */
-static bool load_all;	/* allow to load the non-whitelisted cards */
+static bool load_all;	/* allow to load cards not the allowlist */
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Bt87x soundcard");
@@ -41,7 +41,7 @@ MODULE_PARM_DESC(enable, "Enable Bt87x soundcard");
 module_param_array(digital_rate, int, NULL, 0444);
 MODULE_PARM_DESC(digital_rate, "Digital input rate for Bt87x soundcard");
 module_param(load_all, bool, 0444);
-MODULE_PARM_DESC(load_all, "Allow to load the non-whitelisted cards");
+MODULE_PARM_DESC(load_all, "Allow to load cards not on the allowlist");
 
 
 /* register offsets */
@@ -801,7 +801,7 @@ MODULE_DEVICE_TABLE(pci, snd_bt87x_ids);
  * (DVB cards use the audio function to transfer MPEG data) */
 static struct {
 	unsigned short subvendor, subdevice;
-} blacklist[] = {
+} denylist[] = {
 	{0x0071, 0x0101}, /* Nebula Electronics DigiTV */
 	{0x11bd, 0x001c}, /* Pinnacle PCTV Sat */
 	{0x11bd, 0x0026}, /* Pinnacle PCTV SAT CI */
@@ -817,7 +817,7 @@ static struct {
 
 static struct pci_driver driver;
 
-/* return the id of the card, or a negative value if it's blacklisted */
+/* return the id of the card, or a negative value if it's on the denylist */
 static int snd_bt87x_detect_card(struct pci_dev *pci)
 {
 	int i;
@@ -827,9 +827,9 @@ static int snd_bt87x_detect_card(struct pci_dev *pci)
 	if (supported && supported->driver_data > 0)
 		return supported->driver_data;
 
-	for (i = 0; i < ARRAY_SIZE(blacklist); ++i)
-		if (blacklist[i].subvendor == pci->subsystem_vendor &&
-		    blacklist[i].subdevice == pci->subsystem_device) {
+	for (i = 0; i < ARRAY_SIZE(denylist); ++i)
+		if (denylist[i].subvendor == pci->subsystem_vendor &&
+		    denylist[i].subdevice == pci->subsystem_device) {
 			dev_dbg(&pci->dev,
 				"card %#04x-%#04x:%#04x has no audio\n",
 				    pci->device, pci->subsystem_vendor, pci->subsystem_device);
-- 
2.16.4

