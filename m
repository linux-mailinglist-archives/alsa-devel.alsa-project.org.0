Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C2A1C8A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1ED166A;
	Thu, 29 Aug 2019 16:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1ED166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088280;
	bh=tE6NGZv0JTcCUc9Mk24LPtF+gS4k1nsgYFlIuxbUFRU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cBbi/Q8hgAV4GNXggqOEhI3wKWaH3DxBpH8e+TvZEKhpMdrHgcjM9xWKVnROYthW2
	 flwTyLzVq2oYbzaSqdqKsXdD1pV7GkcGGZBvEG+9zkX5n60Mu6kfqtg+DnwpjDjpop
	 Mp9ux6KMn7lXepAChWLvws86MOGSq/oTc1hFcTZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 193F0F8982B;
	Thu, 29 Aug 2019 06:30:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB77F80C0B; Thu, 29 Aug 2019 06:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6B76F89827
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 06:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6B76F89827
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MMK7O5IU"
Received: by mail-pf1-x442.google.com with SMTP id i30so1168325pfk.9
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 21:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjPTSP9KK2QsqjmhzaDx1khiUa3+dCf9cZMoVMaAshk=;
 b=MMK7O5IUDss97+ZReyNXw062RBZnNuHPYc45XAcCIE0DL5/DB+mNF+5x81uwfZZ9fh
 LrEZ3DrQ4CCRN2P4AHfiQxbBoS/6fKM2ZqMmGV4BBMpM31+fR4kYqVAjtWFGBilNpbqJ
 XVYy0EPLnGvGvc2zVSJPSyF8gdUOu4Vu4gvIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjPTSP9KK2QsqjmhzaDx1khiUa3+dCf9cZMoVMaAshk=;
 b=IFe1evDBGu8xvPTqF8qhSxgYWICwSy7lJLETdktEslduhsCZj+67qaPRYbrzB+GRmo
 1mMGdOjgU6xyUx7dZdYZ74Z7YekMl0KZEBNU3OfH0J+vZJy4o3fTzY0YvBWZQZPZyTOD
 WHpbAbPsWU94vVo+SHBw+fERzvITrJGQ5lz0VcL9BNpx3yegbCR3ZziqqEqPunzACFTp
 DV9YkulZ10S5HiqYxr/9zjMWzFE0oW0qDXBcxppCzpvPYss0h6duraCxGprnGtR7BNoZ
 +pCm2PXDRIstKh4BSmvldaQamzv8u9jSM6wb7/InFOrKw4NLYIS8IrHO5FBBeEfH8k8I
 P2Vw==
X-Gm-Message-State: APjAAAUktglDmqkAWxZxEhDGC4vXOCX6UcNcTwLTkZM32x+MOAwX7feG
 /nv5JwluPZsnZoNc2oskOrfrYQ==
X-Google-Smtp-Source: APXvYqyPaVF6cNmZOG33dRsz6I4yq7+2LHI4Ys4JgoXMTN5eZVkbgzvy71GI5pd6/ByGdtUhZbRStg==
X-Received: by 2002:a17:90a:2525:: with SMTP id
 j34mr8022406pje.11.1567053013589; 
 Wed, 28 Aug 2019 21:30:13 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id s72sm717756pgc.92.2019.08.28.21.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2019 21:30:12 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Aug 2019 12:29:57 +0800
Message-Id: <20190829042957.150929-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org, zhengxing@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, a.hajda@samsung.com, airlied@linux.ie,
 jeffy.chen@rock-chips.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com,
 linux-rockchip@lists.infradead.org, eddie.cai@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 enric.balletbo@collabora.com, dgreid@chromium.org, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH] drm: dw-hdmi-i2s: enable audio clock in
	audio_startup
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

In the designware databook, the sequence of enabling audio clock and
setting format is not clearly specified.
Currently, audio clock is enabled in the end of hw_param ops after
setting format.

On some monitors, there is a possibility that audio does not come out.
Fix this by enabling audio clock in audio_startup ops
before hw_param ops setting format.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 5cbb71a866d5..08b4adbb1ddc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -69,6 +69,14 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
 	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
 
+	return 0;
+}
+
+static int dw_hdmi_i2s_audio_startup(struct device *dev, void *data)
+{
+	struct dw_hdmi_i2s_audio_data *audio = data;
+	struct dw_hdmi *hdmi = audio->hdmi;
+
 	dw_hdmi_audio_enable(hdmi);
 
 	return 0;
@@ -105,6 +113,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 }
 
 static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
+	.audio_startup = dw_hdmi_i2s_audio_startup,
 	.hw_params	= dw_hdmi_i2s_hw_params,
 	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
 	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
