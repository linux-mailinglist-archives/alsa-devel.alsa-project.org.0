Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C96002A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 06:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67D716A2;
	Fri,  5 Jul 2019 06:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67D716A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562300912;
	bh=U6gxgkF7jK9DLjd2nzD9dJl4kRid56fL9sqLlAu/XC8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZBA21EOXsbLW2H3Xm3CapF9TikMkd1KcwhAlDN7XcVgZK3qIYEasiHH/W4oczIipK
	 97AaKSBKBpcS1iimZpSoQ2sry18SDIYZZgnbFu0YZuMYDHF3bLLAHFbITBApIdQxN1
	 d7KncH7usaPl41CUIR2vsjwVrGs+vLBiZrunzhOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A39F8011F;
	Fri,  5 Jul 2019 06:26:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B07F8011F; Fri,  5 Jul 2019 06:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A74FF800E6
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 06:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A74FF800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FH7xwm41"
Received: by mail-pf1-x444.google.com with SMTP id m30so3718301pff.8
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ensoF4e5rXwj74hLBAIVZsxBBZL6nZ0Z+cRMEnh3LdU=;
 b=FH7xwm41hWZcz/bAm+ebH7WH/5qVUe7aIauNjE+VqhgU4DONdUYDjR6z3/jLVCpfFL
 +ZyqOEs/+VQDuVAKFfcSwZkA8O1zp5vb1wdIIFfnHLEfwZVUyvh2eD1eewv/HY0dGTZy
 hOrcbDsGJEEK2DJUNTWxd/2vDfa0hfcJ7qHBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ensoF4e5rXwj74hLBAIVZsxBBZL6nZ0Z+cRMEnh3LdU=;
 b=rFmD6rwxEJNZ8UhkTx4yA/w4rDT6yt6nV7ZHM0IsyYLmZyWOLto1Mk5kXBo5aJNnyE
 UdjJRk6ztWehPPGblb7TUTPXXQqOUleOtDxwNKDGztwDiRlnuJfzL5mPsMdRzFUItdWT
 W4DuWwbQyEuoDVtxbW2vG/uTx+hUt67JBxiJFW3JToVms9Wz6A6eL2os+Q5xeqX7g36G
 U7IgrU8/QjOw99jFeZ3W9Na60emtLiAdEpT14QxKwzRgB3jLfODk2LeuIzRRLWd8tLM7
 y9sfZPOmb4XvM0BYwcm+kLb99fnIDsiS+gDm141IGLw4AEdxokJiIOi8Sqj+7aUS/MFz
 mLag==
X-Gm-Message-State: APjAAAUv6N8iEyiToKMA66WTMTm3cQ5STA83xNQHshs2a/RLggf6aDc5
 gfXQNC9Bsm5986YpOpTxLzVLcA==
X-Google-Smtp-Source: APXvYqyf2nrb7RrUXLJ76qJyQDgKtq5/C+VLUCT/21TfLnfPJ/m2mK68NmzbeQqbgUJDJTJaH+v/mQ==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr2098527pjz.85.1562300791713; 
 Thu, 04 Jul 2019 21:26:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id q3sm6050507pgv.21.2019.07.04.21.26.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:26:30 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jul 2019 12:26:19 +0800
Message-Id: <20190705042623.129541-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tzungbi@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH 0/4] Add HDMI jack support on RK3288
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch series supports HDMI jack reporting on RK3288, which uses
DRM dw-hdmi driver and hdmi-codec codec driver.

The previous discussion about reporting jack status using hdmi-notifier
and drm_audio_component is at

https://lore.kernel.org/patchwork/patch/1083027/

The new approach is to use a callback mechanism that is
specific to hdmi-codec.

Cheng-Yi Chiang (4):
  ASoC: hdmi-codec: Add an op to set callback function for plug event
  drm: bridge: dw-hdmi: Report connector status using callback
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support

 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |   3 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  10 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  32 ++++-
 include/sound/hdmi-codec.h                    |  16 +++
 sound/soc/codecs/hdmi-codec.c                 |  52 ++++++++
 sound/soc/rockchip/rockchip_max98090.c        | 112 ++++++++++++++----
 6 files changed, 201 insertions(+), 24 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
