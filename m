Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C454B5AC2
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 20:58:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C928B17F6;
	Mon, 14 Feb 2022 20:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C928B17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644868723;
	bh=bEPy6NJl7Wq/HjmZFY73/HZHbqfu0PFJaWVuNBjag7o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HJfXHfUAYFhkeee3p0FfhMhXQ++Y8bmicCig/X6Dgfxi2V5B/NrYMopeV/NCcrZS4
	 yiFCZ6b/yLwQrMuKTCJaTRrryyhRfGSMz7OjQIOy+a28gn5uy5E2J5epCO6+zBMOz4
	 gVmBcxxVhj8so4imMNr8UzKCVvx0Qk1d6MbxqGTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48564F8012F;
	Mon, 14 Feb 2022 20:57:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0A05F80310; Mon, 14 Feb 2022 20:57:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58B06F8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 20:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B06F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I01WRmE5"
Received: by mail-oo1-xc34.google.com with SMTP id
 c7-20020a4ad207000000b002e7ab4185d2so20605420oos.6
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Uivi620S657cMyL0oc/T0uVgPl9V4a4viL4QV6K6iY=;
 b=I01WRmE5ZetWTX9ZKAY3UdqRXs3jz79StozPRwhUVP8EjaTxtQBT9NHefjrZCzug0y
 8A8fe4yfO2qHoee33cQRfSzV5RMGYUYwR+88Se0dTMbwMsxAUYLAiWJjN8RjWQTmCemo
 xJe5svhaLkzgZV1Gh/6ZsQCnCWl/5jbDeePRR3Ro3vOi+2aozNpNyfhi8SBJlTlSr0XG
 SOLSGBLp0rT5M6csDorBr6ze7McHe8W5UHM9UabKEO2h2Lda6PEZrdWkCSxqP53VP5Ib
 eMsmALbgCcMraoVFmt4t/om0RdeN2dFNk+k+uMpJ3UwDGb50oEqjGygXOOWwYbMgMiIz
 QscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Uivi620S657cMyL0oc/T0uVgPl9V4a4viL4QV6K6iY=;
 b=X4E4+L2f3k3nZXV7Czn5/YiQ8j8zKomL80GPyJnBltp+5GV+QRsyqAl9T5FR1tqzyS
 8ftkoBEYTOuYPKg3/sxuryndhYjBRwEm5cgaCUVZ4UMQUJ4Gf4MLK9Jll+nHTObt+nKu
 OxILQxtjc6EiQNZzZ3sozbyw78EH6SOLEasd13Q0yRTqKbl3+QGvN4g69VimRF++X0Im
 ZVgX0Qn3Zp5vpL/1dc++kl18Goxmoe0uiCqu/ix7aW3JkLuybqTxE0aZubd91c2x5/ze
 3S/z9GPQ/Mz2XB7L+g0fzFNZboYXShKLTmU82m9PpCe8ve43HalliWa/Nbd+7lR3zlVt
 BEdQ==
X-Gm-Message-State: AOAM533SlsUH0R7S1fZyoGEIpMkLRPdsFCOo1K2scBs7EYaPedYrwoLV
 kyUomXIVfKFJwm4aX5CKnE4=
X-Google-Smtp-Source: ABdhPJx6VV2c210PhcrwrOgYNp/i3qn+mspJzl7/Nw3I5m6sgNg8fkkRLCK40xxbhgTr7r1UYSTZhg==
X-Received: by 2002:a05:6870:10d6:: with SMTP id
 22mr164488oar.238.1644868645762; 
 Mon, 14 Feb 2022 11:57:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:2cbd:f00f:fa12:3ccc])
 by smtp.gmail.com with ESMTPSA id
 t21sm12890341otj.26.2022.02.14.11.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 11:57:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: cs4265: Fix the duplicated control name
Date: Mon, 14 Feb 2022 16:57:16 -0300
Message-Id: <20220214195716.1096265-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com
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

From: Fabio Estevam <festevam@denx.de>

Currently, the following error messages are seen during boot:

asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16

Quoting Mark Brown:

"The driver is just plain buggy, it defines both a regular SPIDF Switch
control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
create an identically named control, it can never have loaded without
error.  One or both of those has to be renamed."

Rename it from "SPDIF Switch" to "SPDIF" to avoid the name confict.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/cs4265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index c338c9f6cf91..8891e9275cba 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -150,7 +150,7 @@ static const struct snd_kcontrol_new cs4265_snd_controls[] = {
 	SOC_SINGLE("E to F Buffer Disable Switch", CS4265_SPDIF_CTL1,
 				6, 1, 0),
 	SOC_ENUM("C Data Access", cam_mode_enum),
-	SOC_SINGLE("SPDIF Switch", CS4265_SPDIF_CTL2, 5, 1, 1),
+	SOC_SINGLE("SPDIF", CS4265_SPDIF_CTL2, 5, 1, 1),
 	SOC_SINGLE("Validity Bit Control Switch", CS4265_SPDIF_CTL2,
 				3, 1, 0),
 	SOC_ENUM("SPDIF Mono/Stereo", spdif_mono_stereo_enum),
-- 
2.25.1

