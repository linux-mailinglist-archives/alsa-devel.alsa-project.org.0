Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E6212D4C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BD2168F;
	Thu,  2 Jul 2020 21:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BD2168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719134;
	bh=RHEYSEyoxOjORCdUmHL2/R4q8JTqBbc3ygATOIgDQmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HL95NJMDo7gK26V0Dylox4PRPnfaR53zq5TEzmSuDjSlrM74tPADOz6MTzLHNIBUZ
	 G18JgDHDgE22zTdca8bkAeofS752NZJ7vuAT1Lxbr21pD3jLhGyUfsE/wP0hf4mxXB
	 rFiGcCtbf+dBp3JsRjIrqhg4rmYdV7u9J1A2zyxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02788F80338;
	Thu,  2 Jul 2020 21:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8376DF80305; Thu,  2 Jul 2020 21:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0100F802DD
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0100F802DD
IronPort-SDR: Wzk7sn0FPct43fE+RW6A56H6sASZoyu6/yeJPBCS5BEyPrNionNZd+8i/D/JVRreyqBgRf9h2s
 5WIDwU2HQkwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549354"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549354"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:26 -0700
IronPort-SDR: RBYM2fb4Fr3qlDqRJ3tlfXEJZ91E8XvvIkTL1/mR1cNBNTJIeP3Ynvbv6PN3Z5wEzHY+YDEEzu
 pP5gdvAk6aeA==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116384"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 13/23] ALSA: pci/emu10k1: remove 'set but not used' warning
Date: Thu,  2 Jul 2020 14:35:54 -0500
Message-Id: <20200702193604.169059-14-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning. The loopsize variable is only used in compiled-out
code, so mark with __maybe_unused.

sound/pci/emu10k1/emu10k1_patch.c: In function
‘snd_emu10k1_sample_new’:
sound/pci/emu10k1/emu10k1_patch.c:30:22: warning: variable ‘loopsize’
set but not used [-Wunused-but-set-variable]
   30 |  int truesize, size, loopsize, blocksize;
      |                      ^~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/emu10k1/emu10k1_patch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_patch.c
index b3aa7bbe1067..89890f24509f 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -27,7 +27,8 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_sf_sample *sp,
 		       const void __user *data, long count)
 {
 	int offset;
-	int truesize, size, loopsize, blocksize;
+	int truesize, size, blocksize;
+	__maybe_unused int loopsize;
 	int loopend, sampleend;
 	unsigned int start_addr;
 	struct snd_emu10k1 *emu;
-- 
2.25.1

