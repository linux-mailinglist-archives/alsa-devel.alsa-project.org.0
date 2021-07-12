Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12B3C4649
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 11:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6391F1687;
	Mon, 12 Jul 2021 11:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6391F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626082665;
	bh=k5Sf7ZRdGrhKOqzaE3b4UKQ0uNbCuAfWmy7Y4N3PxI4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ORhCJjBH++EeKao7F40gqjj+ONyrRhUx44wFAY3e0cKslATLfrdOIXr5Hme4fgBAc
	 S43mPaKl6DEB7JdSdCDwNhsg8D75+kkWgfBqV0J/xvJE3/3dMOBtZa65JIS+YM03ps
	 yiUZs3oWRKWGHEuDhr/qUTy4Ch9yrPypWsGvNijA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C1BF8026D;
	Mon, 12 Jul 2021 11:36:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DF3CF8026D; Mon, 12 Jul 2021 11:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0CD8F8020C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 11:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0CD8F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tFR1IaHy"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="OPMD1Lce"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 178531FD5C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626082603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CeUHwtALwJN3hMRr1XBfr584By95mbr7OePlsPWA6r0=;
 b=tFR1IaHyp7zuN87PNG5mCKR9Gl+1T0+B9ZoRCuBj0PsgRA/6DljexSYLQV1I6xz8opD+Eh
 ENVSlXpX3kixALhmO7QpSTzBFDte0+13kd3BE3Psq9QMA976u7j1iuLwCUD1EEmp/8iwTT
 j6wUZ9tHRjMfzCfPbxpeDkQ5k4eiDbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626082603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CeUHwtALwJN3hMRr1XBfr584By95mbr7OePlsPWA6r0=;
 b=OPMD1LcedSyxNlQcG5wapLs5MvavwEtczRPyLKTadkCGL0GOKRZtmI9B3+NGP7Cx623E6u
 OFncu1LwSloYboAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 079E5A3B8A;
 Mon, 12 Jul 2021 09:36:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: intel8x0: Skip ac97 clock measurement on VM
Date: Mon, 12 Jul 2021 11:36:41 +0200
Message-Id: <20210712093641.29079-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The intel8x0 driver tries to measure the AC97 bus clock at the probe
time because there have been machines that are driven in different
rate (44.1kHz vs 48kHz).  This was the past and currently most of
usages of this driver are on VM, and those are certainly fixed with
48k clock, hence it's useless and waste of time to measure.

This patch is an optimization, setting the fixed 48k rate if it's
detected to be running on a VM.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index df3ba5c70de9..6a436a2ce26a 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2656,6 +2656,8 @@ static void intel8x0_measure_ac97_clock(struct intel8x0 *chip)
 
 	if (chip->ac97_bus->clock != 48000)
 		return; /* specified in module option */
+	if (chip->inside_vm && !ac97_clock)
+		return; /* no measurement on VM */
 
       __again:
 	subs = chip->pcm[0]->streams[0].substream;
-- 
2.26.2

