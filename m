Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D139812F596
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB191769;
	Fri,  3 Jan 2020 09:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB191769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040778;
	bh=lkWV30KdVMn+iHmBYNSbK80OkGXq5HnzEG2Y7GE3iXw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FRzRNdniFOJSDHIbwOc9lQTRoDAzaDk1wecdUPSS6AUwNN41wchjLWgEyvkmTag9s
	 lXmKIHvCUDpsRQ94/SNKWHLPNBn5maCqXOcpbCI0OlS+xzEwvg1MRfu9urfC+GfxTs
	 fVkNYRm374oKQAFT+Ba13lldWVWWNQ2QVKXcwJjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25EEAF803F3;
	Fri,  3 Jan 2020 09:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5121F80368; Fri,  3 Jan 2020 09:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37835F8028F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37835F8028F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1813B261
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:38 +0100
Message-Id: <20200103081714.9560-23-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 22/58] ALSA: ac97: Treat snd_ac97_bus_ops as
	const
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

This is a preliminary patch to allow const for snd_ac97_bus_ops
definitions in each driver's code.  The ops reference is read-only,
hence it can be declared as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ac97_codec.h  | 5 +++--
 sound/ac97_bus.c            | 2 +-
 sound/pci/ac97/ac97_codec.c | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sound/ac97_codec.h b/include/sound/ac97_codec.h
index cc383991c0fe..49200ec26dc4 100644
--- a/include/sound/ac97_codec.h
+++ b/include/sound/ac97_codec.h
@@ -197,7 +197,7 @@ struct snd_ac97_bus_ops {
 
 struct snd_ac97_bus {
 	/* -- lowlevel (hardware) driver specific -- */
-	struct snd_ac97_bus_ops *ops;
+	const struct snd_ac97_bus_ops *ops;
 	void *private_data;
 	void (*private_free) (struct snd_ac97_bus *bus);
 	/* --- */
@@ -310,7 +310,8 @@ static inline int ac97_can_spdif(struct snd_ac97 * ac97)
 
 /* functions */
 /* create new AC97 bus */
-int snd_ac97_bus(struct snd_card *card, int num, struct snd_ac97_bus_ops *ops,
+int snd_ac97_bus(struct snd_card *card, int num,
+		 const struct snd_ac97_bus_ops *ops,
 		 void *private_data, struct snd_ac97_bus **rbus);
 /* create mixer controls */
 int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
diff --git a/sound/ac97_bus.c b/sound/ac97_bus.c
index 3732a63a2a81..b4685c53ff11 100644
--- a/sound/ac97_bus.c
+++ b/sound/ac97_bus.c
@@ -55,7 +55,7 @@ static bool snd_ac97_check_id(struct snd_ac97 *ac97, unsigned int id,
 int snd_ac97_reset(struct snd_ac97 *ac97, bool try_warm, unsigned int id,
 	unsigned int id_mask)
 {
-	struct snd_ac97_bus_ops *ops = ac97->bus->ops;
+	const struct snd_ac97_bus_ops *ops = ac97->bus->ops;
 
 	if (try_warm && ops->warm_reset) {
 		ops->warm_reset(ac97);
diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 41bdec4249e1..fcfa8499e453 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1894,7 +1894,8 @@ static int ac97_reset_wait(struct snd_ac97 *ac97, int timeout, int with_modem)
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_ac97_bus(struct snd_card *card, int num, struct snd_ac97_bus_ops *ops,
+int snd_ac97_bus(struct snd_card *card, int num,
+		 const struct snd_ac97_bus_ops *ops,
 		 void *private_data, struct snd_ac97_bus **rbus)
 {
 	int err;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
