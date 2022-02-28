Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4894C72DA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 18:29:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC637185F;
	Mon, 28 Feb 2022 18:28:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC637185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646069357;
	bh=jBiY7T4ywCh7gj2A7vS3VYgJDsQPibBY1B7FLLsAFfA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lQjme7ounwWwpERY4GyvMy7icmK/+3+Dl8JoNXWs0GXm8+skCODVfnnjd+fw1ajp5
	 44GZWwA1bRx7HJQj6/NcXvBfC1KgxWCgi8lgUhkrnTTLBweDm/4jgpBTE6D1esb50w
	 CYhbZWNe6w2A5ryPuixJi/dqC7znYl0PRvsDDhBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC23F804CA;
	Mon, 28 Feb 2022 18:28:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D2CF80154; Mon, 28 Feb 2022 18:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7340CF80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 18:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7340CF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SChsN/oy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21SFwZIh005113;
 Mon, 28 Feb 2022 11:28:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=t89hC57npduwQLcBV3r9nbt80Vt6eUmyKFdTHvx+Nbo=;
 b=SChsN/oyUxJogKRIB1fDInhsKLxrY0Dyov6N+Zy8p6cDB9QP115Sbz+nNuWh806VPNEK
 Pd8b6CjOm9ZV1Co1AF7c4GceLRgONHxWkrPYXPHW8K8/BR26VFHDKe6TrHX0PUxjuooo
 ZFQgnmIDDHLNIC7Cf7+6ssHoKi3SS1GCILKm6gxigpPztGqYvisY4ITAdBF+XKifyXMg
 VBd9fNvw0WLQDJ/79m0E1AdcNiNvd6Mb3l0HrKI3VaaKxN5KUMOdtR6ujIwTSMjr6aW6
 r659PP/0h9X/LF+Vavmg37fKssdsoQ56CGhKNd5miUzvsw5AKFUPCxxVAMPSVi1CrhBp Xg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3efjg5thq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Feb 2022 11:27:59 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 28 Feb
 2022 17:27:57 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 28 Feb 2022 17:27:57 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.213])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 099CBB06;
 Mon, 28 Feb 2022 17:27:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH V3 0/2] ASoC: audio_graph_card2: Support variable slot widths
Date: Mon, 28 Feb 2022 17:27:52 +0000
Message-ID: <20220228172754.453783-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TRZtSh8x4QpWQs5UXd9lvOBw-rZejTc2
X-Proofpoint-ORIG-GUID: TRZtSh8x4QpWQs5UXd9lvOBw-rZejTc2
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

Changes since V2:
- Change property type to uint32-matrix.
- Put min/max ranges on cells.
- Use per-item description to document the tuple entries.
- Add a slot count to the tuple - it's unlikely that this would change
  for different sample rates but it's trivial to implement support for it.
- Minor tidying of the code in asoc_simple_parse_tdm_width_map() and
  asoc_simple_set_tdm().

Richard Fitzgerald (2):
  ASoC: dt-bindings: audio-graph-port: Add dai-tdm-slot-width-map
  ASoC: audio_graph_card2: Add support for variable slot widths

 .../bindings/sound/audio-graph-port.yaml      | 20 ++++
 include/sound/simple_card_utils.h             | 11 +++
 sound/soc/generic/audio-graph-card2.c         |  4 +
 sound/soc/generic/simple-card-utils.c         | 97 +++++++++++++++++++
 4 files changed, 132 insertions(+)

-- 
2.30.2

