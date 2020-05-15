Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF731D5B52
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 23:18:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226BD1669;
	Fri, 15 May 2020 23:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226BD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589577501;
	bh=FqEqC3aXoxYfo2A7MrQOa7+R4i66/yAR/N+dtkzO8iA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIpIxsS348Sbj5L1hmw+MeIKWvyZEQvTrhTQ4UBqJmLnj71Usp9LYX0zs64i12sVV
	 48tV4nBniy23tmyxg1kDjAmZSdvfwgKoT6n8fs/vxWzdoCWohkyuPlvdnxDpkZochw
	 C6mapryQcTm6naeqxwbCaaouLnSEiBNO8o5v0CGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D8DBF80278;
	Fri, 15 May 2020 23:16:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF6E8F80278; Fri, 15 May 2020 23:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F15CF8022D
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 23:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F15CF8022D
IronPort-SDR: ln3TuxhbVowrmkXed9u4/PNzrI7UcrDyL8OZMy/BDnJ4WwJhpF2OunKIIkaSU6mHZZySMXruXB
 TfV+VY/EIMMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 14:15:49 -0700
IronPort-SDR: JuF3Jyi7bu/ssYlfQFnOzvD8RItDlH9qXDKOFmiOnuz6wHcppTO9n3zd7lxatOGwiS6m8gYfFw
 +7ejcXwQuqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="438454493"
Received: from btchambe-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.66.225])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2020 14:15:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: codecs: rt*-sdw: fix memory leak in set_sdw_stream()
Date: Fri, 15 May 2020 16:15:30 -0500
Message-Id: <20200515211531.11416-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
References: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>
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

Now that the sdw_stream is allocated in machine driver,
set_sdw_stream() is also called with a NULL argument during the
dailink shutdown.

In this case, the drivers should not allocate any memory, and just
return.

Detected with KASAN/kmemleak.

Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Shuming Fan <shumingf@realtek.com>
Cc: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 3 +++
 sound/soc/codecs/rt5682.c     | 3 +++
 sound/soc/codecs/rt700.c      | 3 +++
 sound/soc/codecs/rt711.c      | 3 +++
 sound/soc/codecs/rt715.c      | 3 +++
 5 files changed, 15 insertions(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 4b88fa8efb27..91cc5a15c211 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -482,6 +482,9 @@ static int rt1308_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 {
 	struct sdw_stream_data *stream;
 
+	if (!sdw_stream)
+		return 0;
+
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
 		return -ENOMEM;
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 5d3b11756a34..046e6110de73 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2935,6 +2935,9 @@ static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 {
 	struct sdw_stream_data *stream;
 
+	if (!sdw_stream)
+		return 0;
+
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
 		return -ENOMEM;
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index ff68f0e4f629..687ac2153666 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -860,6 +860,9 @@ static int rt700_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 {
 	struct sdw_stream_data *stream;
 
+	if (!sdw_stream)
+		return 0;
+
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
 		return -ENOMEM;
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 2daed7692a3b..65b59dbfb43c 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -906,6 +906,9 @@ static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 {
 	struct sdw_stream_data *stream;
 
+	if (!sdw_stream)
+		return 0;
+
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
 		return -ENOMEM;
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 2cbc57b16b13..099c8bd20006 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -530,6 +530,9 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 
 	struct sdw_stream_data *stream;
 
+	if (!sdw_stream)
+		return 0;
+
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
 		return -ENOMEM;
-- 
2.20.1

