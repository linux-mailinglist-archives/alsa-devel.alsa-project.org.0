Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3525F509FC8
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 14:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A4C18C7;
	Thu, 21 Apr 2022 14:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A4C18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650544776;
	bh=OAGA7Y/uNQUjSjKTEofTVl2s8bD0Pc4pFUCJXL6t4Hg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WoF6uzz1zhhMUkY73lrcM5fv5OB1bp4en7cjxF0UCAeAbcWx0AfP2KazbrTVZfpcC
	 hAyfBM1EO41lHNdHSvU7Dw8DZrUEgpwiG7+8dXvmQrf+a4d43cGJTp/KUvleHlmQF2
	 IwczipDwrQEg7OPf4j7YMtFUb4fqMb06cCq9zDBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E839F8032D;
	Thu, 21 Apr 2022 14:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 546FBF8047D; Thu, 21 Apr 2022 14:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC5CCF800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC5CCF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u8C5QyDC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D37C61C7A;
 Thu, 21 Apr 2022 12:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1973C385A1;
 Thu, 21 Apr 2022 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544709;
 bh=OAGA7Y/uNQUjSjKTEofTVl2s8bD0Pc4pFUCJXL6t4Hg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u8C5QyDCsa6Uq27aCJ+R5b2TP+Nw8d/YH5qcatDyP1wPOv6YV7XdTJA4hjf3Pumzs
 CPx2LluIje6liQkNebv6T4BYqohtl0fhizT9svnqBTr9NtLWoCS3eyEZle/xw3T/KX
 LM28q8ctg//X7V1yNJpMzHwPQ1jFV6EXakRT+BDYEGA3pJaCp4hmXo2p9LVGL5Fh02
 6RhZXIBaTibHYg/hxqM2ySG/1O5fuop0HztJ8p7keaSB/shv0ayrKzfSSUipN0OY+u
 atPDgwed4S9iT/taQe0FjfU4koPxusy/ywQDjIHW6ks1DA99bYxbj2rypqHQeAHiaf
 CzJPyiarWbSfg==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 1/3] ASoC: meson: Fix event generation for AUI ACODEC mux
Date: Thu, 21 Apr 2022 13:38:01 +0100
Message-Id: <20220421123803.292063-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=OAGA7Y/uNQUjSjKTEofTVl2s8bD0Pc4pFUCJXL6t4Hg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVAo08szkcs7B1kQq8R3+DqTe3rqtlh2eGGB8ri0
 44bNiymJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQKAAKCRAk1otyXVSH0HfBB/
 47HI2ir0hJfTo3YLT2NgpB0PithajCfZfEIo3XL0wsVkO08LimJc05KrL4Y+iTa4PCDuR/G4kGPw+a
 zVCKjtt0suLWB+zqMeThD1Lwc/jm4K9+saDhshLO+r0r97J4BU1+CT8InXQzBbA2KnDBzOrsc8FCY6
 Y/9mW2qHGltq3TeGEao5XnQIbVNpAQhTcbm0pwNh9tHdlh6o1WMiwIgKlj4yeUcXnOCD5DjSnlh4da
 E04hozdqcFstNVF3wu9IdHHnTgHD0RVFbm5V3VTPrPdaRK+dder+K8gg3gQsq0YbMqqFLh9e+5fQ1i
 SuIg/n8pcXSkdoX8Y8OMz8f4QEgsd7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

The AIU ACODEC has a custom put() operation which returns 0 when the value
of the mux changes, meaning that events are not generated for userspace.
Change to return 1 in this case, the function returns early in the case
where there is no change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 27a6d3259c50..442c215936d9 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -58,7 +58,7 @@ static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(aiu_acodec_ctrl_mux_enum, AIU_ACODEC_CTRL,
-- 
2.30.2

