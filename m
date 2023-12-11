Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D58580CBEC
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:55:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7487B826;
	Mon, 11 Dec 2023 14:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7487B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702302952;
	bh=pNlP4vGkarnwGp1Oo40l89Ze7xESs542YpRXB+srIjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1fgF6k9Gbj1mgmZxnDzKvNFaV9p7hrntfpV4D95ZCK9Mu0mY7GPs4+HlBNDbS8Zp
	 cscH4idqM9lRty6CVToc+0nvg+h8+98q4f5oQ5a16dbcEmxl+qYze/qdorCFkYzVeC
	 S/SqDiIGX5jmymSLh3d//DzH0Vjwv3s/9qaJ1tr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FBC4F8055B; Mon, 11 Dec 2023 14:55:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 373A5F80579;
	Mon, 11 Dec 2023 14:55:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B3E8F80166; Mon, 11 Dec 2023 14:55:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CFEAF80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CFEAF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rUxseFxl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8D1D7B80E5E;
	Mon, 11 Dec 2023 13:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9DFC433CD;
	Mon, 11 Dec 2023 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302914;
	bh=pNlP4vGkarnwGp1Oo40l89Ze7xESs542YpRXB+srIjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rUxseFxl1754/XRR4Rc/SqPrqsWRT85Fc7CLA8VjhMrKUFfwwwxwkYxFGyd3LU5hQ
	 zBs3oaPMILZmQMYcC4cjyf/Gyj7RBOnu70GmZTNWxVDEzWaDxR1wAKEXO8vuS+is4i
	 iEPdIZ5Z2GmwOtXDJblQE7TU2tyyQB0A37ZKeQYgK85NYBVnR0U9yowp0YHf+k0F6T
	 Qb5GYwsQNvSxGRX9U1Y8XRQTdN63V09+CZBp0XsHQmt0dRy7CYEGc2v4aVzOf77uZJ
	 p7aqpF4wWvmwfRJSCT2YytaDL681xMvdHjUGvVnZ7QSluUho3+dEIiQiCbI7ujrTP6
	 3rQAtKHfuaMXw==
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
Subject: [PATCH AUTOSEL 6.1 05/29] ASoC: Intel: Skylake: Fix mem leak in few
 functions
Date: Mon, 11 Dec 2023 08:53:49 -0500
Message-ID: <20231211135457.381397-5-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F63AQ34QEZXX4AYHPOAQQXMPTPI7OKRK
X-Message-ID-Hash: F63AQ34QEZXX4AYHPOAQQXMPTPI7OKRK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F63AQ34QEZXX4AYHPOAQQXMPTPI7OKRK/>
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
index 1015716f93361..7ef0041075130 100644
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

