Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824C75F33
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 08:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AADCA1FE8;
	Fri, 26 Jul 2019 08:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AADCA1FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564123528;
	bh=aeel7VBlkVPN7xqz4suUZzqBu6KuaOwsJpmWBwVwEvE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sqLQrv2GY6iaeRWtgvgWhWyZzHZTHDYdrZhK7e+luYLXCq3Oq98JumuU33oIWZ0oM
	 RDyzz5aow70zCymFyicd/3uCVmQLQvueKAxR1iLdzpeG/GJMIiQV9DAkEtIg8lroJc
	 wGahU7YBqD0lsfGIKifa2IbbKNhb0nhWCWr4awnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44AB7F80481;
	Fri, 26 Jul 2019 08:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 946F3F803D5; Fri, 26 Jul 2019 08:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC19F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 08:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC19F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VI1gGzrE"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6Q6glA3094675;
 Fri, 26 Jul 2019 01:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564123367;
 bh=Kbx0FuO4EzLjDPro7sa4K2Bk81JrkfRl5Tmzx7VPajg=;
 h=From:To:CC:Subject:Date;
 b=VI1gGzrEd7ZcBtDXs80nZc0NuAeVrDSl/DE/3+p85LpAH4tdwrrGp4FyV7Vzwd91Q
 AMweKHYAXSqHA79Z0wIWbN31LJ4daRAw6EVay5UOPVK0j5GRmBTu6ZTpba145DiJqX
 kxkptYOWte++b9sCVzSNUT6bCHuuLXJwlDTlGXFY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6Q6glLn017125
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Jul 2019 01:42:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 01:42:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 26 Jul 2019 01:42:45 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6Q6gh46099394;
 Fri, 26 Jul 2019 01:42:44 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 26 Jul 2019 09:42:42 +0300
Message-ID: <20190726064244.3762-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, tiwai@suse.com,
 jsarha@ti.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: ti: davinci-mcasp: sample format
	constraint fixes
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

The two patch fixes two issues on how the driver have placed constraints on the
format size.
1. When the first stream starts and the TDM slot_width is configured we can
   allow formats which require less or equal number of bits on the bus.
2. For the second stream we must allow only formats which uses exact number of
   bits on the bus.

These issues are visible around the S24_3LE, S24_LE and S32_LE formats.
  
Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: ti: davinci-mcasp: Correct slot_width posed constraint
  ASoC: ti: davinci-mcasp: Support for correct symmetric sample bits

 sound/soc/ti/davinci-mcasp.c | 91 +++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 12 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
