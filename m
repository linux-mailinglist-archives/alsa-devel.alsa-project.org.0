Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B7C1DC7CD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 09:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AAD9182F;
	Thu, 21 May 2020 09:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AAD9182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590046733;
	bh=T3C7aC7cK5XnqGqzgY4boiSa2YTP3/oCAFpAwG8lTos=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T9UJtwZWJG8LfEol5p1c1A7smW7pG+a9FNFsYrENszga5DaBumfXv5tQTF8pw3hDK
	 1V8zlux/cdgIJ1d85GpfWwEmL3qpK2acMBffCWT/0k7TW6hTdY+ie2f4NhXodEB9M/
	 n5+Tojb/RPXlVcsPfchV/B5vfSHFsr3rqh6cE/Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6937EF801D8;
	Thu, 21 May 2020 09:37:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D939F80229; Thu, 21 May 2020 09:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76AE0F80161
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 09:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76AE0F80161
IronPort-SDR: /eNk19XSAaLt/KkFF3Fo0QjWnvHn6bB0QqY/t/dRZyaykTW9a70dNR1zauHuAZg4oH0A2dy9H3
 NdjwoEmeoxiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 00:36:59 -0700
IronPort-SDR: kpJn1DlEBbE7xMYEmEGXr4mNWomCtxGEOJ+ZH2kxzu6qD9XTXCBhizwDcE468NNw7FmW/xR1yY
 QDGr6w0vf+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="268548029"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by orsmga006.jf.intel.com with ESMTP; 21 May 2020 00:36:55 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] ASoC topology header parsing refinement
Date: Thu, 21 May 2020 15:48:45 +0800
Message-Id: <20200521074847.71406-1-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org
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

This small series is to optimize the header logging during the topology
parsing. This is verified work fine on both SOF and SST drivers
(bxt_rt298 with dfw_sst.bin).

Change History:
v2:
- Change the internal used array to be 'static' to fix the issue
  reported by: kbuild test robot <lkp@intel.com>
- Add testing coverage including Intel SST driver also.

v1:
- Initial version.

Keyon Jie (2):
  ASoC: topology: refine and log the header in the correct pass
  ASoC: topology: remove the redundant pass checks

 sound/soc/soc-topology.c | 99 ++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 55 deletions(-)

-- 
2.25.1

