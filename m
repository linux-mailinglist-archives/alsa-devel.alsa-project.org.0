Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D122534D
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 20:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DAD61660;
	Sun, 19 Jul 2020 20:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DAD61660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595182248;
	bh=AECm8aRo4if2Mwp2fUFroMtIu2fKm+pnJnVg8GFh9e0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l+FnauutmkFTxikJEb/fSPtgeiPgtUp82iYUseZBHTrGbOQ8nquBP1R/Ld7lKDkh+
	 uYZFn9J70/uja5YxVjJ2TbrLtjw8EngvJo+Jk5NJ6bskr/GPJPyKrzZ5+zT6eAXpL3
	 pt5caLDlJ2PdJkPTThiMmSabGjgXzZiu1j2Pauu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F9BAF800C1;
	Sun, 19 Jul 2020 20:09:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A88BAF800BF; Sun, 19 Jul 2020 20:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 208C2F800BF
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 20:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 208C2F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="SLXT6wz6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=gKFpR8jAPzcYmVRLFz/KkDA7PdkxDdgLZsiVDwET5tU=; b=SLXT6wz61CjPbZIWN1cyqrV2g/
 Ejj3ZUrfnezTDp7Q1IidCJjVt4d2dNY9RL6t2K41cpGsKTZrGwWGyp8jE1YPPAfmZyuUQPLvnSy65
 r6H/EyaaQfHdl7uHLbJTDUe7MuJKDJTepxB7KDDQAwsYtrmqq09Ple4baY5RRogICGQOANUJRYKiB
 Bv9DES0NpM2NlIoWill8700heQlds4VlERuwCpwnVnEKbgDEU2R00sZOFWpltHSyDN9PzCXhDxkqE
 zEUtZGrPqvu9ZL5wC/wuhlMBbjwC7VMPQ7AkP2QSER6QUjrfI7V/e5XMwmsbGDQpb50xgGd32zJg9
 0f9hV/Cg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDk3-0006D6-KE; Sun, 19 Jul 2020 18:08:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] sound: asihpi: delete duplicated word
Date: Sun, 19 Jul 2020 11:08:48 -0700
Message-Id: <20200719180848.22572-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>
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

Delete the doubled word "of" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
---
 sound/pci/asihpi/hpi_internal.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/sound/pci/asihpi/hpi_internal.h
+++ linux-next-20200717/sound/pci/asihpi/hpi_internal.h
@@ -53,7 +53,7 @@ If handle is invalid *pPhysicalAddr is s
 u16 hpios_locked_mem_get_phys_addr(struct consistent_dma_area
 	*locked_mem_handle, u32 *p_physical_addr);
 
-/** Get the CPU address of of memory represented by LockedMemHandle.
+/** Get the CPU address of memory represented by LockedMemHandle.
 
 If handle is NULL *ppvVirtualAddr is set to NULL and return 1
 */
