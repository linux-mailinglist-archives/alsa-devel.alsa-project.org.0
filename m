Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDF796649
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 18:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36211668;
	Tue, 20 Aug 2019 18:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36211668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566318400;
	bh=GU8eO642xiU8fhYFHCCWmFVMIfYkAsb0EJgr1SGVe9g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DCSjljURDJR+qbZu275nYrHwtl2geEdtSvLvMaQ3pC6c9NaBUIAF39nLkrzuHY3xC
	 J/1xH+h8WIMbihlN31A4lM7lPMW3ExTXgWixWcMnKJ7YZTnD+M32FgtKC7xc33t4Rb
	 ywkYjaLjC8E5r7JB5/DsqGc/UTxgubeSQp6+G/GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CA6F800D3;
	Tue, 20 Aug 2019 18:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A89A4F800D3; Tue, 20 Aug 2019 18:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5882AF800D3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 18:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5882AF800D3
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: fWI45YppRXL2cpH01hnpCc35g1Ub3xWS0ia640z7pOG9bho9JkilCCrM1QxwhvGUmjrDzgDRX6
 TxVKD/N1hrAsGaHqkJwwTCXRFj78iiO+EuhUTWIlNaV+a22DTk9683gB5rTrcrK1MrVdBXq0tI
 cGp3a3Oo1oSDd6pRzUQKMhILHo9ZkQNgs9kfH6UvJAhtNprxhKE3XVe1quppvJ1/m0B3f0xvhA
 zqhDXjCFvKhzLUL+5BzajbC4DA0w55INwMA3S4OwocNZjqxFV63LtMgwm5ZF6DhAFiUQcjjgIB
 hQM=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="47246835"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 09:24:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 09:24:46 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 20 Aug 2019 09:24:43 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 20 Aug 2019 19:24:08 +0300
Message-ID: <20190820162411.24836-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [PATCH 0/3] ASoC: mchp-i2s-mcc: Several fixes
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

This pathset fixes some issues detected while testing some more the
Microchip I2S multichannel controller. The first two patches fix some
issues that appear mostly when hw_free() and hw_params() callbacks
are called multiple times. The third patch fixes a problem caused
when the controller is in master mode and both capture and playback 
are played at the same time.

All three patches have a "Fixes" tag. Although they are independent,
some conflicts might appear if they are not applied in the order
presented in this patchset. If so, please let me know so I can rebase
them.

Codrin Ciubotariu (3):
  ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controller is running
  ASoC: mchp-i2s-mcc: Fix unprepare of GCLK
  ASoC: mchp-i2s-mcc: Fix simultaneous capture and playback in master
    mode

 sound/soc/atmel/mchp-i2s-mcc.c | 111 +++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 47 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
