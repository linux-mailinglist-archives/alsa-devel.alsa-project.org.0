Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602AD63AF7F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:42:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDC0416A5;
	Mon, 28 Nov 2022 18:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDC0416A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657365;
	bh=NzvipcFRF9q5bE/cNdqVOSWroprF8Tiijl7/qRLdyoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJAgpfsmQsSSt4KwQmcWDB8Qu326fnMGHg77yKCu3X7YERRjdcOQ314MZ4kUGvuo9
	 OSI3MeiwdK7gUwhsFseVrASRlf1BaHBzAD6i9ALQumanG3P93G2LEOiLcK8JWjqkNM
	 eiQKNebO+VanQsPrgEwzMP6TG5l2MuaFGc6NLj2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24DBCF80563;
	Mon, 28 Nov 2022 18:41:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA69BF8055C; Mon, 28 Nov 2022 18:41:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5EC0F801D8
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5EC0F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dp19Qn1B"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 850C661309;
 Mon, 28 Nov 2022 17:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D735C433D7;
 Mon, 28 Nov 2022 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657269;
 bh=NzvipcFRF9q5bE/cNdqVOSWroprF8Tiijl7/qRLdyoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dp19Qn1BHi1qLOIeFwigolo/9j6dExRse9nAF1YVPXr0ZpMo+oGwIpFlH+g5zXL+K
 Ex/M/be/AdBnDXas0cKyDQeeR3R79TDd/FZye7MWIEgECLGHGyN4ySUnjw42SpiZhq
 foDFEajKTvwSpsRKQ3QmRUUoPYy3glCmKPeKJ35wccH3jdNLmJaY9UU6vh/vw+ssWb
 EcuUMYnjmbsmwTDopb7i4xWHhptq4rLvOmVipLQSshVpSIghd13VuNO8PoSNkt7vE+
 wD/2CefZXOuTmM8FGKD0DzyZZ8PjcIWQ5VQ+5BH3RPD+P4FhtnLp1WEeZVSbRuwJ/z
 at+VmzKU5PsTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 19/24] ASoC: soc-pcm: Add NULL check in BE
 reparenting
Date: Mon, 28 Nov 2022 12:40:19 -0500
Message-Id: <20221128174027.1441921-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174027.1441921-1-sashal@kernel.org>
References: <20221128174027.1441921-1-sashal@kernel.org>
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
index 48f71bb81a2f..de837bacf219 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1171,6 +1171,8 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 		return;
 
 	be_substream = snd_soc_dpcm_get_substream(be, stream);
+	if (!be_substream)
+		return;
 
 	for_each_dpcm_fe(be, stream, dpcm) {
 		if (dpcm->fe == fe)
-- 
2.35.1

