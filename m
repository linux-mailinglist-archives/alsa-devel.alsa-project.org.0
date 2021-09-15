Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932240BFAC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 08:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1FC17D1;
	Wed, 15 Sep 2021 08:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1FC17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631687648;
	bh=5s9yqwFqMyZe3Z6YoxgUqOL9ieW5RxLTOr5Hh+xZX6c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XFKeXVAkXfq7IkGXS4UgJdLbGTE1bSG5oOYf34fQGMhi/tIAeKHLHmrxdUUgsavlA
	 vNe8rW7SPdRRGHL1y2HieBbnKsw6fi9CkfH9XRfO57JYPdHohpeHAuHC1iy6/SQWRs
	 s8I/n90rkAjfFmZpB5F0pBFSrQqV4wTRGPlgX4X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F9FF80132;
	Wed, 15 Sep 2021 08:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A9EF8027C; Wed, 15 Sep 2021 08:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC0CF80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 08:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC0CF80132
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219049398"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="219049398"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 23:32:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544596539"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 23:32:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: Fix DSP oops stack dump output contents
Date: Wed, 15 Sep 2021 09:32:30 +0300
Message-Id: <20210915063230.29711-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Yong Zhi <yong.zhi@intel.com>

Fix @buf arg given to hex_dump_to_buffer() and stack address used
in dump error output.

Fixes: e657c18a01c8 ('ASoC: SOF: Add xtensa support')
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/xtensa/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index bbb9a2282ed9..f6e3411b33cf 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -122,9 +122,9 @@ static void xtensa_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 	 * 0x0049fbb0: 8000f2d0 0049fc00 6f6c6c61 00632e63
 	 */
 	for (i = 0; i < stack_words; i += 4) {
-		hex_dump_to_buffer(stack + i * 4, 16, 16, 4,
+		hex_dump_to_buffer(stack + i, 16, 16, 4,
 				   buf, sizeof(buf), false);
-		dev_err(sdev->dev, "0x%08x: %s\n", stack_ptr + i, buf);
+		dev_err(sdev->dev, "0x%08x: %s\n", stack_ptr + i * 4, buf);
 	}
 }
 
-- 
2.33.0

