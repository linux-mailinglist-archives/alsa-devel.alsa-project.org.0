Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3ED1CF57E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 15:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9382A1696;
	Tue, 12 May 2020 15:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9382A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589289478;
	bh=hnKGx6OX3+xzP9PtczF0HTGunIXPRuqnZDui33mcdcg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MmX5WZvATmRmjifYs/kNUYAs5CgbPxg8pfws+5gyK1SUpHnsAUA446XWZ3o0Gp9eq
	 EyvX/Sk+Pgyaf9NKXWPgtU/X74HcChWO5KJEC3wTh7eU8kNdINGxF3nYPXGiPmN4KJ
	 agjb0ud6I0dbHbGHLgAVeMCCXErumPZPIwmS0+wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 541A7F8015A;
	Tue, 12 May 2020 15:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406B7F801DB; Tue, 12 May 2020 15:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A456EF800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 15:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A456EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Cmr9KFtr"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04CDG2mu091972;
 Tue, 12 May 2020 08:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589289362;
 bh=h/Hv47WcjhG9VuUQ8uKmgAHJp1wp4aGRTo5I3HJrIVo=;
 h=From:To:CC:Subject:Date;
 b=Cmr9KFtr9gbpcES+o4LjfHOKZ7HE24D3uxHUfMUij8hwYhq5eBcf8TUT1YtzmTdWG
 DDfZ4yEqQKOxYMkahYeuWfoYef0taZUNSjU7SPbi8WSzOx3IetwyJjW5YFYqRfdYJP
 SWb+P1kwoWOL4bNNj0qg8Pp1Z4mmhDo1W3qGRD8k=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CDG2UE065346;
 Tue, 12 May 2020 08:16:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 08:16:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 08:16:01 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CDFxaa079268;
 Tue, 12 May 2020 08:15:59 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH v2 0/3] ASoC: ti: Add support for audio on J721e EVM
Date: Tue, 12 May 2020 16:16:30 +0300
Message-ID: <20200512131633.32668-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Changes since v1:
- Fixed DT binding documentation errors
- Rebased on ASoC head and updated the driver to compile and work

This series adds support for the analog audio setup on the j721e EVM.
The audio setup of the EVM is:
Common Processor Board (CPB): McASP10 <-> pcm3168a
Infotainment Expansion Board (IVI): McASP0 <-> 2x pcm3168a

Both CPB and IVI wired in parallel serializer setup.

The first patch adds the stream_name for McASP driver as it is needed in
multicodec (and would be needed in DPCM) setup for proper DAPM handling.

The second patch adds two DT schema, one for the cpb and one for the cpb+ivi
card.

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: ti: davinci-mcasp: Specify stream_name for playback/capture
  bindings: sound: Add documentation for TI j721e EVM (CPB and IVI)
  ASoC: ti: Add custom machine driver for j721e EVM (CPB and IVI)

 .../bindings/sound/ti,j721e-cpb-audio.yaml    |  93 ++
 .../sound/ti,j721e-cpb-ivi-audio.yaml         | 142 +++
 sound/soc/ti/Kconfig                          |   8 +
 sound/soc/ti/Makefile                         |   2 +
 sound/soc/ti/davinci-mcasp.c                  |   3 +
 sound/soc/ti/j721e-evm.c                      | 867 ++++++++++++++++++
 6 files changed, 1115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
 create mode 100644 sound/soc/ti/j721e-evm.c

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

