Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401F610E6C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26BE222A;
	Fri, 28 Oct 2022 12:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26BE222A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666952766;
	bh=+bXe5mhRxhrurQy+nEuid+uIM7Iu5zjcIt1VevakoCc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oarp8q7dONgK/L6XsO5Y7ZXrLBcS/eaim0epuCEgKOX7mue++Z+FetfB3ENLgEOXX
	 t4jRGahB9qNBnW8NCbFrwcvSZqMgD7L+mTILjpvgErcb0aEE4KmgzrLgtt1gw/W6qe
	 sxuaAuF0MeQ3FLdigZVP3S/ljntP3/0B2JU9v4+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8BBF804BD;
	Fri, 28 Oct 2022 12:25:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F26CF80095; Fri, 28 Oct 2022 12:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C097F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C097F80095
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="sSlppe4N"
Received: by mail-pl1-x62f.google.com with SMTP id p3so4475233pld.10
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZC8394g/oSHb1w89qyTVGSgqWEPdgXV2NM/y2pTr74=;
 b=sSlppe4NJWWXV5yBu1kykNWWxehe88U/8q1q7SnG4d8/WcqVJemFszw5xqDtTOAz8w
 xq4RciBvf4yPH5XG1rgJCpKsvZ2Uiz1dtWq9mKevLqAJKl+Sljr76rdWM8+QcOCBk5py
 b5+hl4NYdGHrmKSDTF6/9PBnzHqy5D3xz0UF3jM82vPT1Ex7P7ehHekVkwh0uL4EYeau
 VWE389takqz8EWZQEyn1nGd6Kavmbt6bANsZxcLtnvGr+EtXt4C7zjXBtsxEQ5hk8u25
 yOoYwTQPUdzLk3NgegKrU8ijW81H73g6p/U95lOfhCh6CvqqnOLmK3AbAlLFOuOanXwM
 1Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZC8394g/oSHb1w89qyTVGSgqWEPdgXV2NM/y2pTr74=;
 b=DEdA+uW6FjNNbGOSUqa0t7SjgwamK5Z6rkuE7xLLn75u7KvDptwNBYC5bMJrP5xE5V
 zfsCMD0s0oPNR2ZPzdUSZrn7M6+b/hSmgebVQrrkEHV/qt49oBz3Vrk3rTAc64IeBMlN
 0U2H1V2UTBppuOwSH/wbTBVnzqLD8+uCYIH4aP4u1a664mYc5gUlHp5GFlc8+r+v0x3e
 NWAmVkbJ0aiUuR0NItXS3bEjPIIHFdySq7M55wmvF9eMeo7LkfyRtTqU6Z5tugLjnwah
 JIQb7OSp+vwG8xlWtwVn+wQsTV2GFgB5v2ZvAtSvaWMUbCI9ZyekZdvH4HmRQCMcL9zf
 ZOgA==
X-Gm-Message-State: ACrzQf1G6B4kcVkSNzZ8jSRKInGNjgdjtqL799ElK817SfLGDZtRAOSw
 0JYocGJtub8hhJy/+HtGclFwIA==
X-Google-Smtp-Source: AMsMyM7iANNZTI00sQBDnQzS9j9Z/a/chwN4BciHmlrMm0hBj6pNIK7fSz1HfepBKyrCF4zBiPYruw==
X-Received: by 2002:a17:90b:384e:b0:213:7c41:1018 with SMTP id
 nl14-20020a17090b384e00b002137c411018mr7282132pjb.63.1666952704646; 
 Fri, 28 Oct 2022 03:25:04 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 o1-20020aa79781000000b0056b6a22d6c9sm2565236pfp.212.2022.10.28.03.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:25:04 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add optional dmic selection for two DMICs
Date: Fri, 28 Oct 2022 18:24:48 +0800
Message-Id: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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
- Documentation: Add dmic_sel-gpios optional prop for two DMICs.
- dmic codec driver: 
  - "dmic_sel-gpios" property is used for a mixer control to switch
     the dmic signal source between the Front and Rear Dmic.

Thanks for the review!

Ajye Huang (2):
  ASoC: dt-bindings: Document dmic_sel-gpios optional prop for two DMICs
    case
  ASoC: dmic: Add optional dmic selection

 .../devicetree/bindings/sound/dmic-codec.yaml |  5 ++
 sound/soc/codecs/dmic.c                       | 52 +++++++++++++++++++
 2 files changed, 57 insertions(+)

-- 
2.25.1

