Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2D4BA1E5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 14:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 923E61ADC;
	Thu, 17 Feb 2022 14:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 923E61ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645105837;
	bh=PYYGPUryO+dpfTAKHqMDyne1xKvqK1todpxuB3FcT88=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=izi+Y8aSPIpajb842Utw6XDBaoxBLRRex4xklv5LZfm9BsBIA/SBG0xdlvUSsGebW
	 /PqCDv0raygSrNVI/n3B5UwJDsp4WNlEZhKlS2tf2IWfe/rwQr5brcH+taMwmXN+SO
	 spit1QDZILF2Fl9ossJePtS+A+VgrGzlBzwu85l4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20B45F80519;
	Thu, 17 Feb 2022 14:48:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D38BF804D6; Thu, 17 Feb 2022 14:48:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 518CCF800CE
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 518CCF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XRLRW4jO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21HCNFGO030051;
 Thu, 17 Feb 2022 07:48:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=RXMw4ELiiPGxb1BhM1EtrpskMk8OtBkyJrUegKF5rBQ=;
 b=XRLRW4jOC2j3jgVA8macDkPJcqW9rzrqrL3Um9hPcrcXyy74QMxLqgTBuIIbcWmsw179
 SFQw+I0dF1t9IKkHpq44aDyIYB3k7nkTF40TpDcFjdTudqVz4Y8BKE3+znwjgA/qbPlu
 ktsoII82Nv+LWfJ8ejVgdGIr3dbqI0wJtd72UBt/Pwo7698T1RVKxIW71t7ex9axAEqr
 WTOuztt3CY16bnuW3zNZhzngzzT0Hd3tfavfmHBKll/PjXZ+UULzYBZ6VTIWyLaVk0CF
 SXseO1t968TVfIiCJtIj77Ld8Gn1tWG9KVqkZ+ItXNhQ5BmsjuVbuQgjF9tCKOtCwGzS tA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e8nyda81v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Feb 2022 07:48:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 13:48:39 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Feb 2022 13:48:39 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.199])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1641146B;
 Thu, 17 Feb 2022 13:48:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH V2 0/2] ASoC: audio_graph_card2: Support variable slot widths
Date: Thu, 17 Feb 2022 13:48:33 +0000
Message-ID: <20220217134835.282389-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E2bZm9GJmWyN-WL5TubSTxMn7nc8Cscq
X-Proofpoint-ORIG-GUID: E2bZm9GJmWyN-WL5TubSTxMn7nc8Cscq
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

This adds support for I2S/TDM links where the slot width varies
depending on the sample width, in a way that cannot be guessed by
component hw_params().

A typical example is:

- 16-bit samples use 16-bit slots
- 24-bit samples use 32-bit slots

There is no way for a component hw_params() to deduce from the information
it is passed that 24-bit samples will be in 32-bit slots.

Some audio hardware cannot support a fixed slot width or a slot width
equal to the sample width in all cases. This is usually due either to
limitations of the audio serial port or system clocking restrictions.

These two patches add support for defining a mapping between sample widths
and sample slots. This allows audio_graph_card2 to be used in these
situations instead of having to write a custom machine driver.

Richard Fitzgerald (2):
  ASoC: dt-bindings: audio-graph-port: Add dai-tdm-slot-width-map
  ASoC: audio_graph_card2: Add support for variable slot widths

 .../bindings/sound/audio-graph-port.yaml      |  7 ++
 include/sound/simple_card_utils.h             | 10 ++
 sound/soc/generic/audio-graph-card2.c         |  4 +
 sound/soc/generic/simple-card-utils.c         | 93 +++++++++++++++++++
 4 files changed, 114 insertions(+)

-- 
2.30.2

