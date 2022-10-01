Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456D5F1F18
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Oct 2022 22:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C998E2821;
	Sat,  1 Oct 2022 22:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C998E2821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664654590;
	bh=F9UM8d8lA3046U37XUYCtVXPxQjp5ZdwgBzRmOCUupI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VW8SutnYFl84SSaWrsfIBEm2R0bbr33Lh12rSvfY40svbFOMK7XWy2yT3MIPokjpU
	 hBvDiPzh+1SpSTeWRRYOACjTo04A0mDAoHIUHtO0ZY/fbP/JkgBFYceA73Gz4OLT2h
	 LlEMaE48TmzJsutNhut0ypItd/D7gYTZLvGYbds0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9CFF8047C;
	Sat,  1 Oct 2022 22:02:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A228F80171; Sat,  1 Oct 2022 22:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2247F8014C
 for <alsa-devel@alsa-project.org>; Sat,  1 Oct 2022 22:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2247F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="T2nO/bjO"
Received: by mail-pj1-x1031.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso390634pjf.2
 for <alsa-devel@alsa-project.org>; Sat, 01 Oct 2022 13:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ZWAeA4Sa1ifawPVMtTP+pp0uH23CxEW9tP2Hk70DSVo=;
 b=T2nO/bjO6RmI+Oq7jfv4fZK6mgqcXlBjcpWtasvkdB7eIFQzDfDKam0MoyyHzvjJNO
 dtPgQiqxVFZahjbkopkuwyy5kgn5O2Z3ilnoEs5UnGA6eCyv0gjoHtpFDv4se5aK2KSj
 zCHCW5Iez1kaAIUA0+3YrhdsJW8xvR7C+gtuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ZWAeA4Sa1ifawPVMtTP+pp0uH23CxEW9tP2Hk70DSVo=;
 b=zVGLAKSAfz9KxMyK60Qf0ZXHA4cUoQQCkEoyIeWRp9jMNHKCaKkuKaBfkvNyfJ+O87
 H97i7Mjvj3TabQWUHyJqVpA8azaDPMYQb0wLUZNoU+ZkP0ur+UewL0v8wom+OE8Bcsq3
 wr99QllAlE9jSp3OIStRZSGH6HAEYqqS8j8N9BgQ9Sl3hg1Vx8/ehr5CopVy9hSbIUCh
 Jt9OvN0OI4DFXd/WIORhFd1BSR9BXHmLEAShW0zShThUoB/9bSDcmkA50uJ8nVZQS+7h
 /v2iqVsvJayoNXk8f47H/zbuR4pfUNOkKZWvqglLHWtFKRac5XPuUvk1wFnRlvhg3sIu
 Rhhg==
X-Gm-Message-State: ACrzQf2jc8ldpbR2ENEiA2ayCVTEFASSs0hhv717flQShouLZAQwjdC/
 5buvnDzyToWa0bNmPgTox4HdVQ==
X-Google-Smtp-Source: AMsMyM6CxcnHsw/RFWto95wzipp0WqdEGgeHj33uekZXp4/kS/QAETKAk/pZPtYER2hq/f4kscBKhw==
X-Received: by 2002:a17:902:6bc8:b0:178:81db:c6d9 with SMTP id
 m8-20020a1709026bc800b0017881dbc6d9mr15180623plt.56.1664654527733; 
 Sat, 01 Oct 2022 13:02:07 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903121200b0017a8aed0a5asm4313593plh.136.2022.10.01.13.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 13:02:07 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: add devicetree support for WM8961 codec
Date: Sat,  1 Oct 2022 13:00:37 -0700
Message-Id: <20221001200039.21049-1-doug@schmorgal.com>
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
first patch adds a schema, and the second patch hooks it up in the code.

Doug Brown (2):
  ASoC: dt-bindings: add schema for WM8961
  ASoC: wm8961: add support for devicetree

 .../devicetree/bindings/sound/wlf,wm8961.yaml | 40 +++++++++++++++++++
 sound/soc/codecs/Kconfig                      |  2 +-
 sound/soc/codecs/wm8961.c                     |  6 +++
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml

-- 
2.34.1

