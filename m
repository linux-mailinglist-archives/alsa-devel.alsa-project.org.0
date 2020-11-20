Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23752BB095
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FA1182B;
	Fri, 20 Nov 2020 17:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FA1182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889911;
	bh=eg5/nyaqALzijU8H2GOtWYcQapgeWcHG71oF3tWQQWg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLQAG/VPyf+FDMoLAqn4Z73q05uG592p+ko7uvHlAIU0vqx/ElNBPd1UtCK3Rq2M5
	 1rX6KY8Av7ucqPoXo9kL6XjQiajNTsyEFJe2j01mxdV4NpL/zD4kJS0mxgDwrSPcja
	 Ge+ZW+Wm6JeLRPyKZQ6X0cQjST5rC+CJZJfgSjo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50B97F805D9;
	Fri, 20 Nov 2020 17:19:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 425BBF805D8; Fri, 20 Nov 2020 17:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11AD0F805D6
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AD0F805D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oosmMJ6C"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28B83223FD;
 Fri, 20 Nov 2020 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889189;
 bh=eg5/nyaqALzijU8H2GOtWYcQapgeWcHG71oF3tWQQWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oosmMJ6CyU8Xo45/D/STkGuWo95XQARTBuVHD7D7pNzuZMePPS6rIIf6DMebY/CKz
 9gpaJQd0sOszdfdQpuOrwI0EDGrS3imX/6/WHX/cXQnoX+831lbcdAdEMfTwPXDq++
 SG6uIQDR/1Q/Qq2SawkIZPvlE0Ah0urCmeDcgC5A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 33/38] ASoC: es7241: mark OF related data as maybe unused
Date: Fri, 20 Nov 2020 17:16:47 +0100
Message-Id: <20201120161653.445521-33-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/es7241.c:206:33: warning: ‘es7241_chip’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/es7241.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 87991bd4acef..2344a0b03518 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -203,7 +203,7 @@ static const struct es7241_clock_mode es7241_modes[] = {
 	},
 };
 
-static const struct es7241_chip es7241_chip = {
+static const struct es7241_chip es7241_chip __maybe_unused = {
 	.modes = es7241_modes,
 	.mode_num = ARRAY_SIZE(es7241_modes),
 };
-- 
2.25.1

