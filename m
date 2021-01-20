Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9122FC6CE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 02:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F75F18F6;
	Wed, 20 Jan 2021 02:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F75F18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611106213;
	bh=9zKkvOfDNwl6eBjoQDcLMVhaf5ppRyV83Q/SpXcoSqw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bAhseEC5cTHc6QBXtJKFGCuEVmlruVrRj/1nGn6Sidzveu3Y3xGDBsQFfhiUM3NnE
	 hU9aDkb9q0iUPDcgKSnBoysVXdAJ2USW1kctTgKChsuD3ouOU59edpK+J3nu7HO9xz
	 JOIEBZUF8p5HYHvfs0SvCxrIuv1O+1fBObCrVqEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B29F8029B;
	Wed, 20 Jan 2021 02:28:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF35DF8029B; Wed, 20 Jan 2021 02:28:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 252FAF80273
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 02:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252FAF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gWFNERlS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CED7223441;
 Wed, 20 Jan 2021 01:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106084;
 bh=9zKkvOfDNwl6eBjoQDcLMVhaf5ppRyV83Q/SpXcoSqw=;
 h=From:To:Cc:Subject:Date:From;
 b=gWFNERlShBFV90kdBOtR5g3agkZNOxzZJoBkG8Vb+RBSPqXpSzucqStStAHOgHKvd
 GKVvV3JNF8Xf99Lze7fiVWCKiWn0lbI8vAMXy0Rz5fyY7QAAJe5St7yxMVCUjMF5ti
 LBop4OckLlXbGKp4rWZR5xRG0Rgbj52tDqWc9qgYxrYiiJBczW5QXYnbLfKEX9uQuU
 AD5oLFZ4r4oIBqrMW09pMTivj38JGwdSA8eBh9YZlJERN6Iky5n11g1ZEpGQSqVG5k
 h2KsEhOSyOFVnv+nrvtIaQHkdEDAPYq8x+/5gmyjceh3KN21uU/pbDCmgacmlSOUdk
 tbnCpf1rAolpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 1/9] ASoC: Intel: haswell: Add missing pm_ops
Date: Tue, 19 Jan 2021 20:27:54 -0500
Message-Id: <20210120012802.770525-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit bb224c3e3e41d940612d4cc9573289cdbd5cb8f5 ]

haswell machine board is missing pm_ops what prevents it from undergoing
suspend-resume procedure successfully. Assign default snd_soc_pm_ops so
this is no longer the case.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20201217105401.27865-1-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/haswell.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index 8158409921e02..c6007aa95fff1 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -197,6 +197,7 @@ static struct platform_driver haswell_audio = {
 	.probe = haswell_audio_probe,
 	.driver = {
 		.name = "haswell-audio",
+		.pm = &snd_soc_pm_ops,
 	},
 };
 
-- 
2.27.0

