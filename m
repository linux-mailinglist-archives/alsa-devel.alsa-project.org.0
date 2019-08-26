Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A09CD9F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 12:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F2A167D;
	Mon, 26 Aug 2019 12:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F2A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566816693;
	bh=aALr3k2ETKxHn1n0YD/pKcUphANgUkr8/aLv3V9szik=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tekaoAD7CV2FYHBQ6n/SLvt7ukkMYZDkT6LWmC6h2OgTzU48Vh8fx8qalCrnjvhae
	 QVQtO1MPYuj0itP2WHmVNi3u5FVRGbPWRcU+F4v6RrngQBcZI2zB5t15MNYVRWPVYK
	 O3zym2vvptpVRlgucU38heeFg9kXWDWcj0KGvWQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9795EF80377;
	Mon, 26 Aug 2019 12:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 929B6F80362; Mon, 26 Aug 2019 12:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 742A1F801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 12:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 742A1F801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; d="scan'208";a="187561603"
Received: from mpietra-desktop.igk.intel.com ([10.102.9.77])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 03:49:37 -0700
From: Marcin Pietraszko <marcin.pietraszko@linux.intel.com>
To: perex@perex.cz
Date: Mon, 26 Aug 2019 13:51:41 +0200
Message-Id: <1566820301-18671-1-git-send-email-marcin.pietraszko@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org,
 Marcin Pietraszko <marcin.pietraszko@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/1] ASoC: topology: Fix variable overflow in
	split_format
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

The 1 which was 32-bit long, when left-shifted by more than 31 caused
an overflow, which resulted in some of the formats being not supported.

Signed-off-by: Marcin Pietraszko <marcin.pietraszko@linux.intel.com>
---
 src/topology/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index 5f586dc..00a35b9 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -321,7 +321,7 @@ static int split_format(struct snd_soc_tplg_stream_caps *caps, char *str)
 			return -EINVAL;
 		}
 
-		caps->formats |= 1 << format;
+		caps->formats |= 1ull << format;
 		s = strtok(NULL, ", ");
 		i++;
 	}
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
