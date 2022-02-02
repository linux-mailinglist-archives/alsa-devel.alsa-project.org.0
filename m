Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 901734A7890
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FDD81712;
	Wed,  2 Feb 2022 20:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FDD81712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829285;
	bh=Da0y9JEjIEO4OMjDtlAM818JnlX/NVlMELvFQKl9Fy4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W90qPRTQX122m7/4z0Lfc58jk6wa8ohOGooW71LH20GoZP83UnaVtBRYEpRNJeNsg
	 GOxrSlAJei+fvkR+HDE3tCFV8uA6pSYuDs8pAIkFp0enH+mUEnyL3A9oV30OSDIYMR
	 Ch84fQSXpbXMJbIHWCAuqrsMLuB5azU/6Jyijd+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77990F804B1;
	Wed,  2 Feb 2022 20:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81FE5F804B0; Wed,  2 Feb 2022 20:13:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20824F80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20824F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MEY03f8P"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D226EB83242;
 Wed,  2 Feb 2022 19:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A551C004E1;
 Wed,  2 Feb 2022 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829206;
 bh=Da0y9JEjIEO4OMjDtlAM818JnlX/NVlMELvFQKl9Fy4=;
 h=From:To:Cc:Subject:Date:From;
 b=MEY03f8PBNZwGxOC279CCJUYjuK8Zorj7qV8MVfmuCl4iai9TZ9wljug2HiSiDQGZ
 +3/t4xYQUd5zX68g3L1FLCm8BeNByb8Qby8o3H3QYZAqqITvWeT0vMzd7HVVOePBGR
 iCdX6MyL3Yf6PlrhTmp3CYBCyYwejlGmpHcAmwkIvlv6Xon7ZptxXBJzsuY6Z+/gBa
 tpPRu3eqm8tJPUj+m91FgzMGmi22onG6L/XtMZNWSrk+l/T64RZrvCjiJkFMBboKoU
 U88qm6TiRB8TWVZTKdGsq6AUIlnQqKFtaeWezPV0jGxyziH4KEe4iS37fNDNpidexT
 a9pjCXc5QzHVQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: samsung: Explicitly include gpiolib header
Date: Wed,  2 Feb 2022 19:13:22 +0000
Message-Id: <20220202191322.3650708-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=760; h=from:subject;
 bh=Da0y9JEjIEO4OMjDtlAM818JnlX/NVlMELvFQKl9Fy4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+te1WlwZjUbsVH00k0yCAwIkTKBwVl4G6iOSV50d
 +0YxkpGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfrXtQAKCRAk1otyXVSH0GuuB/
 0daeYoJqPajHU3Hx+PZQi8v90CaXJ6EYUSPhRy8euZITfxv06CGSWrOe5n3wM2Di5dT/gqs0pqXHKK
 223LQAdm0Oh6VuH8UiRtmSn/5p9A4UG21N2KDVw7qNz9Sx+9hHJZSGjDwc4PdfoesUumfsCQ2nB1hO
 NGEKZWZDRIuSvRvNmJUduUeQWqrXdHo1OiiBf1HFJq8uVhlt2LcSmuQwtwmflSvCFqSNecBBBWF8/z
 mNh+2NZboyXgi4+B3AaUINVx9oZer6sv7d0wZXAcKXV+mKNYQcErgfGtKBYH3KgfuqFiwPw8agGN1R
 w07TYAF9/gM0fbxN0Y9BaQXS1hcHCd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

midas_wm811 uses gpiolib but relies on the header being implicitly included
which can lead to build failures in some configurations, explicitly pull
the header in to avoid problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/midas_wm1811.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index a2019535a0b1..5e9dc18687cc 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -6,6 +6,7 @@
 // Copyright (C) 2020 Samsung Electronics Co., Ltd.
 
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
-- 
2.30.2

