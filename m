Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59763E0861
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 20:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E94986E;
	Wed,  4 Aug 2021 20:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E94986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628103395;
	bh=w/Zgn9S61NoHeIE2vu+DgBcXaivGFRTIAa5FTf/s4MU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l9G0vGKmRcNvtv80cHL06mNB7uEyUJwXoZjI4Not3CCTSiULwysV9GYrDOonISYxM
	 W2YrqtiWEUCBy7238iY/1Ff+cKyQuJr1eCyjZ6A6nBlHCeodeJiPdIts2bg0EpZNu9
	 UOA8QYFyJKpYO4GoDq9cntaNfzhQY2CcxlTsSyeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 975B8F8010A;
	Wed,  4 Aug 2021 20:55:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C032F8025F; Wed,  4 Aug 2021 20:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E16F8010A
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 20:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E16F8010A
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="277747201"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="277747201"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 11:54:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="668191813"
Received: from ccho-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.189.253])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 11:54:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pci/korg1212: completely remove 'set but not used'
 warnings
Date: Wed,  4 Aug 2021 13:54:42 -0500
Message-Id: <20210804185442.274057-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Commit 6cdc01ebdfb0 ("ALSA: pci/korg1212: remove 'set but not used'
warnings") missed one __maybe_unused, add to enable make W=1 sound/
compilation with x86_64 allmodconfig

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/korg1212/korg1212.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 49ed2bfaf11f..5c9e240ff6a9 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2094,7 +2094,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 {
         int err, rc;
         unsigned int i;
-	unsigned iomem_size;
+	__maybe_unused unsigned iomem_size;
 	__maybe_unused unsigned ioport_size;
 	__maybe_unused unsigned iomem2_size;
 	struct snd_korg1212 *korg1212 = card->private_data;
-- 
2.25.1

