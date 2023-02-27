Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D9D6A375B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 03:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2765283B;
	Mon, 27 Feb 2023 03:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2765283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677463739;
	bh=MlICvfNlkt/04BgB922RhkwmhiqwArFoMZV1CyQ2w1o=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EeUujG9LBiuFjQ9ybfbOBDhBxQF8AQRbGDXW7tntpT7mmmn8OymVYm5FoMWaBYaN/
	 He88NsDR9NjJAdEDLY4ONKOQYvz9uAKB9VI46R0nBVbyzQ+t2sgmwbBRQz9z1ejnu3
	 u18tGxkdcisZoNGVqXykMvSIEED3t8AatmSVVO+8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C7F7F8051B;
	Mon, 27 Feb 2023 03:07:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC701F8049C; Mon, 27 Feb 2023 03:07:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9833DF802BE
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 03:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9833DF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SfXucv6o
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27D5560D14;
	Mon, 27 Feb 2023 02:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C4FC43442;
	Mon, 27 Feb 2023 02:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677463626;
	bh=MlICvfNlkt/04BgB922RhkwmhiqwArFoMZV1CyQ2w1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SfXucv6oQsbnQZZYADAS8Or/Yq/Wy5DwuhXB+TyqCzMYf4iUJMYUdj6R/j6Cc4jRz
	 LXFamvFScL4s54cnsvuidEtEctFLsCj2Yza7F+KY4oaY2NuKtTvBMSIxSKtNJOW1R8
	 8C81yuywBW3OIQQRzhjymikQ6W9wX5ja3wqyBdaolsswt0NoeTcqE+a+BvCgHLjAkp
	 OqOHNApxZEr3mzq/ynn7uJnV/qtK29Isf7IJuNFSSGLNgpBExJ3XiWneBGatFTMwEk
	 ts1TLN5CjhlnXL7L+STfeIU3NRndGnlH/rSn2WLS7anznj5FkziYSy0+R4bfgoSDIL
	 F7rijOKWRa2iQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 33/58] ASoC: soc-compress: Reposition and add
 pcm_mutex
Date: Sun, 26 Feb 2023 21:04:31 -0500
Message-Id: <20230227020457.1048737-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IY7EHJJY3Q4QRDHXGEUERODTGLEZKP3I
X-Message-ID-Hash: IY7EHJJY3Q4QRDHXGEUERODTGLEZKP3I
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?q?=EA=B0=95=EC=8B=A0=ED=98=95?= <s47.kang@samsung.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 vkoul@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IY7EHJJY3Q4QRDHXGEUERODTGLEZKP3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: 강신형 <s47.kang@samsung.com>

[ Upstream commit aa9ff6a4955fdba02b54fbc4386db876603703b7 ]

If panic_on_warn is set and compress stream(DPCM) is started,
then kernel panic occurred because card->pcm_mutex isn't held appropriately.
In the following functions, warning were issued at this line
"snd_soc_dpcm_mutex_assert_held".

static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
		struct snd_soc_pcm_runtime *be, int stream)
{
	...
	snd_soc_dpcm_mutex_assert_held(fe);
	...
}

void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
{
	...
	snd_soc_dpcm_mutex_assert_held(fe);
	...
}

void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
			    int stream, int action)
{
	...
	snd_soc_dpcm_mutex_assert_held(rtd);
	...
}

int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
	int event)
{
	...
	snd_soc_dpcm_mutex_assert_held(fe);
	...
}

These functions are called by soc_compr_set_params_fe, soc_compr_open_fe
and soc_compr_free_fe
without pcm_mutex locking. And this is call stack.

[  414.527841][ T2179] pc : dpcm_process_paths+0x5a4/0x750
[  414.527848][ T2179] lr : dpcm_process_paths+0x37c/0x750
[  414.527945][ T2179] Call trace:
[  414.527949][ T2179]  dpcm_process_paths+0x5a4/0x750
[  414.527955][ T2179]  soc_compr_open_fe+0xb0/0x2cc
[  414.527972][ T2179]  snd_compr_open+0x180/0x248
[  414.527981][ T2179]  snd_open+0x15c/0x194
[  414.528003][ T2179]  chrdev_open+0x1b0/0x220
[  414.528023][ T2179]  do_dentry_open+0x30c/0x594
[  414.528045][ T2179]  vfs_open+0x34/0x44
[  414.528053][ T2179]  path_openat+0x914/0xb08
[  414.528062][ T2179]  do_filp_open+0xc0/0x170
[  414.528068][ T2179]  do_sys_openat2+0x94/0x18c
[  414.528076][ T2179]  __arm64_sys_openat+0x78/0xa4
[  414.528084][ T2179]  invoke_syscall+0x48/0x10c
[  414.528094][ T2179]  el0_svc_common+0xbc/0x104
[  414.528099][ T2179]  do_el0_svc+0x34/0xd8
[  414.528103][ T2179]  el0_svc+0x34/0xc4
[  414.528125][ T2179]  el0t_64_sync_handler+0x8c/0xfc
[  414.528133][ T2179]  el0t_64_sync+0x1a0/0x1a4
[  414.528142][ T2179] Kernel panic - not syncing: panic_on_warn set ...

So, I reposition and add pcm_mutex to resolve lockdep error.

Signed-off-by: Shinhyung Kang <s47.kang@samsung.com>
Link: https://lore.kernel.org/r/016401d90ac4$7b6848c0$7238da40$@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-compress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 870f13e1d389c..7bce5088b4554 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -149,6 +149,8 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto be_err;
 
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_process_paths(fe, stream, &list, 1);
 	fe->dpcm[stream].runtime = fe_substream->runtime;
@@ -184,7 +186,6 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_activate(fe, stream);
 	mutex_unlock(&fe->card->pcm_mutex);
 
@@ -215,7 +216,6 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_deactivate(fe, stream);
-	mutex_unlock(&fe->card->pcm_mutex);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
@@ -234,6 +234,8 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	dpcm_be_disconnect(fe, stream);
 
+	mutex_unlock(&fe->card->pcm_mutex);
+
 	fe->dpcm[stream].runtime = NULL;
 
 	snd_soc_link_compr_shutdown(cstream, 0);
@@ -409,8 +411,9 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	ret = snd_soc_link_compr_set_params(cstream);
 	if (ret < 0)
 		goto out;
-
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
+	mutex_unlock(&fe->card->pcm_mutex);
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 
 out:
-- 
2.39.0

