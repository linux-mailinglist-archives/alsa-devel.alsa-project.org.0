Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43A221D41
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F82D15DC;
	Thu, 16 Jul 2020 09:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F82D15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884259;
	bh=H3/HRH+Np6p/LK2SjaZ+T3iWeGIUeOr5VEPoW3DSNTA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tlf77OS6P5ENpQ4B9YEfMzUUMvTIYhl7FQI7PRPZP60615yeVW+OCL0+qETTdHNcz
	 I6Igt+VoLsLTnErqmJMj6t6TWFiLKarN7Rh4wf1IJ5ZWNsXGrLuPlSZdD9XheM+TYM
	 +axosuivwN+CaLefDLS/o/DuwVQ8ErfFSr62TPvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27403F802FD;
	Thu, 16 Jul 2020 09:18:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A7CF801EC; Thu, 16 Jul 2020 08:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net
 [150.101.137.141])
 by alsa1.perex.cz (Postfix) with ESMTP id A0ACAF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 08:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0ACAF8014E
X-SMTP-MATCH: 0
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B+BwBx9Q9f/5UxyQ5gHQEBPAEFBQE?=
 =?us-ascii?q?CAQkBHIFDAoNrSxSNNIV/nhkLATwBAgQBAYRGBAKCDCU3Bg4CEAEBBgEBAQE?=
 =?us-ascii?q?BBgSGVIYdCwEjI09vAQkJgyaCfKtEM4VRg2aBQIE4AYgChQmCAIERg06KMwS?=
 =?us-ascii?q?bHpoRgmeBC5hBMIELni4BLZFJoQuBezMaCCgIgyRQGQ2cdTQwNwIGCAEBAwl?=
 =?us-ascii?q?XAY9cAQE?=
Received: from 14-201-49-149.tpgi.com.au (HELO silver.lan) ([14.201.49.149])
 by ipmail03.adl2.internode.on.net with ESMTP; 16 Jul 2020 16:11:07 +0930
From: Paul Schulz <paul@mawsonlakes.org>
To: Paul Schulz <paul@mawsonlakes.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH] sound/pci/bt87x: Replaces 'blacklist' with 'no_audio_list'
Date: Thu, 16 Jul 2020 16:11:02 +0930
Message-Id: <20200716064102.632618-1-paul@mawsonlakes.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:18:10 +0200
Cc: Clemens Ladisch <clemens@ladisch.de>
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

This patch removes 'blacklist' and replaces it with
the more descriptive 'no_audio_list'

This is a functionally trivial patch and has no other effect.

Signed-off-by: Paul Schulz <paul@mawsonlakes.org>
---
 sound/pci/bt87x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 6567504665b9..b74b55bdb146 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -801,7 +801,7 @@ MODULE_DEVICE_TABLE(pci, snd_bt87x_ids);
  * (DVB cards use the audio function to transfer MPEG data) */
 static struct {
 	unsigned short subvendor, subdevice;
-} blacklist[] = {
+} no_audio_list[] = {
 	{0x0071, 0x0101}, /* Nebula Electronics DigiTV */
 	{0x11bd, 0x001c}, /* Pinnacle PCTV Sat */
 	{0x11bd, 0x0026}, /* Pinnacle PCTV SAT CI */
@@ -817,7 +817,7 @@ static struct {
 
 static struct pci_driver driver;
 
-/* return the id of the card, or a negative value if it's blacklisted */
+/* return the id of the card, or a negative value if it's in the no_audio_list */
 static int snd_bt87x_detect_card(struct pci_dev *pci)
 {
 	int i;
@@ -827,9 +827,9 @@ static int snd_bt87x_detect_card(struct pci_dev *pci)
 	if (supported && supported->driver_data > 0)
 		return supported->driver_data;
 
-	for (i = 0; i < ARRAY_SIZE(blacklist); ++i)
-		if (blacklist[i].subvendor == pci->subsystem_vendor &&
-		    blacklist[i].subdevice == pci->subsystem_device) {
+	for (i = 0; i < ARRAY_SIZE(no_audio_list); ++i)
+		if (no_audio_list[i].subvendor == pci->subsystem_vendor &&
+		    no_audio_list[i].subdevice == pci->subsystem_device) {
 			dev_dbg(&pci->dev,
 				"card %#04x-%#04x:%#04x has no audio\n",
 				    pci->device, pci->subsystem_vendor, pci->subsystem_device);
-- 
2.25.1

