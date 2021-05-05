Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7680374107
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:42:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 741F9171F;
	Wed,  5 May 2021 18:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 741F9171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232955;
	bh=slT+Q2dWhK/Pdvc0JkBxSi4ZYL05dsOo7M1WRdImxtA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hmw1ENvZ5ruJkBM/jW6oaExgGIDPgavxeFk64uo8TIkJ8sP/sduo9lYPFlXslfMYh
	 DB2RcfM/Q+tR6tywgyncZira66nTRxMi0IYawp+5DgF83dfvSoG9YIzFypGQIkiaVj
	 MpwoHLbnJlFDTUxBtNYPpVYdCFK5Ht872SFmfuuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9291AF8053D;
	Wed,  5 May 2021 18:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF26F8053B; Wed,  5 May 2021 18:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E5E0F80538
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E5E0F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DsJA/i5N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF9EC613F1;
 Wed,  5 May 2021 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232522;
 bh=slT+Q2dWhK/Pdvc0JkBxSi4ZYL05dsOo7M1WRdImxtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DsJA/i5NsmkLnJHFgMqKNeR/bAVJo3exi4PWsym3X71QcWTpZ8Q9lyqZ7QFaFDehK
 09jx4tUVjRmZxetLNTVhbeys1pBKwkwh+hol6xGb5Lu8y3aX68bMApuBwYfXVBZg37
 wJHxDnhbd8EApr3hHU4tXZPBp4R5GvrxA33fJnXIYAgqGXCKuw6vI/T6XZbn+QOF7Q
 upm10Rzc4nrOcZJaZOCpHaCa/R5bHWWjFNABcPV3qJlqoDgVNn595uMQ5riD54zIIG
 4hrZ1REMxXMPw2HfYAqrY1ljrqwaU/gMXibXsTIqTwcnynalfc9N0fK5cQAaU5gp+x
 NV1XeEH2vJSsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 048/104] ASoC: soc-compress: lock pcm_mutex to
 resolve lockdep error
Date: Wed,  5 May 2021 12:33:17 -0400
Message-Id: <20210505163413.3461611-48-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Gyeongtaek Lee <gt82.lee@samsung.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
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

From: Gyeongtaek Lee <gt82.lee@samsung.com>

[ Upstream commit 45475bf60cc1d42da229a0aa757180c88bab8d22 ]

If panic_on_warn=1 is added in bootargs and compress offload playback with
DPCM is started, kernel panic would be occurred because rtd->card->pcm_mutex
isn't held in soc_compr_open_fe() and soc_compr_free_fe() and it generates
lockdep warning in the following code.

void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
			    int stream, int action)
{
	struct snd_soc_dai *dai;
	int i;

	lockdep_assert_held(&rtd->card->pcm_mutex);

To prevent lockdep warning but minimize side effect by adding mutex,
pcm_mutex is held just before snd_soc_runtime_activate() and
snd_soc_runtime_deactivate() and is released right after them.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Link: https://lore.kernel.org/r/1891546521.01617772502282.JavaMail.epsvc@epcpadp3
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 246a5e32e22a..b4810266f5e5 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -153,7 +153,9 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_activate(fe, stream);
+	mutex_unlock(&fe->card->pcm_mutex);
 
 	mutex_unlock(&fe->card->mutex);
 
@@ -181,7 +183,9 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
 
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_deactivate(fe, stream);
+	mutex_unlock(&fe->card->pcm_mutex);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
-- 
2.30.2

