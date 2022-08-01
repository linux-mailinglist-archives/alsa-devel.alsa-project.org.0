Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9249586F0C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C984851;
	Mon,  1 Aug 2022 18:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C984851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659372962;
	bh=HHZE7LpqtbMM+mWqUDx3JlzY9BE8ksjixKIkxS+N98A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gy+UHLBj2eduzlHpga5EDflg0dwbeRSbwyLRJ3FT8P1Gu0d0H+25zhzLmejnZwKRm
	 8hwUOBS/Ha30B0gxqXsa689Wpg6nIDeJYhvliv6oYJZmDOcah0x8aIh6DCSRE5tJCu
	 bvf8i4JJeDa6LPmzkvf3kBFhORXIOs86gsPy0C0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD93F80539;
	Mon,  1 Aug 2022 18:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCCFDF802DB; Mon,  1 Aug 2022 18:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 764C2F8023B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 764C2F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xGK0hcXU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0xT5fpsj"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 689FD38340;
 Mon,  1 Aug 2022 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659372864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRNpSGUK2O/A9dIAwB0+U6mvP3AD7U/zuitWRrgD8fI=;
 b=xGK0hcXUTFNmloPcjkhr5YNDUizNdbdDivrSgBLF4/3O6YZOjndG0XGGv9eymE4XG7Ub9s
 ybZexIJ+R+dVSzLuuZ7ic1uBLtnyTjy/8qV/MzyaFXuZ6p7I7XVF74zIYiwi6NBsjw1uvj
 DB1nmDZ/lJU4vHF9HRGUSz/Hv4HMeQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659372864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRNpSGUK2O/A9dIAwB0+U6mvP3AD7U/zuitWRrgD8fI=;
 b=0xT5fpsjnMGFr+eBwB06OR02pgDVtQ6S56mOcnYC4Ds1lQDp2BX+12x9TXh9n5Ros5p1z+
 b6ZMCEBU9rbZb8BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34D7D13ADF;
 Mon,  1 Aug 2022 16:54:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QAc5DEAF6GL9GQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:54:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda: Fix potential buffer overflow by
 snprintf()
Date: Mon,  1 Aug 2022 18:54:20 +0200
Message-Id: <20220801165420.25978-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165420.25978-1-tiwai@suse.de>
References: <20220801165420.25978-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

snprintf() returns the would-be-filled size when the string overflows
the given buffer size, hence using this value may result in the buffer
overflow (although it's unrealistic).

This patch replaces with a safer version, scnprintf() for papering
over such a potential issue.

Fixes: 29c8e4398f02 ("ASoC: SOF: Intel: hda: add extended rom status dump to error log")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8639ea63a10d..6d4ecbe14adf 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -574,7 +574,7 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, const char *le
 	chip = get_chip_info(sdev->pdata);
 	for (i = 0; i < HDA_EXT_ROM_STATUS_SIZE; i++) {
 		value = snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg + i * 0x4);
-		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
+		len += scnprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
 	dev_printk(level, sdev->dev, "extended rom status: %s", msg);
-- 
2.35.3

