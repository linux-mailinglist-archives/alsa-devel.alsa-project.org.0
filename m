Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2F34545D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 02:00:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 251811616;
	Tue, 23 Mar 2021 01:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 251811616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616461241;
	bh=dPa6diMaeROfbkKxUFbp6b7Rp/r/oqAl1amDhymFkho=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fwMDwHRB5f/9iwc5QjV9FZ7S3k0NnWn/wP0ASbIJcNleuyslALZvqa0BXVVEzVOfS
	 K8/XciZxpwNNMX+GTepwzHIgrqWqQlRC4Spa0E4UpJ/cYEDRyyzhBi15botjl7xcIA
	 j2pg3wxkORoQWMa1SRvo/I9TZehxrbmsMlBUUp6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9F2AF801EB;
	Tue, 23 Mar 2021 01:59:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7D44F801D5; Tue, 23 Mar 2021 01:59:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E66D8F80107
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 01:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E66D8F80107
IronPort-SDR: YctxeqY2kThUqsAvR/lJn4XVhHaPX0JjOPAw7MnVxX8EZM/PRfrHj4YXiLwMhkKxaTVzY6Xg4H
 r36iLERf2JyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275477943"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="275477943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:06 -0700
IronPort-SDR: ZdKNzNMz8SYQ1t8eRal3511rk5tunH7tqDiwiuAf5DnLxi2fCyQ3SWLTmB+/5qt18wpCdvVuau
 f3d0aXGnrN/A==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="414728307"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/5] soundwire: add missing \n in dev_err()
Date: Tue, 23 Mar 2021 08:58:50 +0800
Message-Id: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

We fixed a lot of warnings in 2019 but the magic of copy-paste keeps
adding new ones...

Pierre-Louis Bossart (5):
  soundwire: intel: add missing \n in dev_err()
  soundwire: bandwidth_allocation: add missing \n in dev_err()
  soundwire: cadence: add missing \n in dev_err()
  soundwire: stream: add missing \n in dev_err()
  soundwire: qcom: add missing \n in dev_err()

 drivers/soundwire/cadence_master.c             |  2 +-
 .../soundwire/generic_bandwidth_allocation.c   |  4 ++--
 drivers/soundwire/intel.c                      | 18 +++++++++---------
 drivers/soundwire/qcom.c                       |  2 +-
 drivers/soundwire/stream.c                     | 10 +++++-----
 5 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.17.1

