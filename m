Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FE36286F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 21:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55FBD16F9;
	Fri, 16 Apr 2021 21:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55FBD16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618600468;
	bh=BferpQ9UMwpQFtt+i/6rWxC6CQAOTUclyRTo1GEyucQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Phw3NYYUVuYnAji9YQTG7abcGeL/jFdeBBKlWxiaBEig3CjHlRxvhmsJ2rL60mS4I
	 OCWcKryZ2H4pJv7CnsSoQXQUCQyV+udevPJPAYjmAo/Ic8ZXyw3LAH2wRIJheiE8ZK
	 JBPq3beL3g97BrGbs0TDFW3BTDiGkBI6uTBxzlDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D57F80425;
	Fri, 16 Apr 2021 21:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82442F80423; Fri, 16 Apr 2021 21:12:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2802F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 21:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2802F800FF
IronPort-SDR: Yr6A3Y1lrVIwPpMrcnddsPAlL1WbVLz5HjPyfTBGSfmE56EuaqSMtOGBa/6Frjdu6KH/T49lew
 UiDfb7X+GBlQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="256407097"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="256407097"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:11:57 -0700
IronPort-SDR: Tf7NL7cds7n4IRTpoGG/tjpfyVxqHTcGxjZNp2gace3ciQNTmzAKzqOTAKAbjnJ3gD9C1I/YEK
 MPUet0Odv0PA==
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="612838744"
Received: from paulsoum-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.66.118])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:11:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: soc-core: fix signed/unsigned issue
Date: Fri, 16 Apr 2021 14:11:41 -0500
Message-Id: <20210416191144.27006-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
References: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, broonie@kernel.org,
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

cppcheck warning:

sound/soc/soc-core.c:2237:13: warning: %x in format string (no. 1)
requires 'unsigned int *' but the argument type is 'signed
int *'. [invalidScanfArgType_int]
 } else if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
            ^
sound/soc/soc-core.c:2237:13: warning: %x in format string (no. 2)
requires 'unsigned int *' but the argument type is 'signed
int *'. [invalidScanfArgType_int]
 } else if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 236e075b9e57..aee91bde9fb8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2215,7 +2215,7 @@ static char *fmt_single_name(struct device *dev, int *id)
 {
 	const char *devname = dev_name(dev);
 	char *found, *name;
-	int id1, id2;
+	unsigned int id1, id2;
 
 	if (devname == NULL)
 		return NULL;
-- 
2.25.1

