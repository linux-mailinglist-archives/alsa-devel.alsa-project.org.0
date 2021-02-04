Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83730F42A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A300116EC;
	Thu,  4 Feb 2021 14:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A300116EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612446729;
	bh=iHXCbCy38Vh7UXR8PkqkjVsAT4sMbKSELDZDxs4fP50=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X/SfMHlyUVj5AzoSUc3WLJnLFWE8IwdmBOCJ/waKkm7FlZXshx323VTITi/lGDARb
	 Nq+Nqy4CUIQe2mlhH6sJtCLpxHbsHMwMH5RCH6TOqpMskWO8uIH++4eIe+pnjcOSXX
	 jNc8emO8TkodVC+DpEl4xLIiCMx70SiCQN9WreTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE6DF8021C;
	Thu,  4 Feb 2021 14:50:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41C21F80139; Thu,  4 Feb 2021 14:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8596F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8596F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="mRNYrg7T"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601bfba60000>; Thu, 04 Feb 2021 05:50:30 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 13:50:29 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 13:50:27 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/3] Rename audio graph export functions
Date: Thu, 4 Feb 2021 19:20:09 +0530
Message-ID: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612446630; bh=dj10Gs3BbaHOUAmMCPFkQcwO1Cd4oSq8N9+7lh0+Rss=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=mRNYrg7TJ3Idx7panBFWSs8ed8piVcACwNbrakognWWxj5GJlsFVk+LS1Criny3kt
 r0n0mHZOSbcPgFttuxTmQ6PcMuXwvkgZ5iFl/YVV8Unvp6TmBaBH9RbTkMCb7Eua6I
 NNW40CFzJ3AC8WzREMY00zeRxWYXW6OFHQqDav3aj26Mz+J3e62KYLbmfQIkSZ68h8
 KT3n5SkyCHgTJXa3FVAbcCBkKulioX8PtSStxJEK9Z8eQePCiaNfcMA5VflTcyJ+tF
 W90FN66jxqbiUcTiTJ9BuUUS3xfud/8lIbRx1d10tT+RdG318gUS0ba9uK/Dcsi5Fs
 a6zIr7CUGLUyw==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

This series renames exported functions from audio graph for a better
global visibility. In doing so update the references in audio graph
and Tegra audio graph card drivers.


Changelog
=========

v1 -> v2:
---------
 [Patch v2 1/3]:
   - Rename graph_parse_of() to audio_graph_parse_of() and
     graph_card_probe() to audio_graph_card_probe() as well.

   - Update above references in audio graph driver.

 [Patch v2 2/3]: New patch
   - Update references for audio_graph_parse_of() and
     audio_graph_card_probe() in Tegra graph driver.

   - Add "Depends-on" tag

 [Patch v2 3/3]:
   - Update commit message to add "Depends-on" tag.

Sameer Pujar (3):
  ASoC: audio-graph: Rename functions needed for export
  ASoC: tegra: Update references of audio graph helpers
  ASoC: tegra: Add driver remove() callback

 include/sound/graph_card.h               |  6 ++++--
 sound/soc/generic/audio-graph-card.c     | 17 +++++++++--------
 sound/soc/tegra/tegra_audio_graph_card.c |  9 +++++----
 3 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.7.4

