Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B9B18D9E3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 21:59:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC5C1661;
	Fri, 20 Mar 2020 21:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC5C1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584737944;
	bh=VZYqMg+388ubn9qo9sEi5m8itQMIvAwFL3qPzdXbemU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7ugwAhfrJEf4I8ZcOXUuA22XzsuWLjSVTYm3fUnJ3e2tdNea95TFTNMboFIOc7DC
	 TYJtqxJytYgcRyjPpz99yVyFOCs+0AImyeT5hS1I+2zIa4q+UrDjxfDzuXGpXeL6+N
	 D5O8c07XoRGijm8ITNYuDB8qsK/GFsacTkE80Tfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F226F800C0;
	Fri, 20 Mar 2020 21:56:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49B87F8015B; Fri, 20 Mar 2020 21:56:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1748F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 21:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1748F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uJ662SXh"
Received: by mail-lf1-x144.google.com with SMTP id i1so4938930lfo.1
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 13:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9oV0Jet7GMraR3xqtV0h+iLCecJI0XRcctkMuUHagA=;
 b=uJ662SXhR9zxkO088xiUitQhQMrirDeOS3TUScosTIg4zji4P6drAcNKY1fliPnOLy
 TC7gD8qUZrOf1kuPbaPvTabKzsGP3+LRRZmLE0lz5JSMe2wWs6GT1/UeTu/8K8YKM5m4
 QNZb+C04XDHdbjfO/nfKsjrFOVGlNAOS/9jFz5LPgWs5XULwEAd1K7SS0CJu4qR0hIUv
 JCHHsgdq+nftXyM2M0XI0YNoWXCN8k5JOVmv1ksoWcXG3XVNO5y3cZQmcnOXhKmfoqvb
 XeFq5/4B0ZHYZNQgch62LqTbYyHVxUMhRXFH9qnpo1VFSWMHdosYyFV0p96nS/DjKEUd
 vFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9oV0Jet7GMraR3xqtV0h+iLCecJI0XRcctkMuUHagA=;
 b=rOePwN+9Y9l5RulFtv8XRLSF04IVKRBys8dlqkFm4aD7JLN8+wBpJZbLjH93fAHNF9
 EVMYV7EiVuYmeB+5q+CcWhvvnGrrBv+ptLrven1QcPyRCI04mwXTVMxfTrqCrqnO5o97
 ZNHg5m3NaCHbRILnkZdXptFtxxPPIbznJONcqPHeIJ7lCWBM9c2n9ob8zJcAXUV5MVr6
 7EdE9YcX9MPRPGmgnpl8AietF1/ZBOEc2Trocl1MTLvPv7AGdD35XO9DR9mWxzuE79Bw
 Alihe0TdZywpq8z2DQLmCcUSG6kbhg23DuBIxbNYuKz4xHCAgYLxRzYrRSAQnXGoW916
 L+SQ==
X-Gm-Message-State: ANhLgQ3VFVJ/FxYUpB2/3wDk3uzQuWsW6nQ1A1vh9Ui4FrqxRKiTwL3O
 +L6v5Bc0LL4DLe+/NPlngsg=
X-Google-Smtp-Source: ADFU+vsLajssmyb9pDEbtINGlaD8mIM0RtJt8T7pAoYMTjD1DsK8CE1iAEpQ1DTyU2ucTWgIXn+98g==
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr6566513lfg.35.1584737776522; 
 Fri, 20 Mar 2020 13:56:16 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.gmail.com with ESMTPSA id 1sm3873356lft.47.2020.03.20.13.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 13:56:15 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1 2/2] ASoC: tegra: tegra_wm8903: Support DAPM events for
 built-in microphone
Date: Fri, 20 Mar 2020 23:55:04 +0300
Message-Id: <20200320205504.30466-3-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320205504.30466-1-digetx@gmail.com>
References: <20200320205504.30466-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The enable-GPIO needs to be toggled on a DAPM event in order to turn
microphone ON/OFF, otherwise microphone won't work.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_wm8903.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index f08d3489c3cf..071c7d2de77c 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -143,14 +143,32 @@ static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int tegra_wm8903_event_int_mic(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
+
+	if (!gpio_is_valid(machine->gpio_int_mic_en))
+		return 0;
+
+	gpio_set_value_cansleep(machine->gpio_int_mic_en,
+				SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget tegra_wm8903_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Int Spk", tegra_wm8903_event_int_spk),
 	SND_SOC_DAPM_HP("Headphone Jack", tegra_wm8903_event_hp),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", tegra_wm8903_event_int_mic),
 };
 
 static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
 };
 
 static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.25.1

