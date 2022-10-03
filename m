Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA225F27D5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 05:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E154285E;
	Mon,  3 Oct 2022 05:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E154285E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664767541;
	bh=ysGhqzVkVRnS0bag2nAOl5ktI/Gk74D9u5hSEcuMDqE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNJ3C5LdT73qfk0XW/9nP3FTFYSk4eDD4ebPQ54H6YrW6EVpWMXJTQRMo6GRnzCqd
	 OgE851TdpgJXbmhqpAFkog0pL7g0hxtpamIwOSIa+rX8HNxRV3bKiBuNTojCWWDItj
	 FbDV8C7ETlUgCqABsu2gGLFSWNPtVjyv0ihOP7pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD939F800CC;
	Mon,  3 Oct 2022 05:24:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 860D1F80431; Mon,  3 Oct 2022 05:24:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 305D6F800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 05:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 305D6F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="dthz2xeL"
Received: by mail-pj1-x102e.google.com with SMTP id b15so753012pje.1
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 20:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=z2kbdiQ3OWBq1OvUH8zoDFLqMD73DnTq2ErCwWOA2RA=;
 b=dthz2xeLnmFZLYt4QnpN+sJBIsvLr+HB4X1NvD6x2OgwGSBFqfhe4/AYfP+dY66Dgt
 Ycff6Pqrqt1+Yu4ZIn2pgh7yeZzpnuZhKulrsy/0tduiSLgohvJlUzgObFxaE2NJyl/l
 mWqs8HrrNXyKHrFEmVDf70FeRs2P/GCyV0IJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=z2kbdiQ3OWBq1OvUH8zoDFLqMD73DnTq2ErCwWOA2RA=;
 b=IEfGMEl6AW0aQmCLRfcoKo+x+Ccgm9Jqwe0vyW6RfqcU2ebiYjhNfCc2PIAp2w/8g/
 LuWzdvCqCgerbHp93jN+i+fsgac9z7ltuXbiBNWE4h+d4+nCk0YF8Q+LxmyKOBPvfROR
 MHTV9lZYa8o39MLWyX+j6Dp2Wb/dOWMGpdYOfr06ukzw3LFl+8Y0XZolz3WNTsHjkzxv
 zqCT4OD4pVdg5QdUWUi/BLwqB+GqOF2HAe81Dr4A8GCEsABVFOMEiKqNtXxgDIIhdHXb
 twFilGDjoHQCYHAQR4j2u+4lglcIVIe7UH8rqpew/KzzHIdbz0sur+H/66l4DJiy9jHo
 Aj9Q==
X-Gm-Message-State: ACrzQf0oi9ITJN8qVzZPoyahm2c2Qn2rm+1rw6GKbHJVOYUQFCb3od6m
 EmGdSsV1UtMCPr6OFXKAj5EPJA==
X-Google-Smtp-Source: AMsMyM7nUxPuP0qW4Mt1Ael7EqKpHyqrpOExEwnTRZ42vB7J5GdEAud0K0SH/+QkiTG8+5UPNpNuIw==
X-Received: by 2002:a17:902:d4ce:b0:177:fe49:19d2 with SMTP id
 o14-20020a170902d4ce00b00177fe4919d2mr20305345plg.4.1664767475830; 
 Sun, 02 Oct 2022 20:24:35 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 y25-20020aa78f39000000b0053e7d3b8d6dsm6157977pfr.1.2022.10.02.20.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 20:24:35 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] ASoC: add devicetree support for WM8961 codec
Date: Sun,  2 Oct 2022 20:24:11 -0700
Message-Id: <20221003032414.248326-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Doug Brown <doug@schmorgal.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

This series adds devicetree support for the Wolfson WM8961 codec. The
first patch adds a schema, the second patch hooks it up in the code, and
the third patch allows it to be selected in Kconfig.

Changes since v1:
- Fix ordering of property lists and example in schema
- Fix wording of commit message
- Fix unused variable warning
- Split Kconfig change to separate commit

Doug Brown (3):
  ASoC: dt-bindings: add schema for WM8961
  ASoC: wm8961: add support for devicetree
  ASoC: codecs: allow WM8961 to be selected by the user

 .../devicetree/bindings/sound/wlf,wm8961.yaml | 40 +++++++++++++++++++
 sound/soc/codecs/Kconfig                      |  2 +-
 sound/soc/codecs/wm8961.c                     |  7 ++++
 3 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml

-- 
2.34.1

