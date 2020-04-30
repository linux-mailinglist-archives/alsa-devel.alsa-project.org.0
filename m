Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 491601BFC02
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:03:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD55169B;
	Thu, 30 Apr 2020 16:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD55169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588255413;
	bh=FDZY+s+wCtA2hrGYGuRdyfgJiqpSlmXqbgsFOKZZSPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s7ztUlxhEp9Mk35T/ovBEs8Rl/xhAerxjUNByNfpQG/7Tas8898kYe/B3nP9Ozjvf
	 xeyTSOtTkOQiDO0pgd7lhHgNzR37b/Hqxun4rmFDrcKmDhpueK27ngTb3CQqPrOVQc
	 mC/c8g8q7FAMXhj4nBtfU8nmS8Ki68jKcbip5y6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20B55F8034F;
	Thu, 30 Apr 2020 15:52:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70EB7F8034E; Thu, 30 Apr 2020 15:52:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7665FF80349
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7665FF80349
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="apdE4DwC"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B5B22137B;
 Thu, 30 Apr 2020 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254743;
 bh=FDZY+s+wCtA2hrGYGuRdyfgJiqpSlmXqbgsFOKZZSPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=apdE4DwCalqSFFEh6H/41dmMxZkMLHLFQZHSD/M2VzFAyPJBn4WemAAVKoTYAs8gR
 9jzJuKmFmITdnuviv3NM4zL++o5B4Tzsd0OPY0bcYvCKjXnA+lzEoFc9T16RUWZ6dX
 WgNeyO0oQNqKQaLBS9WHMnQWcDCjiiHy4WN4OXek=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/57] ASoC: topology: Check return value of
 soc_tplg_create_tlv
Date: Thu, 30 Apr 2020 09:51:24 -0400
Message-Id: <20200430135218.20372-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135218.20372-1-sashal@kernel.org>
References: <20200430135218.20372-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 482db55ae87f3749db05810a38b1d618dfd4407c ]

Function soc_tplg_create_tlv can fail, so we should check if it succeded
or not and proceed appropriately.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200327204729.397-3-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-topology.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 17556a47f7274..c2901652a6d04 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -893,7 +893,13 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		}
 
 		/* create any TLV data */
-		soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
+		err = soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
+				mc->hdr.name);
+			kfree(sm);
+			continue;
+		}
 
 		/* pass control to driver for optional further init */
 		err = soc_tplg_init_kcontrol(tplg, &kc,
@@ -1354,7 +1360,13 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		}
 
 		/* create any TLV data */
-		soc_tplg_create_tlv(tplg, &kc[i], &mc->hdr);
+		err = soc_tplg_create_tlv(tplg, &kc[i], &mc->hdr);
+		if (err < 0) {
+			dev_err(tplg->dev, "ASoC: failed to create TLV %s\n",
+				mc->hdr.name);
+			kfree(sm);
+			continue;
+		}
 
 		/* pass control to driver for optional further init */
 		err = soc_tplg_init_kcontrol(tplg, &kc[i],
-- 
2.20.1

