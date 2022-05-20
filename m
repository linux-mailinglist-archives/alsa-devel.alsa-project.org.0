Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06352F501
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C18B31748;
	Fri, 20 May 2022 23:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C18B31748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081761;
	bh=ngAehnQ7+MeSSwjSeAY8VFh0ZBhyvEjFbFq5BxPj9tE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vpXe6M2kZPoYrE1DDzsMrdN1MXPHbnvN1Z1kzVOZAXIuhI06ty96pvd2BoPfaDutR
	 oWI64A/S5kAmDAAl1AmsHsVC6ZP1b+ZLuxJ1CBFgmK12iqkLjkZwY1amAp3HPx7mTQ
	 WVq3vX2cSpDH92b5oqH1iQVIYs2WYI1sznPlDp2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C35B0F8057C;
	Fri, 20 May 2022 23:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5DCF80525; Fri, 20 May 2022 23:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 523E2F80526
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 523E2F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UEKJcAKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081465; x=1684617465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ngAehnQ7+MeSSwjSeAY8VFh0ZBhyvEjFbFq5BxPj9tE=;
 b=UEKJcAKfrGlw2UP93KXH8Wjkz4Kh2SGJTiGL+cQcz7mD7C83T2eJ6XIc
 MMqodbfsw2JnZ2DhHFrUI4ne9gpkfCA7uHzfO4IWCiArgza1AqiIDjgPJ
 nQO8+qvvxNzZu0rOhkPUg3AFxGQzhfhbPX6zDgXz74PMSHgqYJ/CfHo6O
 u20z+mHJBJo0Ondf6tzfxWhPw2plbbUGZYs2+G9ph2dhu5i3fHe0MvYPN
 QXTLr4MO2ZKKsclGjJYFFdKJsYsy1DpJPXOZhm+ofllaj/FRY70XfpEwO
 5V7GTFCnWcUOdjA0IoUT+w2l5NE5urUyVaswjhGwDUAncJLdmZ9IfnXrh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324249"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324249"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796035"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/16] ASoC: qcom: q6dsp: q6adm: remove useless initializations
Date: Fri, 20 May 2022 16:17:15 -0500
Message-Id: <20220520211719.607543-13-pierre-louis.bossart@linux.intel.com>
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

cppcheck complains about invalid NULL dereferences but there's
indeed no need to initialize loop variables.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 72c5719f1d253..22b408c3794e0 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -90,7 +90,7 @@ struct q6adm_session_map_node_v5 {
 static struct q6copp *q6adm_find_copp(struct q6adm *adm, int port_idx,
 				  int copp_idx)
 {
-	struct q6copp *c = NULL;
+	struct q6copp *c;
 	struct q6copp *ret = NULL;
 	unsigned long flags;
 
@@ -299,7 +299,7 @@ static struct q6copp *q6adm_find_matching_copp(struct q6adm *adm,
 					       int channel_mode, int bit_width,
 					       int app_type)
 {
-	struct q6copp *c = NULL;
+	struct q6copp *c;
 	struct q6copp *ret = NULL;
 	unsigned long flags;
 
-- 
2.30.2

