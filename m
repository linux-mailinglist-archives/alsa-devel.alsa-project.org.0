Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95929ECB42
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2D82BD3;
	Wed, 11 Dec 2024 12:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2D82BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916768;
	bh=JQNGPZYkGQRQ2sTS79lFZ6me2mcLImriGT7BK3n9sx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gYp9fhCv4tJNmL6Uh5ilcPP3ITh54U2FCvWnPInFvNB2K877F/EPVLVezYJI5DyFF
	 w+P+YyiTTmuOcGIE0+E0oFO4p5My/Iz9Cd3UFCS01N2C2+I7X/4/4SEgS5xk2zKAu1
	 ozoCDasjTRKj4NdT9KBbQH5EPeGwRi5wuz8QWLys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362FAF805E4; Wed, 11 Dec 2024 12:28:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8353CF805ED;
	Wed, 11 Dec 2024 12:28:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A6D7F80533; Tue, 10 Dec 2024 18:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98906F80482
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98906F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=aTdtzUc7
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so5214486a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850645; x=1734455445;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdorf6J6oUWOvTlM/ckHP3yguOeZKUZzy/Da078XD3Q=;
        b=aTdtzUc7lsvq/h4ioxi0n/wBtYid5XIfgvKZw6a8DcF/S6Bpt1qDwyZSboMDpxtCQR
         4jcbZGKoGaPB0G8iErihoYacYe159KPnIU+4TfCTW20HFJn11lj6FONsn3E2v4x5D0Fh
         PV5nhy72fbExk507x5Pm9vNowoypgs58vnVAFGJ9RthrgISx7gsLgDZwCFxaEd4z6P4u
         qDDnzora/BDf2D1sEQQ1pEsvHXsjApzgb97x/BYDX0VD76nki3iWLSQp8WLmB1+rRWYg
         TLe8O1Uciu6A8IUBKDCRx1qfwrwb5CT3e0gaP3Vv4M4QlRc2A5qz10Dch7fHpY8kW/qN
         +BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850645; x=1734455445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdorf6J6oUWOvTlM/ckHP3yguOeZKUZzy/Da078XD3Q=;
        b=WOaoq/oBoy9CD2TyWKNvgr3VXdTJ6HWJ+N5ARjdZj7ZInLS4rcEiy4oPHMmzqOL7lY
         6GXILB/kohhhwZeRV5VySEfnNNqm4vEA5XrmDjrr2eHnKq7MqWVbHT6wWszWvV3slWfH
         QWiBAMqnhhtn2ln+G8LF08bL5ZXW3lpwCE8P9GcrIabWFJ/+ttwdqjP/bt0BIBhOMAIF
         xMRQCN8CNknSimUQy05EpmldMJlgUrqcUn0rYdVuzcLKJ1GjhbEA3ueDVjjcepcgJ5q+
         RBrCegblRQph0C5u2qGO/E8TJzumZ2KsKqpGpNimzBp+3cQA2kn5N3WUuy1vGp/fKa8d
         ulTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5cJ4RPaeRD+59VzuvMNZMLjUumWocS8Yx5mlYKBahr34zgkP/vwcj2UZfW2Crl05YI8XIEuxWE357@alsa-project.org
X-Gm-Message-State: AOJu0Yw9jCMuncxWzgV6aGW09bePoiJch5t8hnGP+IaQH7vQ6xT6Bz3y
	zR+nevDt71odkRqPlRqAFAK9jodW9reJgBLJoAej183y8OKLMF3xEUogUb7nL6E=
X-Gm-Gg: ASbGncu2bNhS693wIulzcQdhNTq28MUxJnhl34cQeUkZd1MLKNBu47vwCbfpa5//bwC
	3oYcN0zZ1cSt77qEEeZ+Dr9GaE/Gp37bLL1kHkAIAdHocID06DoGjGrNuYuW5L0wgTZPee8tB35
	SZoNBw/iLRopBbO5u6lwntjfZaLHxYpy1zEaGsCt7BYdQT0z2dgMW69pZ0lPfXEB3uFqMRIgDmW
	VcLfKUgwED48lkyhT0LhyVqm1IEroPpLtkWWY+iokSCUaYzDS0HAM+hth6e1Km4uKgHhefybEL/
	Z2kbHa1p
X-Google-Smtp-Source: 
 AGHT+IG0YYavl8GoEPcOWdjWdvPZujuBgG2HJ16HofI4S8uWOgmyS/RSRLDoRpiWfKoP6RlhHB13MA==
X-Received: by 2002:a05:6402:3493:b0:5d3:e9fd:9a15 with SMTP id
 4fb4d7f45d1cf-5d3e9fd9b71mr12243945a12.32.1733850644830;
        Tue, 10 Dec 2024 09:10:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:43 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 17/24] ASoC: renesas: rz-ssi: Add suspend to RAM support
Date: Tue, 10 Dec 2024 19:09:46 +0200
Message-Id: <20241210170953.2936724-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X6CZSZ2VNAUVIY3HTV46MKNQHG72TSQX
X-Message-ID-Hash: X6CZSZ2VNAUVIY3HTV46MKNQHG72TSQX
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6CZSZ2VNAUVIY3HTV46MKNQHG72TSQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSIF-2 IP is available on the Renesas RZ/G3S SoC. The Renesas RZ/G3S
SoC supports a power-saving mode where power to most of the SoC
components is turned off. Add suspend/resume support to the SSIF-2 driver
to support this power-saving mode.

On SNDRV_PCM_TRIGGER_SUSPEND trigger the SSI is stopped (the stream
user pointer is left untouched to avoid breaking user space and the dma
buffer pointer is set to zero), on SNDRV_PCM_TRIGGER_RESUME software reset
is issued for the SSIF-2 IP and the clocks are re-configured.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 46 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 486822d79458..d48e2e7356b6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -782,6 +782,32 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	return -ENODEV;
 }
 
+static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
+{
+	int ret;
+
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return 0;
+
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
+	return rz_ssi_clk_setup(ssi, ssi->hw_params_cache.rate,
+				ssi->hw_params_cache.channels);
+}
+
+static void rz_ssi_streams_suspend(struct rz_ssi_priv *ssi)
+{
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return;
+
+	ssi->playback.dma_buffer_pos = 0;
+	ssi->capture.dma_buffer_pos = 0;
+}
+
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -790,8 +816,16 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0, i, num_transfer = 1;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = rz_ssi_trigger_resume(ssi);
+		if (ret)
+			return ret;
+
+		fallthrough;
+
 	case SNDRV_PCM_TRIGGER_START:
-		rz_ssi_stream_init(strm, substream);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
 			bool is_playback;
@@ -819,6 +853,12 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		ret = rz_ssi_start(ssi, strm);
 		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		rz_ssi_stop(ssi, strm);
+		rz_ssi_streams_suspend(ssi);
+		break;
+
 	case SNDRV_PCM_TRIGGER_STOP:
 		rz_ssi_stop(ssi, strm);
 		rz_ssi_stream_quit(ssi, strm);
@@ -958,7 +998,8 @@ static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
-				  SNDRV_PCM_INFO_MMAP_VALID,
+				  SNDRV_PCM_INFO_MMAP_VALID	|
+				  SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -1201,6 +1242,7 @@ static int rz_ssi_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops rz_ssi_pm_ops = {
 	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver rz_ssi_driver = {
-- 
2.39.2

