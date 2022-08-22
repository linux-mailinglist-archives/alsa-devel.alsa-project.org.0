Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58B59C6D8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE6B165E;
	Mon, 22 Aug 2022 20:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE6B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193877;
	bh=vFptHFTQvMLLc8fNOk6m0lzbZBBJ5nP10P1cIx99YyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLKcr4LOplmKHXG/SQJ0DjyGtPMNKXa55GBEht+RAXfTLWCXFv6q5LcCDgQYeF94s
	 ngEkgWI8KIGRqrv2om+ct6gkh+NETwXTFrdChL4KDClRWBG6Q3kMT3yGXETztkd18h
	 3BN3Q/8fFyCrSiCcCvq4iRgBmY30aSm/toLJHj4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF94F800A7;
	Mon, 22 Aug 2022 20:43:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3D50F80529; Mon, 22 Aug 2022 20:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9C9EF800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C9EF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TT4icqA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661193788; x=1692729788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vFptHFTQvMLLc8fNOk6m0lzbZBBJ5nP10P1cIx99YyU=;
 b=TT4icqA+/Dp0H18fgt5d+ImUrUeUEeQnN1IboD+YLtG39pLF+ScQ+fDz
 SYBPLHnXeFO/xX+/KrQ81jcRmHjo8wZ3jxT4zKis8kxLo/j1gEs1sZ08v
 puZ9zm2s3PFBAWFU276sHnJ3SSgnLwOnKJvW8zBO6XPxSmQQNxrZI95Et
 WjxGX/PxsG5YjojPTXQoNw4DxV03y8+qTq45P9DmB2+RtxTlz7aneUJ5C
 lzK1Fkjb1LVHRf+8NMbpATHsNpE7OJKGG1aeEgZuXpmypwbA6l9Ju+wnX
 LuZNrMJojq4lxaBmOD97gsYPFSL61Hx3JFn/gsAsDU/5n3aqKsjUALhzh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293488946"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="293488946"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669671063"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: hdmi-codec: remove unused definitions
Date: Mon, 22 Aug 2022 20:42:35 +0200
Message-Id: <20220822184239.169757-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>, Dmitry Osipenko <digetx@gmail.com>,
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

sound/soc/codecs/hdmi-codec.c:24:16: style: struct member
'hdmi_codec_channel_ma`p_table::map' is never used. [unusedStructMember]
 unsigned char map; /* ALSA API channel map position */
               ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
---
 sound/soc/codecs/hdmi-codec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 5679102de91f8..863e679d2ac11 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -20,10 +20,6 @@
 
 #define HDMI_CODEC_CHMAP_IDX_UNKNOWN  -1
 
-struct hdmi_codec_channel_map_table {
-	unsigned char map;	/* ALSA API channel map position */
-};
-
 /*
  * CEA speaker placement for HDMI 1.4:
  *
-- 
2.34.1

