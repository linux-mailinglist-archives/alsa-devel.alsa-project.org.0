Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099288CC13
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F911615;
	Wed, 14 Aug 2019 08:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F911615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565765339;
	bh=VHpg7HBBQWkaj06nE/oV0Ysa6U5AAuslD39aJP9N8OY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S/VDXfTGLEan0T29Xs0riBzRMECnXOA2tVlT7A5Y18C2TgO8ZLIQKU4bvp82kKB6p
	 8Z9Py/9cazAbel7ivNoU3udqilC7V27gx80AywT3c7WJtR7oxlK3yXqJscZt6dgDI3
	 AURFqOrBLX/ht7B0AyV/scuH3qQyfMmKALo31Jr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0022F805A0;
	Wed, 14 Aug 2019 08:47:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4853BF80214; Wed, 14 Aug 2019 08:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F41A2F80446
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41A2F80446
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 23:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,384,1559545200"; d="scan'208";a="327912110"
Received: from vganji-b85m-d3h.iind.intel.com ([10.223.163.76])
 by orsmga004.jf.intel.com with ESMTP; 13 Aug 2019 23:47:11 -0700
From: vani.ganji@intel.com
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 12:17:40 +0530
Message-Id: <20190814064740.9064-1-vani.ganji@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vani.ganji@intel.com
Subject: [alsa-devel] [PATCH] ALSA: hda: Retry codec read on first time
	failure
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Vani Ganji <vani.ganji@intel.com>

Sometimes HDMI audio fails while fast switching
between HDMI and Speaker due to codec Get Power state verb read failure.

Verb is codec driver to access codec HW. Since issue scenario involves
fast switching between HDMI and speaker, there might be chance to fail
read from HW and same happened in the error scenario.

Based on Display/Graphics architect suggestion, added a retry mechanism
for failure on first attempt.

Signed-off-by: Vani Ganji <vani.ganji@intel.com>
---
 sound/hda/hdac_device.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index b26cc93e7e10..225bd1bfe156 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -984,10 +984,17 @@ static unsigned int codec_read(struct hdac_device *hdac, hda_nid_t nid,
 {
 	unsigned int cmd = snd_hdac_make_cmd(hdac, nid, verb, parm);
 	unsigned int res;
-
-	if (snd_hdac_exec_verb(hdac, cmd, flags, &res))
-		return -1;
-
+	unsigned int count;
+
+	/* Retry verb once more if it fails first time */
+	/* recommended to retry since it is HW related */
+	for (count = 0; count <= 1; count++) {
+		if (snd_hdac_exec_verb(hdac, cmd, flags, &res))
+			if (count == 1)
+				return -1;
+		} else
+			break;
+	}
 	return res;
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
