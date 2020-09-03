Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C025D3D6
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 10:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 125651AD0;
	Fri,  4 Sep 2020 10:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 125651AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599208949;
	bh=a5JaVI7WX4Ffo7kJCU+cIbeMeMuRyD0R7v+o3m/evaI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sCp18/uTw7byO1r62gjncDwnxR6sZAH8NVh4gRogrCPxN2T6Na5/eit3eOl6kDhQA
	 x9/MaT9/tOXXClhetXNlymawPSQrAH2INhGRlduLORVMLJFKN96oqhR2IRHQt6Blcg
	 ApYk2YMW2dlniCfZlJp0brG00iAO4Xls0UMcLVR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26158F8024A;
	Fri,  4 Sep 2020 10:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDFC2F80257; Fri,  4 Sep 2020 10:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C73CF80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 10:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C73CF80113
IronPort-SDR: G6UV9YiQ2JhfnsnyE87mq1aGgDwJMtgDHDMAKQYIdK/m+dxaX2OO198GZnYlvXIHe1wZgHJYO6
 zNJZ/VXIrrzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137231238"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137231238"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:40:34 -0700
IronPort-SDR: SArn5SKMBnPwKqdjUimlbTiMJ8yKzoB0sqc6YHLrl13UwYQRYsnXSyM+29UpGwYUMcBUyYVz0r
 GtBjRVdL8u9w==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="478402057"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:40:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/3] ASoC: Add sdw stream operations to dailink ops.
Date: Fri,  4 Sep 2020 04:46:47 +0800
Message-Id: <20200903204650.31098-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
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

Sdw stream operation APIs can be called once per stream. Move these
operations to dailink ops. The linked series is "soundwire: Remove sdw
stream operations from Intel soundwire dai".

Pierre-Louis Bossart (3):
  ASoC: soc-dai: clarify return value for get_sdw_stream()
  ASOC: Intel: sof_sdw: add dailink .trigger callback
  ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback

 include/sound/soc-dai.h          |  3 +-
 sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.17.1

