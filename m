Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2C624DD5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 23:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CBB685D;
	Thu, 10 Nov 2022 23:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CBB685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668120963;
	bh=W0eIJYHhA6U00wfcU8AuwbRFd/2vy+U9LQqb9hJf/ds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b53CwckcZ0UAhvSuU+K9sgYICwWZplByOZLseGHWRsmxBP5U3AtV9rYzM1n5Hh8mu
	 41bXr6CgCdAjBYym8nym76necfLrb8r/K9xbdQYeCavZjji9tqd/s6NPbSFhm5KVOO
	 /hd607os5nkifv+cCpEPUmMiV9/dmCpJaOkZKubI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C50DEF8021D;
	Thu, 10 Nov 2022 23:55:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1A4DF80163; Thu, 10 Nov 2022 23:55:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F7B1F80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 23:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F7B1F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="knX/rgI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668120903; x=1699656903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W0eIJYHhA6U00wfcU8AuwbRFd/2vy+U9LQqb9hJf/ds=;
 b=knX/rgI4Nxjd5S+EAISJXOhq/DuYLM865bmLx7nmPDGkUQCC++9pgYuc
 E0bDPE12mq4wXn3tomtT9BWEfNkIvb4eLe1/2PoeH1HMfq7bQolNWyNhN
 iKBoyoM7aV1pj+KGC/FkpA8VPLfrpHaz42J1+34z8iSIz1d73JZaLnZ5M
 RZqpEcXGkGuT0/ym2k82vJJyNGx0AzH29OerfiLtv3P6GjXK3UHAnLLBV
 P0sQ/Qjba324p9HOrgOY0UEvoxkDOVvYtbkh/sSo0/j5Dk3hPgNCrZS5u
 N98PY/9dqDz06L4p2jdyqYPovv6Gd4gl2da/3lCY6JBbyJqf984uXIQEV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373588004"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="373588004"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:54:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670533691"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="670533691"
Received: from tleibov-mobl.ger.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.214.199.216])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:54:55 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: Intel: add more ACPI tables/quirks for RPL/MTL 
Date: Thu, 10 Nov 2022 16:54:27 -0600
Message-Id: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for two RaptorLake SoundWire SKUs and one test board for
MeteorLake.

There will be additional RaptorLake SKUs shared when validation is
complete.

Gongjun Song (4):
  ASoC: Intel: sof_sdw: Add support for SKU 0C10 product
  ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire configuration
  ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
  ASoC: Intel: soc-acpi: add SKU 0C40 SoundWire configuration

Yong Zhi (1):
  ASoC: Intel: soc-acpi: add MTL AIC SoundWire configurations

 sound/soc/intel/boards/sof_sdw.c              |  21 ++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  59 ++++++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   | 109 ++++++++++++++++++
 3 files changed, 189 insertions(+)

-- 
2.34.1

