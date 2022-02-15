Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C44B6D73
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 14:30:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB18018BA;
	Tue, 15 Feb 2022 14:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB18018BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644931822;
	bh=LXrP6q4kj/bk9dwZLayLMEodDEaumFXjfqEL2zZyyO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FED8TCaq+dfFFHEEJH9nPKGMp3liUisXRTAtVRhT7ZwNi9ubPPcUy6V1hXXjDbkDy
	 +4n2iqbxhAJ1CPPI+8ifS6J062I/YQjBTYw/88jX7UUB0DLRBYYbl1dK+YstBfqp6Y
	 5is6bQjMh/phWmpGt5mhn9EkvTt2NfIORsNX213Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF26F80515;
	Tue, 15 Feb 2022 14:28:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B7EF80271; Tue, 15 Feb 2022 14:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89A8EF800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 14:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A8EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="o+EpAY0+"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="eYJT58Ew"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C08E121102;
 Tue, 15 Feb 2022 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644931679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56wXIyAsB7EDQ3jWSML86fy7gKwfmsfVIAJO37+aUZo=;
 b=o+EpAY0+WSMmqncwbBdos3kxGKsmEGOLj5AZZrAQ0fso7uVSEQDFRQbrbxs3jFpCQDcc3P
 GX2BXUV02AqujWPtPQQvHpZbFeFNAtJZhsPtJrU8iG0sEDmcvuDqXKl4D1/kYpjr5WMCW3
 DpVCmyIomeb0y4UKxeXaLTXjiHYx9GY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644931679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56wXIyAsB7EDQ3jWSML86fy7gKwfmsfVIAJO37+aUZo=;
 b=eYJT58Ewx9fBA4KNJc4HKprRKhWDdb461AT+SNpyQy9czBpCkouZevuKOPvFmKIxZWotwA
 s09CHsnb08wk6yCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AF3E7A3B87;
 Tue, 15 Feb 2022 13:27:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: intel: skylake: Set max DMA segment size
Date: Tue, 15 Feb 2022 14:27:56 +0100
Message-Id: <20220215132756.31236-4-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220215132756.31236-1-tiwai@suse.de>
References: <20220215132756.31236-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>,
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

The recent code refactoring to use the standard DMA helper requires
the max DMA segment size setup for SG list management.  Without it,
the kernel may spew warnings when a large buffer is allocated.

This patch sets up dma_set_max_seg_size() for avoiding spurious
warnings.

Fixes: 2c95b92ecd92 ("ALSA: memalloc: Unify x86 SG-buffer handling (take#3)")
Cc: <stable@vger.kernel.org>
BugLink: https://github.com/thesofproject/linux/issues/3430
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/skylake/skl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 148ddf4cace0..aeca58246fc7 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -952,6 +952,7 @@ static int skl_first_init(struct hdac_bus *bus)
 	/* allow 64bit DMA address if supported by H/W */
 	if (dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(64)))
 		dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(bus->dev, UINT_MAX);
 
 	/* initialize streams */
 	snd_hdac_ext_stream_init_all
-- 
2.31.1

