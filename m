Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6772211277
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C2816BB;
	Wed,  1 Jul 2020 20:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C2816BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627547;
	bh=6BurVOUe2Fd0ifH+7W6hdY21FGr/IdufuWDu2gsaljc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LONQAGD9pblE6UN0dTFBXWdInaVZcji82MS4xqRoyOdYTZTunTa3FkggV2JbxC9n6
	 JjNgqQPrxFqWU8iC01kHVWQSSFjTUTQOJM8qRgAztWtdlmgyVkV9U8Q9J+Wg+ZLno9
	 mBpoYjlnhLPZYbnWsRwB9pqtKnVzI3E2NGzBBnSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D29C9F802E9;
	Wed,  1 Jul 2020 20:14:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA89AF802A8; Wed,  1 Jul 2020 20:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD265F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD265F80217
IronPort-SDR: 9VCD43XQfYj6dRztIBFBlkEGF7OW+lPDw1AtvJ2tARjc1lzFkXCLMjaJpcn20Z7PQU6dSt1wYx
 CqwKLExng7zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753284"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:57 -0700
IronPort-SDR: PDq2TanOI5rAjEuvT1VNIyvrNkyGEJpP5f8vd4XdKI9+xwu2zovkY3AI2zsSm+Cr+4LYly3y8V
 hrr3pDkRLk4w==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686403"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: codecs: wm8994: fix kernel-doc
Date: Wed,  1 Jul 2020 13:13:19 -0500
Message-Id: <20200701181320.80848-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

Fix W=1 warning

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8994.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 5e1ce243feb1..75242ec47406 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3877,6 +3877,10 @@ static void wm1811_jackdet_bootstrap(struct work_struct *work)
  *
  * @component:   WM8958 component
  * @jack:    jack to report detection events on
+ * @det_cb: detection callback
+ * @det_cb_data: data for detection callback
+ * @id_cb: mic id callback
+ * @id_cb_data: data for mic id callback
  *
  * Enable microphone detection functionality for the WM8958.  By
  * default simple detection which supports the detection of up to 6
-- 
2.25.1

