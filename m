Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF692CA3C3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:28:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 945F417A0;
	Tue,  1 Dec 2020 14:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 945F417A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829291;
	bh=h83gcMeZ6eWLb8mfBkIF63aDLofllJVu2lOGtMCVB3s=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vWGbEXOg6BvU0EJaUzvWsDeVDsmFaklCmqAQegUCHq2aVs1fHv2I6Heg5R7r95LaJ
	 nneC+HnpTn6pN48+wzEGn30kwy5FFK3lnwzaapcqjPyCXuPGHEuI/IJvy5wv9L9fXc
	 aFHW0Ei9BpN4OAd4kSAquI4H2Z2PBeYnlyk2UXPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6290F8026D;
	Tue,  1 Dec 2020 14:26:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D81F8016D; Tue,  1 Dec 2020 14:26:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D8FF80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D8FF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="FLKL7IRg"
Received: by mail-qk1-x749.google.com with SMTP id d132so1326402qke.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=acp8e1gkaaB/fBTyrmi5rUj2D525BAkZdj4ZlarzG/Y=;
 b=FLKL7IRgdv6w+hgodjLl/76+I1MghdIFjJQTn9sr5pu1jNSL8mZ2GzPzm2q/pvXvkW
 j30kVLbZxHuSvxvEX0OC67PAT59zHu/Zp8NuVG6Fno3vzkmcGO0zrlbtxcGjs9/1eb4u
 1Dms54fBu1Ni+m6MS/96FtaDg5caQQAOXSXYhOStMBvR24l7/htBLpX5P59EO5u5ardB
 jiahVr+8ZY4lR/j7+kcDa5UBPc4BkJ55amzBf20ZQbmE2TBVdrlrqrEl2uc8bfISRADg
 mVGTxQ+bh8R2xAEaKlC9EWXAkEvID8jXnMbLGK+J4I5Y0ULsV/Hvyw9Fq/LU3se3Ibtd
 l8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=acp8e1gkaaB/fBTyrmi5rUj2D525BAkZdj4ZlarzG/Y=;
 b=SDO/t2DPp+UivoOFpCsTxEf3Lgkn+1Iha8HzjmWTgbXgyevQ0t52xK6xo5EVtuOCzc
 Ipjmj+IjZNKhbsBm8vpYJD8FoWYbizzuoT0nsSvtdsl/vhl0RRvvPqyRUvii7yPqKPU3
 7DAL46NAUnRyoF3/Wm/OgYxLK0Vdo9hemgwDbdIJKt6vtBLEmXxBi2f64zAjgeavz8Hc
 Vw74hYqJKliP6R0/67i+J2emD/BbHUjwbpT37/qPQ0TiWjvxkBXkMYwv/gNbTZZALPNp
 45gqQoKA8axEnc0idFPE4pZbtyFx9cAL/Z4rJePLnhy73HLPqxu4CANI9RHy8iVC08nm
 BO/w==
X-Gm-Message-State: AOAM530nYkYBh7HLLey0XQ25fV2GxBjqsSnpchG+aWlixFBh7kx5Dmu6
 UIreR12viZmrz7cCR2fGkcK79H44V4oi
X-Google-Smtp-Source: ABdhPJznxXASo+FIoy7Hqj6qPfeCxXNWpiIORMqGrpNHjWA6EBSGcZ0DhAY8r3b+9DdMcnFV5v3U3B3nqAe/
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:5587:: with SMTP id
 e7mr3109888qvx.33.1606829188401; Tue, 01 Dec 2020 05:26:28 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:08 +0800
Message-Id: <20201201132614.1691352-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 0/6] ASoC: mediatek: mt8192: support new machine
 rt1015p_rt5682
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

The series supports new machines with rt1015p and rt5682.  Reuses most of
the code in mt8192-mt6359-rt1015-rt5682.c.

The first 3 patches refactor the existing mt8192-mt6359-rt1015-rt5682.c.
For easier to support newly added components later.

The 4th patch fixes a typo in DT bindings document.

The 5th patch proposes a new compatible string "mt8192_mt6359_rt1015p_rt5682"
for machines with rt1015p and rt5682.

The 6th patch reuses the existing machine driver to support machines with
rt1015p and rt5682.

Tzung-Bi Shih (6):
  ASoC: mediatek: mt8192: rename common symbols
  ASoC: mediatek: mt8192: extract rt1015_rt5682 specific DAI link
  ASoC: mediatek: mt8192: move rt1015_rt5682 specific data
  ASoC: dt-bindings: mt8192-mt6359: fix typo in the example
  ASoC: dt-bindings: mt8192-mt6359: add new compatible for using rt1015p
  ASoC: mediatek: mt8192: support rt1015p_rt5682

 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |   6 +-
 sound/soc/mediatek/Kconfig                    |   1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 171 +++++++++++++-----
 3 files changed, 129 insertions(+), 49 deletions(-)

-- 
2.29.2.454.gaff20da3a2-goog

