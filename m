Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686A94F6981
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1000B16CB;
	Wed,  6 Apr 2022 21:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1000B16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649271739;
	bh=47mxIjZG1rjZ4Kz/8HnV8eiIRF2N4CM5vuJ7TDgmvzE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oil+ju8GJdWbPnq8QORBfdRnfU/38tLXb5mZrvqR549blQpbbuBlGL6ng0p3o/vAl
	 BcojeZjRlDQovjaa44oThM0YsGtUfLu3osT5IUwNVky0rV/ahUdIwrvhJzdnEcXgFZ
	 OsIvCqk453jtPB5J7DsKxWCNtvJoAB2Nkc5Oyvpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82CBCF8020C;
	Wed,  6 Apr 2022 21:01:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3B9F800D1; Wed,  6 Apr 2022 21:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D28AF800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D28AF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VHJtJNwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649271676; x=1680807676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=47mxIjZG1rjZ4Kz/8HnV8eiIRF2N4CM5vuJ7TDgmvzE=;
 b=VHJtJNwGUyV0k5HBnrjNcq5iYij3FCuFoNUiqzPSEBAEtLQoYlgn/A4S
 bDiACiwLF0hqRb0BQ9mceEin4iGNEN1CyfTdXhLSnbKil4qw4vCRg4WQV
 a4byNqGZ0gJLhDb+awRaTDdoKNKUjwS5anbWGQON5+8VWyBbudNtFYHWZ
 xpZJwYu+y3nO+Vzc0s81fB3z3WdzAQ8h3hcR+NPogbm/euJ4VKQXiBEP4
 Q3IqC3MGnNQ85cCtPFGRLW54BXewNvf1rHbqTKA+s7TLB3DlKIu7rQb2I
 8dbecPAbxByz+IpWtpTV7TLkwJK7Sb6KFSvk9PyKoD1QJbWkqk2MoxcxQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248655756"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="248655756"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:01:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570700427"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:01:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: soc-pcm: improve BE state transitions
Date: Wed,  6 Apr 2022 14:00:54 -0500
Message-Id: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

With additional tests with the introduction of a 'deep-buffer' PCM
device mixed with the regular low-latency path, we came up with two
improvements in the BE state machine and transitions. The short
explanation is that the BE cannot directly use the trigger commands
provided by the FE, and a translation is needed to deal with paused
states.

Pierre-Louis Bossart (2):
  ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE
  ASoC: soc-pcm: improve BE transition for TRIGGER_START

 include/sound/soc-dpcm.h |  2 ++
 sound/soc/soc-pcm.c      | 38 +++++++++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.30.2

