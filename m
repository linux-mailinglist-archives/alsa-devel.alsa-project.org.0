Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF1194A0E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 22:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAA4166F;
	Thu, 26 Mar 2020 22:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAA4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585257119;
	bh=JdEr8MDhzyZ0xHZws7k27ypDiJGZu134CCRdAlpi3hw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nzHnxe2/C/rzg+u0RqM369iTuJZZlmVRKesTPbpa/Kjh12ECLDSpWKZMAaDsNXrzm
	 65l86z38W4xVyUm+9mFmrLFMpl2sdc0vtGUlnDm8h8FXbMYMcL1bdzTcVSndpDR3xZ
	 KNjnJdowS1tBkZGFlkf3D1m5JgXVBMWuPHm9/gH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB6EBF80095;
	Thu, 26 Mar 2020 22:10:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 420B2F80258; Thu, 26 Mar 2020 22:10:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=FORGED_SPF_HELO, SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by alsa1.perex.cz (Postfix) with ESMTP id AEB27F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 22:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB27F80095
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
 by pokefinder.org (Postfix) with ESMTPSA id EDEC02C1F8B;
 Thu, 26 Mar 2020 22:10:10 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 0/1] ASoC: convert to use new I2C API
Date: Thu, 26 Mar 2020 22:10:09 +0100
Message-Id: <20200326211010.13471-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

We are deprecating calls which return NULL in favor of new variants which
return an ERR_PTR. Only build tested.


Wolfram Sang (1):
  ASoC: pxa: magician: convert to use i2c_new_client_device()

 sound/soc/pxa/magician.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.20.1

