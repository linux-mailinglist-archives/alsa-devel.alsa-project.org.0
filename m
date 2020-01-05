Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE611308AD
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29901831;
	Sun,  5 Jan 2020 16:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29901831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237751;
	bh=N4MGby947so8gnkYf6bChNcMf7zo/0GRRRCZg3OKQPo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAka7+gRoal3S+sLDbebRS3joWY6K9xf+MstfXqEYiP+jHagY9Kk7VpONvkhyQCqP
	 7O1oXELxz41MgROw+oElNJdQISuf6qnVzAa3/L+S0FO2Pz/WONB3nohQBVY+OmsGq0
	 5N3ZCzvah73Utc/H+Ol7hHias7dx+EGQw6H32Um0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 263BBF80508;
	Sun,  5 Jan 2020 15:50:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88DBEF803A6; Sun,  5 Jan 2020 15:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38163F802BE
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38163F802BE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01547ADF0
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:03 +0100
Message-Id: <20200105144823.29547-49-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 48/68] ALSA: es18xx: More constifications
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

Apply const prefix to the static map tables and the static resource
tables.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es18xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 6ce5b5c76980..d1135f6ae104 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -965,7 +965,7 @@ static int snd_es18xx_info_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 
 static int snd_es18xx_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	static unsigned char invMap4Source[8] = {0, 0, 1, 1, 0, 0, 2, 3};
+	static const unsigned char invMap4Source[8] = {0, 0, 1, 1, 0, 0, 2, 3};
 	struct snd_es18xx *chip = snd_kcontrol_chip(kcontrol);
 	int muxSource = snd_es18xx_mixer_read(chip, 0x1c) & 0x07;
 	if (!(chip->version == 0x1869 || chip->version == 0x1879)) {
@@ -982,7 +982,7 @@ static int snd_es18xx_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 
 static int snd_es18xx_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	static unsigned char map4Source[4] = {0, 2, 6, 7};
+	static const unsigned char map4Source[4] = {0, 2, 6, 7};
 	struct snd_es18xx *chip = snd_kcontrol_chip(kcontrol);
 	unsigned char val = ucontrol->value.enumerated.item[0];
 	unsigned char retVal = 0;
@@ -2173,8 +2173,8 @@ static int snd_es18xx_isa_probe1(int dev, struct device *devptr)
 static int snd_es18xx_isa_probe(struct device *pdev, unsigned int dev)
 {
 	int err;
-	static int possible_irqs[] = {5, 9, 10, 7, 11, 12, -1};
-	static int possible_dmas[] = {1, 0, 3, 5, -1};
+	static const int possible_irqs[] = {5, 9, 10, 7, 11, 12, -1};
+	static const int possible_dmas[] = {1, 0, 3, 5, -1};
 
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
 		if ((irq[dev] = snd_legacy_find_free_irq(possible_irqs)) < 0) {
@@ -2198,7 +2198,7 @@ static int snd_es18xx_isa_probe(struct device *pdev, unsigned int dev)
 	if (port[dev] != SNDRV_AUTO_PORT) {
 		return snd_es18xx_isa_probe1(dev, pdev);
 	} else {
-		static unsigned long possible_ports[] = {0x220, 0x240, 0x260, 0x280};
+		static const unsigned long possible_ports[] = {0x220, 0x240, 0x260, 0x280};
 		int i;
 		for (i = 0; i < ARRAY_SIZE(possible_ports); i++) {
 			port[dev] = possible_ports[i];
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
