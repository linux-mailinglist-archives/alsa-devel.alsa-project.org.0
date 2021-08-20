Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B013F33CB
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 20:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C7D1662;
	Fri, 20 Aug 2021 20:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C7D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629484185;
	bh=+0EXsh46ezYMxLhVldwlLYDc06Zw0+basYbnv3QeQhg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CCKb/9CtrBbAsmILJ1hmqWpJHQQFcGNzn9kjmQ8y9E2nbsPIu4Rka9JoPJoGsfvoU
	 KUP6e9Zzub5u57PvyA2D2kiz0Nj0WtNtvTwqb+sGjD0vFiXX0N/yRE8LFe7onHXY5+
	 45CI3zX32BukXkBRiD0IMPWpNXUeyPsCsolKmtYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A53AF800C1;
	Fri, 20 Aug 2021 20:28:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2982F80249; Fri, 20 Aug 2021 20:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF78F800C1
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 20:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF78F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f9cByAwt"
Received: by mail-ed1-x52c.google.com with SMTP id n12so15230168edx.8
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+fwJK6cnEZCMjdsnKpqrNeZQk4XPHKUiIqGOR28Ciyc=;
 b=f9cByAwt5N7co5rgLKUdcfgA3NWyB8162sDzKYPn0MfsiCQGnTm6Po9A5Yz9vGAJhN
 adtn6UIXbJ1zm0Ax5yU1pgAKgJeFCyyYM2rvRMhK7AQBy8mkuwe2lfDflteCV9s4TmMj
 Al7TVZS7MX7aA/U3nz3RvspdJelXqNjXSbTJCShro89hsFSXXpfIeAMl+WYXJKNhs/JY
 3HVYd6Yg34SLpsWSjuQwCCj+oeZJbRHwVNI7++0BA1dClsMr5+Qw468EQeT/YlHkQN4a
 wGu2FNyH2eCUti/TfIVVtqTwNdpfAcRlTswIbNf1V8AAp/pAvXU5MKgt2vDXWnSdAJl4
 tC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+fwJK6cnEZCMjdsnKpqrNeZQk4XPHKUiIqGOR28Ciyc=;
 b=dWkfEsz8dzEIewiZDVkCU8NH7dNrx1uzEe36sksYtShoJAr+x1m/EG18QPQiZppJKs
 0miQ5MxQ0kpvbdVPVOpoHwyyjc+uHdMFi5bXXbGE6waIcyTZHqtJ6I7fCws0PXooWvM9
 hsJ4hX+p0nokDBiZABk0RUESQNh6gOr2c9lVBI2GRB8E2VevGvaIIldEc7I/raY0iQaH
 zPbDHkxqaE9wNcXWIptE6EiJUm8FFEB71lI0oVvi98JZdQ/Z3YdFZX/8mli5scYva60F
 F6b+/GdzvulktzGTLF/hA2q33MxdvbjrfJU6KZKfOZvRpS8RHW+hEBZTkIH0dhLdvpI0
 iZlg==
X-Gm-Message-State: AOAM530Rj/xtM5uBe/EJSdHttGoecFdmuXkPdhBop7hRtYe8saa7egIA
 OmDugk4mfTlrPddgEH5c/o0=
X-Google-Smtp-Source: ABdhPJzJfYq4YbWtWWxg0FlVHG1GBA1BRHiyIib6NSGMRYw5NSToA66ll1pqB7aSeGllAPnac5DuPA==
X-Received: by 2002:a05:6402:100d:: with SMTP id
 c13mr23727138edu.261.1629484094603; 
 Fri, 20 Aug 2021 11:28:14 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id n10sm3255724ejk.86.2021.08.20.11.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 11:28:14 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: 
Subject: [PATCH v2 0/4] Rockchip I2S/TDM controller
Date: Fri, 20 Aug 2021 20:27:27 +0200
Message-Id: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes in v2:
 - remove ad-hoc writeq and needless (and broken) optimisation in
   reset assert/deassert. This wouldn't have worked on Big Endian,
   and would've been pointless on any other platform, as the
   overhead for saving one write was comparatively big
 - fix various checkpatch issues
 - get rid of leftover clk-trcm in schema
 - set status = "okay" in example in schema instead of "disabled"
 - change dma-names so rx is first, adjust device trees as necessary
 - properly reference uint32-array for rx-route and tx-route
   instead of uint32
 - replace trcm-sync with two boolean properties, adjust DT changes
   accordingly and also get rid of the header file
 - get rid of rockchip,no-dmaengine. This was only needed for
   some downstream driver and shouldn't be in the DT
 - get rid of rockchip,capture-only/playback-only. Rationale being
   that I have no way to test whether they're needed, and
   unconditionally setting channels_min to 0 breaks everything
 - change hclk description in "clocks"

Additionally, I have been made aware that registers and code seem
to be an extension of the rockchip_i2s driver. This is true,
though merging the two seems like more effort than just slapping
a few compatibles and properties into the mix. I'll investigate
it further in the coming weeks, but would likely still prefer
basing any unified driver on mine rather than the other way
around, since I think it has better code quality now.

Original cover letter:

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

 .../bindings/sound/rockchip,i2s-tdm.yaml      |  193 ++
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   35 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   26 +
 sound/soc/rockchip/Kconfig                    |   11 +
 sound/soc/rockchip/Makefile                   |    2 +
 sound/soc/rockchip/rockchip_i2s_tdm.c         | 1737 +++++++++++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h         |  398 ++++
 7 files changed, 2401 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.c
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.h

-- 
2.32.0

