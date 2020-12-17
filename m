Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A02DD477
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 16:43:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B99218AC;
	Thu, 17 Dec 2020 16:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B99218AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608219810;
	bh=wTCfBUUPj3HTg9kzDeRxzX11rIollbprOBZeaG59r/I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EyIPIp7mnb29dDAwsqhRBMuow+B+D/kLbK6WesBqZk+LvdnRceYolEZ5iyMKZ0w24
	 gPHfeDChVx6Pri8/WbNda8nwdEQdEAGJxT1m7zv1xDHPDIf08j1XJ/UNGIlabdxzax
	 +ZgFbU5yZIeF6MIrtNivcP4hL3uo7SVoiHq5wYOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98429F804B0;
	Thu, 17 Dec 2020 16:41:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6FABF80259; Thu, 17 Dec 2020 16:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D36F80259
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 16:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D36F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TcIAf6XN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BHFPi96001634; Thu, 17 Dec 2020 09:41:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=GJuPaWXDibxU2/dULc9tTJBurZLFeQMjY985Dgp9j4E=;
 b=TcIAf6XNA7au7X+Rgn7vi+65Lo5Oq+IWBErpF7GoTEqmbVeznU15A9wCM5T0dDPivBTK
 UiOR1U33X5PdHs4dUpIcHI1dvjK/7fxH+7Xs/uBBB92j4L8mDqu2NSbJEuIsVCSHTtpp
 7cOWQusHsOT9g+38e8HyBq3WQ0Q3JB8dEI7Vyc+JhmGHTwSYz5ZEpm5iF67AY7vUvATp
 LUdokZNZUEttX/7R6KvO/OgC0RMigqCoYEY8SSmv14OyjvRxS3MNJoNrk2JUM0145CZg
 ioYqFNev04MROC+OBhXT0k26tWFcWzHohPjhI9QoEwhYB/P/sFDMGXgshl+X5XpFFIvd Dg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35cu5rxy90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Dec 2020 09:41:47 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 17 Dec
 2020 15:41:45 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 17 Dec 2020 15:41:45 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.236])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0995A11CB;
 Thu, 17 Dec 2020 15:41:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>
Subject: [PATCH v3 0/6] Add support for Rpi4b + Cirrus Lochnagar2 and CS47L15
Date: Thu, 17 Dec 2020 15:41:36 +0000
Message-ID: <20201217154142.24301-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170108
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
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

This set of patches provides support for using the Raspberry Pi 4b with
a Cirrus Logic Lochnagar 2 audio development platform plus Cirrus Logic
CS47L15 codec.

Patches are needed to audio-graph-card to enable support for setting the
component sysclks and plls. These are not specific to CS47L15 - several
Cirrus and non-Cirrus codecs also require component clock setup, typically
for larger codecs with multiple internal clocking options and clock domains.

The codec sysclks and plls cannot be placed under the clock framework because
they are typically I2C/SPI/Soundwire-connected peripherals and access to the
registers would cause a nested get of the bus clock. The clock framework does
not support this and it would result in a deadlock.

Richard Fitzgerald (6):
  of: base: Add of_count_phandle_with_fixed_args()
  ASoC: audio-graph-card: Add plls and sysclks DT bindings
  ASoC: audio-graph-card: Support setting component plls and sysclks
  ASoC: madera: Allow codecs to be selected from kernel config
  ASoC: madera: Export clock config defines to dt-bindings
  ARM: dts: Add dts for RPi4b + Cirrus Logic Lochnagar2 + CS47L15

 .../bindings/sound/audio-graph-card.txt       |  72 ++++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 ...bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts | 186 ++++++++++++++
 .../dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi   | 201 +++++++++++++++
 drivers/of/base.c                             |  73 ++++--
 include/dt-bindings/sound/madera.h            |  60 +++++
 include/linux/of.h                            |   9 +
 include/sound/simple_card_utils.h             |  25 ++
 sound/soc/codecs/Kconfig                      |  10 +-
 sound/soc/codecs/madera.h                     |  56 +----
 sound/soc/generic/audio-graph-card.c          |  16 +-
 sound/soc/generic/simple-card-utils.c         | 236 ++++++++++++++++++
 13 files changed, 861 insertions(+), 85 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi

-- 
2.20.1

