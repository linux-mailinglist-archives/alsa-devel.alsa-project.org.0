Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08494430241
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Oct 2021 12:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798BC1840;
	Sat, 16 Oct 2021 12:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798BC1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634381747;
	bh=EcvCoFSHZENYN7stDu5A4FBacttmz8Yafbdh0rI48xg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sf9HaC9dLn5aNkXl423pisU+dTfhzrCqJ1wdgxiO5QID02zK9kp086S6V+Bswv00L
	 4MSlX+JOxmIG7377P/jEFYAo93CG5T+CfBxJt+Y00gM8PmMQHZg092eg1BS+i1xSwq
	 YLhl+VLTEcCr9PTB7LjoYW66n1QMsPte7IIvxZ8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC39BF800C5;
	Sat, 16 Oct 2021 12:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 174FFF80212; Sat, 16 Oct 2021 12:54:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1794F800C5
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 12:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1794F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l/7qp0MV"
Received: by mail-lf1-x131.google.com with SMTP id z11so51853339lfj.4
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nXEEQOI2UyvJFPHSDiyUoFnaQvmSXlf0s7F8x76wlc=;
 b=l/7qp0MVktj3pxcjYP9oXhD8My/pkVceyXH3oedix5GS9BxwMQjo7JAd2GUyEpLgFJ
 6A3jHx9ICFXkVdu49qN0hEKmZrz2ZEhlTdvdmse34ktf0ATlExTZ3OMVZu32xnbqJW2P
 FDxZAHo9raJeXntES+2CUbL1k0Ay4WGatGyhMlmjXlTTBLjbACCTP2AdAj1spaQXMZVO
 5lD3PoaKhStIqLiTf/+T+GH2ACtOO/3folt0bgzpwcCp/jolrhr64pEViAd1HVdYa5lH
 VG6/fFrRSBy+fuIPUTC8+vbdCVoec4GuTn2lbS5SElm+OCp1q+t72Rg40uIFVSVr6ps7
 0a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nXEEQOI2UyvJFPHSDiyUoFnaQvmSXlf0s7F8x76wlc=;
 b=CLTNxqtH7exR+Jrx0CAf8pNJS8cX7EAirEEjLpQESPAeqBsbND/DuP07bCZrDJWYXN
 ci2fBrGMx2p9JD369osK31hE3VwocfvYohtf7v2qKEIegsbSSdqcjly5nMcZf7Xl9ZYZ
 q+blZovANCEqW6uebIvRdiAisaIb6OWM/zn/OLql8/Un9mTLnhyFXiNaMi2m0rO0FO7/
 QzqE4nsr0N241eXvgSlACGDS1HszL6T7RReGFYqaCfGvY2mCJBN+JiWZY4NZ8J9xjy4+
 p7sjTQbE7aHucC2chzyFbpH9JjsxsTSse0oOFq9Xw54K3raCttABqZpqUg9jq2dq3bcq
 L9Ww==
X-Gm-Message-State: AOAM530tOEEKqa8YJBLaXUVDNA7EdWUBfTyrmrnZYbKKEBRWDibMIXyG
 7f8s/sw5Lzb1aWba/HBexk8=
X-Google-Smtp-Source: ABdhPJy71ErVHEZBd5Yxc8l9Ddc4qLHPXpX6v/GjX9j4ndPss0lcNvuXGDEW7DzF5dJ7R5zXECcltg==
X-Received: by 2002:a05:651c:2121:: with SMTP id
 a33mr6782437ljq.490.1634381657633; 
 Sat, 16 Oct 2021 03:54:17 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id r3sm814224lfc.131.2021.10.16.03.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 03:54:17 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: 
Subject: [PATCH 0/4] Getting rid of the reset controller in i2s-tdm
Date: Sat, 16 Oct 2021 12:53:49 +0200
Message-Id: <20211016105354.116513-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
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

after some discussion with Heiko on IRC, he has admitted to me
that the rockchip,cru property, and its corresponding half a reset
controller in the driver, is weighing heavily on his mind.

The background is that if the lrck only uses one clock for both rx
and tx direction, then according to the downstream driver, the rx
and tx resets should be asserted at roughly the same time to keep
things in sync.

Since there is no existing kernel way of doing this, the driver
would manually write to the CRU's registers to achieve this,
violating abstractions.

We've agreed that an atomic bulk reset API would be the best way to
achieve what it does in a clean fashion. The details of such an API
have yet to be worked out by me, but as it turns out, this is not
a pressing need.

During my investigation, I noticed that I can simply drop the
synchronised reset for now and assert the two resets manually one
after the other, and deassert them in the same manner.

For the case I care about, which is audio playback, this seems to
work just fine. Should someone actually find a case where this
causes a problem, it should be fixed with an atomic bulk reset API.

Patch 1 removes the direct CRU writing stuff from the i2s-tdm driver.

Patch 2 drops the rockchip,cru property from the bindings; they have
not yet been in a kernel release, so as far as I know, we can still
change them with no regard for backwards compatibility.

Patch 3 adds the rk356x i2s1 node without the rockchip,cru property.

Patch 4 adds the analog audio output on Quartz64, included here for
Heiko's convenience.

Regards,
Nicolas Frattaroli

Nicolas Frattaroli (4):
  ASoC: rockchip: i2s-tdm: Strip out direct CRU use
  ASoC: dt-bindings: rockchip: i2s-tdm: Drop rockchip,cru property
  arm64: dts: rockchip: Add i2s1 on rk356x
  arm64: dts: rockchip: Add analog audio on Quartz64

 .../bindings/sound/rockchip,i2s-tdm.yaml      |  16 ---
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |  31 ++++-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |  25 ++++
 sound/soc/rockchip/rockchip_i2s_tdm.c         | 126 +++---------------
 4 files changed, 76 insertions(+), 122 deletions(-)

-- 
2.33.1

