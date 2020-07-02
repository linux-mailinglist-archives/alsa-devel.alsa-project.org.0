Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD916212D57
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39C5116DF;
	Thu,  2 Jul 2020 21:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39C5116DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719239;
	bh=sNPHCx+hEMd2z2eB5UyIxEPTUdI+1xP1n70yIONVsL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3WMJFeYGN23NwAzn68hqIzw+tv9pa8L7kqxGw5iHU+4GVDOmB2vD90fHMDQQ/E+z
	 r53fP50iepnM/98YusKlkKyTl1OPFGWCnTxQaHf5jeOIOZtm7qSxTbdYw3b/CQ4SbZ
	 ayexT4iC+75gJKdPFsbTJtm+MTy9DSIKLd4ASEv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AD5F8034D;
	Thu,  2 Jul 2020 21:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7976AF80316; Thu,  2 Jul 2020 21:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC077F8027B
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC077F8027B
IronPort-SDR: 3+Qq6Cc1d5+nAmRpoKwy6CTxBQtLo5ElPJrGPtdlomjab2HpvUuD1qiB4WMkUMxasi6wZX4k+B
 RVplxr+aFAlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549357"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549357"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:27 -0700
IronPort-SDR: QI8MbEF7miVfzyRSy7faLFlrBd+aXyNopc5DqHzMkoL+Zj9E5UESDaKDvP1zL/pkF5J4zNglMb
 zIs+HsXp5S4Q==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116388"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 15/23] ALSA: pci/rme9652/hdspm: remove always true
 condition
Date: Thu,  2 Jul 2020 14:35:56 -0500
Message-Id: <20200702193604.169059-16-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning:

sound/pci/rme9652/hdspm.c: In function ‘hdspm_autosync_ref’:
sound/pci/rme9652/hdspm.c:3030:16: warning: comparison of unsigned
expression >= 0 is always true [-Wtype-limits]
 3030 |   if ((syncref >= HDSPM_AES32_AUTOSYNC_FROM_WORD) &&
      |                ^~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/rme9652/hdspm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index f7cda9062088..0fa49f4d15cf 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -3027,8 +3027,8 @@ static int hdspm_autosync_ref(struct hdspm *hdspm)
 
 		unsigned int status = hdspm_read(hdspm, HDSPM_statusRegister);
 		unsigned int syncref = (status >> HDSPM_AES32_syncref_bit) & 0xF;
-		if ((syncref >= HDSPM_AES32_AUTOSYNC_FROM_WORD) &&
-				(syncref <= HDSPM_AES32_AUTOSYNC_FROM_SYNC_IN)) {
+		/* syncref >= HDSPM_AES32_AUTOSYNC_FROM_WORD is always true */
+		if (syncref <= HDSPM_AES32_AUTOSYNC_FROM_SYNC_IN) {
 			return syncref;
 		}
 		return HDSPM_AES32_AUTOSYNC_FROM_NONE;
-- 
2.25.1

