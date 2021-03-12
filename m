Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F443395CD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:04:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013F31754;
	Fri, 12 Mar 2021 19:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013F31754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615572265;
	bh=KROTqqWOYX6RjyZyg1ZMwJe1vdS7NLHO8y/Z0fLSnF0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G3jyN0y4hXpb/CGag5X0PBPcGbKn8AguqRc495rS36D+kS4qhDR/FofJN3L7RA0WI
	 yw7aijcqc+u0QDbuaSUAgm5mag3EX6ePwDFhmOrkZ9T2p1ipCJKi+5pivqQTzLT5A7
	 ghy3s/lk7b56p9qzhREEGLnaB4dmfoYRVUpmehM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E181DF800AB;
	Fri, 12 Mar 2021 19:02:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E39A6F800AB; Fri, 12 Mar 2021 19:02:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B91F800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B91F800AB
IronPort-SDR: nAtOAbhFFwBSu7f29Jc+ReWcT54E/EKxEjPc2jMtQcvCWV3Cdnsp+L+1ab7rRxI/Asg8QlbErI
 CiSlOQXCJ4Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="176459528"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="176459528"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:02:39 -0800
IronPort-SDR: ZkDXOoi3Yx1OXMpXxlpHbBAUj3SBMqB+ryYdgfdHenYNlHx/URSdlw8SjJyqX5wI+HynrWosoc
 4RKSzKb5eppw==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="432013358"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:02:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 0/2] ASoC: samsung: remove cppcheck warnings
Date: Fri, 12 Mar 2021 12:02:29 -0600
Message-Id: <20210312180231.2741-1-pierre-louis.bossart@linux.intel.com>
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

v4:
corrected Fixes tag
Added added Krzysztof Kozlowski's r-v-b tag
reverted patch2 to v2 since this is the agreement.

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
  ASoC: samsung: tm2_wm5110: remove shadowed variable

 sound/soc/samsung/tm2_wm5110.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1

