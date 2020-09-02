Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E825B5D8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E0E17F3;
	Wed,  2 Sep 2020 23:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E0E17F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599082136;
	bh=gCmZiEwaW/sHkqAN1bMyYqiWCofXWCuhTqccy30wQqg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYkrXMvgl5bEDfVNLManzWs9j6jJ2IzRT7FjZuml17NN5n09F6FfL5puqLqipU5Ls
	 yOjiMlS4F6/k2qo6mL+jjjiSbpa33t2eOwKoDNBS5yb+Y6VQv2esB+LsIb5ezmEbIu
	 8BA7K2+BV1haqSkC36neDWWiaewCqYtYQ9z4bDs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E02F80317;
	Wed,  2 Sep 2020 23:22:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02135F80306; Wed,  2 Sep 2020 23:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E69DFF802C3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E69DFF802C3
IronPort-SDR: FVW7YaOgoQFGvW206WyuOGxic7nmSy+aFPiSzV0gpxENdyzUOouPL+fRnqTJrRR6SpjEYVipHu
 mddNuManhJSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482873"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482873"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:06 -0700
IronPort-SDR: zdjWUYucAIHyUH9Rd7PSoOMLLfF3MoV6723DCtSS2aCLTMno9QuczngkRu/TcJ237mEFMSN6PY
 VO/bxhrWsCMA==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798283"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/18] ALSA: hda: auto_parser: remove shadowed variable
 declaration
Date: Wed,  2 Sep 2020 16:21:25 -0500
Message-Id: <20200902212133.30964-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warning:

sound/pci/hda/hda_auto_parser.c:353:7: style: Local variable 'i'
shadows outer variable [shadowVariable]
  int i = 0;
      ^
sound/pci/hda/hda_auto_parser.c:182:6: note: Shadowed declaration
 int i;
     ^
sound/pci/hda/hda_auto_parser.c:353:7: note: Shadow variable
  int i = 0;
      ^

It's not clear why a new declaration was added, remove and reuse
variable declared with larger scope.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/hda_auto_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 824f4ac1a8ce..4dc01647753c 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -350,7 +350,7 @@ int snd_hda_parse_pin_defcfg(struct hda_codec *codec,
 	 */
 	if (!cfg->line_outs && cfg->hp_outs > 1 &&
 	    !(cond_flags & HDA_PINCFG_NO_HP_FIXUP)) {
-		int i = 0;
+		i = 0;
 		while (i < cfg->hp_outs) {
 			/* The real HPs should have the sequence 0x0f */
 			if ((hp_out[i].seq & 0x0f) == 0x0f) {
-- 
2.25.1

