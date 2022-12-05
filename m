Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06B6424CE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40AC1717;
	Mon,  5 Dec 2022 09:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40AC1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229526;
	bh=gXfSGnPfL+Q635d2cehZtogy9MtbXl2+EV/nOLXsI2g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFP+W7XJVztecF03Zh/UCnDp8osxWXndOm7VbVzXJWk2fL4EiX/N3csjLUHHYF1pR
	 ixbYYXpWXfjhdegfhrbYmjiZbeV+36OyXb791xhi6l7W4VezozFqkYCbVB3K21aF4Y
	 9I228dWmqcEVcF0S2pr4ofofUKPpXaMogqHy5Fng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DEAF80579;
	Mon,  5 Dec 2022 09:36:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B651F8054A; Mon,  5 Dec 2022 09:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC3A3F8054A
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC3A3F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VE7aVVT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229401; x=1701765401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXfSGnPfL+Q635d2cehZtogy9MtbXl2+EV/nOLXsI2g=;
 b=VE7aVVT7Iry7oHaJOTtv5ZZtfqRt7HDphggev3pU3ojdgYLqSdkoAnNU
 sdUbQDuHOCyZhrbRRCJ7BtO/Dw+AIUgl8xbIWQ8DznzK3dH/nxgR/FJlQ
 VFXydWi+6X63JUs5uvwqNlUUEpCSjB7vD4xO0RA9A7reS6lkGe5dkWZLD
 IRInLcMcoOBXq6Ou/HAcaUaJpo5P3YIn2fl2fCcCrm3x/6TkJvsJgqeBO
 GJKStIss3KDi1ui0uzaXFZWdFu2cM732qmr/PaMkM/GNsq3YinMXK91J7
 liL1xjaRJFc1N9Huendgfny8b7zj57lZcjlD+LWML4Ie7ju418H/2XUP2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288365"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288365"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866237"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866237"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:36 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 5/6] ASoC: Intel: Skylake: Fix driver hang during shutdown
Date: Mon,  5 Dec 2022 09:53:29 +0100
Message-Id: <20221205085330.857665-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205085330.857665-1-cezary.rojewski@intel.com>
References: <20221205085330.857665-1-cezary.rojewski@intel.com>
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

