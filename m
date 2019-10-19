Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C63DD70C
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Oct 2019 09:05:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2A6852;
	Sat, 19 Oct 2019 09:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2A6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571468701;
	bh=wkcjYAdkA6qOGPi/EDko7yd6Ok9YuQ1okP2GU10nJPw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CMvSWXXB+0+mpXyT55xNzM1ZqFJas0K3PybkWijQLBVXvspTO3n4Fz+l7mD0XoO8i
	 4tocvx2ilz4pFDkorxAgcRVx1MKQa1xeKWzIwob9c4bAMEQ7fLknLOgsopCd3hnLua
	 0EFHjh/p/YfwaWgX84CI80xk712fKU05gqUsEJ6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0234F804AB;
	Sat, 19 Oct 2019 09:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4015FF804AA; Sat, 19 Oct 2019 09:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01676F80322
 for <alsa-devel@alsa-project.org>; Sat, 19 Oct 2019 09:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01676F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gSckZJdI"
Received: by mail-pl1-x649.google.com with SMTP id 99so5139746plc.18
 for <alsa-devel@alsa-project.org>; Sat, 19 Oct 2019 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=d0XyTmgfeAre5YC2OnNwo/Pr1PqjNkWbfyJ5reUpD1M=;
 b=gSckZJdIoFFxrOxNfz8OOIHcGK+aCKXcKoIN0v4bDseFxXjGU4RlKRbVMelhdfGh3a
 RVfGRMdhKgu+aJgPhLKiQTaWJ0xm8zLrJvkfrREWPmqR7bRk/8ZsXSFv100BTDEIFCY9
 0kCV82YuFU/km+t+Tr6XeYNhohtKFFQqyeeT6qdp0VODRdhwRt+/cQdWHhEPuR0KTBrE
 X86PTsteaUZx+UXtxt4G3LCTsWkJvhhLqauWfZXYRTqoepVS+Gi7dGhmk5XS9SZNIIr4
 cUm3c0YzXvXfpPijxRTJIJY5GDm6V5TUVWEMQRiVKuYzTK1HdTIiIzF9YT6ME8crgO1S
 Xvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=d0XyTmgfeAre5YC2OnNwo/Pr1PqjNkWbfyJ5reUpD1M=;
 b=SVE4sfgLcmBIu5xP/ol/25Ifg48KGLL2J/82jNqV60rPr/mJhLGPxxK+0NQf+CAhxU
 by5/Ay/3zxPbL1C3xA8REwF/U485/NWCuBI8hnl2mJdnm6Dy71pXNRxXaL//5SmbRLfT
 trcLLzQgcPZpluaUjEIgC9pCBtNLf2Bs93b7sercgN/y6bO4UAOigg9PXZlS+Rsyni3w
 etaPcww6GwH+Ey1WOxQRTvRDn254fGRNJANlcrF1nTn0qncHrehmQUhPTFrs6QxpQ4I3
 pi7GCKM1TJcybkQBOtJP6bCk0UAGO4bxF7s33hiMl5oTpy3xvERYXHUzwkLoMj2LNpo4
 Wv1Q==
X-Gm-Message-State: APjAAAUTwzYbSp9DdUo2sspeMMu8kLRFajk59mqAx+17zCcHRXjeQytz
 ny9+gP985CJjFukc97r26qfhjozu38pF
X-Google-Smtp-Source: APXvYqzEGT16epUCp5nzQ6XZ+L8Hc3IzAUWo4NSxm6buinTSwg7NBNeZ73ax3MOptOf39U8ffnLcW/c6v/JW
X-Received: by 2002:a63:287:: with SMTP id 129mr749320pgc.190.1571468589134;
 Sat, 19 Oct 2019 00:03:09 -0700 (PDT)
Date: Sat, 19 Oct 2019 15:02:50 +0800
Message-Id: <20191019070254.23870-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v5 0/4] ASoC: mediatek:
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

ASoC: cros_ec_codec: support WoV
- makes cros_ec_codec support WoV.

ASoC: mediatek: mt6358: support WoV
- sets necessary registers on mt6358 to support WoV.

ASoC: dt-bindings: mt8183: add ec-codec
ASoC: mediatek: mt8183: support WoV
- make machine driver mt8183-mt6358-ts3a227-max98357 support WoV
  if ec-codec is in DTS.

Changes from v4:
- remove the first 6 commits which have merged
- fix a compile error by adding Kconfig dependency
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156992.html

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

Tzung-Bi Shih (4):
  ASoC: cros_ec_codec: support WoV
  ASoC: mediatek: mt6358: support WoV
  ASoC: dt-bindings: mt8183: add ec-codec
  ASoC: mediatek: mt8183: support WoV

 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |   3 +
 drivers/platform/chrome/cros_ec_trace.c       |   1 +
 .../linux/platform_data/cros_ec_commands.h    |  69 ++
 sound/soc/codecs/Kconfig                      |   2 +
 sound/soc/codecs/cros_ec_codec.c              | 700 +++++++++++++++++-
 sound/soc/codecs/mt6358.c                     | 105 +++
 sound/soc/mediatek/Kconfig                    |   1 +
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  70 +-
 8 files changed, 946 insertions(+), 5 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
