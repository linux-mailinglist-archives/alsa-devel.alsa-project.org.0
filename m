Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F302FCD5F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 10:24:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC64182D;
	Wed, 20 Jan 2021 10:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC64182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611134667;
	bh=8+PLyAtceu8cPiUFJc5T2Xa31Y4kGJiBSZqY/OmNA1w=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D4diTitB1NeAzDA1Z/tW4WJf5VOvRwylD4mv8/oX6MNVjHumdv37FyYUWX6Bi/aBW
	 50MeIi8ylrORhAOms4HNnKfSKf6LtvA7kJrIbc2WzLURjvS8NQsAqJeeds/8eUraud
	 7WvT53KvMu0Qf6j1dfFIjlUSwCcEyVzz+Pt+DL0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D990F8019B;
	Wed, 20 Jan 2021 10:22:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F255F8016E; Wed, 20 Jan 2021 10:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F81F80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F81F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Vq+OUx5w"
Received: by mail-yb1-xb49.google.com with SMTP id 67so25600051ybh.22
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=rj5XYv9cBDRx3ifO5EAj/FxuIMAJiP6yK0XTYXtiVto=;
 b=Vq+OUx5w5yZxKXY8j+S0lycACR96LCT40KqcdanEI8d5aXrf4TQG6Gn2XwZJh60WpC
 eIYvicKFVzPf4WrBp5ooWEWsg07eFG36rA62jvFbrwv2/TnhLsk+9qD/66m2488457GM
 FbLrLCKSRGRJ2SxH45g+hGC+c78wTymypwRu0nDxDLQe4UFlNW8U4wFBCLTZa4yWjCxL
 QNUE+brISCEHDGORyn+OxBAXOvZVOUkWNRSs69zSPBgt5ZSCNDtfBcSmbgj78r/FxgdD
 9pF8UUERj3tidJOG0DfQyTvTq2R0xtz4L1Cl+Seb1AQzL+Lnl1ABWgIfj8BUTCsA7PpU
 AGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=rj5XYv9cBDRx3ifO5EAj/FxuIMAJiP6yK0XTYXtiVto=;
 b=TKsTdD95t4OZcTd8+hzGGi2KrkGFZehw3kILh+ww35985rS304kDzmidbh/uHQyFAz
 f0ASKwxzrXs/QKQ5wN/JICB9x7zkJAEUeSl1ODgqlthZ2w3Xp7DbzttDUDxi+dbfEfdB
 +qlVqBUH24W92KPrhpmqcLAUVRUX8H3A2dnSTtIBDUJnm+WFcS9JKmHJ29cbZAqyZf67
 qy8sf5XDP/5W5O/+3y1OFyMYqCPk6pve5aLpIeWgIZr3eafjI+jjIq61EYIh8Tzzp4oN
 QA2RBqU0mk39z3ekpVp+hT4l6eq2eZxaEP6qd78wxogxAKrnsPsdZJmRnbZ0rMTmqlww
 xKww==
X-Gm-Message-State: AOAM530hfnEz5OaZyckwAt4+44+lSuTVBakL2a1ts3gB9qB9p+nsKEMr
 WPth14wN85E+oly/Q18eEzZUyP4/VCjo
X-Google-Smtp-Source: ABdhPJyuAO/REnxG3SD/pCQMtm2oEqw7tkiO4Yf7n0qJJK1N0tG75vVvNydHimdNdZAEKXGfzRq/jqzmaBQF
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:1164:8893:969a:b338])
 (user=tzungbi job=sendgmr) by 2002:a25:b213:: with SMTP id
 i19mr3358418ybj.8.1611134567865; Wed, 20 Jan 2021 01:22:47 -0800 (PST)
Date: Wed, 20 Jan 2021 17:22:35 +0800
Message-Id: <20210120092237.1553938-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 0/2] ASoC: mediatek: mt8183: ignore TDM DAI link by by default
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

hdmi-codec is an optional property.  The 2 patches fix DAI link binding
error when the property doesn't exist in DTS.

Tzung-Bi Shih (2):
  ASoC: mediatek: mt8183-mt6358: ignore TDM DAI link by default
  ASoC: mediatek: mt8183-da7219: ignore TDM DAI link by default

 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 5 ++++-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.30.0.284.gd98b1dd5eaa7-goog

