Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6E80CC50
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 15:00:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF59AE8;
	Mon, 11 Dec 2023 14:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF59AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702303209;
	bh=qevDLRP32SAMdYjSN/Ie2iVDY7FiTH9LcdyLcgeiTDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0yB/NdBcieYl8MzkR8zBDyHd7vyAR2fd7qs8Wwp0JzkE6NMIhYttqd0UJkMiCRd8
	 47GwnEh+maREZnhn8A0YHMAXV7skiTpzuQTnU1CFOF5yQu0kG3NMBa3ty18p6MX4ZB
	 4Qfv7YRC24E/Sv1onznbHLnWBZo7zz58EfdVEMSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA95F8057C; Mon, 11 Dec 2023 14:59:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28AFAF80571;
	Mon, 11 Dec 2023 14:59:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49C99F80166; Mon, 11 Dec 2023 14:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84BBEF80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84BBEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mEjzYADx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2026BB80E58;
	Mon, 11 Dec 2023 13:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CFDC433C7;
	Mon, 11 Dec 2023 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702303166;
	bh=qevDLRP32SAMdYjSN/Ie2iVDY7FiTH9LcdyLcgeiTDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mEjzYADxbsLAQo99lGtKicN+gxsaT8HW04Uxj+gS27Jij9fvf7g1aU4e3tZALT5EH
	 9AMhPtTwIrnE7uc2GgvFPvBJTcaqPiGkcjaF+vkldn4ln1WR5X68MrHSU36VEvPwOu
	 ihQWLIhYGtYraHdlEZCw52fz38iJwdeHcvC8JIE9lHV4vPXTW7DUdp5ybq19d5EYdu
	 z3aTKywaroYVtDYHSm3K/26xWtsdl11Lbke/N5zgMBle/eibv7HQNnYGKGyEr8HtwQ
	 L1RpYvo187Ehe05V1tyzid/HvF2uay9KnwqoWHSlJov/flkV+N1VOUhE/y5OCx/eyY
	 tNu+n6qetjldA==
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
	kuninori.morimoto.gx@renesas.com,
	zhangyiqun@phytium.com.cn,
	suhui@nfschina.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/19] ASoC: Intel: Skylake: Fix mem leak in few
 functions
Date: Mon, 11 Dec 2023 08:57:36 -0500
Message-ID: <20231211135908.385694-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135908.385694-1-sashal@kernel.org>
References: <20231211135908.385694-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.142
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33W3GG2SRWXIOWE5N2CRBKXINITFZI6D
X-Message-ID-Hash: 33W3GG2SRWXIOWE5N2CRBKXINITFZI6D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33W3GG2SRWXIOWE5N2CRBKXINITFZI6D/>
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
index db41bd7170650..0d08b0269a662 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -251,8 +251,10 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
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

