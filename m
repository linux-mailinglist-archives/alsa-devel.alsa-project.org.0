Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64936355694
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 16:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C0B15F2;
	Tue,  6 Apr 2021 16:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C0B15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617719181;
	bh=CGpQIePXzYIoTcCdMP82u1kfVOMX5FW6heOv/Q1pgnI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pPwAZFUZ4iLFpgJSdZVg8sRWJb2GM9PGwH10eMXvfgFxJw0eV1L/YO3EuxDSfvivg
	 Kc5HuVPOsDKlg/J/K/TjVfIGzsNXx82EHr+PrhShH40w6vZ+jg0lroUlqJe2o+giHa
	 bZ+dXGa+2UFfBAwSjjYKtuSIr0fbZdGkRDgDXFvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DCEF80259;
	Tue,  6 Apr 2021 16:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 563D6F80259; Tue,  6 Apr 2021 16:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B7A8F800E1
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 16:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7A8F800E1
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id BCFD83FA38;
 Tue,  6 Apr 2021 16:24:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 50r0R8RM4mMZ; Tue,  6 Apr 2021 16:24:43 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 0D04B3FA29;
 Tue,  6 Apr 2021 16:24:42 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] Adds SPI support
Date: Tue,  6 Apr 2021 16:24:35 +0200
Message-Id: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Moved I2C stuff to separated file, shered thingk to header file.
Added SPI in separeted file.

Jiri Prchal (4):
  ASoC: codecs: tlv320aic3x: move model definitions
  ASoC: codecs: tlv320aic3x: rename probe function
  ASoC: codecs: tlv320aic3x: move I2C to separated file
  ASoC: codecs: tlv320aic3x: add SPI support

 sound/soc/codecs/Kconfig           |  16 ++++-
 sound/soc/codecs/Makefile          |   4 ++
 sound/soc/codecs/tlv320aic3x-i2c.c |  70 +++++++++++++++++++
 sound/soc/codecs/tlv320aic3x-spi.c |  76 ++++++++++++++++++++
 sound/soc/codecs/tlv320aic3x.c     | 108 ++++++++---------------------
 sound/soc/codecs/tlv320aic3x.h     |  12 ++++
 6 files changed, 204 insertions(+), 82 deletions(-)
 create mode 100644 sound/soc/codecs/tlv320aic3x-i2c.c
 create mode 100644 sound/soc/codecs/tlv320aic3x-spi.c

-- 
2.25.1

