Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750521AE8A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDD2815E5;
	Fri, 10 Jul 2020 07:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDD2815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594358837;
	bh=cikD737BKtR4L1NhnZLR0xp7+it+RjDTJ49ptI6nGW0=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kGvRhPq46ykTPtUf9BUh24S3vAMPv9+yAYtsn9EnV+xuowmJayGbfJaQrBJfuqmaI
	 EostHhAzfgD4N/AeyzhbYuSTJjsULR/G1XbPaUGtD3JrcFGZdw5fHkxsvG3fc2l079
	 Sxkv+jrfzlytSbWDb+fIgdOin9uPxoQ5AqTKYmQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C07F80161;
	Fri, 10 Jul 2020 07:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8541CF8015D; Fri, 10 Jul 2020 07:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89098F8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89098F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gp2t+uxT"
Received: by mail-yb1-xb4a.google.com with SMTP id k127so5780825ybk.11
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=XAbjQkqFJHu/4T3iFsKodU4MZAQHWDS32dunmGjM4vA=;
 b=gp2t+uxTBmcyf3aoRt9iU1+ytBbeBlQJ4p02owquF6+K5VlJDTSW8ZT2e8pMK8z2k9
 iZPtkTBbTbqQdRQpt43Y5KWV/e123ul8Rvhv+nLppSUusntJegO4uUhnfoEjFDt6L9s1
 s56460M+apoZPOEPFK38ThhCiEt2vDHyBMVz8UxL5CgCNPTYwta7R8Pcj42wsoDuZl1g
 raxLovfS9u28TfBkb0vk/FQjFHnaD+48LziJtbLtzYQ1CxZQnR2DnHJNdEkENoWjluGw
 Lzkr30g/ShJH4Jq8JQ3/3XViktDy6gEyqIdUX1nj6O6RUdybBtdcXarUIF8Q84JWb344
 lUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=XAbjQkqFJHu/4T3iFsKodU4MZAQHWDS32dunmGjM4vA=;
 b=iQbBvJPIRZQh88ccCK9pCNp1iU4ncUEhXOkFC4uzchwRWotq5t0sUPfOmoBUiEbt/9
 Rv3Qgd6bczyRliCN+9iogqFYbQ7rdotihyerKQn6eoQVdkIgVm0Gy1sjJDHoAW5s1tkZ
 2HaLXKE7twq//8CA3lBZW0nDAsikrXQyun9yXXScoxyZ/jS7X1iVebPsTRs1O0a8qyLA
 OvC4aQ3QBBJn1tg5Cq3+7kxZ8KsnOuVNdnsoyy7SUcEWTO/RLXfAmajEaOUN9m6sJ2/7
 FwydKePZX8SyCmoW+2eZg3C1A+XJv0GKViYmxxZQvxcZiccesI8Qhkb2HqCmxZINsEUg
 AyhQ==
X-Gm-Message-State: AOAM530vE8fcBhdY8DqOVgQ2AAGuSQa3iLWK3dQmSIh1sOxVp7ZbQeTV
 1TbLxzSSS/UK25DcRvu4+rQYWZRMjdYg
X-Google-Smtp-Source: ABdhPJyu14MmPThhBCrePZPw5xrF424Jw8O4wEbivNq60fQi2mJXFLpGbPC9WzA1L3RF0hKzfV6sXlMF487E
X-Received: by 2002:a25:50c2:: with SMTP id
 e185mr15499758ybb.204.1594358713525; 
 Thu, 09 Jul 2020 22:25:13 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:24:59 +0800
Message-Id: <20200710052505.3664118-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 0/6] ASoC: mediatek: mt8183: support DP audio
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

This series is a follow up for a long time ago series
(https://patchwork.kernel.org/cover/11204303/).

The old series bound too much on the patches of DRM bridge and ASoC
machine driver.  And unluckily, the dependencies
(https://lore.kernel.org/patchwork/patch/1126819/) have not applied.

Revewing the ASoC patches in the old series, I found that they could be
decoupled from the DRM bridge patches.  And they are harmless as it is
an optional attribute ("hdmi-codec") in DTS.

This series arranges and rebases the harmless ASoC patches for
mt8183-mt6358-ts3a227-max98357 and mt8183-da7219-max98357.

The 1st and 4th patch add an optional DT property.  The 1st patch was
acked long time ago (https://patchwork.kernel.org/patch/11204321/).

The 2nd and 5th patch add DAI link for using hdmi-codec.

The 3rd and 6th patch support the HDMI jack reporting.

Tzung-Bi Shih (6):
  ASoC: dt-bindings: mt8183: add a property "mediatek,hdmi-codec"
  ASoC: mediatek: mt8183: use hdmi-codec
  ASoC: mediatek: mt8183: support HDMI jack reporting
  ASoC: dt-bindings: mt8183-da7219: add a property "mediatek,hdmi-codec"
  ASoC: mediatek: mt8183-da7219: use hdmi-codec
  ASoC: mediatek: mt8183-da7219: support HDMI jack reporting

 .../bindings/sound/mt8183-da7219-max98357.txt |  4 +++
 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |  2 ++
 sound/soc/mediatek/Kconfig                    |  2 ++
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 29 +++++++++++++++++--
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 29 +++++++++++++++++--
 5 files changed, 60 insertions(+), 6 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

