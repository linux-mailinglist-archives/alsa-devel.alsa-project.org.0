Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E301E6F6C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 10:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B10E81F2D;
	Mon, 28 Oct 2019 10:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B10E81F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572256471;
	bh=GknEs/qzttR8iPEkIjs37/crucsE2fBuciEzsB//DPk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I4QiM2MkTzJ7Fr71fd4x2NQ5o2y88S9nhECz7qCHoKXX4bvKWlPWpVkjngB/u0rcG
	 5K5D7vMjkB3IWSg45Z+EqjjMLY1H7mgUN4RnST52hHoCVnEluJl1x5gGpjIVig83iJ
	 jcavnkCXnZYgm0H6Sa8PWcc6Wks7UzRDdGw95djc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF7AF802BD;
	Mon, 28 Oct 2019 10:52:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D95F80361; Mon, 28 Oct 2019 10:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE4EAF800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 10:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE4EAF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Z2BgNGzJ"
Received: by mail-pf1-x442.google.com with SMTP id c7so5390048pfo.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=00GH+7MY7gv6VeGZTXVYIreq96BqJ0QE/x20tMZ+6ks=;
 b=Z2BgNGzJ7q4FPtJU4fW2x3DMrNZlTDM5dHyQ8Hf5kSrB3beK/s9ztKON5ojRLhAuMU
 Nyza/b0Moh08dmhqk8Sbj4HZo5KxZBPDr9IKjplFa2wWNOjsepMPXWzF68Gq1+GogWj3
 F5uKtCRH9q/B9Y/z0A5OS6pkzkgTaPndd1a/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=00GH+7MY7gv6VeGZTXVYIreq96BqJ0QE/x20tMZ+6ks=;
 b=TAD6vv0m5g9cbmSVZg2dkGaNrsjj3QRyAH3HQpqVm1CExDbCsDpuEvxIPvC454GgKp
 /+PXcfYwzcgm4H17B9UAIh43GZlWlQMfZZcwCqxuvRazjPs6fMccT6/VzbIDQhXJKqQL
 VtoKwaBO5Bj+fLLBaHosBmjgQlAsI47SaRHlni+jOk9A1oukzaaxzeN9V4aPxw7IPnHp
 gQ3gfpqqK+dYSiuGyTkzRxtLEUNeDLihoaP+9Owdn5CTwZO3NClYRuIY73R+JynP5o+C
 YklWovkLY66TjCepxODJtImKsksyNekmZKubHB6fnotENH4bC9kjyfRqJdWvZL0IULdK
 JyOw==
X-Gm-Message-State: APjAAAUXm4wpZ1iepySYjNstz5JZTg/+5ibx+bE0CIfTCajqkhyH+dh7
 3Ot9Ohe0P/VUtrhtWd+oEgZQrA==
X-Google-Smtp-Source: APXvYqzdMK0gStf/HLg07oXhPJn5lFdaQhPuDeCWUTAcDq3Av+TyeUSuRXkSsM7OLCc3qJH164huew==
X-Received: by 2002:a63:6901:: with SMTP id e1mr19755671pgc.373.1572256360802; 
 Mon, 28 Oct 2019 02:52:40 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id p3sm9897517pgp.41.2019.10.28.02.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 02:52:40 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2019 17:52:29 +0800
Message-Id: <20191028095229.99438-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 enric.balletbo@collabora.com, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rockchip: rockchip_max98090: Enable SHDN
	to fix headset detection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

max98090 spec states that chip needs to be in turned-on state to supply
mic bias. Enable SHDN dapm widget along with MICBIAS widget to
actually turn on mic bias for proper headset button detection.
This is similar to cht_ti_jack_event in
sound/soc/intel/boards/cht_bsw_max98090_ti.c.

Note that due to ts3a227e reports the jack event right away before the
notifier is registered, if headset is plugged on boot, headset button
will not get detected until headset is unplugged and plugged. This is
still an issue to be fixed.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 0097df1fae66..e80b09143b63 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -66,10 +66,13 @@ static int rk_jack_event(struct notifier_block *nb, unsigned long event,
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
 	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
 
-	if (event & SND_JACK_MICROPHONE)
+	if (event & SND_JACK_MICROPHONE) {
 		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-	else
+		snd_soc_dapm_force_enable_pin(dapm, "SHDN");
+	} else {
 		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+		snd_soc_dapm_disable_pin(dapm, "SHDN");
+	}
 
 	snd_soc_dapm_sync(dapm);
 
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
