Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D513F272C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 09:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F54168A;
	Fri, 20 Aug 2021 09:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F54168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629443051;
	bh=H7lOSrLiwECEE/TGWWEezYApC6yd9l+zOtf+Y4a36l0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bKvravSuHH06vCtHU+3lfmzxdpq+2w3vrG7JVJ2sTPgqh4f6IeCaEuzzu15xsK6mm
	 LiE7ihKXY1wFffpHJZAS8XqL0oe8K5Jc8HL9OR402yZCgZJKwuWkE0nMGF2opFTSKT
	 yfey7I0xCVGmoXzF4QmroYXFtNH0jQYiYYB33SXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6F4F804E1;
	Fri, 20 Aug 2021 09:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F2E9F80272; Tue, 17 Aug 2021 12:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9659AF80111
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 12:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9659AF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZOD4sNyt"
Received: by mail-ej1-x630.google.com with SMTP id z20so37543590ejf.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jqw1AzmRK6zGBEx+a2c5M5+dO2MAySjNQQ8o1qXDJs8=;
 b=ZOD4sNytd4WPSZyPmbX2m9LgLSk9COCpOOmzj4bjLOzp2hFpikCaBnzFGgBEJXICwt
 DFV6SrstOLxM3pjIJQkIqAsjum+an8vUqUMGq4tdyNV+qQLzWl24Xn6SIoHoZiT9HmYs
 K6tTCTfaBYOh91jPdHHjTqZ9i22gfQjdka4U+GzF0Om23yB3MrVUsgNm8U+9JusW64Tz
 V1BHhVIxeqkxBphRPnqyzO33KJn02nxmZ4XjS4gU2sPLGkTt+gWcF1QVjPF6t4Wljy+X
 3UMt9JMbllLtSImr1hQHs/PyaM3QIy0V6JWU/I2K4yx+UPq+RTJBXjI6OSHlMMH9xHIq
 Ie2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jqw1AzmRK6zGBEx+a2c5M5+dO2MAySjNQQ8o1qXDJs8=;
 b=nkw2qJEdmmg3kuZr8HDmUE+cVHzO22CtYCTdXgRstXg5npCsZoqv3O5gWMOFGTLSTT
 wTWBWMkwka9zy80UuhHLMwaMJDxRGRNOhCXm5YrdWLv3UDSFY8DxEg9NLk2dq6MgKsiE
 B5/ocV4Yu3BG3icTLzIClXTE/6/2HMetZ/9cl4WiXYM2GeXpXAF1yJ8enV9guJtJDQpe
 6EjsXlGaj06fgdZq0RU7WraUxgd5Rl+/cErTkSoInaIOc0njBXso/ueKNZU9QEViOyy3
 HzyVfFknwoQZdq+sEbaxAhE2xTWC4MAb7/xpwCdaQZIG6q86ZeDQ0DAtHAIn3wt4ffo9
 Ra+g==
X-Gm-Message-State: AOAM533InH2Bm4h8CHSNfC+CjtimoHyXcOd5QwcHdxVmeEVdbBITKPHj
 axK/Z6LvzseyK/aTDDzt3fs=
X-Google-Smtp-Source: ABdhPJx7FraHwOny+E8f8qN3AMF/gbn3eNC37y6iQIiMzCrRbYBFSEtrtKJm1qLG9Pa6rK1MeNaVHg==
X-Received: by 2002:a17:906:4e59:: with SMTP id
 g25mr3104501ejw.399.1629195115109; 
 Tue, 17 Aug 2021 03:11:55 -0700 (PDT)
Received: from localhost.localdomain ([185.213.155.232])
 by smtp.gmail.com with ESMTPSA id m6sm822920edq.22.2021.08.17.03.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:11:54 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: 
Subject: [PATCH 0/4] Rockchip I2S/TDM controller
Date: Tue, 17 Aug 2021 12:11:15 +0200
Message-Id: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:02:12 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Hello,

I come bearing four patches for your consideration.

The first of these four patches adds a driver for the Rockchip
I2S/TDM controller, used in interfacing between the AHB bus and the
I2S bus on some Rockchip SoCs. This allows for audio playback with
a matching codec.

The controller has three different modes: I2S, I2S/TDM and PCM.
It is distinct from the earlier Rockchip I2S controller, and
therefore not just an extension of that driver.

The driver is based on the downstream version, though various
changes have been made to hopefully make it more palatable to
upstream. Some needless code duplication has been refactored, and
the probe function will no longer let wrong device tree values
write nonsense to hardware registers. Properties have been renamed
and had their semantics changed. I won't bore you with the details
of what downstream did, since that's not what I'm submitting, but
the changes are significant enough that I've added myself to the
list of authors.

The second patch adds the YAML device tree bindings for this, which
have been written from scratch by yours truly. Since I didn't like
having random integers mean things, I defined them as constants in
a header file for the bindings.

The third patch adds the i2s1 controller to the rk356x device tree.
I didn't add any of the other i2s controllers on that SoC for now as
I have no way of testing them; in particular, i2s0 is tied to HDMI,
so needs a functioning VOP2 driver to even have a chance of working.

The fourth patch makes use of the i2s1 controller to enable analog
audio output on the Quartz64 Model A through its RK817 codec. I've
tested this to work properly at both 44.1 kHz and 96 kHz, so both
mclk_root0 and mclk_root1 are definitely functioning.

This is my first kernel contribution, so I most likely did
something horribly wrong. That's why I'm more than happy to receive
any criticisms and concerns over how the driver is implemented,
because I've run out of ideas on how to make it clearly better
myself.

I'd also like to extend my thanks to Peter Geis, who has been
acting as somewhat of a mentor and gave me occasional feedback
and ideas during the writing of this patch series.

Regards,
Nicolas Frattaroli

Nicolas Frattaroli (4):
  ASoC: rockchip: add support for i2s-tdm controller
  dt-bindings: sound: add rockchip i2s-tdm binding
  arm64: dts: rockchip: add i2s1 on rk356x
  arm64: dts: rockchip: add analog audio on Quartz64

 .../bindings/sound/rockchip,i2s-tdm.yaml      |  221 ++
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   36 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   26 +
 include/dt-bindings/sound/rockchip,i2s-tdm.h  |    9 +
 sound/soc/rockchip/Kconfig                    |   11 +
 sound/soc/rockchip/Makefile                   |    2 +
 sound/soc/rockchip/rockchip_i2s_tdm.c         | 1804 +++++++++++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h         |  400 ++++
 8 files changed, 2508 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 create mode 100644 include/dt-bindings/sound/rockchip,i2s-tdm.h
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.c
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.h

-- 
2.32.0

