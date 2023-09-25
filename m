Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15D7B3EE6
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:02:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1201DEC;
	Sat, 30 Sep 2023 10:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1201DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696060974;
	bh=s1bEVdACqjpHadIktSmTo5nBbnYcheE/nDdSaAFrQ+E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RjpBH4CJDQ/qZQioSD/YaLRCUYLf8js/jTk0Ltphd97OPxSVwDiECSMqq7tWrA1c6
	 olu+Uy04o1VBX7Fipj3eoRH8emIlXA8wes6PU/cTXx25qLzIGa/0sGhgFH/1KKdUjF
	 A2W4hLDwcANMogwhSaYtHzXg34L5aBRN7m3fFsNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 045F3F8047D; Sat, 30 Sep 2023 10:02:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63ED0F8016A;
	Sat, 30 Sep 2023 10:02:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3578F8016A; Mon, 25 Sep 2023 10:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70C38F8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 10:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C38F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=mDpEq5/+
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27747002244so1461106a91.2
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Sep 2023 01:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695631137; x=1696235937; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=;
        b=mDpEq5/+hQcI8rzG8qzJs6aYrzda4pVfvkQXCfWqINCVjPyiyrduYZC7lM2evXffEj
         N4n9/VF3K0gHV5Ty1+7Yl6b11+aTLkEAnS/vslGxcqTJecmNwDqkNvPKbYkRpfF/mPZP
         10z4gszVrkAgkzt8JUoId5+0IWrnjGWOWzkOPxFI7scbAO5EF8pG+EPmZ2AAj/fYmgbM
         lZO3QnnthkTi6/7pdfVjvLHdkZMWJ4TQaTk2aJuEhXv81gJN9Z2q/rBk4QLr56Y00zis
         HmBiBHbXTRZrMJDCdjlYH8BGoB+LpEfSZ2M3tA8l3TSKdlP/Za+DgKvbzLiEi/bcfhan
         6B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631137; x=1696235937;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=;
        b=RhfTix9huPPbFpDBJuq5EkkbpnzGUWIYZj4L7smSubslIXaNYj+3wmQB2LJo8J/g47
         apqUzAJe1pOEuPh1HZ4Qi9IiHjj87PHY0YO3I5CbK1NGPK6yLt+kPi4DhSRyM7ru/YrN
         +QdjBNXLtXxND90IJgoYIGnd3/5B4jQ8ZYtJ+vwoXAwidNLoz9lmYSWJxVFxyovofKJS
         abYy8/SC2SHz3CwjaZyT0ecfB1HvzsYO6LWnWpZlQMcCcDOIAoTE66CmWuQgTZfjOFma
         7VH4JcEkJHiHYw9rGk6xsTgVBwv+sh3iDOGbup0RcQBvuHfLCQ1KVWOgl8OAYWfoGsHs
         JeNQ==
X-Gm-Message-State: AOJu0Yyyygathtk9H69wUPGUguSKqvtsV9DWX6W4UyYNu/L2GLh3WHaZ
	Pvvq7+yU15DK4NnOn2JLPzGlvg==
X-Google-Smtp-Source: 
 AGHT+IGRzWUFKvAXUdW7P/gM1pTcDYhfc2VIx4gXPNUiXkY34HMjyU1m/YIX7/WbQhw3zmUkXjMlHQ==
X-Received: by 2002:a17:90a:2a4a:b0:26d:2bac:a0bb with SMTP id
 d10-20020a17090a2a4a00b0026d2baca0bbmr5300954pjg.6.1695631137400;
        Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Mon, 25 Sep 2023 16:38:45 +0800
Message-Id: 
 <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2T64OVDWUSNEDPEBJH62JYOTIIGURRQN
X-Message-ID-Hash: 2T64OVDWUSNEDPEBJH62JYOTIIGURRQN
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:01:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2T64OVDWUSNEDPEBJH62JYOTIIGURRQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682.

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 154 +++++++++++++++++-
 3 files changed, 155 insertions(+), 1 deletion(-)

-- 
2.17.1

