Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C359C6DA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:45:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0B41685;
	Mon, 22 Aug 2022 20:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0B41685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193901;
	bh=n8LryROOr9/Rmu/wIyOOGB0YSEQdyNpliRqkID42vQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rru1hlxJeSOJoTdbhO1q3uTV7CMtSKHh35Aeqezov2nFNPBRnQrVh1LTrF6I8uwXt
	 kUn5/JEgIUpbRTpG8e3Eqls08/2JEBzdIjL7uC1OXY2rX7nu5ua4PgsJLrzkTBP2j6
	 Rw7jlRL82hHVmgN1bmgb4wVPw0PpjZaXK71lVff0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2077FF80536;
	Mon, 22 Aug 2022 20:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D9F7F8053B; Mon, 22 Aug 2022 20:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 685E3F8052F
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 685E3F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EUPHNKAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661193795; x=1692729795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n8LryROOr9/Rmu/wIyOOGB0YSEQdyNpliRqkID42vQM=;
 b=EUPHNKApkNkerBJj8wlkr5kOCldOh0TEj4CP0g52Oc0mFcKhl0K4Fm/e
 UnPiEhclI3c2va0iGoCdeienrV4eNv0NZv3eFDMktqA4ZOwl9CBQ3Nd0n
 I9nqjVsKGn9BVxh/MRbMSoSoI/JynoIJHJVxqGJSpWTrbRx3V1bahsADZ
 uBpF6UXRj5cVL6Fkq0R+rZlOLHabLpV8cttGxZmakWcDuEXFi44KfscaR
 Ukb5b4fx2XA2MP8T/MH3LCAbubKJT6mMGXxm19sq9ZS4h/Equq65IoVMz
 qkIlZoP/+l87ATlrEOJWYqMSObpwoRqSP0R38a8He/WxEZTQcxhaQjTyJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293488979"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="293488979"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669671100"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: wcd9335: remove always-true condition
Date: Mon, 22 Aug 2022 20:42:37 +0200
Message-Id: <20220822184239.169757-4-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/wcd9335.c:1824:22: style: Condition 'tx_port==13' is
always true [knownConditionTrueFalse]
  } else if (tx_port == 13) {
                     ^
sound/soc/codecs/wcd9335.c:1802:16: note: Assuming that condition
'tx_port==12' is not redundant
  if ((tx_port == 12) || (tx_port >= 14)) {
               ^
sound/soc/codecs/wcd9335.c:1802:35: note: Assuming that condition
'tx_port>=14' is not redundant
  if ((tx_port == 12) || (tx_port >= 14)) {
                                  ^
sound/soc/codecs/wcd9335.c:1824:22: note: Condition 'tx_port==13' is
always true
  } else if (tx_port == 13) {
                     ^
sound/soc/codecs/wcd9335.c:1845:22: style: Condition 'tx_port==13' is
always true [knownConditionTrueFalse]
  } else if (tx_port == 13) {
                     ^
sound/soc/codecs/wcd9335.c:1802:16: note: Assuming that condition
'tx_port==12' is not redundant
  if ((tx_port == 12) || (tx_port >= 14)) {
               ^
sound/soc/codecs/wcd9335.c:1802:35: note: Assuming that condition
'tx_port>=14' is not redundant
  if ((tx_port == 12) || (tx_port >= 14)) {
                                  ^
sound/soc/codecs/wcd9335.c:1845:22: note: Condition 'tx_port==13' is
always true
  } else if (tx_port == 13) {
                     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
---
 sound/soc/codecs/wcd9335.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index beeeb35e80321..5b4d3c5973532 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1821,12 +1821,10 @@ static int wcd9335_set_decimator_rate(struct snd_soc_dai *dai,
 			tx_port_reg = WCD9335_CDC_IF_ROUTER_TX_MUX_CFG3;
 			shift = 0;
 			shift_val = 0x0F;
-		} else if (tx_port == 13) {
+		} else /* (tx_port == 13) */ {
 			tx_port_reg = WCD9335_CDC_IF_ROUTER_TX_MUX_CFG3;
 			shift = 4;
 			shift_val = 0x03;
-		} else {
-			return -EINVAL;
 		}
 
 		tx_mux_sel = snd_soc_component_read(comp, tx_port_reg) &
-- 
2.34.1

