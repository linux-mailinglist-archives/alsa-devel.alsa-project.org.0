Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F2212D4E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A61416DA;
	Thu,  2 Jul 2020 21:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A61416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719174;
	bh=6inimV1WLpdT8bbdGtVM8ItUKhvLB0AdubJb1/Pd+AU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FawPpP8lvj8GI4wZ0b2RBeQlrZeweTZB+AUujMiPgOy4xNR3eRqRYktDQp9D4crws
	 QMys1vUqkEGv/WuzC8EhMMxoIuZVQOEKcaMVojs4qAQXEtFyaNDZExCmITHkGFICej
	 SgJ3ahFiA5Sbw9f/1/+VCTvl8LDN1s5SoErIFSIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD2BF80345;
	Thu,  2 Jul 2020 21:37:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA3A3F800C1; Thu,  2 Jul 2020 21:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F251CF802DF
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F251CF802DF
IronPort-SDR: tlmWpGUCDJcKNJC2FGRQIPB9hGeP2aZ25/bE6cfUd5+Pb2yJ4pzoOJUNtoHUOIMi7+4mD7jPeu
 0UeDbCM/mgig==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549356"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549356"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:26 -0700
IronPort-SDR: jmdDyOYoJHiTiyjck32cngoo3LnhpWep6AWQL1CfnfJuvUaPsLw4vG1ZPjgtOy47c0rrGxWanr
 pldmHNwjmh7Q==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116385"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 14/23] ALSA: pci/korg1212: remove 'set but not used'
 warnings
Date: Thu,  2 Jul 2020 14:35:55 -0500
Message-Id: <20200702193604.169059-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix W=1 warnings. Two variables are only used for debug logs, mark
with __maybe_unused:

sound/pci/korg1212/korg1212.c: In function ‘snd_korg1212_create’:
sound/pci/korg1212/korg1212.c:2152:36: warning: variable ‘iomem2_size’
set but not used [-Wunused-but-set-variable]
 2152 |  unsigned ioport_size, iomem_size, iomem2_size;
      |                                    ^~~~~~~~~~~
sound/pci/korg1212/korg1212.c:2152:11: warning: variable ‘ioport_size’
set but not used [-Wunused-but-set-variable]
 2152 |  unsigned ioport_size, iomem_size, iomem2_size;
      |           ^~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/korg1212/korg1212.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 65a887b217ee..2eddd9de9e6d 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2149,7 +2149,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 {
         int err, rc;
         unsigned int i;
-	unsigned ioport_size, iomem_size, iomem2_size;
+	unsigned iomem_size;
+	__maybe_unused unsigned ioport_size;
+	__maybe_unused unsigned iomem2_size;
         struct snd_korg1212 * korg1212;
 	const struct firmware *dsp_code;
 
-- 
2.25.1

