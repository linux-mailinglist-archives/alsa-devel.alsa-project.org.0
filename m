Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F2679434
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 10:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE044DF9;
	Tue, 24 Jan 2023 10:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE044DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674552534;
	bh=CyuvSZ+k/B4DZfPX8vLEMWVkSlriM854bIhasRgmG9U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=S10lkWEc8TyJaA1mSu/lPSxk7nARFzPLVw3GALZSrmuVch3ijwxLRLxTY2YrKkLee
	 P0iPcun3uZhiagwiIShii1dhjfdBJ6kqj0vBt8jVt5bQWECwFHIQXMVMZpY6gpCGjO
	 bRlOU0W/JoKcUrJoJIU+99O6GI5v4+ca3L3xtgsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6AE8F801D5;
	Tue, 24 Jan 2023 10:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0AD8F8030F; Tue, 24 Jan 2023 10:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B581DF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 10:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B581DF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=kSlUuZeC; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ToOk0SaJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 530121F8C2;
 Tue, 24 Jan 2023 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674552469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dGPg8oz/0KgeKFm3O/KaO4akyscl5TmxoVb/DGwxXBs=;
 b=kSlUuZeCGYiogsBr6/6NIJYOQ76/QYbAbRXnTN4huO9k6KYXAC4jYrLNylMFhhsnPAYMH8
 sZXuNqeerLhwpdqkwaJ7Fn8HNHRvS1ihj7pXwOfHhAxkfnwoF11WQwSYgj2XkL4wh9v/k1
 j9nVuonOr9QNnF6EQSJ3kiMU+g3BQmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674552469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dGPg8oz/0KgeKFm3O/KaO4akyscl5TmxoVb/DGwxXBs=;
 b=ToOk0SaJs8D2ZeNX43NbGgBzlluX1ypdujQTtRG1FnZz/vWpluNS4q4Dzt+PztwIIyYjwO
 F7y6L78Utj5z4GAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 218C9139FB;
 Tue, 24 Jan 2023 09:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2SypBpWkz2NeUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 24 Jan 2023 09:27:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: memalloc: Fix for Xen PV and non-IOMMU systems
Date: Tue, 24 Jan 2023 10:27:42 +0100
Message-Id: <20230124092744.27370-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

this is a patch series to address the recent regression on Xen PV (and
possibly non-IOMMU) systems about the SG-buffer memory allocation.
We switched to use dma_alloc_noncontiguous() as hoped it handling
everything right, but it turned out that this doesn't work always.
So this is one step back, use the explicit SG-buffer with
dma_alloc_coherent() calls, but in a bit more optimized ways, and also
applying only for those systems.


Takashi

===

Takashi Iwai (2):
  ALSA: memalloc: Explicit SG-allocations for Xen PV and non-IOMMU
    systems
  ALSA: memalloc: Use coherent DMA allocation for fallback again

 sound/core/memalloc.c | 68 +++++++++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 15 deletions(-)

-- 
2.35.3

