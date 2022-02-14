Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 917084B48DB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 11:02:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD77171B;
	Mon, 14 Feb 2022 11:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD77171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644832937;
	bh=H+2LHrrIhstikYrfHEr0/wb5DnYTu8P1RRXRMnVsRPE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bb54xbqoHiyOyzuLFFB9FV9LIaav4WT77Aj3yo/hIeRum/B9Ca1Y1ZPyNTXZRUS2A
	 n14tNSKnr3GsV/TgVYa3ZdIMX/HcQKW+o1q+GxJFvEQhaBWQ66gDO66SGniNSZ1YUS
	 ekWgGAA36CNMtkI7evJln/xUeIk67jXZxxhIpEQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDCE4F8051D;
	Mon, 14 Feb 2022 11:00:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A00E3F8051C; Mon, 14 Feb 2022 11:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B99A9F80517
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99A9F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="euWmc7gT"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="hwvSOznq"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AE8991F384
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644832825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfy6WUoYKyJCLaWIR/qrsDdz+V/69ma2XElviWnclFk=;
 b=euWmc7gTNQ+QYJNwERbIo0kpASRM/xJN+hoCMncbXzxuQ4UuQG3cRCf8k9pEhi+i7G5Ms6
 Q8YZgMzgE13hjcRCAgxgindJRxIUdBEbdnZuRVU7vUCT6YsC5HwRIPj4RYgZDnH2S76TQh
 XsVooezLtJl0xhO2w1lPux38oWmYNiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644832825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfy6WUoYKyJCLaWIR/qrsDdz+V/69ma2XElviWnclFk=;
 b=hwvSOznq1RnuMD7AIt2RlQyt6VjoaYG+Z3ssc4SRXiF13CqR/z0DO2ivuWIwdKGgnBzvas
 9/UqPsRF5Le9v9Bw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9C11DA3B81;
 Mon, 14 Feb 2022 10:00:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: hda: Fix missing codec probe on Shenker Dock 15
Date: Mon, 14 Feb 2022 11:00:20 +0100
Message-Id: <20220214100020.8870-2-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220214100020.8870-1-tiwai@suse.de>
References: <20220214100020.8870-1-tiwai@suse.de>
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

By some unknown reason, BIOS on Shenker Dock 15 doesn't set up the
codec mask properly for the onboard audio.  Let's set the forced codec
mask to enable the codec discovery.

Reported-by: dmummenschanz@web.de
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 18b795220b52..917ad9d375b1 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1615,6 +1615,7 @@ static const struct snd_pci_quirk probe_mask_list[] = {
 	/* forced codec slots */
 	SND_PCI_QUIRK(0x1043, 0x1262, "ASUS W5Fm", 0x103),
 	SND_PCI_QUIRK(0x1046, 0x1262, "ASUS W5F", 0x103),
+	SND_PCI_QUIRK(0x1558, 0x0351, "Schenker Dock 15", 0x105),
 	/* WinFast VP200 H (Teradici) user reported broken communication */
 	SND_PCI_QUIRK(0x3a21, 0x040d, "WinFast VP200 H", 0x101),
 	{}
-- 
2.31.1

