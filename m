Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B730039F905
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF641836;
	Tue,  8 Jun 2021 16:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF641836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162359;
	bh=QCWMO63zf5cwBCx7ES/qETUf4S/GTKgn1fwU9VW4408=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XbivWd5J53wJpJ9Tigmf9sUempf/Rnw5tXQCemHaxvNFKiSipXfUMMFPy975Nm+u8
	 BZiFxPNIVAvl7rlrCIVO31LS/31JYixSRtIBXml32fD7SRffjyD9XZDT5U86WEbM2T
	 3jUi7Fa2WVBg0sQVWCD49g/1R5o5jPT1np7N9O/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 206A8F80682;
	Tue,  8 Jun 2021 16:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A6AF80508; Tue,  8 Jun 2021 16:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB42F804F3
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB42F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="elgWk7yE"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0ED/deNU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5D844219E0
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGMLw27JChpT5CIlG46ADedxmhhe9FQt/gXNwwUhWlA=;
 b=elgWk7yETxDCbD3heE63yVTdkJWtTBFfcVl4NkJyfCfWBw/vLUH5IhHSzOP8mNSWXvPd6O
 nKJwBTtdJAcfsHp3JBM60jr276/Uo97g3YUWO68Z9Bsjvjq1ywm2gl/2J0X6QdaZ983mvg
 6H31gwVfJZ60r+m1e9IR4wB88rlRjpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGMLw27JChpT5CIlG46ADedxmhhe9FQt/gXNwwUhWlA=;
 b=0ED/deNUgajQGeUlXKHfBqy8bb2hT2fvk629yB8APxCzjS1FvpHV92eql9PkiqbO//cwlX
 j7hRZgrC7Eo6x1AQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 579B2A3B88;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/66] ALSA: ak4531: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:50 +0200
Message-Id: <20210608140540.17885-17-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

AK4531 codec driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ak4531_codec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ak4531_codec.c b/sound/pci/ak4531_codec.c
index e0a81f99f79a..6af88e7b86f8 100644
--- a/sound/pci/ak4531_codec.c
+++ b/sound/pci/ak4531_codec.c
@@ -384,7 +384,8 @@ int snd_ak4531_mixer(struct snd_card *card,
 		return -ENOMEM;
 	*ak4531 = *_ak4531;
 	mutex_init(&ak4531->reg_mutex);
-	if ((err = snd_component_add(card, "AK4531")) < 0) {
+	err = snd_component_add(card, "AK4531");
+	if (err < 0) {
 		snd_ak4531_free(ak4531);
 		return err;
 	}
@@ -398,13 +399,15 @@ int snd_ak4531_mixer(struct snd_card *card,
 		ak4531->write(ak4531, idx, ak4531->regs[idx] = snd_ak4531_initial_map[idx]);	/* recording source is mixer */
 	}
 	for (idx = 0; idx < ARRAY_SIZE(snd_ak4531_controls); idx++) {
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_ak4531_controls[idx], ak4531))) < 0) {
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_ak4531_controls[idx], ak4531));
+		if (err < 0) {
 			snd_ak4531_free(ak4531);
 			return err;
 		}
 	}
 	snd_ak4531_proc_init(card, ak4531);
-	if ((err = snd_device_new(card, SNDRV_DEV_CODEC, ak4531, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_CODEC, ak4531, &ops);
+	if (err < 0) {
 		snd_ak4531_free(ak4531);
 		return err;
 	}
-- 
2.26.2

