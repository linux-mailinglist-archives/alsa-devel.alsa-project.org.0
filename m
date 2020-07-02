Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B8212D43
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DDF16F1;
	Thu,  2 Jul 2020 21:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DDF16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719034;
	bh=nyD54Yr9W2dZbdGgX7hGxPss+qZcWNnzaqXvbLfsrDs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpmYHnHC39Yz1Nr66wQlzfxZBePgkdKdKVWfOmLtrKvn2MIXBeDNyZ0MVpp8a0sAt
	 sAA6eFv7s4V2BnU3Ins5SH52MmIMv6QcCsZN9bxmQZPZM6YDMYw76pzM+/rd6vFYjA
	 pehbKi3ijp2mFCAOW26ldrKW9b371BnlEmCz+xoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1DDBF80307;
	Thu,  2 Jul 2020 21:37:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A6BCF80305; Thu,  2 Jul 2020 21:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65591F802C2
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65591F802C2
IronPort-SDR: o4vrAy0WYiTbDQUlYbBQdXdlLGScMEFcLUBJqS/8lR6fmml7bg/1S7cyFEPI+dCVSbJAs8nNdD
 WDHQnbinLgKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549352"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549352"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:24 -0700
IronPort-SDR: zJwd1DeUHkJugSns9KT6jYKfp9UuvoyxI4BnZIJSk/vjR0upE20eCoSmORF6ylLkg/HHSEAa1I
 8BZbt3QcUeSg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116377"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 11/23] ASoC: pci/emu10k1: remove "set but not used'
 warnings
Date: Thu,  2 Jul 2020 14:35:52 -0500
Message-Id: <20200702193604.169059-12-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. Mark variables used for reads as __always_unused.

sound/pci/emu10k1/emu10k1_main.c: In function
‘snd_emu10k1_cardbus_init’:
sound/pci/emu10k1/emu10k1_main.c:626:15: warning: variable ‘value’ set
but not used [-Wunused-but-set-variable]
  626 |  unsigned int value;
      |               ^~~~~
sound/pci/emu10k1/emu10k1_main.c: In function
‘snd_emu1010_load_firmware_entry’:
sound/pci/emu10k1/emu10k1_main.c:656:15: warning: variable
‘write_post’ set but not used [-Wunused-but-set-variable]
  656 |  unsigned int write_post;
      |               ^~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/emu10k1/emu10k1_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 6ff581733a19..bd70e112ffd7 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -623,7 +623,7 @@ static int snd_emu10k1_ecard_init(struct snd_emu10k1 *emu)
 static int snd_emu10k1_cardbus_init(struct snd_emu10k1 *emu)
 {
 	unsigned long special_port;
-	unsigned int value;
+	__always_unused unsigned int value;
 
 	/* Special initialisation routine
 	 * before the rest of the IO-Ports become active.
@@ -653,7 +653,7 @@ static int snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
 	int n, i;
 	int reg;
 	int value;
-	unsigned int write_post;
+	__always_unused unsigned int write_post;
 	unsigned long flags;
 
 	if (!fw_entry)
-- 
2.25.1

