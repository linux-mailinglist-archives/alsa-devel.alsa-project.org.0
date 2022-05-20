Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1E52F4F2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:19:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6458C1728;
	Fri, 20 May 2022 23:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6458C1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081579;
	bh=0t8/mt6j6UV5XzgqQ+i3Ss8Ro8+hdA92/oyg44K+0g8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CYRaFBKRoi4kzsqnVbvuCm6u/IgCLphzNpg3WKltiL9+RSJKTMi2pHYLCbSeHyT0C
	 eUETSmt6iGOHxh8pdzYF6u5ctUf16lvmVzpWS1fBuFUZTMs5RwHfc8PpxVSH3nkMeD
	 YfHRgr+K8tACLTO4eXNJDfEdoeKqwOe6JTkOUzwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D6DFF8051C;
	Fri, 20 May 2022 23:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 268BAF80520; Fri, 20 May 2022 23:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CBA2F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBA2F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hZluMwse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081459; x=1684617459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0t8/mt6j6UV5XzgqQ+i3Ss8Ro8+hdA92/oyg44K+0g8=;
 b=hZluMwseGyGWJX9pYvMUTNg8WmbFEqVjor56AQs/IUqdvoJfqiZ2BCAU
 zuXiNfx0dseg+l6iyoK5c8Q7Z0uHU/mT+vTb0JpF2+utSQwJo7DLQrDr0
 qEGknnjVW6x5YwTBBEW/9AxuVba+NuAei3ddZ8Hlq6Ro+FGWBOiK6qezd
 n4ER10pWYYKxWGkJlLMwysJWe5TUhrOeI5/uLNrCoJtUCVavL+JedvhjK
 kjm1slsUuaSRylO/wDevGfWWaIhBDIu6LI/dATpFzm+PCL2/oCXiAEgVn
 +gKnFxqwNpvM4x/Lc56uJavX2Z4VmzgqZJXPEI7acSFxs0h6X3oFdr5xU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324228"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324228"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796017"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/16] ASoC: wcd9335: remove redundant tests
Date: Fri, 20 May 2022 16:17:07 -0500
Message-Id: <20220520211719.607543-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

sound/soc/codecs/wcd9335.c:1810:23: style: Condition 'tx_port>=4' is
always true [knownConditionTrueFalse]
  } else if ((tx_port >= 4) && (tx_port < 8)) {
                      ^

sound/soc/codecs/wcd9335.c:1806:15: note: Assuming that condition
'tx_port<4' is not redundant
  if (tx_port < 4) {
              ^
sound/soc/codecs/wcd9335.c:1810:23: note: Condition 'tx_port>=4' is
always true
  } else if ((tx_port >= 4) && (tx_port < 8)) {
                      ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/wcd9335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 617a36a89dfed..e1b6930480842 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1807,11 +1807,11 @@ static int wcd9335_set_decimator_rate(struct snd_soc_dai *dai,
 			tx_port_reg = WCD9335_CDC_IF_ROUTER_TX_MUX_CFG0;
 			shift = (tx_port << 1);
 			shift_val = 0x03;
-		} else if ((tx_port >= 4) && (tx_port < 8)) {
+		} else if (tx_port < 8) {
 			tx_port_reg = WCD9335_CDC_IF_ROUTER_TX_MUX_CFG1;
 			shift = ((tx_port - 4) << 1);
 			shift_val = 0x03;
-		} else if ((tx_port >= 8) && (tx_port < 11)) {
+		} else if (tx_port < 11) {
 			tx_port_reg = WCD9335_CDC_IF_ROUTER_TX_MUX_CFG2;
 			shift = ((tx_port - 8) << 1);
 			shift_val = 0x03;
-- 
2.30.2

