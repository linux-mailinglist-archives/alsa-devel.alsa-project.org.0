Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92D12F566
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59AE81728;
	Fri,  3 Jan 2020 09:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59AE81728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578039952;
	bh=xl0l/Pzx/tVJ+oGx8zNRR/CTq9lNH+X0+KuSdO2NKg8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBM7Hu17WhsUnDvWMSK3d2VbGZauIHW5eKw5pzlLBptzBo+QLvnpRu1ONRRV/64fe
	 iUDODTPtNDWjhg1J1RpC9MSPsrxj5wQpd3z8LBbyMpa0bRIPzqpja4lIViXEPJB6cc
	 tKbysuq5WNmGtrxe/iwxrGr2BR3yiUcmfy+lw9YI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0D6F80345;
	Fri,  3 Jan 2020 09:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29E80F80329; Fri,  3 Jan 2020 09:17:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78807F80272
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78807F80272
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF6C5B21E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:24 +0100
Message-Id: <20200103081714.9560-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 08/58] ALSA: hda: Constify snd_device_ops
	definitions
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

Now we may declare const for snd_device_ops definitions, so let's do
it for optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_beep.c  | 2 +-
 sound/pci/hda/hda_codec.c | 2 +-
 sound/pci/hda/hda_intel.c | 2 +-
 sound/pci/hda/hda_tegra.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_beep.c b/sound/pci/hda/hda_beep.c
index b7d9160ed868..f5fd62ed4df5 100644
--- a/sound/pci/hda/hda_beep.c
+++ b/sound/pci/hda/hda_beep.c
@@ -192,7 +192,7 @@ static int beep_dev_free(struct snd_device *device)
  */
 int snd_hda_attach_beep_device(struct hda_codec *codec, int nid)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_register = beep_dev_register,
 		.dev_disconnect = beep_dev_disconnect,
 		.dev_free = beep_dev_free,
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index a2fb19129219..8f166bbc438b 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -915,7 +915,7 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	char component[31];
 	hda_nid_t fg;
 	int err;
-	static struct snd_device_ops dev_ops = {
+	static const struct snd_device_ops dev_ops = {
 		.dev_register = snd_hda_codec_dev_register,
 		.dev_free = snd_hda_codec_dev_free,
 	};
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index c7efb6f66bdc..4733268ec74e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1743,7 +1743,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 		      int dev, unsigned int driver_caps,
 		      struct azx **rchip)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_disconnect = azx_dev_disconnect,
 		.dev_free = azx_dev_free,
 	};
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 9d0784aed9e4..567c9ebddb2e 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -366,7 +366,7 @@ static int hda_tegra_create(struct snd_card *card,
 			    unsigned int driver_caps,
 			    struct hda_tegra *hda)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_disconnect = hda_tegra_dev_disconnect,
 		.dev_free = hda_tegra_dev_free,
 	};
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
