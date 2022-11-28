Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5D63AFC7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:45:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380951726;
	Mon, 28 Nov 2022 18:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380951726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657534;
	bh=mYDS8NhRtn6iHirANvokxO19PldCMN2N89AlLM3kj5s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GKMSI5CKM29khK+NclW2d0TEQRfrf+VLrkQKbCeCsdTnlra0c65K6wLVFvtHc1NmS
	 lfLUu3Uy+Rg85DWfmvNhWE+tSnEdVxwWi6w3X+nzibBjIcLM27HnTlmYOLeVx4tIfH
	 ma8m1yYiTZCTAltbxHygyQPtLkrPM+5DPNvNP9+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C837F8057E;
	Mon, 28 Nov 2022 18:43:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4573F8057A; Mon, 28 Nov 2022 18:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B27EF8057A
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B27EF8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C/2HPI6u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 333896130B;
 Mon, 28 Nov 2022 17:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5B6C43141;
 Mon, 28 Nov 2022 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657414;
 bh=mYDS8NhRtn6iHirANvokxO19PldCMN2N89AlLM3kj5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/2HPI6udJk+NmsRVsQLYP6owdJQ9/ItPQy6+KzwrtgtSdHqcngBzr0zkSTmgUmk5
 DBikLAcJq3kWNn2jerVywa+vBkwqPGiUxtUTnBoA5iNklnrd0veEa36q2wSwP+cDst
 mKFXhWySDeU9ekx27CgKZvrrJEtgkEhwOMl62JjrFHFz3HwpVvaA8YGB/lk2rCd0nX
 g2gV9KDrk2Z8z3aZS260aoDpLUsLn8EXWq2lsJ2glDNTVIc0peSzilkOsCzIACBKb3
 2KgTNGvF25ZU4lR6cDz2UwlbjK9zzIRUZIFFnTQdOSDhWyeKifnHRYuNeHDl3jjE+Z
 subU+myQCxb/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 5/5] ASoC: soc-pcm: Add NULL check in BE
 reparenting
Date: Mon, 28 Nov 2022 12:43:23 -0500
Message-Id: <20221128174324.1443132-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174324.1443132-1-sashal@kernel.org>
References: <20221128174324.1443132-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

[ Upstream commit db8f91d424fe0ea6db337aca8bc05908bbce1498 ]

Add NULL check in dpcm_be_reparent API, to handle
kernel NULL pointer dereference error.
The issue occurred in fuzzing test.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Link: https://lore.kernel.org/r/1669098673-29703-1-git-send-email-quic_srivasam@quicinc.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 6c31a909845c..f6cebe2b3cbb 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1182,6 +1182,8 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 		return;
 
 	be_substream = snd_soc_dpcm_get_substream(be, stream);
+	if (!be_substream)
+		return;
 
 	list_for_each_entry(dpcm, &be->dpcm[stream].fe_clients, list_fe) {
 		if (dpcm->fe == fe)
-- 
2.35.1

