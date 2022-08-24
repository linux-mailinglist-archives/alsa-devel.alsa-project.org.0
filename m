Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D659F9E5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 14:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117181651;
	Wed, 24 Aug 2022 14:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117181651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661343880;
	bh=0NTFo4fmXUIBdglzia7bIJNZQG//bquiHmOJlmDaBfA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SxwbgR86bNz5xTSOdKKfZz3O10arCBLaH1xlejlWCSH2QAV+QXV7g42SGvI0eMb2D
	 WlaI/d2B0p3D+otp5ALUfMPChe7DEoT7n/56tGHGW2jDW5Da9/+DiZHLqIBAG7oich
	 E+KUSZotBHfXT7uFveyqXz7G/UEg0t+5mj4Zbwzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E235F80508;
	Wed, 24 Aug 2022 14:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DC07F804C1; Wed, 24 Aug 2022 14:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B3F9F800A7
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 14:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B3F9F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="RSgUydQd"
X-UUID: dbd334d7b88046098fb36c74564f1b1b-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1mC1qjq1nLPOWjHV5r+l86DrF7X2T1C9oykomno0dVI=; 
 b=RSgUydQddO9IgFFJNqQd3inehTU2QsIEIN67YfK5ql6JDZI++CtcME6A2L/7QULaewfxTQxvTvicraYufsxITQZgrIMK1u0f8sMX8R7hOpZgcyqS31lHqIBcnRKQaUL6phv9X+3qNz3yj24GQCn60rRPW2EnzeQoY+kZWWsEeeY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:d713f730-60f5-46bc-be0b-33d888f3646f, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:486aaac9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: dbd334d7b88046098fb36c74564f1b1b-20220824
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 337556359; Wed, 24 Aug 2022 20:23:22 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 20:23:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Wed, 24 Aug 2022 20:23:20 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <nfraprado@collabora.com>, <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: mediatek: dt-bindings: modify machine
Date: Wed, 24 Aug 2022 20:23:17 +0800
Message-ID: <20220824122319.23918-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu.li" <chunxu.li@mediatek.com>, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

From: "chunxu.li" <chunxu.li@mediatek.com>

Changes since V1:
  - remove unnecessary quotes

Add SOF related field.
1. Add a property "mediatek,adsp", Only when adsp phandle could be retrieved,
 from DTS, the SOF related part of machine driver is executed.
2. Add a property "mediatek,dai-link" to support dai-links could be specified
 from DTS

chunxu.li (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF

 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml  | 10 ++++++++++
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.25.1

