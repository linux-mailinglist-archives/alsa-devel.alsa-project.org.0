Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE2513288
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 13:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8E6161D;
	Thu, 28 Apr 2022 13:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8E6161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651145613;
	bh=W+u5alAxNyWNy9kfr01pJww/q+aLlU5X16oyE4FDtZU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iR3NuITyrJlVdm84y4x+TOX8WFTT0hoAo2BxzBz2m9phZkr+TAvPw690nsYJOzKto
	 +ZjS3zkP9JK4VpkAtmlyZ6BQLcRkevfEZVim2Q8chvQnMnI7Tvb6rq3zAW0eQi2vi0
	 YGYzNCOtT983DbHLNEqlaQpcfS508PhIEWuuFJMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D43F80311;
	Thu, 28 Apr 2022 13:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 689D2F8016E; Thu, 28 Apr 2022 13:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 952E4F8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 13:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 952E4F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bWeCqz7o"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AC8F61F5F;
 Thu, 28 Apr 2022 11:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B91CC385A9;
 Thu, 28 Apr 2022 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651145547;
 bh=W+u5alAxNyWNy9kfr01pJww/q+aLlU5X16oyE4FDtZU=;
 h=From:To:Cc:Subject:Date:From;
 b=bWeCqz7oEvkhLBxYlhcfxnlfcwzJ1bJVQst+fuQZogc/qRKN5W+5U+G/yH9OIRZSP
 LFrTO9W0cr0JZ6R3w/uIcSfIj1GGgMPAqhwIHHGycQaP+rYBggiZ6k3/zEEUzuhmCc
 9a/OS100Mc5RLDlSAnUVauAVLMaCq7FkYi43qV8dx0X31UmYlpglMYUUKNt2+bAP8T
 K0HiHGecqQaxeyLliCC864wXzpJJE73aMshDP6VlKLO8QmcRqxrnNQJtuKBnh6MMd+
 wFiVSL8FtbYLbuYeA0NrScG00Ad65YJwmgYZ3oIMTOI1dQoT9xdrJqSDfrNXc4g2nY
 JOWM1H+xa2+zQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: max98090: Fix event generation for custom controls
Date: Thu, 28 Apr 2022 12:32:21 +0100
Message-Id: <20220428113221.15326-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; h=from:subject;
 bh=W+u5alAxNyWNy9kfr01pJww/q+aLlU5X16oyE4FDtZU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiantBBpe1W5SVER9Cwwb7uYvR+K7xE2hLwA4oXnPE
 +Rf40WqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmp7QQAKCRAk1otyXVSH0NYWB/
 9lORhv91/lcbJxVTb99C/VTRcWNi0Zb7IwGPHgeJFX4KK6WB+8++b9y0tmm/DtgonHHZxQuSJGfthi
 MkSi1i2WBvD8NXGny71/iiqw5MDqrUQ+GR2lNQpbvLrCWylg7MfUU20UdyCz8JZtLX/c7VSpbjxtTk
 FAfK6uPG9EK9xVXKDDIM1S2nSAT/aXrfEM6yAe47e5c8j6V8Ms9QQKVnVoJhMCtZm30J4SIwfw/ab9
 05WEZyIuPXm0O/DUrNSuOkS43ElGgrDMrNMA3//67SCXDj+TabAQPikxSvugqaSl+xNlRIOvyzjtXu
 mb4BHQOjdOdTDpVABzzUS3Pssh5d6G
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

The previous fix for event generation for custom controls compared the
value already in the register with the value being written, missing the
logic that only applies the value to the register when the control is
already enabled. Fix this, compare the value cached in the driver data
rather than the register.

This should really be an autodisable control rather than open coded.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 5146837c0fce..48dcf071bb5a 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -396,6 +396,7 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 	unsigned int sel = ucontrol->value.integer.value[0];
 	unsigned int val = snd_soc_component_read(component, mc->reg);
 	unsigned int *select;
+	int change;
 
 	switch (mc->reg) {
 	case M98090_REG_MIC1_INPUT_LEVEL:
@@ -416,6 +417,7 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 	if (sel < 0 || sel > mc->max)
 		return -EINVAL;
 
+	change = *select != sel;
 	*select = sel;
 
 	/* Setting a volume is only valid if it is already On */
@@ -430,7 +432,7 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 		mask << mc->shift,
 		sel << mc->shift);
 
-	return *select != val;
+	return change;
 }
 
 static const char *max98090_perf_pwr_text[] =
-- 
2.30.2

