Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217523A83A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E4A1665;
	Mon,  3 Aug 2020 16:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E4A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596464441;
	bh=s1xI3JZjY5f7fE8LWUqpZRK1CqvQ2ufM+cG7/NWRjtY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=du9MNCmKy/g9A54o9RHVNqT1i+k0VXnC8ycVl3ilIXScNLefG8PKAyRJ/VPtg7trD
	 f5SXAfQ0f+56TjrPaWYBH0BCByeRb4NPNOYFyKmLsyI+zQFULswS2s8Cipv+Gyv6MC
	 m4c7K978OOsnmATsjyQw3hXercQOW0DpvxdA61KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3469F8023E;
	Mon,  3 Aug 2020 16:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B68AF802A2; Mon,  3 Aug 2020 16:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 365D4F800B7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365D4F800B7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC67EB5E0;
 Mon,  3 Aug 2020 14:19:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: tegra: Fix compile warning with CONFIG_PM=n
Date: Mon,  3 Aug 2020 16:18:45 +0200
Message-Id: <20200803141850.23713-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
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

Hi,

this is a trivial patch set to add the missing __maybe_unused for
covering the compile warnings with CONFIG_PM=n.


Takashi

===

Takashi Iwai (5):
  ASoC: tegra: tegra186_dspk: Fix compile warning with CONFIG_PM=n
  ASoC: tegra: tegra210_admaif: Fix compile warning with CONFIG_PM=n
  ASoC: tegra: tegra210_ahub: Fix compile warning with CONFIG_PM=n
  ASoC: tegra: tegra210_dmic: Fix compile warning with CONFIG_PM=n
  ASoC: tegra: tegra210_i2s: Fix compile warning with CONFIG_PM=n

 sound/soc/tegra/tegra186_dspk.c   | 4 ++--
 sound/soc/tegra/tegra210_admaif.c | 4 ++--
 sound/soc/tegra/tegra210_ahub.c   | 4 ++--
 sound/soc/tegra/tegra210_dmic.c   | 4 ++--
 sound/soc/tegra/tegra210_i2s.c    | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.16.4

