Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78A11935C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9693D1660;
	Tue, 10 Dec 2019 22:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9693D1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576012228;
	bh=aQrqhvAl1YNbQrOQGx9Jm3V5qbSPBKn8X2jqsAExfqo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XGXX989dRMfPOoctMT6cdda79qjk2/+IKKJdT0ru1Q/RcpQIApAHRV0a/K5huf99h
	 oFhKET2vrYbpurw6rWbO+OAbV1akBfJ6FMMKqxTWRwdXRCsMg5xYuQ5XeJoOadSOqY
	 C/tkUwnPqsOQl492cPlfyyNhMbfADhurgtu0aSsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023D0F801D8;
	Tue, 10 Dec 2019 22:08:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB159F8020C; Tue, 10 Dec 2019 22:08:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5797BF800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5797BF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LuH4l1Nw"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDF2724687;
 Tue, 10 Dec 2019 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012116;
 bh=mZZJPkpXGAMnfeH+BanVpCPUZl+DzohFfp6s/AyksWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LuH4l1NwBTyuXAcqHNZ1XIwPH7SWKfSpjyV8QBAdwQE1hoG4Bg0Rb/+CTsJ403njR
 V5u3Wj8pbWegQO5zZkN7DcHCX8sZmVtw6uP0ZsKO1C+MZXk1N41wAC6Ton9PvK+vfo
 EsNwV/n26HINonKvdlIIev+e8DsdLkYrWoGLoKRU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:03:13 -0500
Message-Id: <20191210210735.9077-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 088/350] ASoC: SOF: enable
	sync_write in hdac_bus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit f3416e7144f5d4ba0fc5dcef6ebfff891266c46a ]

Align SOF HDA implementation with snd-hda-intel driver and enable
sync_write flag for all supported Intel platforms in SOF. When set,
a sync is issued after each verb write.

Sync after write has helped to overcome intermittent delays in
system resume flow on Intel Coffee Lake systems, and most recently
probe errors related to the HDMI codec on Ice Lake systems.

Matches the snd-hda-intel driver change done in commit 2756d9143aa5
("ALSA: hda - Fix intermittent CORB/RIRB stall on Intel chips").

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 06e84679087bc..5a5163eef2ef4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -268,6 +268,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	bus->use_posbuf = 1;
 	bus->bdl_pos_adj = 0;
+	bus->sync_write = 1;
 
 	mutex_init(&hbus->prepare_mutex);
 	hbus->pci = pci;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
