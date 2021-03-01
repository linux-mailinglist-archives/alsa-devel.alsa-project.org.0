Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5C32866F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE771672;
	Mon,  1 Mar 2021 18:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE771672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618674;
	bh=knhW153OooCkMJTOHIu7Y0vxJPYJ6BQCSg+JmTykUSQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lq8KqoYXdg8KvYaVsC/A31AwjMMcKyhs10KWMQrPbqQX7x6Y8rPYx7hZru8UXHhTX
	 LWHek7LH6v1ezeQEDD8wpGPaF9Q5NXZumQDT3vKeieHzVrSRaSW5vEg8PQk1Hex3xm
	 nDCnc1TYiAky4yApJQEhbn1OrMSnxETBKcvFmxmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FADCF80257;
	Mon,  1 Mar 2021 18:09:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 042C8F8026A; Mon,  1 Mar 2021 18:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45544F800E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45544F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="H29G4JAW"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614618579; x=1646154579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=knhW153OooCkMJTOHIu7Y0vxJPYJ6BQCSg+JmTykUSQ=;
 b=H29G4JAWm02Z1ez0TbgfKRgcOhOwFvm0CARzx74kNYnXgnS7f246IQ2W
 r+6405jX1Zgl5yDzUrGstdhD4kXHgJFxQQ0X5/wTAnBnzJfeljGn7yTKn
 q6S57ri1I4En6cw5FewTG8et+kBfOoePc6tq5Dy0AEeqLSOmMugnvAnMx
 WPjsX73Ve8ITG0+ReAItUp9+wPCJb/mvuu0d12HjKlYA5pE3Zsw3Vx82O
 UBQiUmol4k2xWv8IsdwdG3f71b1y/7JcwY6ViAfnBs13z/i2yUFuOG1pa
 TcvJAFGR3UU9WwFSVTVhkettzw1EiZLHIatkQ7ts8cZQP5PkJoKrVPMcQ Q==;
IronPort-SDR: 6jTzpMK+R9Uhc4uKLcNMv2ll++emto2GNdFi6/xdgoQwaGQ9qTBnOYzp2RBJdre4cVfB+4mg1F
 56BICthPf03UVqGb9q9rvO2eNx4q+jyfvs3Tc8kXd8tjBFARUfWGT6YcrPVKS5jkgpSRzPvw5k
 u7rAW3nh+LYWiQ0adwu5uz8myUzf877wB6Md72mNTspUgxEi19ij1rC0eTcCbDp0EkHC6ta2gM
 Pp6Ui/kkRxN6yPsWS3OQvqhzbbu2Lzkj0AFfEhwb97FeUtjIi5BrdoZQvE/iKkgxchKy/5kFjd
 tXo=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="117058762"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 10:09:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 10:09:34 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 1 Mar 2021 10:09:31 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/7] Add I2S-MCC support for Microchip's SAMA7G5
Date: Mon, 1 Mar 2021 19:08:58 +0200
Message-ID: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

SAMA7G5 includes an updated version of I2S-MCC, found previously on
SAM9X60. This controller includes 8 data pins, 4 for playback and 4 for
capture. For I2S and LEFT_J formats, these pins can be used to
send/receive up to 8 audio channels. For DSP_A, with TDM, any pins pair
(DIN/DOUT) from these 4 can be selected to send/receive data. This
version also includes 2 FIFOs (send and receive).
This patch set starts by moving the driver's bindings to yaml and
continues with adding a new compatible for the SAMA7G5 variant, followed
by the changes needed for I2S/LEFT_J support, TDM pin pair selection and
FIFO support, exclusively for SAMA7G5.

Changes in v2:
- moved DT binding conversion patch from the beginning to the end of the
  patch serieses
- patches that update the DT binding are modified to change .txt file
  instead of .yaml

Codrin Ciubotariu (7):
  dt-bindings: mchp,i2s-mcc: Add SAMA7G5 to binding
  ASoC: mchp-i2s-mcc: Add compatible for SAMA7G5
  ASoC: mchp-i2s-mcc: Add multi-channel support for I2S and LEFT_J
    formats
  dt-bindings: mchp,i2s-mcc: Add property to specify pin pair for TDM
  ASoC: mchp-i2s-mcc: Add support to select TDM pins
  ASoC: mchp-i2s-mcc: Add FIFOs support
  ASoC: convert Microchip I2SMCC binding to yaml

 .../bindings/sound/mchp,i2s-mcc.yaml          | 108 ++++++++++++
 .../bindings/sound/mchp-i2s-mcc.txt           |  43 -----
 sound/soc/atmel/Kconfig                       |   3 +
 sound/soc/atmel/mchp-i2s-mcc.c                | 161 +++++++++++++++---
 4 files changed, 252 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mchp-i2s-mcc.txt

-- 
2.27.0

