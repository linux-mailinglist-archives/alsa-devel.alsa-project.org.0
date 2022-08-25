Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6185A16CE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 18:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA1AB164D;
	Thu, 25 Aug 2022 18:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA1AB164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661445650;
	bh=zAouvVhGGQU1mycPi0W4g/pSkl96QhPOemhs9ryS1uE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sELkdhAdBBbBSmovKfk5GSHQvrwu4VnHBDgf13q4XXvheu9S7EW3hSDWg9Ub8kfPG
	 /lGQtaTjSrcD9kZW1mySguMIjwE6WvdB+Xf0QzzOL9s0Hgnfl3FjvFee/zFkbWuJBz
	 nio4jlLer8dvtVd6SV3AXVUddY3jWltdYFvY5zCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE9DF80525;
	Thu, 25 Aug 2022 18:39:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2650FF80525; Thu, 25 Aug 2022 18:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86C48F80525
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 18:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C48F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JnQS77Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661445550; x=1692981550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zAouvVhGGQU1mycPi0W4g/pSkl96QhPOemhs9ryS1uE=;
 b=JnQS77AyiVN+KsExNnL3oAyaDoGniMliSl5HrT7TiYY2u+8O9mrZjh4D
 65liw7b4AJ1C2HBwRBy16WOVzL/4j7qvJ71gYyRjSe4YjvKkIBzvKd9p1
 /BIH0IP0Cu9+D/feX/GDTW9p0+dpmjL3ENLh2ARUiN0VWmwLimK2kmbrv
 MD/7eH9BDqIiGSXKqAgMfbcdvmRhkUPhKHlXAcBTFRLM3MHBEgmNcFzEd
 q6+oo2rD/eyfU67GLbc2FeQCtcFVM5WHR1w6Cz0K3Lu+LczHquE+oiN3N
 OMazTpRt3yVaRc2M6syUTpk0bO++18h+/6gA0JJnKZmDanuT8NEmgzY1Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274045973"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="274045973"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 09:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="671070402"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2022 09:38:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 0/2] libfs: Introduce tokenize_user_input()
Date: Thu, 25 Aug 2022 18:48:31 +0200
Message-Id: <20220825164833.3923454-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, hdegoede@redhat.com,
 andy.shevchenko@gmail.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, linux-fsdevel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
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

Continuation of recent upstream discussion [1] regarding user string
tokenization.

First, tokenize_user_input() is introduced to allow for splitting
specified user string into a sequence of integers. Makes use of
get_options() internally so the parsing logic is not duplicated.

With that done, redundant parts of the sound driver are removed.

Originally similar functionality was added for the SOF sound driver. As
more users are on the horizon, it is desirable to update existing fs
code and provide a unified solution.


Changes in v2:
- reused get_options() so no parsing logic is duplicated
- simplified __user variant with help of memdup_user_nul()
  Both suggested by Andy, thanks for thourough review


[1]: https://lore.kernel.org/alsa-devel/20220707091301.1282291-1-cezary.rojewski@intel.com/


Cezary Rojewski (2):
  libfs: Introduce tokenize_user_input()
  ASoC: SOF: Remove strsplit_u32() and tokenize_input()

 fs/libfs.c                        | 45 +++++++++++++++
 include/linux/fs.h                |  1 +
 sound/soc/sof/sof-client-probes.c | 92 ++++---------------------------
 3 files changed, 57 insertions(+), 81 deletions(-)

-- 
2.25.1

