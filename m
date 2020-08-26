Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64741253502
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 18:35:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84151764;
	Wed, 26 Aug 2020 18:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84151764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598459744;
	bh=brdy0JqR2glpffx/r0kThUcBvo2d0EzJ3iqr15lOvi8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=igC3UBdFCI/iMnAmqnujnKE22ZjOktVgaixHfNbvLZgWnA2sWIn2UU5F0mi3/q1iM
	 lJL5PlzrJ1w+XM7IikudLiX9IXiWt0Ovn1weEYpmdwW4/hKD822Tw7zUFtrSnZjEFe
	 I7+u7g7qjOHnxovf2hHgrlR3b9WeF4DacJ0yHul4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F3BF8020C;
	Wed, 26 Aug 2020 18:34:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FAEF8020C; Wed, 26 Aug 2020 18:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92464F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 18:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92464F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1ygBdOW3"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFF49206FA;
 Wed, 26 Aug 2020 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598459628;
 bh=brdy0JqR2glpffx/r0kThUcBvo2d0EzJ3iqr15lOvi8=;
 h=From:To:Cc:Subject:Date:From;
 b=1ygBdOW3dC1CTkbTlZMd96EKiB4aF6+bBjHaJEndBO1OWYgdi7Kl3detrkIcyTtRp
 /elKUi9bMdn1rLA/My3zU82qDBs3wOJJGAUF0LoPYYx8byr+aAm5Xtqc4J3eLOoS2f
 qCGtrGUjIyynK+4eNNqxQ5cXk7gGb+MD8k04+ifk=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/5] ASoC: Fix return check for devm_regmap_init_sdw()
Date: Wed, 26 Aug 2020 22:03:35 +0530
Message-Id: <20200826163340.3249608-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Ryan Lee <ryans.lee@maximintegrated.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Shuming Fan <shumingf@realtek.com>,
 Naveen Manohar <naveen.m@intel.com>, Rander Wang <rander.wang@linux.intel.com>
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

This series attempts to fix return check for devm_regmap_init_sdw()

Changes in v2:
 - Add missing patch for rt711
 - Add patch for rt700

Vinod Koul (5):
  ASoC: max98373: Fix return check for devm_regmap_init_sdw()
  ASoC: rt1308-sdw: Fix return check for devm_regmap_init_sdw()
  ASoC: rt711: Fix return check for devm_regmap_init_sdw()
  ASoC: rt715: Fix return check for devm_regmap_init_sdw()
  ASoC: rt700: Fix return check for devm_regmap_init_sdw()

 sound/soc/codecs/max98373-sdw.c | 4 ++--
 sound/soc/codecs/rt1308-sdw.c   | 4 ++--
 sound/soc/codecs/rt700-sdw.c    | 4 ++--
 sound/soc/codecs/rt711-sdw.c    | 4 ++--
 sound/soc/codecs/rt715-sdw.c    | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.26.2

