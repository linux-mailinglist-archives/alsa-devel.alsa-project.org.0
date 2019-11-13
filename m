Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86CFB0C3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 13:48:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C771668;
	Wed, 13 Nov 2019 13:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C771668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573649296;
	bh=wtKJ696gSAHQsNqK0+3iicZaknJPD6DNx593hg5Ddwk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sLv6WTwai81Gc+9sU5OXNyi1XAL09EnigFtiMCQzUIEk8/B3RMP03NwJWQk3QXxmy
	 GR35nHIiJ8ihjNlnE3JoZbLonqpYpcZJvCsTIbXSp4oZ+wS7ckRlHDE07sWgVlEu6z
	 gzUTFS97cFKBh65WvemFebg2mQNoQEnHtHxeY77c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24CACF8007F;
	Wed, 13 Nov 2019 13:46:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42DDCF80081; Wed, 13 Nov 2019 13:46:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57F15F8007E
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 13:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F15F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pXlv7oIm"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADCkLiL119767;
 Wed, 13 Nov 2019 06:46:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573649181;
 bh=pRF7p8v054t/HDVdz8KBBBRwhrT3OT3e+Ov7Dq3EyOQ=;
 h=From:To:CC:Subject:Date;
 b=pXlv7oImuE/C6oRnXLibrgZFjh1nXHEIkiEAQ6Pa48LXx2dMfrclCs1fsA3rd7wfH
 lmM/k+fk0ZjymJCgHEStLTL/CS8+pfeuO8GaU4OvCZoWCbeVVFRlWwirJmt0cJj+RK
 STVY1nwmY/c6JHRsmpSiP2YVmVs9UFoa3AEbwF0c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADCkLed115017
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Nov 2019 06:46:21 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 06:46:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 06:46:03 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADCkIGE127078;
 Wed, 13 Nov 2019 06:46:19 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 13 Nov 2019 14:47:32 +0200
Message-ID: <20191113124734.27984-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: [alsa-devel] [PATCH 0/2] ASoC: pcm3168a: Poor man's RST gpio
	handling
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

Hi,

when the codec RST input is connected to a GPIO it needs to be pulled high in
order to take the pcm3168a out from reset and to make it respond to register
accesses via i2c.

I have a board where one GPIO line is connected to two pcm3168a codec so runtime
handling of the RST gpio is not possible (one codec would place the other codec
to reset as well).

The only possible solution is to request the gpio with
GPIOD_FLAGS_BIT_NONEXCLUSIVE flag, ask it to be high initially and never touch
it again.

If the optinal GPIO is not described then issue the reset as the driver did.

Regards,
Peter
---
Peter Ujfalusi (2):
  bindings: sound: pcm3168a: Document optional RST gpio
  ASoC: pcm3168a: Add support for optional RST gpio handling

 .../devicetree/bindings/sound/ti,pcm3168a.txt |  7 ++++
 sound/soc/codecs/pcm3168a.c                   | 38 +++++++++++++++++--
 2 files changed, 41 insertions(+), 4 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
