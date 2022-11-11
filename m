Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E162500B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 03:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B07E164D;
	Fri, 11 Nov 2022 03:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B07E164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668132949;
	bh=7xegAUbZpkrU7W44Zn4R5tO1p9I94hcYLtcpaHdKlHc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DmnSJqoHgNCQpe9cnLmeWw3fFGGBUjOuru5GxQIb5ArQUbl5cI6JSOKCWIi3xGPzH
	 1BsV4CjPsloVWFPvNxAmsVomIouZWqXNC16dXQS8OKINKoK9QCQMpJFIaD1LSgcj3/
	 M//DbeHgC9t7G1iexp4mKm8cFjfUbPhWcozS9Xoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A8A5F8021D;
	Fri, 11 Nov 2022 03:14:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E703F802E8; Fri, 11 Nov 2022 03:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDAEEF80104
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDAEEF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cntCfhcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668132890; x=1699668890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7xegAUbZpkrU7W44Zn4R5tO1p9I94hcYLtcpaHdKlHc=;
 b=cntCfhcDqet86OxNyFylEGK6QtktF0FgdT2MEIqQMjnDFgOeOKA4HlEF
 6MmRb6QwwEdH3vOjRF5OgWjPZGDLW85x1o9IdAG1r9HTX/6uNmPNm6lw/
 fopD+0uEdX1EJlKRkn+sQR7e9TPWax7Iz0f++TDh4MzOQ60t7hQkGAyzZ
 p7UYbUQ1YcfHNTTZpWZiXbSf8HT0ijql6xdnIwxAj48M7k9REriGQByD+
 w4gw1PBIK3gK2v4KBpVqEoQSUPljPuz1WXkeovtt6QSD037WnfGSXWA/w
 rLQOEz5XWc9DSWmjnzFt8knyPpKgxL4zPlKfX1K9Oy0XH53Jtr/Rd6UqQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291904402"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291904402"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:14:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="615335544"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="615335544"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:14:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/2] soundwire: revisit support for clock registers
Date: Fri, 11 Nov 2022 10:16:31 +0800
Message-Id: <20221111021633.39908-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

SoundWire clock base and scale registers are only supported for SDCA
devices. That's fine, but that leaves SoundWire 1.2 with optional
registers not supported. This is a corner case that needs to be supported.

Pierre-Louis Bossart (2):
  soundwire: remove is_sdca boolean property
  soundwire: enable optional clock registers for SoundWire 1.2 devices

 drivers/soundwire/bus.c           | 11 ++++++-----
 include/linux/soundwire/sdw.h     |  6 ++++--
 sound/soc/codecs/rt1316-sdw.c     |  1 -
 sound/soc/codecs/rt711-sdca-sdw.c |  1 -
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.25.1

