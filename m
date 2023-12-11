Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF380CB74
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:52:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A855F843;
	Mon, 11 Dec 2023 14:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A855F843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702302761;
	bh=9pwVebdOPSAKwWi+9JBZabqnL3tOsDV5EOnZ1Y7JGTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fvMVcoxLtqutFn/kuvqjNeOqkJ0TFvqzx+GGZ3HvIgLuaLCpI2/PQNyct5MwMIioO
	 pUQ9qNf504y3+3Y+MsmSvAM8IOeu8Wchskckrfb6sEo3SR+8W8ZzTwO7MZ9oJFOABA
	 0+po/qjg0LdpX3JWrTYAWcqy7wD9EX9rfwLaLcS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BEC2F80563; Mon, 11 Dec 2023 14:52:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDFCF80124;
	Mon, 11 Dec 2023 14:52:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C821DF80166; Mon, 11 Dec 2023 14:52:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BB10F80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB10F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPu90uOn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BF2D0B80E5B;
	Mon, 11 Dec 2023 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5CFC433C8;
	Mon, 11 Dec 2023 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302729;
	bh=9pwVebdOPSAKwWi+9JBZabqnL3tOsDV5EOnZ1Y7JGTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPu90uOnhemRwt4T/Sw+iOgbSfMrJSzdHzNWTSJLaQwAp/1UuyO6fuILWhN1ylcsF
	 hdNJZP83s5PYfLknEaI4bh3fsWwZvZlZmJNfLyHA4Naga5JnzIocd3P5MxpgEFHUvA
	 O2e7IZ74XnMo50Vx0f/7V/SmpgidpVWje3mfXHp7Qae23PGatjXKfB+fEsZTIK90pP
	 J6PvjAA5mRsS90jMCr4k55zob3CYegTKCNgdVY4Fcc+3hQBDUDk9LP1A0H+0Tvgjdd
	 nJwNJeukREdVdcpfkW6p1hJLFPDWcscIZlzNX9pvjEd64FXK1j+UYTSdcoJjq8O5O5
	 99RXrNJwiHvQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kamil Duljas <kamil.duljas@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	suhui@nfschina.com,
	zhangyiqun@phytium.com.cn,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 06/47] ASoC: Intel: Skylake: Fix mem leak in few
 functions
Date: Mon, 11 Dec 2023 08:50:07 -0500
Message-ID: <20231211135147.380223-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135147.380223-1-sashal@kernel.org>
References: <20231211135147.380223-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQOD2II2O246MX2UV3YKOUSN5SLMVTMB
X-Message-ID-Hash: DQOD2II2O246MX2UV3YKOUSN5SLMVTMB
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQOD2II2O246MX2UV3YKOUSN5SLMVTMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kamil Duljas <kamil.duljas@gmail.com>

[ Upstream commit d5c65be34df73fa01ed05611aafb73b440d89e29 ]

The resources should be freed when function return error.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20231116125150.1436-1-kamil.duljas@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/skylake/skl-pcm.c     | 4 +++-
 sound/soc/intel/skylake/skl-sst-ipc.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index ac3dc8c63c260..29a03ee3d7f73 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -252,8 +252,10 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
 	snd_pcm_set_sync(substream);
 
 	mconfig = skl_tplg_fe_get_cpr_module(dai, substream->stream);
-	if (!mconfig)
+	if (!mconfig) {
+		kfree(dma_params);
 		return -EINVAL;
+	}
 
 	skl_tplg_d0i3_get(skl, mconfig->d0i3_caps);
 
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 7a425271b08b1..fd9624ad5f72b 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -1003,8 +1003,10 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 
 	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
 	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
-	if (!buf)
+	if (!buf) {
+		kfree(reply.data);
 		return -ENOMEM;
+	}
 	*payload = buf;
 	*bytes = reply.size;
 
-- 
2.42.0

