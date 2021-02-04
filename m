Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85730FDFD
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0447F167C;
	Thu,  4 Feb 2021 21:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0447F167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612470040;
	bh=Bhay9fnIM9OoXzQ5YoY5B69chNdX6c26VnJgD31QRUg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iPz0ShDe6zo4DtY7vau5r8kVerty7LCDte9wrhphr8X6HiB4bOnleWkuMpj4dtnhO
	 oIlzlji7sSmqmaY49fRTnoEjJiOyAUa/5RquRvj9kkhcBJT+tLKa4Pxmzgacibmm+D
	 IzxDjtDQTTVNsbh0HSFQgDdXikTgZ7HEC8IkzswM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A5A2F8026B;
	Thu,  4 Feb 2021 21:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A51A8F80139; Thu,  4 Feb 2021 21:18:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA04F80171
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA04F80171
IronPort-SDR: bKS7x8Ydbs1tENXlpHQXG8UiyVRi+NMmyMugg7XOplD0i/J1NqNbM+j2eey6rzb2zRWQZv1lsr
 wHP7f8UlrULA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="177817707"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="177817707"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:56 -0800
IronPort-SDR: MvcHAM+M9X8PTH0eZUPeDLXw6weck1sehTncpTGMwvKorsKwji1PwoIPmrpn/rYqshHeWSLQEf
 cCP6XzIcVxDw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="373011132"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/4] ASoC: rt711-sdw: use cancel_work_sync() for .remove
Date: Thu,  4 Feb 2021 14:17:37 -0600
Message-Id: <20210204201739.25206-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
References: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Make sure the workqueues are not running after the .remove() callback,
which can lead to timeout errors.

A previous fix to use cancel_work_sync was applied for the suspend
case but the remove case is missing

Fixes: 501ef013390b ('ASoC: rt711: wait for the delayed work to finish when the system suspends')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 756c0ada3b31..2beb4286d997 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -463,8 +463,8 @@ static int rt711_sdw_remove(struct sdw_slave *slave)
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
 
 	if (rt711 && rt711->hw_init) {
-		cancel_delayed_work(&rt711->jack_detect_work);
-		cancel_delayed_work(&rt711->jack_btn_check_work);
+		cancel_delayed_work_sync(&rt711->jack_detect_work);
+		cancel_delayed_work_sync(&rt711->jack_btn_check_work);
 		cancel_work_sync(&rt711->calibration_work);
 	}
 
-- 
2.25.1

