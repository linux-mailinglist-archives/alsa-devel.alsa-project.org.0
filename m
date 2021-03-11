Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D9336940
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 886BD16E7;
	Thu, 11 Mar 2021 01:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 886BD16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423911;
	bh=/sx/AKc0WzXdSowMjaWErHtRgChrhJRlD9/Oz5RWMR4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8llHjwdgZgdEXD3WjEw1h3kiFEdZSIWyTK2vDVcUPEOfAfhyeNscY+WCiITC2srw
	 gUyVWKYMqX2DqlbxJ4zlo/VtOAjdDUTS7ia8c4XuvBv2NozjlUdlPdEWhPALuW+Sdh
	 BCXrv0wdZeA/uyDU3/Igz7rgWgq5o3M3byBXTeV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D8BF80425;
	Thu, 11 Mar 2021 01:49:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C14EFF8032C; Thu, 11 Mar 2021 01:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F445F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F445F8010D
IronPort-SDR: Ewzi7aPcmgQh9RJd4Rfwc31LZdNlJOFO4aXpS/mG98kBYluUes2/Mg+Q/JF6q7P3p3jQZERcVI
 m8+9+WFiDDQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865536"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:20 -0800
IronPort-SDR: xjT+db+56M2a0C/cPl5xYfXekIHi8yIzUHQwULkIFBPhKHTd24Xgjn/qDofhFvrXFpATuknXLX
 0aArc4iM1VTQ==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386798"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: mediatek: mt2701: align function prototype
Date: Wed, 10 Mar 2021 18:49:02 -0600
Message-Id: <20210311004904.121205-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

cppcheck warnings:

sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:102:30:
style:inconclusive: Function 'mt2701_afe_enable_i2s' argument 2 names
different: declaration 'path' definition
'i2s_path'. [funcArgNamesDifferent]
     struct mt2701_i2s_path *i2s_path,
                             ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h:21:30: note:
Function 'mt2701_afe_enable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.
     struct mt2701_i2s_path *path,
                             ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:102:30: note:
Function 'mt2701_afe_enable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.

     struct mt2701_i2s_path *i2s_path,
                             ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:128:32:
style:inconclusive: Function 'mt2701_afe_disable_i2s' argument 2 names
different: declaration 'path' definition
'i2s_path'. [funcArgNamesDifferent]
       struct mt2701_i2s_path *i2s_path,
                               ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h:24:32: note:
Function 'mt2701_afe_disable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.
       struct mt2701_i2s_path *path,
                               ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:128:32: note:
Function 'mt2701_afe_disable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.
       struct mt2701_i2s_path *i2s_path,
                               ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h
index 580fead2ab05..0bd82fbda176 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h
@@ -18,10 +18,10 @@ int mt2701_afe_enable_clock(struct mtk_base_afe *afe);
 int mt2701_afe_disable_clock(struct mtk_base_afe *afe);
 
 int mt2701_afe_enable_i2s(struct mtk_base_afe *afe,
-			  struct mt2701_i2s_path *path,
+			  struct mt2701_i2s_path *i2s_path,
 			  int dir);
 void mt2701_afe_disable_i2s(struct mtk_base_afe *afe,
-			    struct mt2701_i2s_path *path,
+			    struct mt2701_i2s_path *i2s_path,
 			    int dir);
 int mt2701_afe_enable_mclk(struct mtk_base_afe *afe, int id);
 void mt2701_afe_disable_mclk(struct mtk_base_afe *afe, int id);
-- 
2.25.1

