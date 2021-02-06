Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261031205F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 00:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1621715E5;
	Sat,  6 Feb 2021 23:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1621715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612652434;
	bh=G3vs40skJQPaDh4zDGGH2Affe84w/pTETBZkhAZVruA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bOtX8QEk+Eapg2/0llutFKEvdMV0KViMXOqRCmR+cr/eWyO+52mSASo8NPpOk/DqV
	 cFoM19sa+SQdt9Rp9+y4ssG6S9jaZ6nwA9Og/tWfqvIK0lhVy8HFMZiTDkMWucW4WW
	 t3hNiNDOCz4NczlMsrHc9CNYBZ+K0yujfQKvq0CQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67251F80139;
	Sat,  6 Feb 2021 23:59:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CE0F80171; Sat,  6 Feb 2021 23:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27638F80095
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 23:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27638F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bL14WlfB"
Received: by mail-lf1-x132.google.com with SMTP id f1so16317479lfu.3
 for <alsa-devel@alsa-project.org>; Sat, 06 Feb 2021 14:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqb4s2Ei4nQ5JzQuxmamKDisIzQOM+m6EVfsBNYONRE=;
 b=bL14WlfBBkJuhiBNnv/jm9VeZsNQgSgO4Ppp/WZu8TftLEV1sdk+caORZ0FCmCnnw3
 Et0YIFiWjG8KdbWmh8bspRSwDc8FHwKSjXG1nOPId+yGNsSMJA2WZL3P6I1J8f0e03qU
 eECUlBLhHzZjp27Zpu4HmWimtaRxtbi98cfhW212apL+lh2bcaB1lJmEBfZxQee6tSpZ
 2tjCIfmE0ka0BkmKU4eQ1ENF8FUURcKOxiBF8pkfFCvWcHJ1YPpXbnkL8k9wHQEh7w8w
 cyQ39TX+AAy94TQfGNQnClNQXhfTvV3V+hDCmBQ98tdnTkeu5f/zXJIZcFXNxTQXeEx8
 Wdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqb4s2Ei4nQ5JzQuxmamKDisIzQOM+m6EVfsBNYONRE=;
 b=Hrj8Jv9EUpf7FUVMQSqapjLwX8ECRx4k00gC2rzF4Tv/8KlAR1EaN/hVuujw/xWt0k
 anhErVP8IbnIIrozfncs+7uNVku/yw4KfZXTNKRYTGP7K0vwOjTtNIyY43SKUMFaov2/
 ME5GOE5DmOR0heYJRUlooRGYtUF3vg7OWw+bDQS7hyj9H9oKEPHcTUwrh1KKWN/j1O4N
 BmwzYnmphQxdV5PZ2AdEeQaQh5P/30rBjKuszJ6FNsVPWTkof9pc5xQXbL12y7NFGaj4
 5ZF24garge5+K828yK5BBgV4lQ8tSw8wNbJOOCX5PSXl5HmQxRr9MjWaExHphM7urjbQ
 jXgQ==
X-Gm-Message-State: AOAM532yExKf1JIfaqSeIHOUgZTRhfO5H4DoBiKbAC4RwsjvEBc2LuMz
 4kyUr4drH0PoWZHPTiheMPk=
X-Google-Smtp-Source: ABdhPJw/YnVxaE3qbFOm+hUdBcFziMPiJkNg5hDiTQSDVPpUFCjZV4Fl7/pjyIWIu+JMzLyzIrii9A==
X-Received: by 2002:a19:4c02:: with SMTP id z2mr5912641lfa.590.1612652335311; 
 Sat, 06 Feb 2021 14:58:55 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id c20sm1467081lfh.275.2021.02.06.14.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 14:58:54 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl: constify static snd_soc_dai_ops structs
Date: Sat,  6 Feb 2021 23:58:49 +0100
Message-Id: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

The only usage of these is to assign their address to the 'ops' field in
the snd_soc_dai_driver struct, which is a pointer to const. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/fsl/fsl_easrc.c  | 2 +-
 sound/soc/fsl/fsl_micfil.c | 2 +-
 sound/soc/fsl/fsl_xcvr.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 60951a8aabd3..636a702f37a6 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1530,7 +1530,7 @@ static int fsl_easrc_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_dai_ops fsl_easrc_dai_ops = {
+static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
 	.startup = fsl_easrc_startup,
 	.trigger = fsl_easrc_trigger,
 	.hw_params = fsl_easrc_hw_params,
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 8aedf6590b28..5935af2e5ff4 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -381,7 +381,7 @@ static int fsl_micfil_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
-static struct snd_soc_dai_ops fsl_micfil_dai_ops = {
+static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 	.startup = fsl_micfil_startup,
 	.trigger = fsl_micfil_trigger,
 	.hw_params = fsl_micfil_hw_params,
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index dd228b421e2c..6dd0a5fcd455 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -857,7 +857,7 @@ static struct snd_kcontrol_new fsl_xcvr_tx_ctls[] = {
 	},
 };
 
-static struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
+static const struct snd_soc_dai_ops fsl_xcvr_dai_ops = {
 	.prepare = fsl_xcvr_prepare,
 	.startup = fsl_xcvr_startup,
 	.shutdown = fsl_xcvr_shutdown,
-- 
2.30.0

