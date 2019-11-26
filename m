Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A110A0D0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8541760;
	Tue, 26 Nov 2019 15:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8541760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574780173;
	bh=zw68IACqF++3g2YDfL+hO0slmeJ8T/zMf+Ak5vRzA8w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgfSlGzL07aodDlGnS+aFxrk5PgbVZ5KVu3UefUYwLNFljpo+1ooVlNZOopQITd0S
	 7+utY3oGMCbgplczNZUB/w39xDYImq8iWiPVOEOl7Z0sbEL9n7drEt+MU9eoEQ3IEL
	 wDKT104X6Hv+pW6XTLR43X1BI7lHO/oG0qRyg5kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A0EF8020B;
	Tue, 26 Nov 2019 15:53:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 840F9F801F7; Tue, 26 Nov 2019 15:53:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ED0BF800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ED0BF800DD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:53:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="239951779"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 06:53:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:53:02 -0600
Message-Id: <20191126145304.24204-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126145304.24204-1-pierre-louis.bossart@linux.intel.com>
References: <20191126145304.24204-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/3] ASoC: SOF: Intel: make common HDMI driver
	default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Use the common HDMI driver by default if the codec driver is
selected in kernel build.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index cc09bb606f7d..56a837d2cb95 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -319,6 +319,7 @@ config SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
 	bool "SOF common HDA HDMI codec driver"
 	depends on SND_SOC_SOF_HDA_LINK
 	depends on SND_HDA_CODEC_HDMI
+	default SND_HDA_CODEC_HDMI
 	help
 	  This adds support for HDMI audio by using the common HDA
 	  HDMI/DisplayPort codec driver.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
