Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95759C6D5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B3C1E11;
	Mon, 22 Aug 2022 20:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B3C1E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193848;
	bh=Kbss1+JFwLtb0GEmgL7j9Rfb2dyxymy/4juddSkwcoE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pqgIwXbQjiGExLf095hxA0nSLnQyGnQ/CY6Sc7pCqHrXJmJiW1aJE0NnQHhVIS44f
	 YtCGImTTVsC9tTyR3T4FvI7HYX8HB0TWLkGiq4U2IGEf2i4CyJIIQG1EKyfVB2ChKX
	 pSQ+hqjUPUSO9n7+FP0NuVZbekGim+JE1D+1qbSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00DC9F804A9;
	Mon, 22 Aug 2022 20:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7178F8026A; Mon, 22 Aug 2022 20:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9EE5F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9EE5F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Sp0mPdY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661193784; x=1692729784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kbss1+JFwLtb0GEmgL7j9Rfb2dyxymy/4juddSkwcoE=;
 b=Sp0mPdY+YMUlBkaqfZQKY0DDuHEn7u2Ty6j+Rf1UlHejhwUYL8IRz8fN
 ADplwE5/HbSj9sE2mtAczxchJFtUywXQRwqP730ByUg+PHE+vdDa/U2yG
 rzM0xuiRBTORbnm4irTjRWc79WMgoacMNP7wkqJgrUVfs9FTiL2PKAh3y
 WUFWOO1ZiNTSULwEiIBYphBxOV7g28Tz1AK7SjKgHqgWHAXBvPwCgKmHX
 ZYS/2vNxEB2/LaGysfg6LYOiS8byiCkxAPH7DdoQ9quMreIr73nUPmlHv
 0w7sPftyrswnQ1SP5Yqi3oFx+oV+HjANG9/rZlHuwzREyHom8z14VpMsL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293488936"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="293488936"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:43:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669671017"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:42:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: codecs: minor cppcheck cleanups
Date: Mon, 22 Aug 2022 20:42:34 +0200
Message-Id: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Small number of cleanups that were either missed in previous versions
or detected by new cppcheck version.

Pierre-Louis Bossart (5):
  ASoC: hdmi-codec: remove unused definitions
  ASoC: wcd-mbhc-v2: remove always-true condition
  ASoC: wcd9335: remove always-true condition
  ASoC: fsl: fsl-utils: remove useless assignment
  ASoC: ti: omap-mcbsp: remove useless assignment

 sound/soc/codecs/hdmi-codec.c  | 4 ----
 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 sound/soc/codecs/wcd9335.c     | 4 +---
 sound/soc/fsl/fsl_utils.c      | 2 +-
 sound/soc/ti/omap-mcbsp.c      | 2 +-
 5 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.34.1

