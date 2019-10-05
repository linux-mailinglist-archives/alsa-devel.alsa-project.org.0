Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA1CC8E2
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 10:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7421678;
	Sat,  5 Oct 2019 10:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7421678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570265837;
	bh=7wJ5i5PUXo/IgUAHRlgR6NEkZAgUeJMkcTApurm4wlU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=voHUWWTcUgsT8kEjrCnO1DYjxQG2tiz6qfg9BBFBmpsRRUy2ZcmrXNzQZvX7Ty79P
	 qpaWLZfevRATV4iBMuMbXYjT6VrRh8B8vdCI/WWoCgWdoySwVMcoei7SbaNRdlzItI
	 SsumU1r2UVTC745lGvXdIH8P1avormNPKM3DdSeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0637F80518;
	Sat,  5 Oct 2019 10:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0302EF80506; Sat,  5 Oct 2019 10:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D297FF800D2
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 10:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D297FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HNvVT6We"
Received: by mail-pg1-x54a.google.com with SMTP id d3so5984481pgv.9
 for <alsa-devel@alsa-project.org>; Sat, 05 Oct 2019 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pphLcKzubt6/3xgcmeykLYyBQzlEs6RSKdSQWX0sxDM=;
 b=HNvVT6WeTyt18Cxfm115qmEHUzDBxDS33Xse/+6Ac8mPdknVe5icL784u81qWxspgB
 c/CQbibe7y+Y0uxDJfcdwmDZ/McY7m5HNTnT/HF51rVRD56djx2RZI1SqijGnbz06ZuM
 Fi2HU8ci57dqUwE/7BGWmeQ18eWFXIC9gOGCYg2QGzlwuIV7a8RV7zKYq4l1ObLOf6Va
 6VQKL/kIGbQP00EPfgt3X/S+dj3Ca1E4B600gvHrTBBgItC3501nnuqzGG+LQJOG5+VR
 ERiG31VDiNvW9uevVp1qUoX8U+NE34Ru17fEPSMEvdXIMuaRMvDzrdho0m5g1KEpQVzc
 e2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pphLcKzubt6/3xgcmeykLYyBQzlEs6RSKdSQWX0sxDM=;
 b=ooOgo8tv1aw+JJtFUB+wee+nQyqnX+AE+cQj+ATw9vgGGbbdnH/uTd2TWN4FymEJTK
 Yg0xu6vFA0uakgly6/MQ76TeLTywuClQQA/CLZZ7dnOItcQZl9ZJaPQiAI4lZKSKu5Bt
 bJIVFH0WYBvFo4O3th/PbVQKdj6DuOz9BbBmuQjM1nkYrYZy1Rwy8XJPnTQn8q/acd6z
 NeVAekF6PG8OsefwgZ9bUkz77K4wJCqSrBxFsD+MNA206Pv1Q6gLBtj5Va3HAFocLVeO
 sZAgdf17w0X23UeRs7dyoRYtXD9kAqerf7vsG8RnMxGdhlpBGduSu1jwu20DBFIeF/8a
 uOmQ==
X-Gm-Message-State: APjAAAWQxpvycsnDpTn/UnOYMU35cV5fZkZOvs3j0OIezwTFhQABX0Wu
 HzlxGkyF/fcPy/vXtkk9pYzQeXwM2wSk
X-Google-Smtp-Source: APXvYqyImMF03MMzTr5muxRkyJaCj3f7Y/q/aYeXW/YCc8aiv4Sn44DDbaUS90H1MoVvDCJEVZn18YlEtFKi
X-Received: by 2002:a63:d058:: with SMTP id s24mr19068377pgi.189.1570265722952; 
 Sat, 05 Oct 2019 01:55:22 -0700 (PDT)
Date: Sat,  5 Oct 2019 16:54:59 +0800
Message-Id: <20191005085509.187179-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v2 00/10] ASoC: mediatek:
 mt8183-mt6358-ts3a227-max98357: support WoV
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

This series makes mt6358, cros_ec_codec, and mt8183-mt6358-ts3a227-max98357
support WoV (wake on voice).

The first 3 commits are some cleanups and refactors.  It looks like
breaking the existing interface.  But please be noticed that, the
cros_ec_codec has not used by any real device yet.  The refactor is
very necessary to keep the style consistent and for easier to further
extend and maintain.
  platform/chrome: cros_ec: remove unused EC feature
  ASoC: cros_ec_codec: refactor I2S RX
  ASoC: cros_ec_codec: extract DMIC EC command from I2S RX

The 4th commit extends the feature offered from EC codec.
  platform/chrome: cros_ec: add common commands for EC codec

The 5th commit changes the behavior of setting and getting DMIC gains.
  ASoC: cros_ec_codec: read max DMIC gain from EC codec

The 6th and 7th commit make cros_ec_codec support WoV.
  ASoC: dt-bindings: cros_ec_codec: add SHM bindings
  ASoC: cros_ec_codec: support WoV

The 8th commit sets necessary registers on mt6358 to support WoV.
  ASoC: mediatek: mt6358: support WoV

The last 2 commit make machine driver mt8183-mt6358-ts3a227-max98357
support WoV if ec-codec is in DTS.
  ASoC: dt-bindings: mt8183: add ec-codec
  ASoC: mediatek: mt8183: support WoV

Changes from v1:
- fix a compile error and make kbuild bot happy
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156315.html

Tzung-Bi Shih (10):
  platform/chrome: cros_ec: remove unused EC feature
  ASoC: cros_ec_codec: refactor I2S RX
  ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
  platform/chrome: cros_ec: add common commands for EC codec
  ASoC: cros_ec_codec: read max DMIC gain from EC codec
  ASoC: dt-bindings: cros_ec_codec: add SHM bindings
  ASoC: cros_ec_codec: support WoV
  ASoC: mediatek: mt6358: support WoV
  ASoC: dt-bindings: mt8183: add ec-codec
  ASoC: mediatek: mt8183: support WoV

 .../bindings/sound/google,cros-ec-codec.txt   |   24 +-
 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |    3 +
 drivers/platform/chrome/cros_ec_trace.c       |    5 +-
 .../linux/platform_data/cros_ec_commands.h    |  285 ++++-
 sound/soc/codecs/cros_ec_codec.c              | 1125 +++++++++++++----
 sound/soc/codecs/mt6358.c                     |  105 ++
 sound/soc/mediatek/Kconfig                    |    1 +
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   70 +-
 8 files changed, 1292 insertions(+), 326 deletions(-)

-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
