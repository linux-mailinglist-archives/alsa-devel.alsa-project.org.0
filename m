Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29A60CC1E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A1F5307;
	Tue, 25 Oct 2022 14:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A1F5307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666701772;
	bh=hDTkX7Vk4zBvTcpvUXNRgG/UefbYfTFPBCWcG5WEUzo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=evuHCj7+g75lymOjEbsoFcKyxxpRu2enGmfJZQ2XkvSBEoLlEPDum/v4xcjPlMTLa
	 OIw3L5b1Hj77uII71rqtyCSZ5ai2HYFgb0+UGrS/9wixlGLs3ZTOBrjlJSvTpfzOqb
	 8g3c5LUNbMU+j+MA+imgheEgwUEYREpvweP+EPBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77284F80100;
	Tue, 25 Oct 2022 14:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D8BF80240; Tue, 25 Oct 2022 14:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17CBCF80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17CBCF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ADcgveVq"
Received: by mail-wr1-x432.google.com with SMTP id y16so10166238wrt.12
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yH8jcG0t2JnpHFP328ErEiy3xOc8p7F+XJJ12TGrYJ4=;
 b=ADcgveVq42dClUSYh1OdhJor5VPmcRA6oevJkoIoUn3cs3uhGEVs3eTiNOnAQDUoJ3
 jqZ/Cza0BIP9QGy8ZetmZ8xAoA7TYpkv0rRaIJ4iysx4ine4E4lEjxcHjGGMNC4p77Bs
 gVHSlRuSEYGign0vPFAYRcC/AVLOPVWpMUF8xX7GO4RkO1Af9UuWuD4yhAOTmBV3v1ml
 etxwfTQTQXCVmxYSy4oMnLxyZS/v40OOCw0y+anTWWnZ9czbBgVVn3RxflHj91yVsNYu
 JXRLAlTRPXOMxGb0Q8lAXZBI+SKVQ4xjDFNYj36MnwsrfDzCTVN5rEzyN1uoUxj/6PKv
 UREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yH8jcG0t2JnpHFP328ErEiy3xOc8p7F+XJJ12TGrYJ4=;
 b=49GALqkyiHCVfOa/LK4GXq9aj7dx9jXblLLAVUHe4LIF9k6LD9RB4e2XFBSc4IZxyW
 GcQhmawcMoMD4t/qiuzEHz5r0qZa+Uwymu7itCVFGeWUu5nTI9crAToLUKartubNEEEK
 PLN+7R9tM3KZT/PZR4moXifMeXYGEYC/HgclSThrC7mJD6DwtBhpZGuhGrYKD2B51fvW
 yJ9z0MEnvTricxDT0B0rE7NbyH/3jwScmAztkyTzyLQ0jWFlSKJlO9LqCdvM9lDUfMkb
 oBoxH2CQR+IAA/AdyZ1SQhknNci2M2VQ3kmQm1NimWEJFAe7iCwuJrjt3FFx1hcVHMvA
 qAWg==
X-Gm-Message-State: ACrzQf39Zb5gTdOKn4sPinh0tWa/yq/hEd1OWnfxcsGD9IRmyUU/it6J
 QlAYsqnynciEE1ioF0aZEa8=
X-Google-Smtp-Source: AMsMyM79M+Qo60SRQPkng0nGNuvvyofmUH45lXPvafVewbcusEHRtb9umhJDmerFTJrt94xMZHytvQ==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr5463369wrs.715.1666701710247; 
 Tue, 25 Oct 2022 05:41:50 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm11250664wmb.47.2022.10.25.05.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:41:49 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: 
Subject: [PATCH 0/4] RK3588 Audio Support
Date: Tue, 25 Oct 2022 14:41:28 +0200
Message-Id: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

This patchset refactors the Rockchip I2S/TDM driver in order to
support the RK3588 SoC, and then adds the necessary compatible
string to load the driver for it.

Patch 1 rectifies a problem with the bindings where we were too
strict about requiring the rockchip,grf property. Most features
of this audio device don't need access to the GRF to function.

Patch 2 modifies the driver to adjust its behaviour to what the
changed bindings now allow, namely using most things without the
GRF.

Patch 3 and 4 are boring compatible string stuff that enables
RK3588 support. No special data is needed to initialise the
driver for this instance of the I2S/TDM IP.

Nicolas Frattaroli (4):
  ASoC: dt-bindings: rockchip: i2s-tdm: Make grf property optional
  ASoC: rockchip: i2s_tdm: Make the grf property optional
  ASoC: dt-bindings: rockchip: i2s-tdm: Add RK3588 compatible
  ASoC: rockchip: i2s_tdm: Add support for RK3588

 .../bindings/sound/rockchip,i2s-tdm.yaml      |  2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c         | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.38.1

