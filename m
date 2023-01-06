Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83988660A29
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 00:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 274254F6C;
	Sat,  7 Jan 2023 00:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 274254F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673047061;
	bh=rD3rMpRr6Vwh5MAIJxJWqDE46f7CDiE9s2HcbItURUo=;
	h=From:Date:Subject:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g4JV5VRvMlez5mv8Vm4iizuhFbt9DIFjN8f5dfrTxC8hUXh0k1Z5xe0e9elM06KXc
	 O69cGoBtDQ+TVQR1G6OaGT/3J8tyJl2JUVY3P6OOCKeh9el/twfMK51BPuU8crIFkc
	 gAPDo6ptxsJhkZNqXqVcL7vRyJbw9YV5KJs5spWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D1EF8024E;
	Sat,  7 Jan 2023 00:16:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2F62F8024E; Sat,  7 Jan 2023 00:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A347F8024E
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 00:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A347F8024E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xg9JTNiT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C35FB81EFE;
 Fri,  6 Jan 2023 23:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A24C433D2;
 Fri,  6 Jan 2023 23:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673046972;
 bh=rD3rMpRr6Vwh5MAIJxJWqDE46f7CDiE9s2HcbItURUo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Xg9JTNiTsjyqPtnFIRPa46TnyjsEQc3iLVkKXz959LHbRRGZ9iUCfsAWO9CZIch7R
 A+yY4UqcC5DZkYASwdhZB9U3vwBtOYBZCOYEvz/hjK9L7SlZElAUHM/mpWRivHEKH5
 dnYbdqmL23sUbl2kfVp+ITzk9DiEyAeGN8363wz+xWbaRjdtQzA1N4q71sFdlDA2v6
 gQlqaL5zsd0mFwNOELMN2IsUbHcYGvrqk4eiL8vVyGsYfW+LYtmu3fyO9pWiGlkvHK
 XW0jbXE2qOvB8aO90qOA4FiUcMgTSJRcBOEQ6RzrFHlP0SFkREw5jxqxKOYwWjPYJh
 W45o4mieEgFtA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Jan 2023 23:15:07 +0000
Subject: [PATCH 2/2] ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230106-asoc-udoo-probe-v1-2-a5d7469d4f67@kernel.org>
References: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
In-Reply-To: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rD3rMpRr6Vwh5MAIJxJWqDE46f7CDiE9s2HcbItURUo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjuKu11kzt+q4bWdfpGfR8Aa2GMJb+x8/lUeR4S08E
 X0QivNSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY7irtQAKCRAk1otyXVSH0HBOB/
 sFAPUtAfpFtfFKs4U8IpCJFN7JZELVyRQeX2Vlm18zFpPyOd67W6RRKgzKsJMzpxauk4Z77SE/udDR
 zGKSjPABh8/BEt4S1XO4u/wgw6YuncgxFDghSiu6MqQNaYq5h+AdHKxF0LTHL3rKULlEwDxtAb+xzT
 ssaPIXtRMcA2OkqvtOEw+KrwOY2qGEBhiac6lgY2Fgcn7quiQRKHj1Hw3WdeNt/lIbaw6DlHqJs6d4
 dA6q4i5iYfRhIb3NwKhCWMvzHIW1wZY8WChsf70hNmI9uV9ZqNKcNeGAV9xHfNZwgeovP6YdSN64AI
 mQh98LojP1yFAOvc2eV2ezdtFH1yVU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The fsl-asoc-card AC'97 support currently tries to route to Playback and
Capture widgets provided by the AC'97 CODEC. This doesn't work since the
generic AC'97 driver registers with an "AC97" at the front of the stream
and hence widget names, update to reflect reality. It's not clear to me
if or how this ever worked.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 1dfd0341e487..8d14b5593658 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -121,8 +121,8 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static const struct snd_soc_dapm_route audio_map_ac97[] = {
 	/* 1st half -- Normal DAPM routes */
-	{"Playback",  NULL, "CPU AC97 Playback"},
-	{"CPU AC97 Capture",  NULL, "Capture"},
+	{"AC97 Playback",  NULL, "CPU AC97 Playback"},
+	{"CPU AC97 Capture",  NULL, "AC97 Capture"},
 	/* 2nd half -- ASRC DAPM routes */
 	{"CPU AC97 Playback",  NULL, "ASRC-Playback"},
 	{"ASRC-Capture",  NULL, "CPU AC97 Capture"},

-- 
2.30.2
