Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC530DF4C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 17:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAB001764;
	Wed,  3 Feb 2021 17:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAB001764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612368699;
	bh=otKkpLE5mA8PLxD6Xbc91TP8eTNf8OM+mXS8NGgiRJU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TbnUeehNGGoCQJFd+ZAxzvhLloKz7tZv/v7gesi8XWb2Js7jWN71Wb0+z7L+US2Np
	 AlJN1oXnjja7SkcWJFEW+q/V1GMkpkVtIp/LiKjD64rBvzfpQCbAVNmF9Hxgo1BrNs
	 VYH/iOcAWgc0UNY7WtPJBev7AyatOn/E2zbY5+0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 118A4F80154;
	Wed,  3 Feb 2021 17:10:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A9AEF8016E; Wed,  3 Feb 2021 17:10:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49E42F8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 17:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E42F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="F4ayGu5P"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601acad30000>; Wed, 03 Feb 2021 08:09:55 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Feb
 2021 16:09:55 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 3 Feb 2021 16:09:52 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/2] Add remove path for Tegra audio graph card
Date: Wed, 3 Feb 2021 21:39:33 +0530
Message-ID: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612368595; bh=mdEjIwUsTxOW77J3RnmCZ4pTZ0Qu0nvmWND3Zms5/f4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=F4ayGu5PT0iyyJpOrH2xeEFMQAG0FO/HOtM39Wq+RISGDSLMiDqGbFzarQk9t5/dx
 BR+ODcbO8N3QMnKqQ+THZlLx39pCfnpKIlxkg4xBEv0wIdeweFX5pwfS2f5Ls/BfNA
 9No1oHO5yjCt9gGA7gl3F4xLJP0/B+Yfiy6XNejmJC9UUqfXm3hCjRqWMHVwKdAjLD
 iL6eyX9cU62mHYJtk9j11CgEA/jDqASY3SIGA/VWOcCXPmWcBcItXCEcXK+YawF5N8
 tzwyfQd7ffGAK4E4um2rHjkHHEQwAJ4lJTctrd+p15gmCGaH97dKqehdBSwb+uvF7b
 uwLNTTC0aNPmw==
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

Audio graph driver cleans up phandle references of CPU/CODEC nodes in
graph_remove() path. As Tegra graph card driver is based on this
populate remove callback for it.

Sameer Pujar (2):
  ASoC: audio-graph: Export graph_remove() function
  ASoC: tegra: Add driver remove() callback

 include/sound/graph_card.h               | 2 ++
 sound/soc/generic/audio-graph-card.c     | 3 ++-
 sound/soc/tegra/tegra_audio_graph_card.c | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

