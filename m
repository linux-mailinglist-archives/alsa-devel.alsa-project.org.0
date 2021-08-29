Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AD63FAD52
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Aug 2021 19:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6953116BA;
	Sun, 29 Aug 2021 19:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6953116BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630256934;
	bh=K7WOQRGdrSf+PbNjqY1YtmWTU3lNTVPtvBKbaWcq284=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VwRT0AquB5ja4v7akb0ZwE9wGJzdtCNdk7mwo1Td8vpaDGzz2oDX5MeNd8d3mU+xy
	 fXFCVfKFhlKuE9iI6y6QK6BbmfkF+7/nbOJeLAHv36JMePZUMFZhIjkqRBA3De5yzc
	 xfleWQBa08wQq41q1HtsN6cQRnWWIGud6kdygbH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE907F80246;
	Sun, 29 Aug 2021 19:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E9C7F8025B; Sun, 29 Aug 2021 19:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dnyon.com (unknown [IPv6:2001:ba0:1800:12f::1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01DEDF80246
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 19:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01DEDF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="Ue4Xpfz8"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id A3C6740442;
 Sun, 29 Aug 2021 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630256848; bh=K7WOQRGdrSf+PbNjqY1YtmWTU3lNTVPtvBKbaWcq284=;
 h=From:To:Cc:Subject:Date:From;
 b=Ue4Xpfz8jQCWWVN5n1TB79rkzw7GeTblHz3Mr4X4/4W81m1sFw8zbcuspenzoxfYS
 WjNSu00M2iSKGG+vBv7CFuNh9xvKYS46QOq7FTFpzWP2fvI6walzTC5roLkGcmdFy/
 iCh33lZJkjeepo73AscnNqYk1MdIwzZpeaVzrnL7EvQA8h+GL6rZBaxz4jFOh8lgAq
 7rinpQieKKLeX4dlDIaiWLs16JvA6IGUvMfzJUHPQgOTwsnbQQUobn1j+CADxyGAVf
 JmSgw3uuQr9S7EMXTFhjQQLlDnZWYmNA/WtteHWEIwwAxwXrTZfsyCZm/xYMAvzQa1
 dXQUn6mvRZo+Q==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [PATCH RESEND 0/2] Add reset-gpios handling for max98927
Date: Sun, 29 Aug 2021 19:00:15 +0200
Message-Id: <20210829170019.384632-1-atafalla@dnyon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Alejandro Tafalla <atafalla@dnyon.com>
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

