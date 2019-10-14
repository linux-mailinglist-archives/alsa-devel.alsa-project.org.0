Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454AD5FFB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 12:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0528D167D;
	Mon, 14 Oct 2019 12:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0528D167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571048552;
	bh=2tsdZk77BE9Uo5KRkBcfpT+6MvbmuQluLsyetYE7wo4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JRRGd2cSpXP7EZXnA0Y+tXhI91g89EgjklfEwgS6TUH2LeMQHfc5pdzExY+aOT9Jz
	 ftyZbN5AltTANMskteiLAwjeKWAfStlr9w0KPEnvZkhUAxT5s64BkvLYUtfVXRRKKO
	 VVczo2AOkQ3reSfiAIm4JsPOTzjORaLWHXKzjE8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F44F80362;
	Mon, 14 Oct 2019 12:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127E9F80362; Mon, 14 Oct 2019 12:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0485FF80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 12:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0485FF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Mf+/ukDv"
Received: by mail-pg1-x54a.google.com with SMTP id z7so12349530pgk.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NUWv3pS6i68MPyjlBfm0nFo2xRHgz4DI1UFPygXWc14=;
 b=Mf+/ukDvCvG79e+JKV/LbVKJnZ317XOeJkfVvPRDrUlNFL4aJeeYA8ORopngzAoY6s
 xdwCooAwsc4aUOg0vs36dVFlDSvf88OZvj5C9Dq3gJG3No2op8TbR2JVM788ZjdXRkss
 2tIrMu7pTC8/u19pHTBITL/KLx969HshJYvtt59VIzhX9ig6VlBA7t4RBz1Z0Ny5zcaa
 cEH9EpheAGIcCPgP5OGQz/Z8TCjnisJFR1Qxjx9a9XgvkkwEjq/bB9ZWNtmIzAotLNV0
 lsTzzJUOexSrh+8v6uUjTrRF5FuxGS0gjLfyQtIaxyL1XWXmjloOkVmNHoNIxVW9JaXE
 wrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NUWv3pS6i68MPyjlBfm0nFo2xRHgz4DI1UFPygXWc14=;
 b=jupumvrcrTMo2w8FP8qnAuKi09nEEQ1oSU/TJh8AKuG0j6LZ1AoIJY5zJ3BekxmP4n
 +yxGqTVpAMW+r7VPSF1BpmKRnGGNxb+6GL3ezaPEJcorgCxXgcYFjfuE+asoJTNNfrex
 ukIOPKcTfocu1EAwMyMCUg5ATYcX2ubfQxyI7Vc4R2fWPEMpHGmzujjPtzKlSGFO4YdG
 IDRdH9SSCjNnEohKe7VmNsebCpG1yNDR2yWJEWy8JhwxCnwhOMh1EqOpSilkdk65EQni
 sU/g5JC8PD/JHdgLvw7Wo6IvnHGbBsouQT8XDCA1EjI9ZX5AAGY+79DwZwvd1aabzLXj
 TXAA==
X-Gm-Message-State: APjAAAX6+MuoYz0Ek8jsEGKvcT3CLpl/TE/jQcu1Ng0OshgxH2Ugafs9
 77BKrMeG414UMCLxTouMBi5jVgvOjcwT
X-Google-Smtp-Source: APXvYqybl2o6f9MpE2y0b4jGAulKGhnTL0ZJF7GuOPvB9xeT2A80cEhd29tNE2grvM2fiuFrEaqpmfICjoBn
X-Received: by 2002:a63:c911:: with SMTP id o17mr32400264pgg.150.1571048439006; 
 Mon, 14 Oct 2019 03:20:39 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:20:12 +0800
Message-Id: <20191014102022.236013-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v3 00/10] ASoC: mediatek:
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
Changes from v2:
- rebase upon to "don't use snd_pcm_ops" series
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156170.html
- fix sparse errors
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156328.html
- use "reg" for SHM binding
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156657.html

Tzung-Bi Shih (10):
  WIP: platform/chrome: cros_ec: remove unused EC feature
  WIP: ASoC: cros_ec_codec: refactor I2S RX
  WIP: ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
  WIP: platform/chrome: cros_ec: add common commands for EC codec
  WIP: ASoC: cros_ec_codec: read max DMIC gain from EC codec
  WIP: ASoC: dt-bindings: cros_ec_codec: add SHM bindings
  WIP: ASoC: cros_ec_codec: support WoV
  WIP: ASoC: mediatek: mt6358: support WoV
  WIP: ASoC: dt-bindings: mt8183: add ec-codec
  WIP: ASoC: mediatek: mt8183: support WoV

 .../bindings/sound/google,cros-ec-codec.txt   |   24 +-
 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |    3 +
 drivers/platform/chrome/cros_ec_trace.c       |    5 +-
 .../linux/platform_data/cros_ec_commands.h    |  285 ++++-
 sound/soc/codecs/cros_ec_codec.c              | 1128 +++++++++++++----
 sound/soc/codecs/mt6358.c                     |  105 ++
 sound/soc/mediatek/Kconfig                    |    1 +
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   70 +-
 8 files changed, 1296 insertions(+), 325 deletions(-)

-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
