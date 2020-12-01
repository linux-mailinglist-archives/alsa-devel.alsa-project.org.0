Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B3A2CA3A3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:23:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBA21795;
	Tue,  1 Dec 2020 14:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBA21795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606828998;
	bh=h83gcMeZ6eWLb8mfBkIF63aDLofllJVu2lOGtMCVB3s=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvB1k/ik2B8d19sfqJRWUPqNc9SA9olp8A22mhwdmKplg6x5FOQEiIeVc8qIJ4AX4
	 pPAd5hb/7kQ4fhNTlNAU9VD1DTnoX4jaHHpxWrXSnkR/FfoPcVENPDC9pwaMqHb/yI
	 VO78rgLNCwhNs28cxTFwEDPLe+Ip7nTaRS6JTjOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC71F80254;
	Tue,  1 Dec 2020 14:21:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97700F8016D; Tue,  1 Dec 2020 14:21:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6574F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6574F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jSEubekW"
Received: by mail-yb1-xb4a.google.com with SMTP id e19so2361072ybc.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=acp8e1gkaaB/fBTyrmi5rUj2D525BAkZdj4ZlarzG/Y=;
 b=jSEubekW63hjhQNb7+QhOSDN8Nh5OKsNOgkA9vj0mUNod/ofPdaIQSFk3smoFlT/Rt
 REBBkeIOtC7gGS7M5gWGI3GOwYr+F1GMMp8GLvHrTroMxox2mkXkVrUhhKVvES7JwhW8
 5rM0GcRhiPAURVo1W+gQrIx+hV20COaiq9SagWxni+OZNfj7OM38R6yF0ym317A3PqZA
 NiVU1Ha/IGEv/FUQTYW3LQFtX/AzufoJAqFWpys5eEKios4I0KBjadsUZGOP8J2rF2/j
 JO8GVRDEmQM9/9f3PZFqpvA/DEmvt7jqZ8ErkAsmE3xKdR8ePRpIAXW1BXp2gyMwUbT2
 uTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=acp8e1gkaaB/fBTyrmi5rUj2D525BAkZdj4ZlarzG/Y=;
 b=K7GhrJigyoagqiVDIsTlwje7d6E3+koCTywO1Aw7TMpaFzBtXYrkSjXRm/PO+7kDNv
 cUJYls0GDH7iBqqjnhN5bOSrW/8mmYmCL7QrZmQpgY29aa/oZ6MlmehwmiLPBMj2I4cV
 ro6yDgXfDPNWMG013lXhStdTa9WKRV/JzBLN0ZESzqDb7l5TRpiE23Lp+5MKA1mYCuMI
 JrZj0oCGZD7jx3fbxD9KZas5IwN0V+TLNEfffxxBrPUPsCikKrvitPanYeQC4RYH7L/i
 EyL8EKy5kW9iQWXOMAsv766x2THJdPEwYVPYPbJajzN+PGZWUyE+VS9kEVmzEEQrAZmt
 yzsw==
X-Gm-Message-State: AOAM530s0LNAe0JRF5PUojGTXrSOjIAfrRYNIIsXUR8qaboyzGAcP6gW
 UaJXJ62wcqZ42gUpOoECPbsBqDbQK9oX
X-Google-Smtp-Source: ABdhPJzt7Kig1jGX4rSHuADIjVQjtG44viovaYZ+bkLJjc3FUgfEOiTHGDlh+jEJ6l5OYtVrfqLlcBKGIzQe
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:d997:: with SMTP id
 q145mr2894345ybg.212.1606828896162; Tue, 01 Dec 2020 05:21:36 -0800 (PST)
Date: Tue,  1 Dec 2020 21:21:20 +0800
Message-Id: <20201201132126.1676005-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 0/6] ASoC: mediatek: mt8192: support new machine rt1015p_rt5682
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

