Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA7DAF01
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EDD1671;
	Thu, 17 Oct 2019 16:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EDD1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571320945;
	bh=H84nsDJjOOMkg0cxBfBHf3ZyeVANNPQCrHCpL5ML1iE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ymem7bOyACnVSICXeL0UDTiGLlMuwyegUROaoHek5bG6Rq8iJBZPAw4frvMsjEdhh
	 GMzpsGGZjyZK6QM90asPwhvsTBKAJd3S60PXt9xbrg7Rxy5nsc2hq/B0mmiNM/2Osg
	 q9cjKye8FD1iDjkyPIq1mAZpIIdF9cx7yk4ePtgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F826F804AB;
	Thu, 17 Oct 2019 16:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21CA7F804AA; Thu, 17 Oct 2019 16:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BAB5F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAB5F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mALvokSa"
Received: by mail-yb1-xb4a.google.com with SMTP id p66so1832940yba.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=eTwvoxixG9e7fAxl5QzNwRqb5cdZfoKTNKkC1RqsVr0=;
 b=mALvokSa+V5WXvm3ssROhiyT4o2IFPLamPw3xItea5wPgAF/9erpezVWSByLUXBwxZ
 T5sRoTVEp0XebAU7Kyy2kIZYXKMaDKxM2K+3B1fRCAo4m9NgdJ+nA/9Y76ZubeRTgB0m
 XMZzWQOaTNyKOLWd3LEvuQC6Wrw/fRJg+VbSdrfM7wZ3Qjjyo1EkVP1eOmk8/y+QyFUv
 JnYiILRoxjIumIFf7MK0vBHFZF3b7osXjluFiqrt3owCqySogBJU9tv+84bV1dvmo22n
 xxQ64lQ9/OFDc9IDqbnMRTHByLyer9jmyz8xhBFVbXCpqgGa+UuNUDaeLw0EfYNGFLrB
 ks/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=eTwvoxixG9e7fAxl5QzNwRqb5cdZfoKTNKkC1RqsVr0=;
 b=ihsu4INPK/j2PwKldQdvIn/aX1qIqpxg1zFYRnnYc9BGx9ockI/71Kv1VUsa2OpK0J
 dapjxbzTZ4H+EVdH8cd8mEpvuc1tbFSxoIByZgpljcVgQ5BADnT1kZ7Thgc49FeCnD/A
 B4Y9nYef+GJdQfYDTK9/TtBurZoLMGoUBKt9l8QXsYnqDckxe4vpLEWgXH/SYpFzTMpz
 5JKbCOWjD5QJf6Xymf75isGp5AzIDdYiKDyknIV9UwwNkhn6Z6fJtnyk8MjQ3cK96K5E
 qVBZRb+0w9PhezW/j9+GqGyUWRMDrONSWAUvjGXw0RNlYBuJDSsC4x0pq3mqw+HWn9uS
 xwwg==
X-Gm-Message-State: APjAAAVz6jHsrOI/BEdSyuSJpxGxHxnjnrGDdyepuvGS75Rykw0x+Tqo
 +A/3WLtTgQ4t8aeSirAPa/j4N+TNQfln
X-Google-Smtp-Source: APXvYqw5iS5oR/4K5Pyu87yPL/HYeiH+rEbgwHFAIZXcpDDXPaoB+Z3XDhYBuxu84fTDHoNY6omWpRrxyLFY
X-Received: by 2002:a25:a0d0:: with SMTP id i16mr2266509ybm.96.1571320833154; 
 Thu, 17 Oct 2019 07:00:33 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:05 +0800
Message-Id: <20191017213539.00-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v4 00/10] ASoC: mediatek:
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

Changes from v3:
- fix a compile error by adding ifdef
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156750.html
- fix a coccinelle warning
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156754.html

Changes from v2:
- rebase upon to "don't use snd_pcm_ops" series
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156170.html
- fix sparse errors
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156328.html
- use "reg" for SHM binding
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156657.html

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
