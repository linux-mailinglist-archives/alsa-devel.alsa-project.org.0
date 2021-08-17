Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C663EE152
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 02:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A201669;
	Tue, 17 Aug 2021 02:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A201669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629160736;
	bh=vtINDJhnYlJbTwKRcDq6V78h1LvBAO6MvAcQ0pJthX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBNf8s2hcBg5gpGtANKw3rrHpR/HH7WMd2pGBV7D3mj1Gle91XmwK3DU4jt2obm+F
	 fZlhZ2ICxtNGJBYQBGI5cLmf/RcO1CePRm5Rn+z4dr5XzR48YerzB2xsLWXjhFaXER
	 McBmGjy36GCKIBQrTKCGNa5BhkQt5AGEdejYaciE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33E0DF804F3;
	Tue, 17 Aug 2021 02:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08635F804EB; Tue, 17 Aug 2021 02:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE93F804E3
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 02:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE93F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OaL+Tmvo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56A1960EBD;
 Tue, 17 Aug 2021 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629160559;
 bh=vtINDJhnYlJbTwKRcDq6V78h1LvBAO6MvAcQ0pJthX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OaL+TmvoEDWtPvrfxCxb/kvpUwZINHmW9E7B658jsEdVups6nNITnZZVY6ErAfXb5
 uxyI+mtRP4Y8JoC8kT7ybO1xBMeN/BVgfHECFZV7YVox3u7ccEMbsKIM1hLuWx0INR
 53XbPa1tYcCA7uC5hNnLuLKgAC075PDua1hbihLIZYYqLWXJkKPhlCAd9iliaH8zCX
 a5zJYTYyoIirULWQoiBeoVmOP6MIRKepHLv/26NEx42/Ya5ynexeb5YqjAqqn6jANU
 7Vyo/UgcwNV9AscnH8446Lr3Dq5v6X7OEInpTZyHgvNYdHYMk0k4njsP8hQRUnxDYy
 N+5+9L8IlSptg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 3/9] ASoC: wm_adsp: Let
 soc_cleanup_component_debugfs remove debugfs
Date: Mon, 16 Aug 2021 20:35:48 -0400
Message-Id: <20210817003554.83213-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817003554.83213-1-sashal@kernel.org>
References: <20210817003554.83213-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

[ Upstream commit acbf58e530416e167c3b323111f4013d9f2b0a7d ]

soc_cleanup_component_debugfs will debugfs_remove_recursive
the component->debugfs_root, so adsp doesn't need to also
remove the same entry.
By doing that adsp also creates a race with core component,
which causes a NULL pointer dereference

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20210728104416.636591-1-tanureal@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 51d95437e0fd..ac3c612ad2f1 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -754,7 +754,6 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
 static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
 {
 	wm_adsp_debugfs_clear(dsp);
-	debugfs_remove_recursive(dsp->debugfs_root);
 }
 #else
 static inline void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
-- 
2.30.2

