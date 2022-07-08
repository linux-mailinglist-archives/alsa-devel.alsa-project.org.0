Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EE56B7E9
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 13:01:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B064162F;
	Fri,  8 Jul 2022 13:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B064162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657278105;
	bh=vX0LXOjPe5wHubgKMhzK0+foV8zUXKysdUaRZeeDKDA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lbvuxzg7m2cqWlsjfIa+8Q2cMDd7X8EAe5VmlwLnuoBxOA+33ugvyiyjtJ7Kl7Kss
	 3T/iZ8fPie7+mKwZS+tUTDPEyqf2H63ESbU16ZtfcoqO0xQGhTdv6XSeiXMzug0qqB
	 4BQWprcZcIJUaS9hSFHiSDemmu5f0POm5XuCDW2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D9BF8025B;
	Fri,  8 Jul 2022 13:00:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9AD3F800C5; Fri,  8 Jul 2022 13:00:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14008F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 13:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14008F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NEWvXmna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657278041; x=1688814041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vX0LXOjPe5wHubgKMhzK0+foV8zUXKysdUaRZeeDKDA=;
 b=NEWvXmnai32G4D48f9rHA5hQ6YYzwsvW6jXqq3SGgPZwWdufZ1F55R+h
 gkFlbhBRJ4BKO4jk5opkLWOBKv+07hJjXfEUXCHLYc1+CPz7TQKfx7bEx
 x6bFufPRgX7gydY4wL4swA1WP04tMKvYamJ9rzgrhrEX3o8EP01YWcyzD
 6QaXVHE6hA+39OwL/8qTXkmlOUUQdqLyTplu75HlfBf1oIQDWXmkviy1n
 fQdn7XDdQr5KV7O572yXEjhXuHTzmTYUt31FrUZ96HXR6MuD+WTjuYeUU
 UcFI7NPgqNcJ3BLJOYciMoD/9zmLv/K2Z38ud70Gf/5txkEaY54FUuf3g w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264668533"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="264668533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 04:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="651524632"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2022 04:00:33 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v8 0/2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload
Date: Fri,  8 Jul 2022 19:00:28 +0800
Message-Id: <20220708110030.658468-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 linux-kernel@vger.kernel.org
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

1. Add BT offload fetch to cs42l42 machine driver
2. Support cs42l42+max98360a on ADL platform

V8 Changes:
- split the V7 patch into two patches; one for BT offload feature, the other for new board config
- change topology name to sof-adl-max98360a-cs42l42.tplg
- remove useless variable 'ret' in create_bt_offload_dai_links

Brent Lu (2):
  ASoC: Intel: sof_cs42l42: support BT offload audio
  ASoC: Intel: sof_cs42l42: add adl_mx98360a_cs4242 board config

 sound/soc/intel/boards/sof_cs42l42.c          | 86 ++++++++++++++++++-
 .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++
 2 files changed, 89 insertions(+), 4 deletions(-)

-- 
2.25.1

