Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4153BA3B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A274F179B;
	Thu,  2 Jun 2022 15:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A274F179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178259;
	bh=slnjXFuQx2CxmCeXUAaXzm782cOCmjgTLMmaLTkUwYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XS4vDPv9uPQIfU62VK6mnpUYLdITDpAJhqQmQTI22VXGYvJTfieOsNAs1qUkr00xZ
	 EgQ8CUT1nvNuf2n8WDoLBKFUS1207k9YKElTAT4/yBTQa9ieZvZ4IxjabxQa7mp5Jg
	 3frfHui25hoi041Zc3SCC0MWd5t8+uTwo3Zzqm1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB30F80588;
	Thu,  2 Jun 2022 15:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A963EF80566; Thu,  2 Jun 2022 15:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBD3BF80551
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD3BF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pWd9dWn3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6736E617D6;
 Thu,  2 Jun 2022 13:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2288BC385A5;
 Thu,  2 Jun 2022 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178015;
 bh=slnjXFuQx2CxmCeXUAaXzm782cOCmjgTLMmaLTkUwYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pWd9dWn30mtzJg0sydIPAW0HQ3O2aTvtH57NuRJe+qmKVeqIrJnAQGIsafHLl4lSY
 w4UFoV8IrwIVKQusMiuRkB4QVm+kJLcyPBVJLMjpcxENpbis4LC1KO0/jVumKxTE60
 TehH8sG8sfY2y2dbm+zpugmpeG9Fsk6nthz52gvQ+z/Z4UIv33mW2KBbS2TG2MY6aO
 MAw2nFGnv6qm4TSRBdmwi4RvVEINm+71vFB2EYXJ07JRzmm0U+iy6c7Ur0LirMrU/B
 ndqMxaYJpOQcLNXT9UvmZdNXMSCldNIXd2IfmUQgsGmvrSKZ5oNXo0hCsCvixNIKTr
 lOusAi7LQV4hg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 12/20] ASoC: uda1334: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:08 +0200
Message-Id: <20220602135316.3554400-13-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; h=from:subject;
 bh=slnjXFuQx2CxmCeXUAaXzm782cOCmjgTLMmaLTkUwYM=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqQZB6YH6q8t+d++ObPwfdZ0uWvzdRhzChzbuE85F51d4SZ/
 RHN5J6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkRBr9n/WrXaTWywCuY089I+LKx
 7+wZ/JpS7VvnxK0PSn/Z9sriyS0sj3df8puV98orbrjmT/2+xFUUfkrkgncF4KEZm+10Gy51O/zK6J
 sl7eaf0+fMtdeJU9tV/eWJgz2dbJ+qGjYmuu2x8uNWFrwzMVmxY90JH52mjIY/i/dfekGad8nbUOv8
 tz5djP32ii77ehuGaeq7XPQ5cvi5eWyYk+aLSvkXI4MeXUFjNdxdOpx+SE/wr35q/XC5+50yX14g89
 2d+yeTwbXRKzAw/c0Pgfan1Y5LPoDuN5B3j7o39fF3xxvSBqdVvqP6kef4e03Ebr51YmZ27s2LTvyq
 UlrEuZL6+fE3fctdst9NFk0+/SAA==
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

As part of moving to remove the old style defines for the bus clocks update
the uda1334 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/uda1334.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 8670a2a05a56..9d5ed34e5420 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -169,7 +169,7 @@ static int uda1334_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 static int uda1334_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	fmt &= (SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_INV_MASK |
-		SND_SOC_DAIFMT_MASTER_MASK);
+		SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 
 	if (fmt != (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 		    SND_SOC_DAIFMT_CBC_CFC)) {
-- 
2.30.2

