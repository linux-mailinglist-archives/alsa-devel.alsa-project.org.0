Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8F3CB9A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 14:31:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B10216FE;
	Tue, 11 Jun 2019 14:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B10216FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560256309;
	bh=lNOo0Ece8TctXRiSvLPGQtnyZ1iVQ/+8eq5ISuZvNPk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bY7i3V+tHnzJ/qYHYzNYrsPHsjsXsQbsmYvHVmqjWZiGizguMk79Xkiu3D3EIa9BG
	 5CMKj30w1W57uon09bCerasY/DRwnktUIRt8v75V6IhLdAEssDJwTM6I/ZTfVuGVqL
	 VFo5rkM83OpvF8OAvnqwzrPxtsFtbOvhB+3o3EiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A33F8972F;
	Tue, 11 Jun 2019 14:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4028EF89712; Tue, 11 Jun 2019 14:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65730F8961D
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 14:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65730F8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mxUBh4pQ"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BCTCTs128301;
 Tue, 11 Jun 2019 07:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560256152;
 bh=3M2n/FZG3A+3YVnUYTVB7tAFganaUi8JUEkw3leCMek=;
 h=From:To:CC:Subject:Date;
 b=mxUBh4pQ7ZN1CbxeZ/bMcne5Z5j2N2vnK9f91x6+xoq6K97ddFlrXPePMWBoLXhuX
 17S2XRZGITPOdAsArm1FXhvIYc9kn91Bad1Q6hOIkKdsGdZdbqqx0V+m3aOXqH5R0V
 R/jQsvRLvMbglDnoBrIZwHDSQgiLNZOlIQ4PQMpo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BCTCci054605
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Jun 2019 07:29:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 11
 Jun 2019 07:29:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 11 Jun 2019 07:29:12 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BCT9s6010308;
 Tue, 11 Jun 2019 07:29:10 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 11 Jun 2019 15:29:39 +0300
Message-ID: <20190611122941.10708-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, robh+dt@kernel.org,
 misael.lopez@ti.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: ti: davinci-mcasp: Master AUXCLK FS
	ration support
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

The AUXCLK of McASP which is used as the master clock for I2S signal generation
usually is a static clock.
The driver (and bindings) assumes this setup, however if the AUXCLK can change
with the stream's FS then this assumption breaks the audio support as it sets
constraint rules in startup, these rules run pre hw_params and in hw_params we
are going to be notified of the new reference clock (which is some multiple of
the FS).

Regards,
Peter
---
Peter Ujfalusi (2):
  bindings: sound: davinci-mcasp: Add support for optional
    auxclk-fs-ratio
  ASoC: ti: davinci-mcasp: Support for auxclk-fs-ratio

 .../bindings/sound/davinci-mcasp-audio.txt    |  3 ++
 sound/soc/ti/davinci-mcasp.c                  | 52 ++++++++++++++++---
 2 files changed, 47 insertions(+), 8 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
