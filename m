Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D85AAE38
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 14:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74CFE163A;
	Fri,  2 Sep 2022 14:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74CFE163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662121253;
	bh=fS3Zg6CR41DlCRJ3YlObPpVsOET9vzxsmZZDS1sOMxU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L+ybEIQO2arMPp6gUxzWy0zyfX8dYLPT8+rTGmvl9i7AX5LrMrMr2v8fY33lQT1pz
	 rtzpL+QeQXs2qnrsrotqPqbCAqZWI8ED0urwsgyu1RornmLSy6MeXjgyQJSVQUelgl
	 YycSusFr29vAyLZblDmIMeSqVyWvwHXZOF2KiHMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2EFBF80125;
	Fri,  2 Sep 2022 14:19:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF7FF8027B; Fri,  2 Sep 2022 14:19:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53AB0F80163
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 14:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53AB0F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jDj086Ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662121190; x=1693657190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fS3Zg6CR41DlCRJ3YlObPpVsOET9vzxsmZZDS1sOMxU=;
 b=jDj086MsAJEi0hS17Fdi3WXQ4Qdz3O+PU/iuaUkYXkCs7hb4/dJyPyeY
 8UrRf56yFy71oGTeZm3x+TpKCNreGCl51a4+C570sCW0oPmH12MBwcjSl
 hb+ZeY/hqgeGd+lVJwOYwRloV3u0arMFEwlbNaaPVDnugeXY/7H3wL305
 pyr3QecJkjt4fnWuYBXX5Tng2ID+M7hMwxPeeVq+xy/n4qhFCeqNfHncI
 OEvT1HqX0Fq10OdEodqXd8NNGaP8RPXRDoJ5m/1j5mfVTKSTptS/ZhjIh
 5zM1+LmT+uAbuYNttNwsSfxFCxM9iObFsBVPkfQ5LyA80fW7p/s6QLjf6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296749280"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296749280"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="563946986"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 05:19:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 0/2] lib/string_helpers: Introduce parse_int_array_user()
Date: Fri,  2 Sep 2022 14:29:26 +0200
Message-Id: <20220902122928.632602-1-cezary.rojewski@intel.com>
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
  Both suggested by Andy, thanks for thourough review


[1]: https://lore.kernel.org/alsa-devel/20220707091301.1282291-1-cezary.rojewski@intel.com/


Cezary Rojewski (2):
  lib/string_helpers: Introduce parse_int_array_user()
  ASoC: SOF: Remove strsplit_u32() and tokenize_input()

 include/linux/string_helpers.h    |   2 +
 lib/string_helpers.c              |  45 +++++++++++++
 sound/soc/sof/sof-client-probes.c | 104 ++++++------------------------
 3 files changed, 65 insertions(+), 86 deletions(-)

-- 
2.25.1

