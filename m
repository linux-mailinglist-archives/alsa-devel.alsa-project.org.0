Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7842589
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 14:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FAE81740;
	Wed, 12 Jun 2019 14:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FAE81740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560342282;
	bh=T24mqF1w+CoFdqWiBDgQBwnQEIDGeDLT3tjix4I18U4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcHVk1rv9LyzmVPrcCHYDZmIsz+Dp1uvOBLwTgZBpGTu3KOny7XJytOV8tBUf4fI6
	 bGqqd511spyL/4C6OQ4vS5HtQEbVC/rLGjRnFS2DWYG42WU9LtScvsH6Cw0HYtCIoD
	 mSeui6DE2iVNGtQRcyxqw2krbE5thauxqUe2EZyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2113FF8972F;
	Wed, 12 Jun 2019 14:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACA0FF896E3; Wed, 12 Jun 2019 14:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A697DF80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 14:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A697DF80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 05:22:10 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2019 05:22:09 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 15:22:56 +0300
Message-Id: <20190612122258.4363-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612122258.4363-1-kai.vehmanen@linux.intel.com>
References: <20190612122258.4363-1-kai.vehmanen@linux.intel.com>
Cc: kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: hdac_hdmi: report codec link up/down
	status to bus
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

Report codec power status to the HDA codec bus from runtime pm
suspend and resume callbacks. This is required to implement
runtime idle logic that relies on 'codec_powered' field of hdac_bus
to be maintained for all codecs.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 660e0587f3999..01ab7aed315cb 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -2090,6 +2090,7 @@ static int hdac_hdmi_runtime_suspend(struct device *dev)
 		return -EIO;
 	}
 
+	snd_hdac_codec_link_down(hdev);
 	snd_hdac_ext_bus_link_put(bus, hlink);
 
 	snd_hdac_display_power(bus, hdev->addr, false);
@@ -2116,6 +2117,7 @@ static int hdac_hdmi_runtime_resume(struct device *dev)
 	}
 
 	snd_hdac_ext_bus_link_get(bus, hlink);
+	snd_hdac_codec_link_up(hdev);
 
 	snd_hdac_display_power(bus, hdev->addr, true);
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
