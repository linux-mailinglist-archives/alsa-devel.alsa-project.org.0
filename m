Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8C595982
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209A11676;
	Tue, 16 Aug 2022 13:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209A11676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660648214;
	bh=aEDCzx9MLrKU8fuOM9E3qwn8DN9miUx+B2bRPqDnZKg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlXoVFi0N1qWOpvCim+ZExmtgKjLBqwy+IYSLL2MkXnC0kwQ52z+EEiBYHoXZF4F5
	 M4J+GaPVW5pT2huTca9RAff/MCW3LI3cJlWMxdnV5vvkTYMShQ2ljLzJB5fNlbHG5U
	 RdAOs7djewTXNNqT9qUQQsJpKbuU7A3x5SLvoVdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA87F8056F;
	Tue, 16 Aug 2022 13:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B836F80564; Tue, 16 Aug 2022 13:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87FC2F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87FC2F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l1U0bpT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660648062; x=1692184062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEDCzx9MLrKU8fuOM9E3qwn8DN9miUx+B2bRPqDnZKg=;
 b=l1U0bpT1HTUverF99h+1jgb3/4Wmp2oCjaIzlLWe3ytLSSkMz+lvggqV
 0i8+i9QSKkPBz7g2+H1azGdLHyZArpO2+DE4iypskpjgg6+h6kQoFfY7P
 Esu8jUE5p1zWf3JK/qPzYDF7iHmBMbZBeQ7GootFPd2y3TxFuFJj48nFt
 ttv2xR58148wkFSbhv3lMXYUF8hOlsKbE4enVv+m5NVp9uBzWcNkuqr6c
 QJCJT0bVgBQCcmt8m66padB7M/vJ2UQdrmDr/wu6FyODdCxD5FHV1xDhP
 UNyc2LXdXuRRsifEljmllWeaSIJrlIDpdbK5E3Bk0aTHLyZJxOvGidmL3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271960465"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="271960465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 04:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="782986182"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2022 04:07:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [RESEND PATCH v2 4/6] ALSA: hda: Always free codec on the device
 release
Date: Tue, 16 Aug 2022 13:17:25 +0200
Message-Id: <20220816111727.3218543-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816111727.3218543-1-cezary.rojewski@intel.com>
References: <20220816111727.3218543-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

With all HDAudio drivers aligned to make use of the same constructor,
have codec freed on the device release regardless of its type.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 384426d7e9dd..aa7a362be290 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -883,13 +883,7 @@ static void snd_hda_codec_dev_release(struct device *dev)
 	snd_hda_sysfs_clear(codec);
 	kfree(codec->modelname);
 	kfree(codec->wcaps);
-
-	/*
-	 * In the case of ASoC HD-audio, hda_codec is device managed.
-	 * It will be freed when the ASoC device is removed.
-	 */
-	if (codec->core.type == HDA_DEV_LEGACY)
-		kfree(codec);
+	kfree(codec);
 }
 
 #define DEV_NAME_LEN 31
-- 
2.25.1

