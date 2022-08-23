Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8059DB08
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB4F162F;
	Tue, 23 Aug 2022 13:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB4F162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661255928;
	bh=wulxSZLwXmYWou/ouwEu8EvMS3+wzOc0DEyPv0w/5sQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XxZHlBdAvTw4CCpsgj00GM6HOQLwTByMVg0u/Nh3ybqP5MDwMyNcrpYhVybUnZ2Iz
	 P4/ZDFecK3LSkuxa5wvf6NtkmHDQRyZgZO2MNRyR6OMdbeMiQot+ewLIxbcrcdqROu
	 9te1u1cnCXHY2h4NrqU/k7cyJfh3WGzuahgxq8jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB1EF80526;
	Tue, 23 Aug 2022 13:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9878CF800A7; Tue, 23 Aug 2022 13:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 403A0F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403A0F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="o04Ga/Lm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="IfXhG437"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D64C8336BA;
 Tue, 23 Aug 2022 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661255863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Yt8TXnf1Pm+uAk2XxFjARvyi/I6HK3K1O2YepFzlH7c=;
 b=o04Ga/LmLXNYbHB7LiJ7yfgiAkumS4bxE2zbO988ykFHCUWdhI0EwR1Kn4FYTu6Bb88Q1n
 keJmXxsygg7SCDJ4CKC8ANjN5jTZ4VHygtZXz8HhlghBvHhUdGFkVJKSL3SUc/YWGuGfNc
 4KnSuKJFiXCJUfBF4F+pLlQrHagkiUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661255863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Yt8TXnf1Pm+uAk2XxFjARvyi/I6HK3K1O2YepFzlH7c=;
 b=IfXhG437Q6w+qRlPJEdoVuSVRRuBKS0M0C0VwwUYBCRp/iUu6XNntHNxcAGrd7OZ4BjRb/
 mndfKCMiY5uUzsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCD8213AB7;
 Tue, 23 Aug 2022 11:57:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LrtULbfABGP1OAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 11:57:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ALSA: Drop hackish GFP giveaway for CONTINUOUS pages
Date: Tue, 23 Aug 2022 13:57:35 +0200
Message-Id: <20220823115740.14123-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

Hi,

this is a series of cleanup patches for dropping the current hackish
way of passing the GFP_* flags for CONTINOUS and VMALLOC memory
allocations.  There are only three users for this legacy feature, and
all of them seem superfluous.  And, if any driver requires the memory
restriction in future, it can now pass the proper device pointer for
specifying the DMA mask.


Takashi

===

Takashi Iwai (5):
  ALSA: vx: Drop superfluous GFP setup
  ALSA: pdaudiocf: Drop superfluous GFP setup
  ASoC: Intel: sst: Switch to standard device pages
  ALSA: memalloc: Drop special handling of GFP for CONTINUOUS allocation
  ALSA: doc: Drop snd_dma_continuous_data() usages

 .../kernel-api/writing-an-alsa-driver.rst     |  21 ++--
 include/sound/memalloc.h                      |   3 -
 sound/core/memalloc.c                         | 113 ++++++++----------
 sound/drivers/vx/vx_pcm.c                     |   3 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c        |   3 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c  |   7 +-
 6 files changed, 61 insertions(+), 89 deletions(-)

-- 
2.35.3

