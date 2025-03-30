Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E073BA8410A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 12:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FE86A887;
	Thu, 10 Apr 2025 12:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FE86A887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744281827;
	bh=aQJ0XHn65sGs6NtxiUXiYeUBvt4Fj924GaZ8/5yJieA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WHsFkarYwDQwaogELUMAeHi+PV8gukTdOcVzBeqQwnuzzDZD42gjGJQ1KpJxWgIy7
	 YeeaFukwTVetElYkLhb4kWC8zbFVyvEiLwpTopAz/OSIZXdNsGJw+nvhFlVYOQ63ll
	 RwqM4ZJulOMP+R85XKGw6JIBau/VCHGtLDI16mGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01E86F805EA; Thu, 10 Apr 2025 12:43:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE86EF805DF;
	Thu, 10 Apr 2025 12:43:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EC08F804FF; Sun, 30 Mar 2025 15:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7349EF80093
	for <alsa-devel@alsa-project.org>; Sun, 30 Mar 2025 15:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7349EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fk20J4lC
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-477282401b3so38182101cf.1
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Mar 2025 06:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743340162; x=1743944962;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otHxdnQGm4FsPjJIQad3dVHmLl/Ou8a+L9FvFBgdAz4=;
        b=fk20J4lCPqtJpI2Ucwxp6T55dGN6wCpyclGrPT+JfAGhsYIXmmdLVBLUxPvUuajHxh
         9cTNxDdn/LCI/wT6tjxxPUKGNIX6atyjeKlcSQUZyrBen9mSKWyKQ1sNgcSpiXWavsBp
         vfuRNvy/gd0XJkN7iBZCn/NxaU2nZAxEO0JVatItJOa+caW1RGER/cloHraPSg98g3ER
         iBh5LGBM0jsfZk05pve0YVMZ0bgnjTasDm7kujE5QdZGGZjIwYqXucTvT6/hO4yXIdux
         BRptheQJmsOTwlPrbUZDr15/TuEQsmvBTy9aimbFTZQHdfgvv9Of9Pzg1NjKmaOvRdcX
         brjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743340162; x=1743944962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otHxdnQGm4FsPjJIQad3dVHmLl/Ou8a+L9FvFBgdAz4=;
        b=g4btlNrQq7fVXIgNtOe730uMWmKB6PJgJ+Ypht3JkvAjO/mOkCFZd30Qe0l+81odf6
         Aj2vkchUfh+x0x8KyhmNnAE9hm3WixL2jO0VnAE3ZPuTHzM1FNEe808M1ZQzPKV5JXbq
         5E3Apv/ARcvZLyh+BAT5FIzxuayNoxEBvH3AbdGJ3vG86X9z5dK+NH2m39DVEmhEWffX
         M8N/ANnYy9sQLTZRq0zGe1HuRMx/OV7n8JFym4DW4rHcgINjXwtwBjaujsjUOkzLzsoq
         tzKbdCF068dopCKVt9pl7oNH4wHmNqsLdkx4t9SMyD1j+HtgzS97PlC4dwHGtk/Faucd
         MdZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh0S2qduftWIr85zWlsaD43s6G0mWsm+Ydifa6JCNOOmsDhSHAPPNZfi99BhV/oIy18ICb2Dq0BMUh@alsa-project.org
X-Gm-Message-State: AOJu0Yx/lx4vsJ8NzQ69NAlmYM1MxR6oATWhIvHXmhbOAhIG1MFUZkaA
	RmueiJeOylkI9YrQ+inyFLUtmdHxtQk0R2Abrf3OrN4WPK4AJbK6
X-Gm-Gg: ASbGncvP0LIYe0Efoud59V0MulPFoLVOZmJR4IZF4zW5VmEoOn9aS8YYuIvTLr+MEST
	viOHOC8SZRd40zEbOkfizeb7r6GwTizQrSPlNEX3sLcpQBDWLrvqw63zsTSCkDq+HL4ES+5qVF/
	O8qCV7aLGY+9QDVY00qaXfNjZunOGeloHhfvRCrvpSJVQ/Sby2TqzbIb8z8tB8E7sDYCU644/Hi
	GZde1RL3/Q2fYgfKgxSYjpUSwAIh1HuaOXTXm0ab4Cjw6vjJRsFYpduHDUWdezjqwpIP+D1xozu
	DWetKzmH3wnjBVnz+k+pzA2C/fjZUh+mmk0HlgzNYXmp4rU/KFeAM9KMHPe9ukaG36tFJy7juty
	hXZaBlj+SJaeiiqWp4fM=
X-Google-Smtp-Source: 
 AGHT+IEV8HdK/DqdmO1+sj1GpGoXKylPrmqo89BfAGEMtLL+QVpJqbJGjIWVOPMDUkqeLA+AxhvjQg==
X-Received: by 2002:a05:622a:1a25:b0:476:8595:fa09 with SMTP id
 d75a77b69052e-477f7ae9679mr63879991cf.40.1743340161958;
        Sun, 30 Mar 2025 06:09:21 -0700 (PDT)
Received: from localhost.localdomain (c-68-55-107-1.hsd1.mi.comcast.net.
 [68.55.107.1])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-477831a65a3sm35687731cf.79.2025.03.30.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:09:21 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	u.kleine-koenig@baylibre.com,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH v2] ASoC: dwc: always enable/disable i2s irqs
Date: Sun, 30 Mar 2025 09:08:54 -0400
Message-ID: <20250330130852.37881-3-bradynorander@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y2WYS6XMHGZSKU5KOHXTEHJLYN3WMRP2
X-Message-ID-Hash: Y2WYS6XMHGZSKU5KOHXTEHJLYN3WMRP2
X-Mailman-Approved-At: Thu, 10 Apr 2025 10:42:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2WYS6XMHGZSKU5KOHXTEHJLYN3WMRP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit a42e988 ("ASoC: dwc: add DMA handshake control") changed the
behavior of the driver to not enable or disable i2s irqs if using DMA. This
breaks platforms such as AMD ACP. Audio playback appears to work but no
audio can be heard. Revert to the old behavior by always enabling and
disabling i2s irqs while keeping DMA handshake control.

Fixes: a42e988 ("ASoC: dwc: add DMA handshake control")
Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
v2: reword commit message to better describe the issue
---
 sound/soc/dwc/dwc-i2s.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 57b789d7fbed..5b4f20dbf7bb 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -199,12 +199,10 @@ static void i2s_start(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 1);
 
-	/* I2S needs to enable IRQ to make a handshake with DMAC on the JH7110 SoC */
-	if (dev->use_pio || dev->is_jh7110)
-		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
-	else
+	if (!(dev->use_pio || dev->is_jh7110))
 		i2s_enable_dma(dev, substream->stream);
 
+	i2s_enable_irqs(dev, substream->stream, config->chan_nr);
 	i2s_write_reg(dev->i2s_base, CER, 1);
 }
 
@@ -218,11 +216,12 @@ static void i2s_stop(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 0);
 
-	if (dev->use_pio || dev->is_jh7110)
-		i2s_disable_irqs(dev, substream->stream, 8);
-	else
+	if (!(dev->use_pio || dev->is_jh7110))
 		i2s_disable_dma(dev, substream->stream);
 
+	i2s_disable_irqs(dev, substream->stream, 8);
+
+
 	if (!dev->active) {
 		i2s_write_reg(dev->i2s_base, CER, 0);
 		i2s_write_reg(dev->i2s_base, IER, 0);
-- 
2.49.0

