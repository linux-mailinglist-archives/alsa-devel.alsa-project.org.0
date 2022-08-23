Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5359DB0D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7E9C163E;
	Tue, 23 Aug 2022 13:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7E9C163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661256001;
	bh=xL4KA/wZrY4kZmBA8+zjMIZqW0SsFCgEW76L1igVqWE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULhimnMgmEInjVVYUsorgmgs0LjEKDk/q69Fqenxb17fUNSc28k05gMpXvCm4MoVc
	 /uf4KD/qbgHYqJmDUrY+Wt2wbBXbf44hQ8uOwz4AH70dpSh2zpVK5gaTyxEruYVhqe
	 cKT8qSmVh1KLMd60abS1r1yOjoanRGqBKHOGAmgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B14F8053A;
	Tue, 23 Aug 2022 13:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BE1DF8020D; Tue, 23 Aug 2022 13:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9FB8F804E6
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9FB8F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dgHVwyQP"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+SaJrFe7"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68862336D3;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661255864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QExBB+fUDys4PhhPdbLolaTTUnFQ4aogbQI4fJNZXfE=;
 b=dgHVwyQPiEnM1SngscGTXzaP/BAT19sl5c9kj7TDF7z9D24Qm2mRFeSud8oNvDknR8/2JZ
 tJH9hDK+S1qNLFSktI+sMe/bUrrwsue4bTbotWwRmkkDdReijg+VbFDJUlcCiHpV6mt3kT
 /61FRRoOYz3fvQoO/5GTulZOwhh0FuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661255864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QExBB+fUDys4PhhPdbLolaTTUnFQ4aogbQI4fJNZXfE=;
 b=+SaJrFe7VkWlr/ltDzyswGmfnb8KLcl9K6jQNM701DC60txA/vWfknXrKB97HNfS9nIZgd
 Iiu1SXDRM7NWPdAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D43913AE6;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gC9SErjABGP1OAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 11:57:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ALSA: doc: Drop snd_dma_continuous_data() usages
Date: Tue, 23 Aug 2022 13:57:40 +0200
Message-Id: <20220823115740.14123-6-tiwai@suse.de>
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

Update the documentation to follow the recent change of the memory
allocation helpers.  The macro snd_dma_continuous_data() is gone, and
the driver needs to set up the coherent dma mask for allocating in the
lower memory addresses, instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../kernel-api/writing-an-alsa-driver.rst     | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 176b73583b7a..07a620c5ca74 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3565,13 +3565,17 @@ given size.
 The second argument (type) and the third argument (device pointer) are
 dependent on the bus. For normal devices, pass the device pointer
 (typically identical as ``card->dev``) to the third argument with
-``SNDRV_DMA_TYPE_DEV`` type. For the continuous buffer unrelated to the
+``SNDRV_DMA_TYPE_DEV`` type.
+
+For the continuous buffer unrelated to the
 bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type.
 You can pass NULL to the device pointer in that case, which is the
 default mode implying to allocate with ``GFP_KERNEL`` flag.
-If you need a different GFP flag, you can pass it by encoding the flag
-into the device pointer via a special macro
-:c:func:`snd_dma_continuous_data()`.
+If you need a restricted (lower) address, set up the coherent DMA mask
+bits for the device, and pass the device pointer, like the normal
+device memory allocations.  For this type, it's still allowed to pass
+NULL to the device pointer, too, if no address restriction is needed.
+
 For the scatter-gather buffers, use ``SNDRV_DMA_TYPE_DEV_SG`` with the
 device pointer (see the `Non-Contiguous Buffers`_ section).
 
@@ -3811,15 +3815,6 @@ arguments here.  Since each vmalloc call should succeed at any time,
 we don't need to pre-allocate the buffers like other continuous
 pages.
 
-If you need the 32bit DMA allocation, pass the device pointer encoded
-by :c:func:`snd_dma_continuous_data()` with ``GFP_KERNEL|__GFP_DMA32``
-argument.
-
-::
-
-  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-          snd_dma_continuous_data(GFP_KERNEL | __GFP_DMA32), 0, 0);
-
 Proc Interface
 ==============
 
-- 
2.35.3

