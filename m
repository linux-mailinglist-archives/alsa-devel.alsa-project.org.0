Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA64956EC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B674D2C31;
	Fri, 21 Jan 2022 00:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B674D2C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720999;
	bh=uT5t9LlKoKGtxpr16eMI7llzjNG5foUYCtnCUr5mTg0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WIo8nHW3K4GwELjUw1iU8HOAxboX5zDi9EHU/QmRlKmbUnI7nMHsMwi+DHX1sskbs
	 3sMlR7W/0mwmverBqGCdSzs7R6vDPrB5KQemm4EshB1xHO/Dnvo/fKo3DBdhHFPAvv
	 UhXA/2ql1XpYf7SfRnnHw6DGCNiaE7BumWAI4gzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C3BEF80134;
	Fri, 21 Jan 2022 00:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA1DF8012E; Fri, 21 Jan 2022 00:22:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4187DF800F2
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4187DF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RyzemOWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720930; x=1674256930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uT5t9LlKoKGtxpr16eMI7llzjNG5foUYCtnCUr5mTg0=;
 b=RyzemOWDlwS3/PA/FG1wTPPWp1aWpJLqwNERmgNuVhC8ui7Q7GaXSjHe
 aYcRi/TzErT6eIvoLYo+bRhu6hznZqXiMvmiOkmfhXOra9jv3a8UkKQ4G
 NC3mr7E+zaT7lpfAPqDhDSsO4LdBYtLRMA++zPhM4+42qYv7s6tDRL37U
 2uX27AtDfYEMGSmFOHCA7pZMp58lx5Hu8kJKoJLawHCQMic7LQaM9tw1W
 gL8FN7Z+qQljF9o4H58j6RvdIxN+koY0gmgWoMUTF8iKV/3gWCWhk6yYf
 jvqVSsJYc3xzPiwEAcv+wfnMvgjoXDuPeWmuRO6iXR1HhXvZtemw9ceLx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="269926945"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="269926945"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:22:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="493637702"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:22:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: Intel: improve SoundWire _ADR handling
Date: Thu, 20 Jan 2022 17:21:55 -0600
Message-Id: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

Make sure the device version is taken into account when selecting a
machine driver, in addition to device manufacturer and part_id, and
simplify code with a macro.

Bard Liao (2):
  ASoC: SOF: Intel: match sdw version on link_slaves_found
  ASoC: SOF: Intel: Compare sdw adr directly

 sound/soc/sof/intel/hda.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

-- 
2.25.1

