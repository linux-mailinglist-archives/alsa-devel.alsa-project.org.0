Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54C13DD0F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 15:10:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C03A17CD;
	Thu, 16 Jan 2020 15:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C03A17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579183834;
	bh=3nmN9jXNH9tuOKgtGwqO+TgWJyFao9/p3WMYjeVlNlQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLelJ4wdgPA3zHkFSk/1X44R5ZFr6CthaedrC/P9BgV93Y8+yAK8LyOafBYUk2hjx
	 l14d6L092Ge/tKflE6Qgorbj4Oewla/5BGaPe9qsSZw2ltwFzRn0jy2v7VukEUxE+J
	 umJSI4uMZvSkKUSh49WQqVPAMoY04IL/beEHNblQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C1A8F8028B;
	Thu, 16 Jan 2020 15:06:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E526EF80278; Thu, 16 Jan 2020 15:06:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C63F80171
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 15:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C63F80171
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 06:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="373319983"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 16 Jan 2020 06:06:22 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 16 Jan 2020 16:06:10 +0200
Message-Id: <20200116140610.7247-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116140610.7247-1-kai.vehmanen@linux.intel.com>
References: <20200116140610.7247-1-kai.vehmanen@linux.intel.com>
Cc: cujomalainey@chromium.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 3/3] ALSA: hda/hdmi - add retry logic to
	parse_intel_hdmi()
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

The initial snd_hda_get_sub_node() can fail on certain
devices (e.g. some Chromebook models using Intel GLK).
The failure rate is very low, but as this is is part of
the probe process, end-user impact is high.

In observed cases, related hardware status registers have
expected values, but the node query still fails. Retrying
the node query does seem to help, so fix the problem by
adding retry logic to the query. This does not impact
non-Intel platforms.

BugLink: https://github.com/thesofproject/linux/issues/1642
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index ce3c212ee467..48bddc218829 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2833,9 +2833,12 @@ static int alloc_intel_hdmi(struct hda_codec *codec)
 /* parse and post-process for Intel codecs */
 static int parse_intel_hdmi(struct hda_codec *codec)
 {
-	int err;
+	int err, retries = 3;
+
+	do {
+		err = hdmi_parse_codec(codec);
+	} while (err < 0 && retries--);
 
-	err = hdmi_parse_codec(codec);
 	if (err < 0) {
 		generic_spec_free(codec);
 		return err;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
