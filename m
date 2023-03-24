Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811D6C7504
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:30:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02CABEBE;
	Fri, 24 Mar 2023 02:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02CABEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621415;
	bh=gcrf/FbQBSeQnVxYB0FjcaGgfLmGLOOfeKwKl/xbKbI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjLLDx9jgTdY+TqHAz/AyANR439hiBc96Z1Wm3c7TN/2xL6g07a2d1vzxvN9WiRZ2
	 QDwCodHDJgRIOVMDy1NXsprVudTDTGyUujVdf4keMCBCxzg0hQlt4MxXC8jILpAp22
	 24ljen9O7hU9JXehBzVxFB2cq4BTzHq0yq+Op5us=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BD85F80533;
	Fri, 24 Mar 2023 02:29:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16086F8052E; Fri, 24 Mar 2023 02:29:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63B63F8027B
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63B63F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jBmzR015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621340; x=1711157340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gcrf/FbQBSeQnVxYB0FjcaGgfLmGLOOfeKwKl/xbKbI=;
  b=jBmzR015SL2jOez7xgVOO2PeFoV1/t56WBV3L/89tXbFcxcijmyYktsR
   rMwM8GllhIFeOkAYM9dg9gNnpOqCCDiRZ9tlrIe3uISVdwEVhDsQd26LB
   qexWbmhwNJdNiiHq3CWTa/ImvAOsB323PjJ8IXKLpEQpxJUG8Np5vbxv2
   7IIfqwZXuECFDybc3+W0qpOMgQApeeRISZ5KgVodZ+5edmkc3EnwAqqjg
   o0rlhmrfkxCgF+/fntvsQDTxrF/HQPc82QNWpRZFRidkXdwvUKlgaN0WB
   r+rscWk1FwdnHvrJg+oaqBqK67sbYMnhSXTxGI70gR659TUfuOhql1FJp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584848"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584848"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659872992"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659872992"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 01/13] ASoC: codecs: cs42l42-sdw: clear stream
Date: Fri, 24 Mar 2023 09:43:56 +0800
Message-Id: <20230324014408.1677505-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DFLHVFLMDZJYA3WUIHHNNARGYJTOVQ7W
X-Message-ID-Hash: DFLHVFLMDZJYA3WUIHHNNARGYJTOVQ7W
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFLHVFLMDZJYA3WUIHHNNARGYJTOVQ7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The API requires the stream info to be cleared when the argument is
NULL.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/cs42l42-sdw.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 7b539ee55499..eeab07c850f9 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -152,9 +152,6 @@ static int cs42l42_sdw_port_prep(struct sdw_slave *slave,
 static int cs42l42_sdw_dai_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 					  int direction)
 {
-	if (!sdw_stream)
-		return 0;
-
 	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
 
 	return 0;
-- 
2.25.1

