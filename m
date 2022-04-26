Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A551074D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8A91720;
	Tue, 26 Apr 2022 20:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8A91720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998541;
	bh=0FXOLz6jkgnBAjf3N2fkOzYqWhVK+MJPoAM+FJDMrx0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j4ol4C33jzhnkvPzefwRWIYz/V5cz6x694+FHHgpTlxNtb8a4XmK/lf/NSf1OEM/0
	 f4cqsITfY0ka4kQyHSopsVlJN52ehwyzYjLZt/7Z+z9ponZv9zbAE4hrLHwj9IWlbo
	 SQ6Yzz8UG4AqiZuWUQMqnYaez1UUf57T8IQfMEJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C039F8025C;
	Tue, 26 Apr 2022 20:41:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2033F800FA; Tue, 26 Apr 2022 20:41:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3258F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3258F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a70F+2ee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998480; x=1682534480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0FXOLz6jkgnBAjf3N2fkOzYqWhVK+MJPoAM+FJDMrx0=;
 b=a70F+2ee71RyhDsFOQVvLxL7vrHHH/tTLXRAcFPo/VvZZifSkwlmKHXm
 gpaGIttLoB9zzizSiN7TDKT8Da/uAx5/5/jRMp+ymOoj+quD1K0Qxmhwa
 3rECALSGpzkuwIuKHd0hJkIJCLCelCtIPQ9r+vFRgpT3AOVOW2SZQBerO
 3L0/WIrkONOXDhzbjlcMhUrVfnfPuTnDgCoYlRKf7XvU+xldZJZW16xa2
 PMJNPsWpgE+yZrMNhxJWd317P+2i72L6NeQGheCtU8xOdUH1jHY+Y5AGI
 hGed/2/Mu9QYPotI2Q2Px22pfB2bVDiGXVXyNwpCOpszvtYiI7RAXbV9l w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326176823"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326176823"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:41:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513300130"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:41:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: use pm_runtime_resume_and_get()
Date: Tue, 26 Apr 2022 13:41:02 -0500
Message-Id: <20220426184106.102636-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

simplify code pattern as recommended by Mark Brown.

Pierre-Louis Bossart (4):
  ASoC: SOF: control: use pm_runtime_resume_and_get()
  ASoC: SOF: debug: use pm_runtime_resume_and_get()
  ASoC: SOF: sof-client-ipc-flood-test: use pm_runtime_resume_and_get()
  ASoC: SOF: sof-client-ipc-msg-injector: use
    pm_runtime_resume_and_get()

 sound/soc/sof/control.c                     | 3 +--
 sound/soc/sof/debug.c                       | 3 +--
 sound/soc/sof/sof-client-ipc-flood-test.c   | 3 +--
 sound/soc/sof/sof-client-ipc-msg-injector.c | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.30.2

