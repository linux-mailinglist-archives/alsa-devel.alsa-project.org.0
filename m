Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BEB2F8E8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 10:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4C11615;
	Thu, 30 May 2019 10:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4C11615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559206782;
	bh=4yB+HSwfq6zt2Xgwo6A42qmsefmySpd7X+Sp5QGq2nw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bw4ynOmpOBermEVOlfCF+vSoCb29bHqe+1ECr5NdN1AJUTp4Z1CNie7Kwb1YlSsCC
	 6wjBSlcpKDPmbzoPsQPZzHS3PreHjukwDYFGHbwEFtzbMCCr0k/D9g7g+69vFEThD/
	 KNtTiiW1qksfgtFbsYq5r1xv1gmtVzXJKTz99mOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A398F896F8;
	Thu, 30 May 2019 10:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D52F896F8; Thu, 30 May 2019 10:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 972E6F8065A
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 10:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 972E6F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 01:57:48 -0700
X-ExtLoop1: 1
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008.jf.intel.com with ESMTP; 30 May 2019 01:57:47 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Thu, 30 May 2019 04:59:00 +0800
Message-Id: <20190529205900.26060-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH] ALSA: hda: fix: lock reg_lock before calling
	snd_hdac_bus_update_rirb
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The patch is to fix commit 5e13cf6cd64c
(ALSA: hda: add polling mode in snd_hdac_bus_get_response)
spin_lock_irq should be called before snd_hdac_bus_update_rirb.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
Takashi,

Sorry, I make a mistake on the "ALSA: hda: add polling mode in
snd_hdac_bus_get_response" patch. This patch is a fix for that.

Thanks,
Bard
---
 sound/hda/hdac_controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index a16ac31bda83..d6a91429c058 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -239,9 +239,9 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	for (loopcounter = 0;; loopcounter++) {
+		spin_lock_irq(&bus->reg_lock);
 		if (bus->polling_mode)
 			snd_hdac_bus_update_rirb(bus);
-		spin_lock_irq(&bus->reg_lock);
 		if (!bus->rirb.cmds[addr]) {
 			if (res)
 				*res = bus->rirb.res[addr]; /* the last value */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
