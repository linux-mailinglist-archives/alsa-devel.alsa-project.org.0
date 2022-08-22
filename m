Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86459C6D9
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFDFF1673;
	Mon, 22 Aug 2022 20:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFDFF1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193889;
	bh=LXeq1g0rOoidK7Ljzxcs+75UbaovvOPztMME8H2Yn5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEBANPUvztBXFdi93cxj8ICEWVxkFg16FdS76j7jIIwtbeui5CUA+2iZ1ITwn4HTl
	 Y6zdkaGWSl4ZGFJobOdPK7/CXJChYuy5Oa5Rsy7HzVm554atBUr6hHeyQWudPN5jSn
	 6XMf4QLFNynFJa04rri5LmkaUis/kVpYh3Z+CHM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BF1EF80533;
	Mon, 22 Aug 2022 20:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FC8DF80535; Mon, 22 Aug 2022 20:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C8AF80517
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C8AF80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iFWPYfrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661193791; x=1692729791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LXeq1g0rOoidK7Ljzxcs+75UbaovvOPztMME8H2Yn5I=;
 b=iFWPYfrFMsQvmAK1H1CyB5UU2vEQtOPzusV9fgalB+1SpUcI4uKU+k2Z
 rfbQBXR+h4YHmkllJbhjFch0FG5nNobYm4avMX2u2o+A/5rd4EunoAMa3
 DIr7z6jghAYxxJhM3Qmy4ypeIwdtXXGTjAF3c5UTJWjp9+uvbIOD7+r1L
 WwT4ZeAeQyuyI5yzl7P4WoL7TH4cR/E+OagaAADHbavtsr1N/u3z5OPXZ
 I33p0aM+dH2FX095rPdt8Jmy61OTyBx0ZjrUEyRk2wsRE6SHnEzfAlwJ7
 ArY3pSRbpHrw7p/s52EmYLb9+JHklBc1B0WqVS/VAlOc+mJynsAWmO9qT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293488963"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="293488963"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669671087"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: wcd-mbhc-v2: remove always-true condition
Date: Mon, 22 Aug 2022 20:42:36 +0200
Message-Id: <20220822184239.169757-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Chao Song <chao.song@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

sound/soc/codecs/wcd-mbhc-v2.c:1192:26: style: Condition
'cross_conn<0' is always true [knownConditionTrueFalse]
   } else if (cross_conn < 0) /* Error */
                         ^
sound/soc/codecs/wcd-mbhc-v2.c:1188:15: note: Assuming that condition
'!cross_conn' is not redundant
   } else if (!cross_conn) { /* no cross connection */
              ^
sound/soc/codecs/wcd-mbhc-v2.c:1192:26: note: Condition 'cross_conn<0'
is always true
   } else if (cross_conn < 0) /* Error */
                         ^
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 98baef594bf31..b16a18dbfe7af 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1189,7 +1189,7 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 				pt_gnd_mic_swap_cnt = 0;
 				plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
 				continue;
-			} else if (cross_conn < 0) /* Error */
+			} else /* Error if (cross_conn < 0) */
 				continue;
 
 			if (pt_gnd_mic_swap_cnt == GND_MIC_SWAP_THRESHOLD) {
-- 
2.34.1

