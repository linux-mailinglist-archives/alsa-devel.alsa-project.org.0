Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25533804
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF5F1687;
	Mon,  3 Jun 2019 20:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF5F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559586960;
	bh=grtm3wv6ce4zrdom9Yzb5RFJUGbw9S61jlar0fYtmcg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BdOmASb/lLz5P1QzdsSY0+a/rKQBmfTj2p0yTBVG1EHVqfkiJ7oeS9Sotp0nmvKi5
	 LuVa8J3LH9Vcem2im6aT3PtyFAKO9/TPIIYLJOZKLFKfIZkQ6bKD1j9uwvuLVkM2Ec
	 6v4TjiRsUY+qwUiOEBq4qXIbxx47T3nBE92qG77Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0691BF896DD;
	Mon,  3 Jun 2019 20:34:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E739F896CE; Mon,  3 Jun 2019 20:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC1EF896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC1EF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZEy6TWEx"
Received: by mail-pf1-x442.google.com with SMTP id y11so11074348pfm.13
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OMm3tcPOrrK8tIoq8oT9gk0/r727fXOc1tebJgYu2Sw=;
 b=ZEy6TWExPeP5gABfGQNd1Z7UgaOyMyRV5h3+HhRUFWa9YK4pIKlzz9hm8yasAXu1Z7
 uSI/5H14hoCeAy70BDaQN11YQsoDp5nlp6K5FRHWVqJiCjhnBnuxrLAVjhVL2MEEMucO
 ArMLSNFye5QXV42DdZrv7mC3u86TzX7IJwSMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OMm3tcPOrrK8tIoq8oT9gk0/r727fXOc1tebJgYu2Sw=;
 b=XtuRHPvFhn2jzkHTByqB/5fG8k27SX/b6r9KvPYd/+ENxmGFDYmq0enDh8Ahs5/Ki/
 eEeu6NNhU/LC+t8d9c8BLAZKLXZw170nht0oDDbXhVN+kv7d99igHfvQ43d7A7iz4v6q
 rmDdfhFBPkOa4B1Ez9hxlDGDcS98hp51v+TOLSekAg0aWPqwzGg8WZL55P3hBcrUeT2z
 NBTn7y2I6JaotCKhjEeifY11qRUeakvTkkCAB9ZJuM//AeDYNBOeSz1PESxomzjsR468
 cBidw2vxwaG+BnDwiAbtuciZsiS/8rKvqqphKJm7j4sP9JxPjHjzSw1hAYZlqz9S+eVj
 xEtg==
X-Gm-Message-State: APjAAAVVKQAPtnvCE4bmFnzJhs6Jphl/JMdLjv5htCKxDQpGguVvg9eB
 XtiljgqcpQu5DWdqJrQ1UanH0w==
X-Google-Smtp-Source: APXvYqwBmiL5k+2ddQT3SaivO2LUTpE1S9J9MlaHPCVbvu7tNhvMpErqzNivenjCl/SMFrlSdiCNDw==
X-Received: by 2002:a63:6c87:: with SMTP id
 h129mr30982099pgc.427.1559586846808; 
 Mon, 03 Jun 2019 11:34:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id y24sm1611759pfn.63.2019.06.03.11.34.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:06 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:31 -0700
Message-Id: <20190603183401.151408-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 00/30] Update cros_ec_commands.h
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

The interface between CrosEC embedded controller and the host,
described by cros_ec_commands.h, as diverged from what the embedded
controller really support.

The source of thruth is at
https://chromium.googlesource.com/chromiumos/platform/ec/+/master/include/ec_commands.h

That include file is converted to remove ACPI and Embedded only code.

From now on, cros_ec_commands.h will be automatically generated from
the file above, do not modify directly.

Fell free to squash the commits below.

v3 resent: Add Fabien's ack.

Changes in v3:
- Rebase after commit 81888d8ab1532 ("mfd: cros_ec: Update the EC feature codes")
- Add Acked-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>

Changes in v2:
- Move I2S changes at the end of the patchset, squashed with change in
  sound/soc/codecs/cros_ec_codec.c to match new interface.
- Add Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Gwendal Grignou (30):
  mfd: cros_ec: Update license term
  mfd: cros_ec: Zero BUILD_ macro
  mfd: cros_ec: set comments properly
  mfd: cros_ec: add ec_align macros
  mfd: cros_ec: Define commands as 4-digit UPPER CASE hex values
  mfd: cros_ec: use BIT macro
  mfd: cros_ec: Update ACPI interface definition
  mfd: cros_ec: move HDMI CEC API definition
  mfd: cros_ec: Remove zero-size structs
  mfd: cros_ec: Add Flash V2 commands API
  mfd: cros_ec: Add PWM_SET_DUTY API
  mfd: cros_ec: Add lightbar v2 API
  mfd: cros_ec: Expand hash API
  mfd: cros_ec: Add EC transport protocol v4
  mfd: cros_ec: Complete MEMS sensor API
  mfd: cros_ec: Fix event processing API
  mfd: cros_ec: Add fingerprint API
  mfd: cros_ec: Fix temperature API
  mfd: cros_ec: Complete Power and USB PD API
  mfd: cros_ec: Add API for keyboard testing
  mfd: cros_ec: Add Hibernate API
  mfd: cros_ec: Add Smart Battery Firmware update API
  mfd: cros_ec: Add I2C passthru protection API
  mfd: cros_ec: Add API for EC-EC communication
  mfd: cros_ec: Add API for Touchpad support
  mfd: cros_ec: Add API for Fingerprint support
  mfd: cros_ec: Add API for rwsig
  mfd: cros_ec: Add SKU ID and Secure storage API
  mfd: cros_ec: Add Management API entry points
  mfd: cros_ec: Update I2S API

 include/linux/mfd/cros_ec_commands.h | 3658 ++++++++++++++++++++------
 sound/soc/codecs/cros_ec_codec.c     |    8 +-
 2 files changed, 2915 insertions(+), 751 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
