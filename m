Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF72B828E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 18:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 025451784;
	Wed, 18 Nov 2020 18:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 025451784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605719117;
	bh=cktfywudPxgITyrb6gx5I8LknwnbS88DCbQ9IJllerw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O2noL7xWkx47o4Gkn+szA4CwHXczaOo2UrCM6lDaFTW3jUrIDa4KBRYdafBEu8Xku
	 8aw4nDOB045mUSdrNoVRivumDyN0RB5Am/NY6pS600s/LpYz0GHwaO2dPeG38BvXRz
	 VH5ydZxq/yk+/K5yyvD17KJybEEnrfSYlRZTHpQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75C45F802A9;
	Wed, 18 Nov 2020 18:03:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EA8F80168; Wed, 18 Nov 2020 18:03:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F784F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 18:03:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F784F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DcCauwZO"
Received: by mail-wr1-x442.google.com with SMTP id k2so2963670wrx.2
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YU4/VDfrF6SXnta/ZtzFGixkNuFm7oEQTxiBQ1MOvE=;
 b=DcCauwZODG9C9KDCCHwf5zbBDn8+ph91my9YgOYBkYeuOJUURcKUXo2Q92GxqVrnT4
 6ESMO8UR63avWUk7hm5ljw5V4CLAzDaIqrMxuq3+NzNO5PvXxTDnFJubeqFAIb3QlTLw
 dFPCUU0hS0EipKsUFkmSV3YqEQ40L/K3O4bh91C2/adgPG+l2rwEECe1ry08I11rEfxV
 Hje9quBPbQIAsbe2KyS8hTv7qsyB26U+eJm+unm7TFLJ/0V8HYwudBUuBBMGTCYBL0rI
 70pnC1hGniV2kPvtYV36xscNR4X9B3gVWO7GrFpGbK83/mUmU+FnvihTcIf2jG13HdGj
 GEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YU4/VDfrF6SXnta/ZtzFGixkNuFm7oEQTxiBQ1MOvE=;
 b=iCsS3fVNQNoG2ihqlsvuwq1gMURU1bV0y69rSnHFLfzIjtN9aoZ0rvBQbYr7lNTX/+
 AYb2RwuGo0bpcoB9YtnZx6zF2r1avBDqJveftViy0kOO4LdOh22geYiJp6PbcaTB+tHr
 tITPjr0h/2YGVJbvJCMbn4UgUcFQHyBCJKjb46VBQ9IZD171V3ICT3QyM4EzZA5wWPt9
 d9cWS7ONyKwF7+YEMwkLJSitoUerWkjoM/7hoBrgNc/XAfNTDp8pgCPigpSKk+HNlYRH
 iJp28VmqTY63mN0tVthf1OTdzQF5NNj4P11jup7bXirUGCIFS0ick5NZ3o3f9MPFkGxI
 UDLw==
X-Gm-Message-State: AOAM533Iswse2JaJ34831mDe1yrSuwUGkLBCoAhL2vsIZZXNHkZQus/5
 6IMW5cmGHY7avBDWu6ttkeZZMQ==
X-Google-Smtp-Source: ABdhPJwyafVZ5A61NzcRtYd9kIdiWBDwYv7z0pyImojRPLzHk57fiuxR7JwVCGidvBGKaDcufEoR8w==
X-Received: by 2002:adf:8284:: with SMTP id 4mr5950124wrc.386.1605718995969;
 Wed, 18 Nov 2020 09:03:15 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x13sm44233wmi.20.2020.11.18.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 09:03:15 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srinivas.kandagatla@linaro.org,
	srini@kernel.org
Subject: [PATCH 0/2] slimbus: qcom-ngd: Add SSR and PDR support
Date: Wed, 18 Nov 2020 17:02:44 +0000
Message-Id: <20201118170246.16588-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
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

Qualcomm DSPs support SSR(Subsystem Restart) and PDR(Protection Domain Restart)
which usually restart the associated services!
Current code does only relies on QMI channel notifications, but there could be
race conditions between QMI notifcations and actual PDR/SSR events.

This patchset adds support to these two events to address those race conditions.

Tested it on Dragon Board DB845c.

Srinivas Kandagatla (2):
  slimbus: qcom-ngd-ctrl: add Sub System Restart support
  slimbus: qcom-ngd-ctrl: add Protection Domain Restart Support

 drivers/slimbus/Kconfig         |   2 +
 drivers/slimbus/qcom-ngd-ctrl.c | 121 ++++++++++++++++++++++++++++++--
 2 files changed, 119 insertions(+), 4 deletions(-)

-- 
2.21.0

