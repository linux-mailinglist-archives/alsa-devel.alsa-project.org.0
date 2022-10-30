Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787F612BE5
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 18:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F153E7;
	Sun, 30 Oct 2022 18:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F153E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667150842;
	bh=ZnG9j5+hNfmsxbnY6BILght7U9IdgquOAfqlxtpdko0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K4ynUIzUxAZf9xhXAxLPlEawVxwrqy5q8yMdr3gHDCuJT9VARjYPMdYmgpi8T2LWc
	 xKVSQWbk0t5GzKPNtpQP/ueiuPprZxCUoi3QMHwseFHNE+fW7tm6w12RlTfcLlyxiw
	 hj0RGGaKMQYdiCHbNZJIXGTTzDhi68HcbyHdPP1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37897F8023B;
	Sun, 30 Oct 2022 18:26:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA59F80217; Sun, 30 Oct 2022 18:26:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B75DCF800E1
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 18:26:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75DCF800E1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="bcK5f8GS"
Received: by mail-pj1-x102f.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso14080873pjc.0
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gLXxaEi/fgQzftVcfZ/5ZZW/Hv9wZqoHOKy0rIFeuG8=;
 b=bcK5f8GSJ5au6s7UOKhNfCDgpZhwaC4LcSCnk+IiN0XipjzOVWFQHfnmNcJZVO0Ar5
 YdWDkuBbVY9SYg7w8/m/pVwcHjpcGjLO4IkQ2V10e6rcMvJ1rm74AKG5tkv4OF3lHK6I
 RSOBTelhZdmuUSEsnQSbmx0PAaaEBYZEi1xSQPuSm0Sbbq6EHv/flF8jK7igMQB8NuGV
 lxLZRsXFTBAffbC0d9CwKQbdHbX+ZbtXxH0JKVaxxVf5qKsvVe84vazlXbrZRG9A203V
 uwkownSc2icUzj4KwF8azkioe0pb8die0hGVgPk/OeUF8sM7dzzftXrAylTAri4cgkkw
 +mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLXxaEi/fgQzftVcfZ/5ZZW/Hv9wZqoHOKy0rIFeuG8=;
 b=2+0U7wiRMLDGcbi8Kj/H5r4f7BCX/q2P/f5VVywZfeIcPgNqcRfhL2rYQrl0U0pTft
 IIWxovZLwo9vz6ktvpgXYbwJkC7XDeJxL+kCb0ojFuKyadWSGTp3Pf7nyfpC8VceIFdE
 iac3J8Hq5DzQ757JwR6u0kUk/S0U3SDgiakLO6YR2wAM/2tR9jHv3vlrBnddqLTzumdF
 6gLvQmlvOMZhj34giJpoqWovK1z+x8DpRE52LP0NgbkwHzemGj6OpO3MwVDoxg2GsUfN
 9w3OkhV7cqCvW8Fd3toqCv/rKb15MZ8FRrCgvemPpFOtPhvlD5kxdKcy/5B4XWRYf8w5
 bGxg==
X-Gm-Message-State: ACrzQf2uML1JTJzJNt/aWUaCVZxxArqYZ+6TKiDLYi45es5M0+8IUixz
 qUGHFZ/NJRHWWySSITG1+jsH/w==
X-Google-Smtp-Source: AMsMyM57weFMujeT2e1myPTiJTj/yCu1MkIsK+ndDUMX4i6e/QPc5/xyzt5HOPqMh/2WCIiV3wZ0kg==
X-Received: by 2002:a17:903:2346:b0:186:ba56:f520 with SMTP id
 c6-20020a170903234600b00186ba56f520mr9937566plh.138.1667150781108; 
 Sun, 30 Oct 2022 10:26:21 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net.
 [118.167.185.125]) by smtp.gmail.com with ESMTPSA id
 q14-20020a170902a3ce00b00186c6d2e7e3sm2933881plb.26.2022.10.30.10.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 10:26:20 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Date: Mon, 31 Oct 2022 01:26:07 +0800
Message-Id: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
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

v4:
- Documentation: 
  - Fix the FATAL ERROR: Unable to parse input tree.

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

