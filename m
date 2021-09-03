Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BA3FF8C1
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 03:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E331517DD;
	Fri,  3 Sep 2021 03:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E331517DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630634033;
	bh=sf2pcCMT1IxNfnOeWrCGZ5xfAX63pMAjrAvTYJj8Qlg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OLv/wHnwQkV6NLPEcX5M65u1e7N54whMi17hz8jbmaHkyteTondcF1Bth8JKEYI+K
	 IZ81x/oKK4iMKLqqYg6j2G4kT90psVqmgbVEzDwBCPBC/Rx9TLozlqir5MwuQofRGV
	 gXYDLzYNqzYuRaDKh1I4k3ubKSnO6J/dvmcZVUwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A972F804C2;
	Fri,  3 Sep 2021 03:51:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A59DF802E0; Fri,  3 Sep 2021 03:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2F60F8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 03:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F60F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="YSOoieVI"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id EA1EF3FEB7;
 Fri,  3 Sep 2021 01:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630633897; bh=sf2pcCMT1IxNfnOeWrCGZ5xfAX63pMAjrAvTYJj8Qlg=;
 h=From:To:Cc:Subject:Date:From;
 b=YSOoieVIDQI4TEiluzOeHfJJkwXXGBtvJuzWBk50seB3HZGBTJuVe3Q/Ym7MAmzc0
 ZmAD0FNBxf2MXvFrspHTW+KplwnDAnyC5l0xEFyNrThdbCxMZRglJOyMzYeFRoZ1Ww
 vMEpp19w0A5IhBGZ5h32sL+SQZqt3Xp3HAoGtGnOolQ4Axs3XgFqQckb2Ldx+hsr6H
 vs1RmEkgEPev9lJyQl4b76CG23Is8jdMX42f6hEyD7bMggiEy/P6RiEIyMJgUPTgk8
 Tq2NUBSOexpqgBIKPo8d+8ErZGV6WLyNsTcZi8DYuczJMiptuyxsT6HUTN40oCy1di
 HmuxMttpYvWcA==
From: Alejandro <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 0/2] Add reset-gpios handling for max98927
Date: Fri,  3 Sep 2021 03:49:49 +0200
Message-Id: <cover.1630632805.git.atafalla@dnyon.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Alejandro <atafalla@dnyon.com>
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

The max98927 codec on some devices (i.e. Xiaomi Mi A2 Lite phone) require
hardware-resetting the codec by driving a reset-gpio. This series add
support for it through an optional reset-gpios property.

Alejandro Tafalla (2):
  ASoC: max98927: Handle reset gpio when probing i2c
  dt-bindings: sound: max98927: Add reset-gpios optional property

 .../devicetree/bindings/sound/max9892x.txt         |  3 +++
 sound/soc/codecs/max98927.c                        | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.33.0

