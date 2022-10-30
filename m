Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73161293A
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 09:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD0C86F;
	Sun, 30 Oct 2022 09:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD0C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667120107;
	bh=kx//Io7Z9l9N9wg1akn5O1Ow3b/dDgoBcnWt6RSmm5c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sRDxL5fwHGvrLnQ5RR18ULOwaOpPU4Sf8znK/v81xzMfmjTGqqGN/bf3AMj4rkniV
	 3Lau3h6jQKNAeHM7li4TmY6RS+SxL/DisZwgS4vbG0+23AGDsohhLBVQ6IRI5RNpWR
	 pVWz9IlECan3dC+cs3SCeyCA/rdNCCUr1M08hbdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76D4DF8023B;
	Sun, 30 Oct 2022 09:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 989C7F80217; Sun, 30 Oct 2022 09:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8018F800A7
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 09:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8018F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="bbXRih8T"
Received: by mail-pl1-x62c.google.com with SMTP id j12so8366064plj.5
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rDkvQjMnPy2Fy0mBItWeOo1V6hYUJ0mhKJvHwDCVi2w=;
 b=bbXRih8TjXzbqHh25uHOxJWFLQw+e1DlCLIq7nhMGQtwji80VAHDq+N4U3++UXV2V3
 Gtv/VtUzMHdL1OkWJNAu+KJGnQpPD+DN8VV/Sl7ulgdHwvTeko0Dg3vy6HVhMHSa6tZ5
 UAy9hUSx6ob+N6sVx+UO9Du0G68SC2Nb6oumIyxC2v1mmD3pg3i/IC8KgCqNrmtewVQK
 TOPm5NQ4hegcpcMOJc9+++rjfnYFlzgowdkhPpjZJfX9fggNcHy7U/kqs8kFOmvffqEL
 Qj7lV+QsXIBwqztGBmQ4uEAJutXxdXn6nZv+VtvVvd3Yq0qHpKioH+X+s3/FYgZH8c+c
 mcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDkvQjMnPy2Fy0mBItWeOo1V6hYUJ0mhKJvHwDCVi2w=;
 b=Gv8krq/+Tnc9phgdba/PuKMbh6Y2zkWbCO1nQaOELx+3RhGNTEU/7bAQ10XBB2Vm/d
 gl6rKobCjf6EFMRlguZex6Y4tA7kfnyr/qEpkXvd3/fomJO52J6av7r+ubt6Kx7OZ/sQ
 sYbHA+/NdswYVSDuRJS3AB4uJqofjOBp+krFNWrRsuPEKkp2/qK9D7BxwlxbHLcAYryH
 CcscQoa4+xItfXtTkz8IhIbSAed9u8d2DiRZjY4daDuRxFclTbWzvmZeiOfm2r3mC6zR
 gvBgvukYWP0eEZyc4no7Py3Xe5SEx2X6eNcwJeum765Il48l479/TpmAWujh03X8DarE
 wnqw==
X-Gm-Message-State: ACrzQf3ep/hsASWRKO3NurmHH38iOXXOA5D+0/XnLAeycWhG+8GXggm3
 LCIBB7WXWxVbzyVIruGNdkYKlw==
X-Google-Smtp-Source: AMsMyM5f9T1Rh9DrdO2JxLDorJoTNDYAWA/e2ujdB/uQxvpcNDMnY2R2vO3fkNs5lc6OSJVNq7YJ5Q==
X-Received: by 2002:a17:903:110f:b0:178:ae31:ab2 with SMTP id
 n15-20020a170903110f00b00178ae310ab2mr8322365plh.89.1667120046351; 
 Sun, 30 Oct 2022 01:54:06 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net.
 [118.167.185.125]) by smtp.gmail.com with ESMTPSA id
 n9-20020a63f809000000b0041ae78c3493sm2054627pgh.52.2022.10.30.01.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 01:54:06 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Date: Sun, 30 Oct 2022 16:53:56 +0800
Message-Id: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

v3:
- Documentation: 
  - Add an explain example in description.
  - Add the pinctrl-name and pinctrl id in its example.

v2:
- dmic codec driver: 
  - Remove the unnecessary use of_property_read_bool()

v1:
- Documentation: Add dmic-gpios optional prop for two DMICs case.
- dmic codec driver: 
  - "dmic-gpios" property is used for amixer control to switch
     the dmic signal source between the Front and Rear Dmic.

Thanks for the review!

Ajye Huang (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
  ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs
    case

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  13 ++-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.25.1

