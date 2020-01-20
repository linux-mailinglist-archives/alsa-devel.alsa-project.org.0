Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24634142F32
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0036167C;
	Mon, 20 Jan 2020 17:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0036167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579536291;
	bh=erV3KlGrfyx3fbtbdILFWmM4gOYP1T8Eo8mhssW4jBk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCz3R9xigjykly0TcTzRZAoxjGMjyOA6nOn58FmKPsha/bC7GRbmstH8xyaljAinI
	 epuV5GSCc0Xn7VwIhrkILDdWgBcgzfrMhLzHnJsJ/ngLP9mnQNRiONsvqPz6Y2mnjD
	 jUUvR8z8nmrfjC/Xlb78mxcUGFS9uoKY6Qz234co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64046F80276;
	Mon, 20 Jan 2020 17:01:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44889F80217; Mon, 20 Jan 2020 17:01:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94ABEF801D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 17:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94ABEF801D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 08:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="258751454"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 08:01:25 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Date: Mon, 20 Jan 2020 18:01:16 +0200
Message-Id: <20200120160117.29130-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120160117.29130-1-kai.vehmanen@linux.intel.com>
References: <20200120160117.29130-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, cujomalainey@chromium.org, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: SOF: Intel: do not disable i915
	power during probe
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

Change HDA probe behaviour slightly so that i915 power is not
turned off if i915 audio codecs are found in the initial probe done
by SOF Intel driver, and power is kept on until HDA codec driver
probe runs.

This will reduce number of mode sets on platforms with low
minimum CDCLK (like GLK) and brings the SOF probe sequence closer
to legacy HDA driver in terms of i915 audio codec power management.

BugLink: https://github.com/thesofproject/linux/issues/1642
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 54a7ba881150..65b86dd044f1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -380,7 +380,8 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	/* create codec instances */
 	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
 
-	hda_codec_i915_display_power(sdev, false);
+	if (!HDA_IDISP_CODEC(bus->codec_mask))
+		hda_codec_i915_display_power(sdev, false);
 
 	/*
 	 * we are done probing so decrement link counts
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
