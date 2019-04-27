Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C0B5B9
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 10:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C352857;
	Sun, 28 Apr 2019 10:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C352857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556441718;
	bh=crPHcoeYIfCHQvEcvqqUhcqBhmnxTErwgSHtgD/dWrA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CyjhsmtnMwGs5oEatP0KhK/Rqz2xLwdoHwgZEBaJTlwZLvtwBCIoD+7/FadMCHiI5
	 hLazE7uLDAg85rArEhuNsaa4QmsRaCh38FaZOQluAHJJXLiJ8G/lNhX3w9ROpZHW7s
	 f5qOKsnoGEfs5RvrmsbhT0VhI2xSniOZmLKf773A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 898BCF89722;
	Sun, 28 Apr 2019 10:52:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A015F896F9; Sun, 28 Apr 2019 10:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9CF2F8962C
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 10:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9CF2F8962C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,405,1549958400"; d="scan'208";a="165756783"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2019 01:52:39 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Sun, 28 Apr 2019 04:53:40 +0800
Message-Id: <20190427205340.8830-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190427205340.8830-1-yung-chuan.liao@linux.intel.com>
References: <20190427205340.8830-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: hdac_hda: overwrite hdev type to
	HDA_DEV_ASOC
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

In ASoC driver, snd_hdac_device_register() will be called by
snd_hdac_ext_bus_device_init() and snd_hdac_device_unregister()
will called by snd_hdac_ext_bus_device_remove(). However when
ASoC codec driver call snd_hda_codec_device_new() to create a
new hda codec, it will assign snd_hda_codec_dev_free() to the
dev_free ops and snd_hda_codec_dev_free() will call
snd_hdac_device_unregister(). As a result, snd_hdac_device_unregister()
will be called twice in ASoC driver. To prevent it, we use hdev
type to determine if the hda codec is registered by legacy HDA
driver or ASoC driver and unregister device in  snd_hda_codec_dev_free()
only if it is a legacy HDA device.
This patch will overwrite the hdev type so that we can know it is
a ASoC device.

Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index f889d94c8e3c..7d4940256914 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -328,6 +328,12 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		dev_err(&hdev->dev, "failed to create hda codec %d\n", ret);
 		goto error_no_pm;
 	}
+	/*
+	 * Overwrite type to HDA_DEV_ASOC since it is a ASoC driver
+	 * hda_codec.c will check this flag to determine if unregister
+	 * device is needed.
+	 */
+	hdev->type = HDA_DEV_ASOC;
 
 	/*
 	 * snd_hda_codec_device_new decrements the usage count so call get pm
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
