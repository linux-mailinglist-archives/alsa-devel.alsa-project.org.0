Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A9663B8C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D59DBA6;
	Tue, 10 Jan 2023 09:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D59DBA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673340317;
	bh=gc7cekZfz731qp3P6JJS5W+8cfmFSOvAAiCCFUwlIVc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sUktKSLWhYHQW2NZJ31mQN90xCGM909OnLlhbrKbtl2bf8EV7hsBHesEu1caoyPsb
	 S9ES/Qhez3mJYGHd2ua6nXyXWRKPdA2PLesXb90NFR0PGzNRUCmFxiCtJ49VnPXQ1M
	 wqktAD1vsM/W4uNKRk4KYX+RCxlGfacNSR4+1rOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A2D8F8055A;
	Tue, 10 Jan 2023 09:43:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3139CF8053D; Tue, 10 Jan 2023 09:43:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CCB7F804C1;
 Tue, 10 Jan 2023 09:43:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CCB7F804C1
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=rwJLPa6Z
X-UUID: 80fb662e7529401baf0d49296dcb09e3-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WFDK6HF3F9x/8+wn/8Ji4fbDarvgIgMr9kjOz7e90ro=; 
 b=rwJLPa6ZuK4j5a9JlKsomShktI2MV6zozaCJNl0BWcQrmYdSLNR1cSI0/ObkuZSIScwAv8qSLD4MXgn6WwVHASJxCdsJgYCLnItXhC8J446yA7CysIgk9SUoOSQxncD1+q4w123FSFzoZuUWWVVXRAAPlO2iekg/ct+JK8S/jIs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:4130a605-65ec-4917-8ba2-459c9188bedd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.17, REQID:4130a605-65ec-4917-8ba2-459c9188bedd, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:543e81c, CLOUDID:504dd28b-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:230110164317B2AMWIKL,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0
X-CID-BVR: 0
X-UUID: 80fb662e7529401baf0d49296dcb09e3-20230110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1932990089; Tue, 10 Jan 2023 16:43:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 16:43:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 16:43:13 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Chunxu Li
 <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>, YC Hung
 <yc.hung@mediatek.com>, Wan Jiabing <wanjiabing@vivo.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 0/3] Add support of MediaTek mt8188 to SOF
Date: Tue, 10 Jan 2023 16:43:09 +0800
Message-ID: <20230110084312.12953-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support of MediaTek mt8188 SoC DSP to SOF.
The sof driver patches in this series are taken from
thesofproject/linux/tree/topic/sof-dev-rebase.

Tinghan Shen (3):
  dt-bindings: dsp: mediatek: Add mt8188 dsp compatible
  ASoC: SOF: mediatek: Support mt8188 platform
  ASoC: SOF: mediatek: Provide debugfs_add_region_item ops for core

 .../bindings/dsp/mediatek,mt8186-dsp.yaml     |  4 +++-
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 20 +++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h        | 10 +++++++++-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  1 +
 4 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.18.0

