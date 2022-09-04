Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC965AC3DC
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Sep 2022 12:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9AD8FA;
	Sun,  4 Sep 2022 12:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9AD8FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662286807;
	bh=oSm3YqgcF0nA/3IBQeWOjYMotwEj1+DdQMUXqyLYEAg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=esNTO9t2fqBtjLg64AnjO84Hm4/JrM0uAZf4s/8qts0BaBXI+txoCU9LY37Y8am8v
	 7RbL88hIjAb2uSdYEqlg3bS4BEU2uVj7Z+bVvgyJGi/LtgETclPuUoKtm90hnQkrHo
	 xbs91o2nQysEBIubZIqwXn4hNUHkaSktAuyV3LIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1729EF8016E;
	Sun,  4 Sep 2022 12:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE478F8013D; Sun,  4 Sep 2022 12:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8F9F800A7
 for <alsa-devel@alsa-project.org>; Sun,  4 Sep 2022 12:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8F9F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S3Dq2WOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662286744; x=1693822744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oSm3YqgcF0nA/3IBQeWOjYMotwEj1+DdQMUXqyLYEAg=;
 b=S3Dq2WOg0yJoYNm7jNZN73eS9CvYKCDP12iuHzaTbgVCiHJ/xIfd0N7S
 VrOFQLivuDma4hS8Kfa0GuN5hm6Mp2uhvBVNUWm43jlhCWAtiQhxFmPkt
 D7Rbvx85hiE/JLgZQ0kK44GxvufG1f0YNzseAnOupbKgk138GAUG0p16g
 rgI7oyOIBBE9bgfZR0UG/tycTkOQ4F+4E0++xyFK6G+VdFYsCSIrLQw+U
 BU7mO2mWAa8qryYOJlX6lJoL96yKIuRXx2txo6Jsa+Z57/yazEMbZI5cc
 bX/v4naSlFNQWSxPaXJ8FSN2GFo4ai71z/cd4KIB+iWKWum20lus2VHm3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="297016177"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="297016177"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 03:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="646589492"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga001.jf.intel.com with ESMTP; 04 Sep 2022 03:18:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v6 0/2] lib/string_helpers: Introduce parse_int_array_user()
Date: Sun,  4 Sep 2022 12:28:38 +0200
Message-Id: <20220904102840.862395-1-cezary.rojewski@intel.com>
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


Changes in v6:
- minor improvements in SOF code: dropped superfluous array-empty checks
  as suggested by Andy

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
 sound/soc/sof/sof-client-probes.c | 104 +++++-------------------------
 3 files changed, 61 insertions(+), 89 deletions(-)

-- 
2.25.1

