Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508FB1F4253
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 19:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FC9166C;
	Tue,  9 Jun 2020 19:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FC9166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591723900;
	bh=9Dm5+2HROcB7Hf1yR+a6BfOHlYAwZTWTrRKFzRQSdWw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U/vIilX+T+XTgOiNiphjQFa2xRtLGMUtRPoA69pBaEHSV7R1OB4+tTzCmlbGhjLuF
	 VJAjTVqX0MCPEUwT5sfKu+J3D6LbS9fBUJcFhWuyc2ssCFtKGtyNbCWWM0BxOSm6lH
	 hoVHOzExt8dpS9Iq2R157EsUgWv3GSeWrCnQX7NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7C6F80124;
	Tue,  9 Jun 2020 19:28:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AE35F8028D; Tue,  9 Jun 2020 19:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A187AF80278
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 19:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A187AF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j2fQQ+aC"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059HSgdK084614;
 Tue, 9 Jun 2020 12:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591723722;
 bh=5a2z97hTdAdkh5ZKUO4ayG5VqkUbg5/xHMaTOyqvLAE=;
 h=From:To:CC:Subject:Date;
 b=j2fQQ+aCaMLEvkVZHtvc7KxJ+lY4ZMBNf8aMbTTUzTWHzqhVqcZInwVdgBvqgIMu1
 h8BU6MDR6biZq5W6ENVlzO13dGuDKCdAuSi0BwHb1Bb31SYUyvbIBRJuyBbzdPDrAn
 ujHE+i3MrYSetegtymCXQvHKCWiVuSBX/QQiNqdU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059HSg5N130134
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 12:28:42 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 12:28:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 12:28:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059HSg6u003016;
 Tue, 9 Jun 2020 12:28:42 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <robh@kernel.org>
Subject: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader
Date: Tue, 9 Jun 2020 12:28:39 -0500
Message-ID: <20200609172841.22541-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Hello

The TAS2563 amplifier has a DSP that can run programs and configurations to
produce alternate audio experiences.  The DSP firmware is not a typical firmware
as the binary may contain various programs and configurations that are
selectable during run time.

These programs and configurations are selectable via files under the I2C dev
node.  There may be a better way to select this through ALSA controls but I was
unable to find a good example of this.  This is why this is an RFC patchset.

Dan

Dan Murphy (2):
  dt-bindings: tas2562: Add firmware support for tas2563
  ASoc: tas2563: DSP Firmware loading support

 .../devicetree/bindings/sound/tas2562.yaml    |   4 +
 sound/soc/codecs/Makefile                     |   2 +-
 sound/soc/codecs/tas2562.c                    |  48 ++-
 sound/soc/codecs/tas2562.h                    |  25 ++
 sound/soc/codecs/tas25xx_dsp_loader.c         | 377 ++++++++++++++++++
 sound/soc/codecs/tas25xx_dsp_loader.h         |  93 +++++
 6 files changed, 530 insertions(+), 19 deletions(-)
 create mode 100644 sound/soc/codecs/tas25xx_dsp_loader.c
 create mode 100644 sound/soc/codecs/tas25xx_dsp_loader.h

-- 
2.26.2

