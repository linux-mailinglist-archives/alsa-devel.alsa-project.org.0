Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D383368C7
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F1A16FB;
	Thu, 11 Mar 2021 01:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F1A16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423028;
	bh=FNzTH2qR9G3MB1c3fzCNTQWwFocpSilm8N6d/CIIrK4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rHq9AzpaCbCsnRbJeI6CXWf7q2ibQhGiXyeZU5MjyCH6oSltfc/cEG3tNHD+4SrC2
	 SWhN6xubL6aSzslomROWMDu5ltZ8VjfPZ8Ctw3r9MHb4hF0oNn7iWSxt91d1lP8azQ
	 VwSsuYByfnet9kkB/fEHAcI5sUzPU4SbqlZOMUkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8D5F8012F;
	Thu, 11 Mar 2021 01:35:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98D9F801ED; Thu, 11 Mar 2021 01:35:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8EEF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8EEF8010D
IronPort-SDR: M7EX+ii6r4g3BE6KinyaACRoYF/zGVvL0nlAPDe/4HDdthZDZp4eHxAsxvuiMdVDT8Q/YwJYty
 FXRlX/VviJHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="249957216"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="249957216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:35:24 -0800
IronPort-SDR: V+QVa222A4OGD1v8gERVJX9DORxE/wXzmeWq//QHCevn/S58j4nb5lWfAnsy6IiHS09Jj3+aTo
 RAZwPOQw+exA==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="520919933"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:35:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/2] ASoC: samsung: remove cppcheck warnings
Date: Wed, 10 Mar 2021 18:35:14 -0600
Message-Id: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
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

v3:
Added Sylwester tag
Rebased and squashed fix with initial patch which was merged at some
point but can't be found in broonie/for-next (not sure what happened?)
Corrected patch subjects to tm2_wm5110
Reverted second patch to initial v1, after agreement between Krzysztof
and Sylwester

v2:
added Krzysztof Kozlowski's tags
added fix for first patch already merged as suggested by Krzysztof Kozlowski
moved variable to lower scope in patch6


Pierre-Louis Bossart (2):
  ASoC: samsung: tm2_wm5110: check of of_parse return value
  ASoC: samsung: tm2_wm5110: remove shadowing variable

 sound/soc/samsung/tm2_wm5110.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.25.1

