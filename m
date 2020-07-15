Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A680C2213B9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 19:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64B41674;
	Wed, 15 Jul 2020 19:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64B41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594835355;
	bh=bkIXVnrSKX9zM0XSuSvvpbS4e4/UqBf2koceWeo1OlM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETZW54+OnK7jzwrwifq+lRRqd63/YJ/oICoBzwtVG0akCawxpRaJ8b9CjCuiNp0UQ
	 46Ngtdvxtyfuy8srsI4/dNA1QhWAsKDV+1MCUW25ooA6MJgHgdSDacODs7zt5ybvIm
	 soyJi/g7UaAyb/s6hQwlDJwHJUaphZAUw7lQBmDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE9AF80229;
	Wed, 15 Jul 2020 19:46:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D70F8021D; Wed, 15 Jul 2020 19:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B16F80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 19:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B16F80229
IronPort-SDR: jpsDmlmXVHefyZxDbYD2mZDQh/0Z9OC34Jexo5qHcgiXdRWOHu3JiZSKibAUw+lAw4BAs8WJHS
 jNiEW0FkSyTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="146739502"
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="146739502"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 10:46:33 -0700
IronPort-SDR: z1gIsUd+zDV2I9C4EiSdeFPIXYonbwsmXQSuADoA/w3zbmUzoKggN8hiDWYnPw1tU5mqHYGByc
 xnAjkZzJ/YGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="326259073"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 15 Jul 2020 10:46:31 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 2/2] ALSA: hda: fix snd_hda_codec_cleanup() documentation
Date: Wed, 15 Jul 2020 20:45:51 +0300
Message-Id: <20200715174551.3730165-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
References: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Fix a copy and paste error in snd_hda_codec_cleanup()
documentation.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b4331355602c..3576e2d8452f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3179,7 +3179,7 @@ int snd_hda_codec_prepare(struct hda_codec *codec,
 EXPORT_SYMBOL_GPL(snd_hda_codec_prepare);
 
 /**
- * snd_hda_codec_cleanup - Prepare a stream
+ * snd_hda_codec_cleanup - Clean up stream resources
  * @codec: the HDA codec
  * @hinfo: PCM information
  * @substream: PCM substream
-- 
2.27.0

