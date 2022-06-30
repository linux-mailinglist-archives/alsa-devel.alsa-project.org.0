Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF05612CF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 08:57:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B27A816C1;
	Thu, 30 Jun 2022 08:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B27A816C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656572224;
	bh=YQ9v3SxVeeikY40AxCK+u90VRRvusXHoo4Iq9ErbSNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fy57mpIQrzSDLxBIYWKsI1DOG+lFUmTP9y2Jr3aQaT6cZ34lXQ2OpyvcyeW00TQ7W
	 +DMUiPTafI9gfhDCZI0v44nKlMJ4hC/uENRqaMy9LczLaJBBXl2N7MImiaz0NUi74v
	 rXNbITip0vKJ1MLouPcSBjCDNdfNrmC6nK9/BY6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95934F804D8;
	Thu, 30 Jun 2022 08:56:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98092F804D8; Thu, 30 Jun 2022 08:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A26E0F8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 08:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A26E0F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZdYpDo8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656572162; x=1688108162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YQ9v3SxVeeikY40AxCK+u90VRRvusXHoo4Iq9ErbSNU=;
 b=ZdYpDo8jT5SIuQ6n/4ZdUFaAIJz6+eFUwmB56grN070x0Vq/yLRePqCB
 4vsPiP5EOA2fDcII5UD4G1b8j3QJWFFczJKYLGufgNMEGxZ4/dvu6SvEl
 qTDhfm3B6G000nLfdPYut41g+ZP94GfrBju96/Dl4SAn/VVZdvX7oa9eb
 xt0bIc+twdnpJTOJT4033T/CFvnB+mstlmsl8WNrvlKZbdMnVMvvI4POz
 jWiz40/DWUr9e23iRiTAAVaGxbahR/m1/jLmSmiZ+CM28XDjzhEdGsfi/
 dab6DIkdKDlKT4K0P3s56leiBedLWyZ27P/Dy3m/IyIgZf8hK1HQi7ADP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="343951689"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="343951689"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:55:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="595575010"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:55:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com
Subject: [PATCH v2 0/2] ASoC: Intel: Skylake: Fixes for skl_get_ssp_clks()
Date: Thu, 30 Jun 2022 09:56:36 +0300
Message-Id: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, kai.vehmanen@linux.intel.com
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

Hi,

Changes since v1:
- drop reference to a might never happening patch from the commit message of
  patch 2.

Cover letter:
while looking at long standing sparse reports regarding to arrays of flexible
structures (arrays of flexible arrays of flexible structures, really).

I came across these which did not looked right.
The skl_get_ssp_clks() as some issues and can work under only strict single
condition.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: Intel: Skylake: Correct the ssp rate discovery in
    skl_get_ssp_clks()
  ASoC: Intel: Skylake: Correct the handling of fmt_config flexible
    array

 sound/soc/intel/skylake/skl-nhlt.c | 40 ++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 13 deletions(-)

-- 
2.37.0

