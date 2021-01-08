Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7862EF585
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C5AE16E9;
	Fri,  8 Jan 2021 17:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C5AE16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610122082;
	bh=l51vPUpwMxdqBdYmdy8kSHWPFA+ItZ9kG/MPrXfO4KQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dvR7Pp1XX7+ybgc2B0nWhOJOSCnVZkctoyhvfVQcfMcka3tZ9ITEC4yujHpt5o4xY
	 gI5iCl6lFCKayygPV1jZSz9zx2Cp6zWD4ov5FqenVlb0MS3B5z0cu1jTpw2fw5fLi/
	 rCirCTwuIB2tkMGFfr83ZSfMxK4hM8rbvw9YWY+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A21F804E3;
	Fri,  8 Jan 2021 17:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACCBEF804CC; Fri,  8 Jan 2021 17:05:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4081F80167
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4081F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UQHMooUk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 108G23sQ011489; Fri, 8 Jan 2021 10:05:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=tqQw790delcllXWLBK7BIW10l+6uB+lTE/LLtib25BM=;
 b=UQHMooUk3DyqjBnXFwJ2yqrnLuwGrAfDvtQIwDmJQYdI6Bl+rty2FA87al0J+13ky+nw
 mvf3pZ6K4unOCo5TqZF8fjJNG3uZT1kvJGjyBAO4CXebK7FMfb79lEIbGmP4XrvjuCHn
 w0eQtq3/sijHGdBT5aUX2nf6cF/pelkA8McaEBaHOY9ouQU3TzV/17DseOPhY35erQrc
 EfTi5hq7+3XyANG/rUATjjFxNk1NIosGlQuAduvBj6HlKl8WCtlMQy1AVjgMmC5+Y3y6
 3lwfUiZu3bQazLGTi2/IlSUUtuZqVBPjCChEBLzH18Vrzq4ZZD0E93C7pG4V6yRQl4yD eg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35wqjka90s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Jan 2021 10:05:07 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 8 Jan 2021
 16:05:06 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 8 Jan 2021 16:05:06 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.226])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4E80C45;
 Fri,  8 Jan 2021 16:05:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>,
 <f.fainelli@gmail.com>
Subject: [PATCH v4 0/6] Add support for Rpi4b + Cirrus Lochnagar2 and CS47L15
Date: Fri, 8 Jan 2021 16:04:55 +0000
Message-ID: <20210108160501.7638-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080091
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
  dt-bindings: audio-graph-card: Add plls and sysclks properties
  ASoC: audio-graph-card: Support setting component plls and sysclks
  ASoC: madera: Allow codecs to be selected from kernel config
  ASoC: madera: Export clock config defines to dt-bindings
  ARM: dts: Add dts for RPi4b + Cirrus Logic Lochnagar2 + CS47L15

 .../bindings/sound/audio-graph.yaml           |  46 ++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts | 186 ++++++++++++++
 .../boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi   | 201 +++++++++++++++
 drivers/of/base.c                             |  73 ++++--
 include/dt-bindings/sound/madera.h            |  60 +++++
 include/linux/of.h                            |   9 +
 include/sound/simple_card_utils.h             |  25 ++
 sound/soc/codecs/Kconfig                      |  10 +-
 sound/soc/codecs/madera.h                     |  56 +----
 sound/soc/generic/audio-graph-card.c          |  13 +
 sound/soc/generic/simple-card-utils.c         | 238 ++++++++++++++++++
 13 files changed, 836 insertions(+), 83 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi

-- 
2.20.1

