Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C671C312671
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 18:38:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57238167F;
	Sun,  7 Feb 2021 18:38:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57238167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612719531;
	bh=JvvD2pyykws6XR6vJVXaoega6AFzth/yudrRm0h/YLc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s96nQkoR6Fx3MBaWWb8QoGc7H3oKHYsaJCx2fvXQF2vT+N8mFYecC5zlEjI7qnKvR
	 XKCCiiL5lYu8TcdLweLaReY7T0oIP6Gkc4zVcghz3nGVm2nWJmzCGDOTckqllKEKe0
	 gnwG0bByrugsS9GFAC81Q6GyF4oTl1Tpw2RHh8Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E703F801EC;
	Sun,  7 Feb 2021 18:37:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D20F801EB; Sun,  7 Feb 2021 18:37:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE455F8013A
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 18:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE455F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="E9JcHcTg"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602025430001>; Sun, 07 Feb 2021 09:37:07 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 7 Feb
 2021 17:37:07 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sun, 7 Feb 2021 17:37:04 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>
Subject: [PATCH v3 0/2] Rename audio graph export functions
Date: Sun, 7 Feb 2021 23:06:56 +0530
Message-ID: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612719428; bh=deN95pb8Y3cHc6wmhcWRIoGtDMyX/fLvfA0avxA1/b8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=E9JcHcTglrcb0zclaZ33P9n9+ZQomA3uoelUZIpVb0YHnWuFcEgiSL33QcDOycrYk
 t5iwQ3cKUWn9Ew355Yl9C4qUd0f7hIcsX574cEwh+YNCfSVQkCq+oZEFpysFWcD9ef
 g+W7ryBpoOPHZe/QATiB6Tkr7xaci/wuTLl9oV5Fsinp8cfHODx8vdyEAcgGDfZdSj
 CJYKKpxvq0xNe1vEnlVUGuQCAcKkO8ElItuymV0ADbV2HqDDBfVoW5V1PaRZ0nJ1RT
 sr3Fw7IAqS9DyM/Z/lWyRZzMrub/pTOW48nHqvcXUxvunRDh2qLSFia50XgT/M5X9V
 1c0Mxsd4xTHAQ==
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

v2 -> v3:
---------
 [Patch v3 1/2]:
   - Squashed "patch v2 1/3" and "patch v2 2/3". Updated commit message
     accordingly.
   - Add "Acked-by" tag from Morimoto-san.

 [Patch v3 2/2]:
   - Add "Acked-by" tag from Morimoto-san.

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

Sameer Pujar (2):
  ASoC: audio-graph: Rename functions needed for export
  ASoC: tegra: Add driver remove() callback

 include/sound/graph_card.h               |  6 ++++--
 sound/soc/generic/audio-graph-card.c     | 17 +++++++++--------
 sound/soc/tegra/tegra_audio_graph_card.c |  9 +++++----
 3 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.7.4

