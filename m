Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF751640A91
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:25:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56300186B;
	Fri,  2 Dec 2022 17:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56300186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998323;
	bh=gXfSGnPfL+Q635d2cehZtogy9MtbXl2+EV/nOLXsI2g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5Du1vR/B+HPgNfUDoXo9lxTvvxBAZtNuLxBzyVG2iP8CU3iWZ811fa3z3BxM1zGC
	 DlUVC1pXtacg9gaNuLFBpGy60WoLHypJxNJ/tHTIRUN6pFV9cmu3VffasZEOFDfFKu
	 viidhNgRfQ6jzEgFA2vFEvoi8rINooWuUv8f1rIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A2C6F80579;
	Fri,  2 Dec 2022 17:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C75F80578; Fri,  2 Dec 2022 17:23:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 285EDF8055A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 285EDF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z0XBC4zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669998180; x=1701534180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXfSGnPfL+Q635d2cehZtogy9MtbXl2+EV/nOLXsI2g=;
 b=Z0XBC4zkS8OOQmXM7RT/57YJlw0/brNdBbDIVU9wwGo3Ki0CgsSFT+5q
 8jMxWMM/1uaY9JS8xT+U0m5iQ/ueZbWvKYhxUgS+ScRferG+B2oZS9zSj
 NdPocBr2Z5pRWH5n48LMrAbVqarI90Y7UKEVzU2W3SREdBEHdrCKRhzsf
 nrod6ORc/UqIyBe0G55MVakw/r2FZm+px4cOj60osYASN9UDC/q0JlM2v
 +IWV/S6jenkyMykAuPMl4jSV28sFsCOC02A3GBxmQCS2hPoC9goxYuquz
 a8l0MyLFU8JI4XXIzguRAp5hJoFo9HQByh47EicOX19gVU1CZrZmMllQs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314689536"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="314689536"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733858998"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="733858998"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2022 08:22:53 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/5] ASoC: Intel: Skylake: Fix driver hang during shutdown
Date: Fri,  2 Dec 2022 17:39:45 +0100
Message-Id: <20221202163945.674746-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202163945.674746-1-cezary.rojewski@intel.com>
References: <20221202163945.674746-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

AudioDSP cores and HDAudio links need to be turned off on shutdown to
ensure no communication or data transfer occurs during the procedure.

Fixes: c5a76a246989 ("ASoC: Intel: Skylake: Add shutdown callback")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 9bd9f9866898..998bd0232cf1 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -1107,7 +1107,10 @@ static void skl_shutdown(struct pci_dev *pci)
 	if (!skl->init_done)
 		return;
 
-	snd_hdac_stop_streams_and_chip(bus);
+	snd_hdac_stop_streams(bus);
+	snd_hdac_ext_bus_link_power_down_all(bus);
+	skl_dsp_sleep(skl->dsp);
+
 	list_for_each_entry(s, &bus->stream_list, list) {
 		stream = stream_to_hdac_ext_stream(s);
 		snd_hdac_ext_stream_decouple(bus, stream, false);
-- 
2.25.1

