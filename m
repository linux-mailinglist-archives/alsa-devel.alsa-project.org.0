Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA337311E5
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 18:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E70015E5;
	Fri, 31 May 2019 18:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E70015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559318612;
	bh=X+UwmYnufRsrbs+AZ9hFNBdn65NXupl/fL1wyFRvWcw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PxZo0tGl/N2mmKpRRSSyvJ9uVA9D0pLm66fss0R1pIZMO8fajktu5AZgRfR4OJxqS
	 YaScVdc9k+AdgHFQ3fddlYf4iBccSlZkXIXYN9cgJvgdw5SazkK42VCfJlj9a37T73
	 tHK3Iqkfq7RlV/7pg5Sfp8Ub86aHxXcQsQPa5mFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D33ADF896E5;
	Fri, 31 May 2019 18:01:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26B87F896E5; Fri, 31 May 2019 18:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1FD1F8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 18:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1FD1F8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 09:01:38 -0700
X-ExtLoop1: 1
Received: from hoangng2-mobl.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.254.19.252])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 09:01:37 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 May 2019 09:01:37 -0700
Message-Id: <20190531160137.5603-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2] ASoC: hda: fix unbalanced codec dev
	refcount for HDA_DEV_ASOC
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

HDA_DEV_ASOC type codec device refcounts are managed differently
from HDA_DEV_LEGACY devices. The refcount is released explicitly
in snd_hdac_ext_bus_device_remove() for ASOC type devices.
So, remove the put_device() call in snd_hda_codec_dev_free()
for such devices to make the refcount balanced. This will prevent
the NULL pointer exception when the codec driver is released
after the card is freed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/pci/hda/hda_codec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b20eb7fc83eb..fcdf2cd3783b 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -840,7 +840,14 @@ static int snd_hda_codec_dev_free(struct snd_device *device)
 	if (codec->core.type == HDA_DEV_LEGACY)
 		snd_hdac_device_unregister(&codec->core);
 	codec_display_power(codec, false);
-	put_device(hda_codec_dev(codec));
+
+	/*
+	 * In the case of ASoC HD-audio bus, the device refcount is released in
+	 * snd_hdac_ext_bus_device_remove() explicitly.
+	 */
+	if (codec->core.type == HDA_DEV_LEGACY)
+		put_device(hda_codec_dev(codec));
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
