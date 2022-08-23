Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77E59DB0B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D611620;
	Tue, 23 Aug 2022 13:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D611620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661255986;
	bh=xZRkHEqI3K8OqHp4glIeN+A9hKbDPjErRa130PN2J/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imNrgp9UVKh0PpeUOAt9PNL1jXVYAknEBConyFf1/CFOvv38ICir0ZUKZWx9EeDWT
	 eCJlJbc7thmgNvZjwdqKRsyYb1oeWdn1ojhBm2KUVH2dRkhHgc7Ab759dl3tc/GuGu
	 vBsxcPIotHJsfuTOjPld163VTdmNAXAtMrFYXTZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364F7F8020D;
	Tue, 23 Aug 2022 13:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1566CF80529; Tue, 23 Aug 2022 13:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E2A8F8027B
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E2A8F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LLwYSgkA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="K/+xy1Wk"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19DA61FA73;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661255864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI/wZdbUkYjQ+d0u4cmEjRKQ6hCMKwq058yCf3kBdzY=;
 b=LLwYSgkApXESesMaJb4BVlvepwWONfegMf9jDk4jBAMFJ3M9o0jWk+88jzXNCwmW+Sf4ql
 xQk94mj60b4sfonKtUW5ZocUQzRqiFx2kX9wq8ZLVWZSAN/6dcVrwjN4tOKsOEWPV73hFF
 76gRIvuhIUTmwSCQBfl0paVTqzGJAX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661255864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI/wZdbUkYjQ+d0u4cmEjRKQ6hCMKwq058yCf3kBdzY=;
 b=K/+xy1WkAnDEllOCMQafCAa4GaKsQRsHBZiTQbGenAHFM2Khh02skrYmzV7Pcc2vt/CPhy
 /Pybk+UCRnIq1dBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F380C13AB7;
 Tue, 23 Aug 2022 11:57:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aCLHOrfABGP1OAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 11:57:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ALSA: pdaudiocf: Drop superfluous GFP setup
Date: Tue, 23 Aug 2022 13:57:37 +0200
Message-Id: <20220823115740.14123-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220823115740.14123-1-tiwai@suse.de>
References: <20220823115740.14123-1-tiwai@suse.de>
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

The extra setup with GFP_DMA32 is superfluous for this driver.  The
whole operation is a simple copy loop, and there is no memory address
restriction at all.  Drop the useless GFP setup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
index dfc4295b69c4..aaa82ec36540 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
@@ -257,8 +257,7 @@ int snd_pdacf_pcm_new(struct snd_pdacf *chip)
 		return err;
 		
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pdacf_pcm_capture_ops);
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-				       snd_dma_continuous_data(GFP_KERNEL | GFP_DMA32),
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL,
 				       0, 0);
 
 	pcm->private_data = chip;
-- 
2.35.3

