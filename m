Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF8613610
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 13:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA5751669;
	Mon, 31 Oct 2022 13:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA5751669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667219012;
	bh=fuA5oIGA6HorqazXUxQ0cfJZGsIVrDF/CZfS+LDE5S4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mhJhh1mhcGULEQ1RgddDUaHbQGPYmru8xKb6leUZnng8vuAYWPH7zjO697h1K7TQZ
	 JxCUfrqgptjN9tKnrPFan8CyGQVXDdNF3Zlp+v/l9xlFDnc8Vd29IS8IxyN5PVIIi4
	 6tmF1ij7qWOQY1hWzG/jwZ8yAjMbgh3Jf9P+tmEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D804F800E1;
	Mon, 31 Oct 2022 13:22:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53904F80163; Mon, 31 Oct 2022 13:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE89F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 13:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE89F800E1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="pSFqsqmB"
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so436069pjl.3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SIKG/oo700nGZV4lbYvo18YgIVmpoqqm9J9pS6SKop0=;
 b=pSFqsqmB6iD2hTJHlxCmZ5NN1/0+mRNsNZqEYWat8iEJ87MWgA1PL7adKCzGNIOn0/
 gkV18E/0rOa4kFsHSC+/iRck53OqhKc1b59DIRt7/9wOlm/GTnsR2muo8FmRLD+CHWMq
 1/4uin+d0XC8IrToPzg2XjJX0NcRkWSLE0U3fpi70lXp2+7k19kVM7EJd1FaXhtSn3xR
 oUsPNJywZ842FStSZQoLgUxFVxfPHSz5WbWEjT6lospF5Lu+o/wjom+OMM+77gH8AUOy
 TBkE7xvdaMHvAm+4fW32ewQ96AoKIRDui1COF6g+u/LFlcJnaRpEcuRFcuUcrgAyuZhY
 bHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIKG/oo700nGZV4lbYvo18YgIVmpoqqm9J9pS6SKop0=;
 b=NxW3cSCDQjlkHaCejo9bV6TGO9oLFu6RI3JzKuHy6MoLXit/S/2DFUd4ZsIZv65GJX
 SIv6enFsfsEGp9TkfRfZKCliBIUlXqtDVRKQjt0XtEBVUzok1I9AkU7aaI1yrjpWg1eg
 XtYAoGbkvJ1HZjgLtowfnyruHK3UBo2/oFiBHZ+sZzzUYBfNfeqeooVOkpUodd0c9nxT
 ikhJS6daaSYyW6TmAKdj7905dQa6K24GiUPhKRvwrWIntU7HAuUwDz/opoKD11h7bBDq
 CirlKhKRn1HCoT8n8qsW2xaCtFwOdmn7MmoZcRPNmG4qxLLy9ZIRaky/ChjhZc/N07KJ
 Sw1Q==
X-Gm-Message-State: ACrzQf3/V6DnWvtIBYd8KtkhGVWDJsBj69gsRslxcARD4VJ8pfyWJgtL
 TY+xfaWTf5lN3bb8UIeSoo9NyA==
X-Google-Smtp-Source: AMsMyM6PT3C30U5ROrwUvLdWSI5V9ryZ2Nt8uqeYCtw+vZNgm+XT+lZF2IX9+s6Dpcss8q3cpVBc0g==
X-Received: by 2002:a17:90b:305:b0:213:8a6:8bb4 with SMTP id
 ay5-20020a17090b030500b0021308a68bb4mr32360323pjb.33.1667218951966; 
 Mon, 31 Oct 2022 05:22:31 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net.
 [118.167.185.125]) by smtp.gmail.com with ESMTPSA id
 y123-20020a623281000000b0056bf24f0837sm4445483pfy.166.2022.10.31.05.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:22:31 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Date: Mon, 31 Oct 2022 20:22:22 +0800
Message-Id: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
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

v5:
- Documentation: 
  - Add #include <dt-bindings/gpio/gpio.h> in order to use
    GPIO_ACTIVE_HIGH.
  - Remove the change-id in message.

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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  14 ++-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.25.1

