Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AAD510CEE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 01:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6439B17E9;
	Wed, 27 Apr 2022 01:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6439B17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651017462;
	bh=eIHvaM/jF1FT9l+KeJTLO1Jd1NhIocqtHenQEupdkBw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xl1sWYzjHu7qo036ZhHsEOGk7KUCRhofJtt3Xd7brwWJuslFQ7E292owe/k2vfFB8
	 poGnXDMnj7gP/hD57zBRN7aBe0rKqBIsDvIMdf23EYm1qbEG3qdUhH488T/r9Yyb1w
	 +4BKWWHe4FEKohLvDfK3gyU0ixNxb+RnpCabSz3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2767F804B4;
	Wed, 27 Apr 2022 01:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C809BF80171; Wed, 27 Apr 2022 01:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 537C0F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 01:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 537C0F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EdTXnItr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651017398; x=1682553398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eIHvaM/jF1FT9l+KeJTLO1Jd1NhIocqtHenQEupdkBw=;
 b=EdTXnItrgmSg21XQLj8mO3FkSnVhNsI5pUap7m6KMgehEsZjDbS3FvV6
 d5IO8Zm6o0TcqwJSuPU/lMFTQbhtf+M0gmt39rU1M03Kdx98ADI1WfMpA
 9EdwYZrLBnZfr02UuksyzBdJ19KfShFrrK9GHMFIyw4ys5YZx2ZRzKCfR
 e3Rz5qoo10rvHfqSF0qEpg1uMzSmjZjY6KtJCUYYCNyAu5SvSjRTFVeYl
 dqSMjypniDgesDdp9LbjfLQUjMeHwep//DIYUaDWHEGW1DlG70PAPIPno
 dmZwdgCx1CYaGF6Onp868phA7xEJ+IUn+1WGxtTS2Y3Rs/ghei8QDrWB4 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290908840"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="290908840"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730515003"
Received: from htamura-mobl2.gar.corp.intel.com (HELO bard-pc.domain.name)
 ([10.252.185.30])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/5] soundwire: use pm_runtime_resume_and_get()
Date: Wed, 27 Apr 2022 07:56:18 +0800
Message-Id: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
pm_runtime_put_noidle() pattern.

Pierre-Louis Bossart (5):
  soundwire: qcom: return error when pm_runtime_get_sync fails
  soundwire: bus: use pm_runtime_resume_and_get()
  soundwire: cadence: use pm_runtime_resume_and_get()
  soundwire: intel: use pm_runtime_resume_and_get()
  soundwire: qcom: use pm_runtime_resume_and_get()

 drivers/soundwire/bus.c            | 15 +++++----------
 drivers/soundwire/cadence_master.c |  5 ++---
 drivers/soundwire/intel.c          |  5 ++---
 drivers/soundwire/qcom.c           | 17 ++++++++---------
 4 files changed, 17 insertions(+), 25 deletions(-)

-- 
2.25.1

