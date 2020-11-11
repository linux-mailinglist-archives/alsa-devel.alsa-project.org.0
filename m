Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786B12AFAAC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:44:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242A917AB;
	Wed, 11 Nov 2020 22:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242A917AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605131075;
	bh=KV21TnYlrA3NizRlQF8Mv5FgCgW6LN489ZWRdSfN15Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B8gSiN1YnJN5moKjXN/G9sPS3ONeRoB5Arkdu02RYrJrqpxqW2iF3vrfihaeCXgF/
	 RP6CjXsal9ZIcpUT0wFpU4FXCd7UkgVY0geIU4FNJsZ/2utZobchPfQwX1/QuPSfRL
	 cv7F+v7xWbQA92beb/tD9dOuyw06erMNAmORrhOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F18FF80271;
	Wed, 11 Nov 2020 22:43:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A53F8027C; Wed, 11 Nov 2020 22:43:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E78D0F801F5
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E78D0F801F5
IronPort-SDR: g7C3wLx5F9u7XoF4U9hPIba+Gq+P4OY5BVh9I0I7JfnNrDcVsIBW4I3EaSRUqaeKwPaQAdyNU/
 yW2L6sMvrEfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149495722"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="149495722"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:32 -0800
IronPort-SDR: vrQ+vC8KuGXBY/TyGigl7pqKkw/R3cLE307nnf4W7QNzKmwYC7XIUYQXDCKVuAA+oOhrwojb2d
 vZvnw+Ee6IsA==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="356808069"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:32 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: soundwire: SDCA device quirk and cleanups
Date: Wed, 11 Nov 2020 15:43:14 -0600
Message-Id: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Add one quirk to handle new TigerLake-SDCA device and cleanup code.

Pierre-Louis Bossart (4):
  ASoC: Intel: sof_sdw: add quirk for new TigerLake-SDCA device
  ASoC: codecs: rt*.c: remove useless pointer cast
  ASoC: rt711: remove warnings
  ASoC: codecs: max98373-sdw: align regmap use with other codecs

 sound/soc/codecs/max98373-sdw.c  |  2 +-
 sound/soc/codecs/rt1308-sdw.c    |  2 +-
 sound/soc/codecs/rt5682-sdw.c    |  2 +-
 sound/soc/codecs/rt700.c         |  2 +-
 sound/soc/codecs/rt711-sdw.c     | 15 ++++++++-------
 sound/soc/codecs/rt711.c         |  2 +-
 sound/soc/codecs/rt715.c         |  2 +-
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 8 files changed, 24 insertions(+), 13 deletions(-)

-- 
2.25.1

