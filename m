Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7CA2A9047
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:26:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BBC1661;
	Fri,  6 Nov 2020 08:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BBC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604647614;
	bh=oHRWLDfn5HJFhSvsviNFVqtYZM3O87Mtx5695ROb1pA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X9PuCskTBRAKv7FjdDECssnurD2GxcVGN5eOqPb369vBvjmJ8zp3lLdSd/fYcowV2
	 6hEJV1/zAJZexN7LU6IPvCDkJuTPXupSGwDvKotkYhbEcear/oNX+ssms3oxEuSjh+
	 2jKfoPCCGEZHMqtdPdpCgdHIuiuL6dF71ZGRd70A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7450CF80127;
	Fri,  6 Nov 2020 08:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B166F80247; Fri,  6 Nov 2020 08:25:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83589F80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:25:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83589F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Rz5q/FjE"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A67PAq2098628;
 Fri, 6 Nov 2020 01:25:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604647510;
 bh=sFQRR04ID9SOrQ/EOOsduAavY6+oIJEBfVjyIWtemp4=;
 h=From:To:CC:Subject:Date;
 b=Rz5q/FjELlarGXZDTTOeqIioREtsrIZBdiXJN0mroC3I3/2+lXCi5J9DMPHRutLZv
 grbc/vuyGmK6+BwfaUesYXO0vScHh/Uu4hPZ0dO0WCV0QptK/p/rQXrVK/TcyJ8lQb
 xg021c5UUyY98rAbccLoCGIR+e86zL3hxBNlTGSo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A67PAce087828
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 01:25:10 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 01:25:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 01:25:10 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A67P8St113537;
 Fri, 6 Nov 2020 01:25:09 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 0/4] ASoC: ti: davinci-mcasp: Handle incomplete DT node
 gracefully
Date: Fri, 6 Nov 2020 09:25:47 +0200
Message-ID: <20201106072551.689-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nm@ti.com, tony@atomide.com, alsa-devel@alsa-project.org,
 tomi.valkeinen@ti.com
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

Hi,

The series is inspired by the effort to standardize TI's arm64 dtsi files to keep
all nodes in 'okay' state and let the board dts files disable not needed
peripherals (and not properly configured):
https://lore.kernel.org/lkml/20201104224356.18040-1-nm@ti.com/

In the unlikely (or likely?) event when the dts misses to disable the McASP node
which is not configured we currenly and luckily just manage to not crash as we
had fixup code in place for legacy pdata boots.
This however prints out a message which does not really help to identify the
issue.

This series will reduce some of the noise during boot (first patch) then
adds the needed changes to handle the variations of 'okay':
A - have all required DT properties for audio
B - gpiochip is enabled

A && !B  -> everything is OK for audio, no gpiochip registered
A && B   -> everything is OK for audio, gpiochip is registered
!A && B  -> audio is not OK, gpiochip is registered. dev_dbg() for audio and do
            not register SOC DAI and PCM
!A && !B ->  audio is not OK, no gpiochip. dev_err() and fail the probe

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: ti: davinci-mcasp: Use platform_get_irq_byname_optional
  ASoC: ti: davinci-mcasp: Remove legacy dma_request parsing
  ASoC: ti: davinci-mcasp: Simplify the configuration parameter handling
  ASoC: ti: davinci-mcasp: Handle missing required DT properties

 sound/soc/ti/davinci-mcasp.c | 294 ++++++++++++++---------------------
 1 file changed, 119 insertions(+), 175 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

