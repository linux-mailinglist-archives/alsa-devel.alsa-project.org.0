Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F408760CC2A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:43:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C7E5339;
	Tue, 25 Oct 2022 14:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C7E5339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666701800;
	bh=sC4nUwLK2yJWWZ6C5v8RzhiRLlscbT+TcPymjBavAN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jI5Emfh16vO03PNZMBc2i5+jSRKwuF1o93bsCINN94SIMXl5qnk3uTYe6AvtG3XMD
	 Pjfiti6wfdziEB9Bi06hFNj5g7iyPuTJ6LP4tf2n3q3JYZkAmalLy4pB1IrZfWPLls
	 6r0bUyzsc9PPHtfaMf/IkvcARfWDJHWWrs+IQO1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C02F80553;
	Tue, 25 Oct 2022 14:42:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE528F80553; Tue, 25 Oct 2022 14:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C63F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C63F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WM9o7GxT"
Received: by mail-wr1-x42d.google.com with SMTP id z14so7106178wrn.7
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIKotX5ooYCDPVEKi3IZCfl55eak5yxZs56MABYXuTk=;
 b=WM9o7GxTlXLmPNHjXk2Fn1+OVVEmRPipyhgvnOuYvoqTrzNOxH1gBm7FQLhnAG3AtX
 E3FkjRghlQQoSWLyK5i95gFBdGiD9sShrvBlg2LkIKJ3Cuqeq0jNFbOOklfwvpGCDxTN
 qrIKz6Z9rEuahjhhtdWP8D7OWZS24e8w0tcIW128tcn5KbQzDeZ8AS87BAAWjRMtArDX
 16Ti6CdwDxDcsTO6H4+NpzzskolLqwR4Vdu68xIorqXov7Q91Crf10M+VjbCxIeq07Hk
 b3WsaG5U3lrbesOzUDIHnhQnL/+mJdsruiBxaOxpiRDJfbqLTgdYMcIi3taTmS8SJxkn
 wPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIKotX5ooYCDPVEKi3IZCfl55eak5yxZs56MABYXuTk=;
 b=6GbMpO/WQKW/BWSptiXYBLdqiEiNR0L6V0NrzpxCgqsLINtTeJEL10+iosRGqZ2VZ1
 +HaidJa3HNgV4m5NcrqLg4lR4ekfl2DEZ68xhHQVl94WbWQQs6rzuyoPNzQk1Od2gqm3
 xV2vuDFFOsMIl/AFi/ic8XEU1UKCTOOHaGgzqggCaz/MlfsVVRjnGz7iATQsEjY6lFcd
 vQcSHvyRRP2MTLljQuj9iiUe9f3Rl68VrOb8jUvFWfQMbCRFNgkbNsZy0FVMLxHqmkUj
 4Im3Uif+AymloBVxwDd/xlffYGyXLndyeKW/7WDFPXQt/OGq4WIRka0SYVAqj2MmJ2GA
 cSCQ==
X-Gm-Message-State: ACrzQf2prjv5bLVdfmPz5YvoXXosV18gg9iwI+JSgIrtZ9uwa2r//AAg
 4pxT3UkjjgLv9GpiXX/iQMs=
X-Google-Smtp-Source: AMsMyM60B8oxsFHLS4Cs0RPNNh1I7NmYcXnq2aWXeGunVPT5z/H92YLK84eclOwVh4IjAMrLrTtXCw==
X-Received: by 2002:a1c:4454:0:b0:3cf:4792:d3ad with SMTP id
 r81-20020a1c4454000000b003cf4792d3admr886197wma.5.1666701718486; 
 Tue, 25 Oct 2022 05:41:58 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm11250664wmb.47.2022.10.25.05.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:41:58 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/4] ASoC: rockchip: i2s_tdm: Make the grf property optional
Date: Tue, 25 Oct 2022 14:41:30 +0200
Message-Id: <20221025124132.399729-3-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Only IO Multiplex and two TRCM modes need access to the GRF, so
making it a hard requirement is not a wise idea, as it complicates
support for newer SoCs which do not do these things.

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 2550bd2a5e78..917f17107891 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -756,6 +756,12 @@ static int rockchip_i2s_io_multiplex(struct snd_pcm_substream *substream,
 	if (!i2s_tdm->io_multiplex)
 		return 0;
 
+	if (IS_ERR_OR_NULL(i2s_tdm->grf)) {
+		dev_err(i2s_tdm->dev,
+			"io multiplex not supported for this device\n");
+		return -EINVAL;
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		struct snd_pcm_str *playback_str =
 			&substream->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
@@ -1222,6 +1228,12 @@ static int common_soc_init(struct device *dev, u32 addr)
 	if (trcm == TRCM_TXRX)
 		return 0;
 
+	if (IS_ERR_OR_NULL(i2s_tdm->grf)) {
+		dev_err(i2s_tdm->dev,
+			"no grf present but non-txrx TRCM specified\n");
+		return -EINVAL;
+	}
+
 	for (i = 0; i < i2s_tdm->soc_data->config_count; i++) {
 		if (addr != configs[i].addr)
 			continue;
@@ -1568,10 +1580,6 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 		return ret;
 
 	i2s_tdm->grf = syscon_regmap_lookup_by_phandle(node, "rockchip,grf");
-	if (IS_ERR(i2s_tdm->grf))
-		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->grf),
-				     "Error in rockchip,grf\n");
-
 	i2s_tdm->tx_reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								      "tx-m");
 	if (IS_ERR(i2s_tdm->tx_reset)) {
-- 
2.38.1

