Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C94CAD2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 11:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28D461682;
	Thu, 20 Jun 2019 11:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28D461682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561022872;
	bh=IMW8GD/ahEvZwQZu/Zt+cL0udYOpkJG1+JsI1TrAtIA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PlqK6Yp9y8+DoK22Nf/EScbdYecudTJKJAgguWnvAiU9s12x2Qn9Rw0SVs/yYxZFX
	 qibh3n0/+Oj0F/KiOvhZIO25CV2XuSCeHgIXoTdeA8ZXoYfq+t02u2RAFVOs3vvb3o
	 Ppsqk6pjxwrZr5aU10Kiwt6ugDkVCLBdBta7f0SA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC3FDF89722;
	Thu, 20 Jun 2019 11:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F865F8971C; Thu, 20 Jun 2019 11:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7F64F896F4
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 11:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F64F896F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R3esNOzR"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K9QLHM089761;
 Thu, 20 Jun 2019 04:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561022781;
 bh=Hp1T9GhCfT67rXi5wDhvT74rxdmGGG1tkccuIGfEABo=;
 h=From:To:CC:Subject:Date;
 b=R3esNOzRmKP6D1QsXLuQHLVc4zs8QbXmHjK+e/U/ao8IFAf5LmMPCEvGydJtS9RDA
 C7Q4H6DjlQee7kU1Yt8duCQOJR5lwZ+Sa6Tj9At/cXR1XBtUbQjBfhzO7E9TEm/49v
 +puXL51MqpakDEukc0pFyYX92CsqY9aPvc6PhJhw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K9QLEX052860
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2019 04:26:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 04:26:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 04:26:21 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K9QJ0q061353;
 Thu, 20 Jun 2019 04:26:20 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 20 Jun 2019 12:26:54 +0300
Message-ID: <20190620092656.14759-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: pcm3168a: Enable multiple digital
	port usage
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

On my board the pcm3168a's DIN1/2/3/4 and DOUT1/2/3 is connected to separate
McASP serializers.
I can run the audio in DIN1/DOUT1 mode (DSP_A, and switching between TDM and
normal mode), but I need to run the codec in multi DIN/DOUT mode which was not
possible as the driver is hardwired to DIN1/DOUT1 mode.

Use the set_tdm_slots we get information on the number of slots per FS so we can
use this to decide if we need to use multiple digital ports in parallel or to
use single ones in TDM mode.

The default mode remains DIN1/DOUT1.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: pcm3168a: Rename min_frame_size to slot_width
  ASoC: pcm3168a: Add support for multi DIN/DOUT with TDM slots
    parameter

 sound/soc/codecs/pcm3168a.c | 41 ++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
