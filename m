Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2955982A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3CA18AA;
	Fri, 24 Jun 2022 12:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3CA18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656067784;
	bh=plJ5UW4OX4w88fuERtzjWWbmFLTQscomleT0mKe1j9w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=veueAZyB2M9KB3ETjixBZmQ7ZWAuTHdMwEBumVukyLQ/3yfnFPAL/g4O+oyK+s9Cx
	 Z0OpHRLS8N6VVrJh7hCEGIGPgBWH12ORpclXZifCEAy95pPRpMesTUpsW/6AxKEUUI
	 JZWFYeDfu+Yy60QxAP9jj1KAXLVPwCudjsAk/ZWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C176FF804ED;
	Fri, 24 Jun 2022 12:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCDEDF8053A; Fri, 24 Jun 2022 12:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 936E1F80165
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936E1F80165
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 328A9282E26;
 Fri, 24 Jun 2022 10:47:22 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH 0/8] ASoC: max98396: Some assorted fixes and additions
Date: Fri, 24 Jun 2022 12:47:04 +0200
Message-Id: <20220624104712.1934484-1-daniel@zonque.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>
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

This is a series of some patches that I collected while using the
max98396 driver is a TDM mode setup.

They correct BSEL and PCM mode configs, add support for power supplies
and add some bits to the documentation.

The code is tested in TDM-16 and TDM-8 mode with 32 channel width.


Thanks,
Daniel

Daniel Mack (8):
  ASoC: dt-bindings: max98396: add voltage supplies
  ASoC: dt-bindings: max98396: Add #sound-dai-cells
  ASoC: dt-bindings: max98396: Document adi,bypass-slot-no
  ASoC: max98396: add voltage regulators
  ASoC: max98396: Improve some error prints
  ASoC: max98396: Fix register access for PCM format settings
  ASoC: max98396: Implement DSP speaker monitor
  ASoC: max98396: Fix TDM mode BSEL settings

 .../bindings/sound/adi,max98396.yaml          |  34 ++-
 sound/soc/codecs/max98396.c                   | 265 ++++++++++++++----
 sound/soc/codecs/max98396.h                   |   8 +
 3 files changed, 257 insertions(+), 50 deletions(-)

-- 
2.36.1

