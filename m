Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019661193A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 19:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2741B1B07;
	Fri, 28 Oct 2022 19:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2741B1B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666977805;
	bh=owBDbjvCxzGSpaI93C4l8vFdWeyPetl/yNUB4+PukMY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gusaGMzgrXsn1mBL+qO0SnXHmQvY/QYQ9R9KJ+DdojMzPikkBsvs/jmjBXe5xgqej
	 /fZzUrmO7rvkfCD4Xl4yERcDra+b9YVCp/+akdRVaFUttvQV81uB2XT5n2Ms/R25Z6
	 R0egZHBsDm31G1jcAq8HQBezjYrvcvS/SEw6R8YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76FB1F8025A;
	Fri, 28 Oct 2022 19:22:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7271AF8025A; Fri, 28 Oct 2022 19:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A7CF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 19:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A7CF80095
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="HHoLoNdP"
Received: by mail-pl1-x636.google.com with SMTP id io19so5393552plb.8
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dEA0uRMa8TxeJYRdNlWPFcX94wVGyCXF1Xf/+3rheBY=;
 b=HHoLoNdPB0qkrK/smItvMUXw2MX16VkSG3Wb6Sq6wx1V5zCqD30UFGrBr6hXMJ2NtD
 LmeLb+qv3HvSjyGgy12ZddE/iB7mNJ7JACuFtGcqPrzY8mHwKGHuriAvzs62BV4v2wG/
 lPfKQGVJ1gcrxo5EH1kUey1p98r0h9hf44iALh02HzL9VrGySlyiw3AQ+jNgcgRhRChG
 cgt7Dv10M9fjuoNaWYZCw0b9JYPbif7hrOOO7Tp7m9aSLnZ7q/rBt+LOb2B+D0Sxwz3H
 DrtV+1G4JEpf+TtxaM5YmKKbcsbZ9g9PWX+5pkTs8zGbvhQtUxY0yDrsctYzapLpogQJ
 tWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEA0uRMa8TxeJYRdNlWPFcX94wVGyCXF1Xf/+3rheBY=;
 b=nGqQSkV+RrS4Zlfimw1foq+hMUOegKFENuFi3Q7KVUGdpLc+VKJoJfPwe+QlruRciT
 rh7i39cz2EFSO7wQH7tNZIb/eQv7cB87nOqrKMichzcPXORKueO7h2eB/ptp139OpXLz
 tqjNwne3pEulQ0HjPwHLAyKuHdYeoLw0iQILR1TR2Cbd5wt9wmR5Bf2O6ln/z9d62Aes
 4FsKp0OI/8Te/Ud7U/wFq0OktFsd+PrjD6b8m5LLzEROD1vXpMAFaIS4ePVIGIGJLAVo
 far50XojUF1npqAGXBt2uUSJ6HTBToq5iI4N3DXAxjdHiLW13bLO13Uc3O8DNpkiBaI/
 IwjA==
X-Gm-Message-State: ACrzQf1GjyozfZeKEC7R51yDJFT/rXaT5DmCtFRVnTKXaYuOe13PMfUY
 9vdrTXkQSjqjQnmzEPlg3U90qg==
X-Google-Smtp-Source: AMsMyM5gtzHQRDvYEJ+/LqCO9vp/O/hO+OoVwkhVr64TlqUb8zjaWEuqctF2XEOxHfx05VuyUlixGw==
X-Received: by 2002:a17:90b:3504:b0:213:5b03:639 with SMTP id
 ls4-20020a17090b350400b002135b030639mr15666082pjb.16.1666977742507; 
 Fri, 28 Oct 2022 10:22:22 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b0021282014066sm4604945pjb.9.2022.10.28.10.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:22:22 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Date: Sat, 29 Oct 2022 01:22:13 +0800
Message-Id: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   6 ++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.25.1

