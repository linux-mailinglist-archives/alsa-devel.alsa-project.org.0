Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D723E35513C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 12:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D1B7165D;
	Tue,  6 Apr 2021 12:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D1B7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617706316;
	bh=Es88WWcD5Q2zE95rq3vvLPfdn+SKGzeYIko/RTCxKMk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NHj1BpEr+wBce3d8HQFgv/i8XPsvg1HFfjPeYu7rhg02Ry2FrZ8HEr1l93ihQCwk4
	 8PkU8LAc9MLvxEg6xqRh2qGNN57I64rxlAVjaxS7BvNSuoa++ERS6/7QYCZ5+UjK37
	 +ardH9J6I6qQKy2FYinAubrsylGEnNOIMSk1LZHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10864F80259;
	Tue,  6 Apr 2021 12:50:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32696F80259; Tue,  6 Apr 2021 12:50:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17CD1F800E1
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17CD1F800E1
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 043743FA31;
 Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 86KLOr3Xijov; Tue,  6 Apr 2021 12:50:22 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 59C4A3FA29;
 Tue,  6 Apr 2021 12:50:22 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] SOC Codecs: TLV320AIC3X add SPI support
Date: Tue,  6 Apr 2021 12:50:13 +0200
Message-Id: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
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

This patches add support of SPI to TLV320AIC3X codecs.

Jiri Prchal (5):
  SOC Codecs: TLV320AIC3X add SPI: move thinks to header file
  SOC Codecs: TLV320AIC3X add SPI: main source code for I2C and SPI
  SOC Codecs: TLV320AIC3X add SPI: I2C code
  SOC Codecs: TLV320AIC3X add SPI: SPI code
  SOC Codecs: TLV320AIC3X add SPI: configuration and compile

 sound/soc/codecs/Kconfig           |  11 +++
 sound/soc/codecs/Makefile          |   4 ++
 sound/soc/codecs/tlv320aic3x-i2c.c |  72 ++++++++++++++++++++
 sound/soc/codecs/tlv320aic3x-spi.c |  77 +++++++++++++++++++++
 sound/soc/codecs/tlv320aic3x.c     | 105 ++++++++---------------------
 sound/soc/codecs/tlv320aic3x.h     |  13 ++++
 6 files changed, 204 insertions(+), 78 deletions(-)
 create mode 100644 sound/soc/codecs/tlv320aic3x-i2c.c
 create mode 100644 sound/soc/codecs/tlv320aic3x-spi.c

-- 
2.25.1

