Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE8513992
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 18:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5D1162F;
	Thu, 28 Apr 2022 18:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5D1162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651162791;
	bh=m0fm0op/+sjZeNOFYRSXjp/N7NUHqPEtUYgGt0UTFHM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kzOkY3PGQgRANLRcTpuk6DR+vh9q3KNT+6ksIPhBjxheRvXqtILXNXgHLePZzRvRr
	 fq6i5svKcB7tFjX3oOPvrEs2w+ZmW6JkREIKX0SPRtUmrN9KwqmijRsYaD+V25DrMo
	 IV70qgzLOK8y2qK1I6JIfxsqh0LkHhY0DlDp10oI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF8D0F8020D;
	Thu, 28 Apr 2022 18:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD23BF800F2; Thu, 28 Apr 2022 18:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E512F800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 18:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E512F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZzZTAoZ6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CECBBB82EA8;
 Thu, 28 Apr 2022 16:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1524C385A0;
 Thu, 28 Apr 2022 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651162720;
 bh=m0fm0op/+sjZeNOFYRSXjp/N7NUHqPEtUYgGt0UTFHM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZzZTAoZ6IauQokRVGBUB3AIhTJ/Wg+1zZvI+lPnuTV07JOYQqx1mxbwCQ9fgMButh
 DNBa+fvu2azwZBrwtXYwMpNOvb0ec4hmc72FGBWfGpFUmYOMiZoGSthSqxGAf+QvQ6
 FG6kTEkzIM6xybnltDCvwxVWhAR8zLIOt0Pg7+/KTkLPuNcKB4pFUffDtbQWsvq/Tv
 5CPqmkY/IkrVwauifqVBkqfAD4/AXWcfxU8uNd/CmOEcQ6hviv6aloEgMCgJ0I+mZ+
 TsZBU3x9ZQuC1BvFNQoUJN8UuYBm4LSQ0yyQqk5ha3MKGrhaAAZY9nlpT2PK0QwpIR
 BSv55hwTIAk8w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: dapm: Don't fold register value changes into
 notifications
Date: Thu, 28 Apr 2022 17:18:32 +0100
Message-Id: <20220428161833.3690050-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; h=from:subject;
 bh=m0fm0op/+sjZeNOFYRSXjp/N7NUHqPEtUYgGt0UTFHM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiar45c+VptCWGynyXhpW1Bq4HgMm7PWzgkwcmj/Db
 Rbe2mbqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmq+OQAKCRAk1otyXVSH0LZOB/
 9MGTRRuKFPPY58sBwoNqflJO59SpRGNJ/fhqGfV/GuJNZcxPgzi8Q61ybPYWZMAcPEVWYOtDEkZUmX
 46F8q1/bLfS9QJ2RTFw4YgqHRJ8FpU3sDDWgIqWCVA47SqYdormOprVJ9muRwNoG398R4VULsrfQIR
 aqgdxBBTz6Uwx0mKmng+qNjB8hlaVs57SvLUFM/jI/Ku32b5SYOQOJSpGk4YJZGOzbNZLwMP2SGizU
 cMlyUdLt3hWjFkdo/17HyU5dVrh6CtYjFqWh008UzET4Y1pPaRu/dLhzRuB6+PzwjWvwlY6Vb7qMUi
 e9Bj4yTnHCxh2Ls+y0TQ5nzwFbLgFi
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

DAPM tracks and reports the value presented to the user from DAPM controls
separately to the register value, these may diverge during initialisation
or when an autodisable control is in use.

When writing DAPM controls we currently report that a change has occurred
if either the DAPM value or the value stored in the register has changed,
meaning that if the two are out of sync we may appear to report a spurious
event to userspace. Since we use this folded in value for nothing other
than the value reported to userspace simply drop the folding in of the
register change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index ca917a849c42..869c76506b66 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3437,7 +3437,6 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			card->update = &update;
 		}
-		change |= reg_change;
 
 		ret = soc_dapm_mixer_update_power(card, kcontrol, connect,
 						  rconnect);
@@ -3539,7 +3538,6 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			card->update = &update;
 		}
-		change |= reg_change;
 
 		ret = soc_dapm_mux_update_power(card, kcontrol, item[0], e);
 
-- 
2.30.2

