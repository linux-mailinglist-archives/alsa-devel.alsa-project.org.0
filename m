Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74E243EA1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D641E1664;
	Thu, 13 Aug 2020 20:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D641E1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597341691;
	bh=hrmIbV2l314munrgAKVpOR92tGDtp0d3YyHY0GAEFoo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arn13FHJpsdH14bdsSUNNfTvrlV/CK3/zs/Ih3yoPrnCtj4yeRKTDKrpXY4+dmlct
	 hH9spTrPmUZkRXrCirH/7mVmCXdJAJnhf7R5gS+fvlW9+49+QUUB5O9RXHIWk88/5A
	 8uTEFTe+bM6QN2CGn7h7lJ2WGDPnwAeIgPQmj0pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB1CF8025E;
	Thu, 13 Aug 2020 19:59:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B70AF8014C; Thu, 13 Aug 2020 19:58:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8B99F8014C
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B99F8014C
IronPort-SDR: AIZBYh7KXwrfIhhpgmbmG74zqWpdExV29Tp3d5SF2O8NXKXQq3IpRdZKRYvLOHCRVbnZXAROsk
 tj3zoEJYKdRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239124811"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="239124811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:58:54 -0700
IronPort-SDR: qwPQd1DyF+wcT4eJPpi6YcSEiQ+DUxQ7SfSVUztlO8RRaw4AIoAUxBLZKzJ686ggz4yP55pPHF
 BxR2wGCgoJUA==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="295510739"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:58:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASOC: SOF: Intel: hda-codec: move unused label to correct
 position
Date: Thu, 13 Aug 2020 12:58:35 -0500
Message-Id: <20200813175839.59422-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
References: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Cppcheck reports the following warning:

sound/soc/sof/intel/hda-codec.c:191:1: style: Label 'error' is not
used. [unusedLabel]

This label is indeed only used conditionally, move it where it's
actually used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 2c5c451fa19d..119aa9ffcc66 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -178,6 +178,11 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	}
 
 	return ret;
+
+error:
+	snd_hdac_ext_bus_device_exit(hdev);
+	return -ENOENT;
+
 #else
 	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
 	if (!hdev)
-- 
2.25.1

