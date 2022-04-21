Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EDA50A54D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4691655;
	Thu, 21 Apr 2022 18:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4691655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558302;
	bh=Ev5XW/hFAU2G7hEDOc8XRChJVIkYPecoTCVxax3VuEI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ewyUczN7moZW40+Q8XNhaOA0rNgTC61lD56uRmL8zx1fSgpvDeEW+S7BYTXRpAkM/
	 fFml4qOhgipkBNC6WyYfuzVUfrEGCNn32X7VPgZPio5fSWhF8jrXQcXZ0V43TNIzjb
	 DehzVS0NBXS9isO053NPzEK6yj+z/VJMsZV3sYpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 961C3F8047D;
	Thu, 21 Apr 2022 18:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BEEF8032D; Thu, 21 Apr 2022 18:24:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D918F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D918F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZIvpccF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558235; x=1682094235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ev5XW/hFAU2G7hEDOc8XRChJVIkYPecoTCVxax3VuEI=;
 b=ZIvpccF0ZxmG3rU5HQ/WFFYODwyoGM7F7vKkzOwx9ztSmyML932QHUHh
 1/x2lkvGMatfVpCp+ycGb5msx2RZoCUNVYE/cfYiXs0SdB2gX3BDLmnDh
 iLuGwqgsZqFA8y5UP20pekFjvZ98LR0mQrO6hWw8lzrnqyjHaOeqqu+xS
 ScTWelj9QxKpIQLcLL0lXMBQ/+0xV7xAYMM9Ph+vfbgHm6nxuAPCRXdDZ
 oshnZzrH9fmyBfHs5Ryvu1zAxyi7xSO8u5pZzDUxHFK0pjeIf6bqatorG
 1ifBfuml/JqeiIxnEtgxn89oI8rQoa3ZgMNGOqdQTYk4Cx+657OgZpW66 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264176427"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="264176427"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:23:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="533414777"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:23:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-ops: fix error handling
Date: Thu, 21 Apr 2022 11:23:28 -0500
Message-Id: <20220421162328.302017-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

cppcheck throws the following warning:

sound/soc/soc-ops.c:461:8: style: Variable 'ret' is assigned a value
that is never used. [unreadVariable]
   ret = err;
       ^

This seems to be a missing change in the return value.

Fixes: 7f3d90a351968 ("ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_sx()")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a0ca58ba16273..58347eadd219b 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -461,7 +461,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 			ret = err;
 		}
 	}
-	return err;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 
-- 
2.30.2

