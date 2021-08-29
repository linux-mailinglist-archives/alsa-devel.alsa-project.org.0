Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 563CA3FDE4A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 17:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2CC174E;
	Wed,  1 Sep 2021 17:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2CC174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630509232;
	bh=K7WOQRGdrSf+PbNjqY1YtmWTU3lNTVPtvBKbaWcq284=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M6BIO/uhYraVRz3mBgm7EGaRx/rVw3QJXBsA8sdmGhfM1tRmAPbW6Cfv2Ih/NS5c8
	 1scAqfiOxjd71wL8Eee+NUhGOA7KTskznmpDBLKFUaz75mbgm0rj7+k9KgCgFsUlTX
	 A3HEQN3lstBxSNJYDEUX4MSjPKeIZmdk0EcjVtf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D132F80227;
	Wed,  1 Sep 2021 17:12:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70ACDF8025B; Sun, 29 Aug 2021 17:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8861EF80143
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 17:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8861EF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="YomUul1y"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id A336040442;
 Sun, 29 Aug 2021 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630252195; bh=K7WOQRGdrSf+PbNjqY1YtmWTU3lNTVPtvBKbaWcq284=;
 h=From:To:Cc:Subject:Date:From;
 b=YomUul1yURUkZT7vFN/EK4seETy+lbrdMjRM5XfjLve9o4BKbNKAOF4cGR27klIgv
 57uMLgbQPC9pRHImkHtpjvtgtajEg1Hl4S6b9VorG0w/opcJyirfUVlE9OzI7DJKFw
 WyKnWDjackbOgKu5GaOsK38orAC8g1nHjBvQGbRxiFY5hW/fzOUFkWadBmkuKGmqhx
 uJQ54ZV32NMNlPtNFMOIOIudQE4z08729sJRDoGSxzKyeLoYa71r5Wsam1us58ezzr
 7VxnfeW9/S42vguVYF0+p6BHQqr1GqQumyvAsE/mZU8K8BEwzlHSGf+mYEvmsXVenV
 w6eR50DZYwfoQ==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: 
Subject: [PATCH 0/2] Add reset-gpios handling for max98927
Date: Sun, 29 Aug 2021 17:45:42 +0200
Message-Id: <20210829154545.383119-1-atafalla@dnyon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Sep 2021 17:12:33 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Alejandro Tafalla <atafalla@dnyon.com>
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

 .../devicetree/bindings/sound/max9892x.txt       |  3 +++
 sound/soc/codecs/max98927.c                      | 16 ++++++++++++++++
 sound/soc/codecs/max98927.h                      |  1 +
 3 files changed, 20 insertions(+)

-- 
2.32.0

