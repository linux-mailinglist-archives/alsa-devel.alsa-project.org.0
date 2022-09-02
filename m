Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0F5AB159
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 15:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766B0163B;
	Fri,  2 Sep 2022 15:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766B0163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662125075;
	bh=+HasZQGD/dK7/z/ep2cvAoa6qEef3JudFUKpRtdWqMg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A2xw3sD8cUvD7vpzah3HdYfQVeFIpSy54aRv2+Zmn44yKv28ucFs2VQlQncbNvf3a
	 rVks8anpJ6/bDoYboSQ67OX7QBS7fpcrhyswRz1e48zJPB7JOpk9bl5fXsxITAZ5fE
	 ZVA38BoAJlKaDVGC4fgw8QlvyfTp4dKhTsY06xf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBFD9F8030F;
	Fri,  2 Sep 2022 15:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EFD0F80154; Fri,  2 Sep 2022 15:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8499BF80154
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 15:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8499BF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T0TBrCz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662125012; x=1693661012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+HasZQGD/dK7/z/ep2cvAoa6qEef3JudFUKpRtdWqMg=;
 b=T0TBrCz5nDIZJTBJGy8ypxtZ2bfUyE0MXf5IccyfDQ1w6xE6oXNj7SIK
 iU52O3TfNodkzqp8jqGB20f05EkK2q/GFF00aUGvw2I5f0aFQkHVqrodq
 khbzB7WMeC2Xbfd1NAViysZGNJBAiB7pwS5TqpVaCmXgObAR0X3rTp/b6
 5xSIyuoFh6xGckNoADsfp2TU52Kcv9DiYLHvwwWiRlTCq4y6ePew+ZAty
 Ezb8MDAuDkKf8lkue29cX0IROTNBFdAo0PhYTQgwReSMvp/V9RefJ6k7/
 TddPDrsZwh/pIWxdq5tSqSaJr35wiG37vR+jjowd8Tj2TZwf70tD7p1kT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296759127"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296759127"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674352535"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2022 06:23:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v5 0/2] lib/string_helpers: Introduce parse_int_array_user()
Date: Fri,  2 Sep 2022 15:32:54 +0200
Message-Id: <20220902133256.789165-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: andy@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 intel-poland@eclists.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, willy@infradead.org, lgirdwood@gmail.com,
 hdegoede@redhat.com, andy.shevchenko@gmail.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org
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

First, parse_int_array_user() is introduced to allow for splitting
specified user string into a sequence of integers. Makes use of
get_options() internally so the parsing logic is not duplicated.

With that done, redundant parts of the sound driver are removed.

Originally similar functionality was added for the SOF sound driver. As
more users are on the horizon, it is desirable to update existing
string_helpers code and provide a unified solution.


Changes in v5:
- fixed kernel doc for parse_int_array_user()

Changes in v4:
- renamed the function to parse_int_array_user()
- at the name several local variable names have been reworded to match
  the above

Changes in v3:
- relocated tokenize_user_input() implementation to string_helpers as
  requested by Matthew

Changes in v2:
- reused get_options() so no parsing logic is duplicated
- simplified __user variant with help of memdup_user_nul()
  Both suggested by Andy, thanks for thorough review


[1]: https://lore.kernel.org/alsa-devel/20220707091301.1282291-1-cezary.rojewski@intel.com/


Cezary Rojewski (2):
  lib/string_helpers: Introduce parse_int_array_user()
  ASoC: SOF: Remove strsplit_u32() and tokenize_input()

 include/linux/string_helpers.h    |   2 +
 lib/string_helpers.c              |  44 +++++++++++++
 sound/soc/sof/sof-client-probes.c | 104 ++++++------------------------
 3 files changed, 64 insertions(+), 86 deletions(-)

-- 
2.25.1

