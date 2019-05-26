Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC12ADD7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 07:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC621774;
	Mon, 27 May 2019 07:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC621774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558933268;
	bh=BOYfIFkxO7Ml1Rw0cho/NSnzT1raBsVqcn+uLP1epRQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1Oa40dAEP/9FSUfDo+6UXmsn56JsakDeghhTjHTq0bvMLn8Rg6SYr2uv8Bb/XhlZ
	 vHDUszvroktQs37wgo8Jwz4rf8sKXWBMFtF1kXB8hbmF+sGySNieQD17LhkRblhyiO
	 cWB1uglR4f/pphJbGwxCtZ0wnHCBLBX1zFKoUv3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1EF7F89733;
	Mon, 27 May 2019 06:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D52BAF80730; Mon, 27 May 2019 06:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792FCF80730
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 06:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792FCF80730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 21:57:30 -0700
X-ExtLoop1: 1
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 21:57:29 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 27 May 2019 00:58:35 +0800
Message-Id: <20190526165836.10867-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
References: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, libin.yang@intel.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
Subject: [alsa-devel] [PATCH 4/5] ALSA: hda: add polling mode in
	snd_hdac_bus_get_response
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

Polling mode is useful if a machine somehow missed an expected IRQ.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/hdac_controller.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index b2e9454f5816..a16ac31bda83 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -239,6 +239,8 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	for (loopcounter = 0;; loopcounter++) {
+		if (bus->polling_mode)
+			snd_hdac_bus_update_rirb(bus);
 		spin_lock_irq(&bus->reg_lock);
 		if (!bus->rirb.cmds[addr]) {
 			if (res)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
