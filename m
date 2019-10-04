Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F2CBD79
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 16:38:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD671677;
	Fri,  4 Oct 2019 16:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD671677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570199895;
	bh=cHFpupLRkZyqcI3c+QANRch0S3qgWTtfBMjGHGB0POI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGSVVXMhqMpAs+1KgS9V5m0BaV9uBlU58DbAM0iheXxNW0gAGQzXOlNLh0TWNpIOF
	 kZxjPgi/2TiLZRMTk1Rp85lORDUJm7a1bYHUALTbKwqaVz22FWv+9pm3vAxOK760lc
	 OkFBdsc6KHygNI+z/v0uW5gMAETf07GGR25SI6Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD4A0F805F9;
	Fri,  4 Oct 2019 16:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D62D5F80137; Fri,  4 Oct 2019 16:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68CC1F80137
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 16:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68CC1F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 07:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="222171164"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2019 07:35:39 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kai.vehmanen@linux.intel.com
Date: Fri,  4 Oct 2019 17:35:27 +0300
Message-Id: <20191004143527.5575-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004143527.5575-1-kai.vehmanen@linux.intel.com>
References: <20191004143527.5575-1-kai.vehmanen@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 1/1] ALSA: hda: add fallback to polling to
	hdac_bus_get_response()
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

The AZX controller implementation in azx_rirb_get_response()
implements logic to fallback to polling in case interrupt is
not received from HDA codec.

Port over this same logic to the generic snd_hdac_bus_get_response()
function, which is used by other HDAC clients such as SOF.

Without this fix, failures are observed in module reload
stress tests with the SOF driver, while test passes on same
hardware with the snd_hda_intel driver. Considering
the AZX implementation has been much more widely used and
there can be exceptions with other systems (and codecs), it
is best to align the implementation and use the time-proven
logic in all drivers.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_controller.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index d3999e7b0705..994c1dd2eb2e 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -238,14 +238,18 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 {
 	unsigned long timeout;
 	unsigned long loopcounter;
+	int do_poll = 0;
 
+ again:
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	for (loopcounter = 0;; loopcounter++) {
 		spin_lock_irq(&bus->reg_lock);
-		if (bus->polling_mode)
+		if (bus->polling_mode || do_poll)
 			snd_hdac_bus_update_rirb(bus);
 		if (!bus->rirb.cmds[addr]) {
+			if (!do_poll)
+				bus->poll_count = 0;
 			if (res)
 				*res = bus->rirb.res[addr]; /* the last value */
 			spin_unlock_irq(&bus->reg_lock);
@@ -262,6 +266,23 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 		}
 	}
 
+	if (!bus->polling_mode && bus->poll_count < 2) {
+		dev_dbg(bus->dev,
+			"response timeout, polling the codec once: last cmd=0x%08x\n",
+			bus->last_cmd[addr]);
+		do_poll = 1;
+		bus->poll_count++;
+		goto again;
+	}
+
+	if (!bus->polling_mode) {
+		dev_warn(bus->dev,
+			 "response timeout, switching to polling mode: last cmd=0x%08x\n",
+			 bus->last_cmd[addr]);
+		bus->polling_mode = 1;
+		goto again;
+	}
+
 	return -EIO;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_get_response);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
