Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA28243E8A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 19:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29206166B;
	Thu, 13 Aug 2020 19:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29206166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597341440;
	bh=aUZ963VaD99BibCIe5uizhQjBe1RntDDzSEI5YJiHVk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G7j59FTuOPoG5kppKmbyxK9QpmdJNNGsuqF91kVcyR5C2Y/r7rzwh7uIMV+KwlgEk
	 uik09kK01kXq709T5S9Q+xzZWG4zwwQ3Ei2LK8hxVo78PwRBx6emdiV+DmyQ+4Hoqy
	 GymUJLgrNZE4mMGyZi9DKgfUOZk+bm22YgIZzKI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D559F80161;
	Thu, 13 Aug 2020 19:55:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53805F8015B; Thu, 13 Aug 2020 19:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A341F800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A341F800D3
IronPort-SDR: f9lexFx6iPzHl7vVrfyLjP463z4W03AKXAncaNYj3Zl+L9ReAHbvr6bYQhdN/qAtGeWL4J65HW
 B+vzZwpS89Tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153519197"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="153519197"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:55:26 -0700
IronPort-SDR: NhuknCraDhLMriKc6E7PGPvo7eA+Pc9evB5RVNgszmDOdr4w6taRwGCxKTDv2CF8lb9VMGWPdo
 mNvlUBx7gHOQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="291472395"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:55:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: wm0010: use DECLARE_COMPLETION_ONSTACK() macro
Date: Thu, 13 Aug 2020 12:54:42 -0500
Message-Id: <20200813175442.59067-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Follow recommendation in Documentation/scheduler/completion.rst and
use macro to declare local 'struct completion'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm0010.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 2f2b2f5d55e4..28b4656c4e14 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -346,7 +346,7 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 	struct list_head xfer_list;
 	struct wm0010_boot_xfer *xfer;
 	int ret;
-	struct completion done;
+	DECLARE_COMPLETION_ONSTACK(done);
 	const struct firmware *fw;
 	const struct dfw_binrec *rec;
 	const struct dfw_inforec *inforec;
@@ -370,7 +370,6 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 	wm0010->boot_failed = false;
 	if (WARN_ON(!list_empty(&xfer_list)))
 		return -EINVAL;
-	init_completion(&done);
 
 	/* First record should be INFO */
 	if (rec->command != DFW_CMD_INFO) {
-- 
2.25.1

