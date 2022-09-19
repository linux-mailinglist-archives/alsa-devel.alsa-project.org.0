Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA25BCB03
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:47:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F3E163D;
	Mon, 19 Sep 2022 13:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F3E163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663588028;
	bh=V3Cg9zGHFx8kINhzhvnGxw9Yqn/mPvyq98JJKi7j4do=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XnZNLAS3a/sz0+XPmEiXOZLyxcR/wNFVtC+6IBY/u4IIoFLWJBENIprhaOm/O8jHs
	 VDwpV7XNQuvziYgEzbbyHcbZYM9LB91hOt6XpYKSZAB+Ux7/4T9iYHmKVw1BKBaR4i
	 jmmLqcQwtS1d0vlBlqpAY+bCEx1O3WsDdQeSZQR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9043F8032B;
	Mon, 19 Sep 2022 13:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEFD1F8023A; Mon, 19 Sep 2022 13:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA444F8016D
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA444F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QZ6fCCKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663587967; x=1695123967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V3Cg9zGHFx8kINhzhvnGxw9Yqn/mPvyq98JJKi7j4do=;
 b=QZ6fCCKjPTKK5SQwnflsCxVJ6Okz4DKXNcen42pUxZ/eCrQ7K1KO0oNg
 a6YyEcQr0xzU6l7WstBkrJbQaiBtVrZGP7XJnjxnONtKTy8CLpThY76qh
 icqbHeQk0H+o8Hneop0yCs1Pg/3wgjm9Ebt3aUu9Q+qcgHnk0T2Rc7j5d
 LH+nhS+BRhRYn9jvk9UDk7ypIL58cfQOGXNUwWOniYq+am9PmFvzKS1z5
 M54/fLEWUKkz43h8z5BES0K9qIxyP6z4j6HFdMdXkcArfMIo0Hy8QGIZY
 lOLXcHGlQY18AJzxhm2hEFZXhWjS/WZQCQcy38ensl7Y4pSsUnFKtrYT7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="279760067"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="279760067"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:46:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="651651022"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:46:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: intel-dspconfig: add ES8336 support for AlderLake-PS
Date: Mon, 19 Sep 2022 13:45:48 +0200
Message-Id: <20220919114548.42769-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Muralidhar Reddy <muralidhar.reddy@intel.com>

added quirks for ESS8336 for AlderLake-PS

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Muralidhar Reddy <muralidhar.reddy@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index d84ffdf47210e..1997ffc16663a 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -427,6 +427,11 @@ static const struct config_entry config_table[] = {
 		.device = 0x51cd,
 	},
 	/* Alderlake-PS */
+	{
+		.flags = FLAG_SOF,
+		.device = 0x51c9,
+		.codec_hid =  &essx_83x6,
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51c9,
-- 
2.34.1

