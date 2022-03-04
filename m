Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF24CDEDF
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF131B4C;
	Fri,  4 Mar 2022 21:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF131B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646426824;
	bh=gTulxrSKHpBV9R6wzQnxTnKB62lG/pEjOFjcrHpachI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oH29NsqhqlT6T5plNr+u4ncWnEPwJZ/68erkQ6nYnFqrpg2woyCNl3wb3i6R7zt4T
	 p3H+7WfuOIDD8c1sLDF0OnvyV/1vTV7xefAwyTeeOjLTw7ol5gktffmcg3Jly/EvCJ
	 pGrnVqFnBzXyC/UWdVfe3YjPoub/89X2nA7/Gzt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76CCDF800FA;
	Fri,  4 Mar 2022 21:45:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00ECBF80224; Fri,  4 Mar 2022 21:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D24A7F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24A7F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TTDBDFZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646426751; x=1677962751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gTulxrSKHpBV9R6wzQnxTnKB62lG/pEjOFjcrHpachI=;
 b=TTDBDFZqml2hZxY70NTQGfdwJbrHkHYlN39vQYcNkFx8uRs42oRqYtZZ
 94ahOtlu1aZGqOalMnd0Z2XJtSo16cIsJXnE99+8WAF9w+/Xer/ADRd7g
 ieFfURYqL67rreoVDZFk4vQfL7q2rNmx8ai90iF3LVlU3DkMQnW7FtEdu
 SBrbnrCKyYioRN7pv6iSLGWZiEPU6cc1Emimld2X2tYI1bnUbmEdOaaqO
 tNMFynJgOBmCB9s2kAM5uIfEs1VUChX6djj9SC6ycVAuzBydMcQxKuSjX
 Ty/aAsL30JFP1zfOpKm1kQk0HfuTJJTvaMx32It3tsFCmxRgLHdc1JxtS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="314776821"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="314776821"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="640695967"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel: boards: cleanups for 5.18
Date: Fri,  4 Mar 2022 14:45:29 -0600
Message-Id: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Updates to clean-up the GPIOLIB dependency and a quirk for HP
SoundWire devices.

Anthony I Gilea (1):
  ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360 13"

Pierre-Louis Bossart (2):
  ASoC: Intel: boards: remove explicit dependency on GPIOLIB when DMIC
    is used"
  ASoC: Intel: boards: add GPIOLIB dependency where missed

 drivers/soundwire/dmi-quirks.c   |  2 +-
 sound/soc/intel/boards/Kconfig   | 49 +++++++++++++++++++-------------
 sound/soc/intel/boards/sof_sdw.c |  2 +-
 3 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.30.2

