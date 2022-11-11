Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E256252D2
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:49:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04A51657;
	Fri, 11 Nov 2022 05:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04A51657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668142179;
	bh=tBYmb/elmKbUQqDtxdD8ygMW21buXfDWiI0f0+UdQWs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOO+b1yb6EpiTZ1YTcp38/mWelbE4731qJn+bp8wx6PByB31JCKcHakxG1ao01gkV
	 wGbI1f6hEYJe1xp5vx8p3bh5JbshZn0EzkFfPYqG6q3D8uiMtdxzoKNqq1QDOyEIqD
	 yEHB4ZLjGX4yFVjaJ9thDICaFJZIzwh5ctkdMfUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BE4F804AB;
	Fri, 11 Nov 2022 05:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF3EF804AB; Fri, 11 Nov 2022 05:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 066C6F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 066C6F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V3j3BE+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668142120; x=1699678120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tBYmb/elmKbUQqDtxdD8ygMW21buXfDWiI0f0+UdQWs=;
 b=V3j3BE+NuPjIoHwWdQE1N2tlewWPFYG1Z+SydVIC2xGVQjkgG9SDRAYi
 bkcNXHmi9bzBxLCzbPj9veV9xs+KAhIJ21FnueBp/LF7nPJjy3Y/vgKvT
 t5p4A8THglMM6xBPsZRKOFvTz9jYGk1h5m45UNDVsm2NXa8J2/jLQVO3g
 H/vLWaF+cFj0IS+qQWx/rHk/V7HWDdX5PzlTCIefZ1JBHNgl63uXY7s9l
 lg3al2bd1LaVP4IC9y4BFycth2WaRfxbSV68dGg+RwDlbrEy2W9iNXAmp
 3JG8jkv+HUqiV0jrRRrxBYCYPjwsX3dvPFzpRVnpq0jJ6cyww1JBu11TX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="311527604"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="311527604"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:48:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="706420066"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="706420066"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:48:24 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/4] ASoC: Intel: add new Dell devices support
Date: Fri, 11 Nov 2022 12:50:12 +0800
Message-Id: <20221111045016.46573-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

Add 2 Dell SKU support.

Gongjun Song (4):
  ASoC: Intel: sof_sdw: Add support for SKU 0C10 product
  ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire configuration
  ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
  ASoC: Intel: soc-acpi: add SKU 0C40 SoundWire configuration

 sound/soc/intel/boards/sof_sdw.c              |  21 ++++
 .../intel/common/soc-acpi-intel-rpl-match.c   | 109 ++++++++++++++++++
 2 files changed, 130 insertions(+)

-- 
2.25.1

