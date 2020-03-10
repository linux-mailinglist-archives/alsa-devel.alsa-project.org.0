Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC611803AA
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 17:38:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE961607;
	Tue, 10 Mar 2020 17:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE961607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583858287;
	bh=vdnO1mD5uP9Ut6DxkvLV2R/8hUHrcWzbroHl7Qu4ua4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yxj9kV41krzglxJnQTwlvNrYZOw2n1UkJ4Pyp0Bwaf4QpzQYeQPnsnxMrojs/Tkkx
	 +uFe5d+5ylQbs6JO8rHDEJ6oAKumq51aL13lltXAodrblTvN7VYgSLkulY0lG2cotU
	 vu7vC06hSc6mBCl0Q2QNjh2IXsqSp+bNWx1UCQng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16088F8020C;
	Tue, 10 Mar 2020 17:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA4DBF8028C; Tue, 10 Mar 2020 17:35:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2E79F800BC
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 17:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E79F800BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 09:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; d="scan'208";a="388985481"
Received: from djdickof-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.192.103])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2020 09:35:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: rt5682: fix unmet dependencies
Date: Tue, 10 Mar 2020 11:35:07 -0500
Message-Id: <20200310163509.14466-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
References: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
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

The rt5682 code can be used in I2C or SoundWire mode. When I2C is not
selected, we have the following issue:

WARNING: unmet direct dependencies detected for SND_SOC_RT5682
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] &&
  I2C [=n]
  Selected by [m]:
  - SND_SOC_RT5682_SDW [=m] && SOUND [=m] && !UML && SND [=m] &&
    SND_SOC [=m] && SOUNDWIRE [=m]

Fix by adding SOUNDWIRE as a dependency.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 03f6fc6de9192f ('ASoC: rt5682: Add the soundwire support')
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6aee70ed43df..78be69e9b618 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1135,7 +1135,7 @@ config SND_SOC_RT5677_SPI
 
 config SND_SOC_RT5682
 	tristate
-	depends on I2C
+	depends on I2C || SOUNDWIRE
 
 config SND_SOC_RT5682_SDW
 	tristate "Realtek RT5682 Codec - SDW"
-- 
2.20.1

