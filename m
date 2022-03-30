Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1024EC14C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CCF118FA;
	Wed, 30 Mar 2022 13:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CCF118FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641400;
	bh=SXDpUl53LOcvA7vl1vjJ+tv7O0zHMaTxiH6T79oerk8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FNQW1i7oxkPZBZcAEu3yUpImdWbEJPCFOzMCt3QE6+iqJlSy4bV5B1YBMzt5IacA/
	 /cOvpUByEYckV3wRL6aziTnU8Re8T4dsU61gnYwVXoCypOQUI7S017ERsdfVMV8cPt
	 Zy0+0mHbVjsiLq/m5vQgfoi2XoY/Ccu3jlRvAjTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26349F80527;
	Wed, 30 Mar 2022 13:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88083F805EC; Wed, 30 Mar 2022 13:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9226BF80527
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9226BF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kl++iMlz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08917B81C34;
 Wed, 30 Mar 2022 11:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F6BC36AE2;
 Wed, 30 Mar 2022 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640950;
 bh=SXDpUl53LOcvA7vl1vjJ+tv7O0zHMaTxiH6T79oerk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kl++iMlzQanbWuXliTryfv5p9W73Z2Jf1F5NnT9b9yRi/EbL1tIbs4PCOHY+i8l4R
 mJlcIFXHbU33qhybGe/05yrDTRC/SY18S/PQo4YzOQyX+NpBaUMed85pQvmb92oQii
 fpXd9iDbcYenyY1QPfKjuckSOfo9pW1wQaBWf1960qhZpBQCh2YIysyS+L7Qx4RQlE
 FxzcytBnzM9K3HUijD1Hh5yCze2xfL+x/8XmbE0t2SbhR73ST0zZ7JCASTvXR3VBpY
 FI0oQt4Q2nmaBTUdHN2uhMc0vGWHOrOkjwXxevX/trTIQkW0ct5w27vU2WchWVTGZE
 umzDqWgCvJ3VA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 24/59] ALSA: hda: Fix driver index handling at
 re-binding
Date: Wed, 30 Mar 2022 07:47:56 -0400
Message-Id: <20220330114831.1670235-24-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Alexander Sergeyev <sergeev917@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 gregkh@linuxfoundation.org, tiwai@suse.com
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 69458e2c27800da7697c87ed908b65323ef3f3bd ]

HD-audio driver handles the multiple instances and keeps the static
index that is incremented at each probe.  This becomes a problem when
user tries to re-bind the device via sysfs multiple times; as the
device index isn't cleared unlike rmmod case, it points to the next
element at re-binding, and eventually later you can't probe any more
when it reaches to SNDRV_CARDS_MAX (usually 32).

This patch is an attempt to improve the handling at rebinding.
Instead of a static device index, now we keep a bitmap and assigns to
the first zero bit position.  At the driver remove, in return, the
bitmap slot is cleared again, so that it'll be available for the next
probe.

Reported-by: Alexander Sergeyev <sergeev917@gmail.com>
Link: https://lore.kernel.org/r/20220209081912.20687-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3b6f2aacda45..1ffd96fbf230 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2061,14 +2061,16 @@ static const struct hda_controller_ops pci_hda_ops = {
 	.position_check = azx_position_check,
 };
 
+static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
+
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
-	static int dev;
 	struct snd_card *card;
 	struct hda_intel *hda;
 	struct azx *chip;
 	bool schedule_probe;
+	int dev;
 	int err;
 
 	if (pci_match_id(driver_denylist, pci)) {
@@ -2076,10 +2078,11 @@ static int azx_probe(struct pci_dev *pci,
 		return -ENODEV;
 	}
 
+	dev = find_first_zero_bit(probed_devs, SNDRV_CARDS);
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
 	if (!enable[dev]) {
-		dev++;
+		set_bit(dev, probed_devs);
 		return -ENOENT;
 	}
 
@@ -2146,7 +2149,7 @@ static int azx_probe(struct pci_dev *pci,
 	if (schedule_probe)
 		schedule_delayed_work(&hda->probe_work, 0);
 
-	dev++;
+	set_bit(dev, probed_devs);
 	if (chip->disabled)
 		complete_all(&hda->probe_wait);
 	return 0;
@@ -2369,6 +2372,7 @@ static void azx_remove(struct pci_dev *pci)
 		cancel_delayed_work_sync(&hda->probe_work);
 		device_lock(&pci->dev);
 
+		clear_bit(chip->dev_index, probed_devs);
 		pci_set_drvdata(pci, NULL);
 		snd_card_free(card);
 	}
-- 
2.34.1

