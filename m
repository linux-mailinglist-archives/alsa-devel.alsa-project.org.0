Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D064F8D52
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 08:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DBE18B0;
	Fri,  8 Apr 2022 08:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DBE18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649398030;
	bh=nkelpOaU9b/omq5xkJP0/LnT8GcVVqmYf5idPWoggf0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AO5MscE63xJLcUiHcUQtM891Gl1x8/x8DIJcoHjv1RV7mUjR1hJoUrrM8NEJXEjzK
	 y0DAx80NfkcMGyDkYUsSlWikG3UT2JGb7wYZMZtkXT9Pd8aPrIBB2Kg6YAg1YrpM32
	 vzh9Tz6gpTFscnbMjlcW3dAnPIMsok5Gpa2kXOr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC8E8F8050F;
	Fri,  8 Apr 2022 08:06:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E43CBF80311; Fri,  8 Apr 2022 08:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E2CF8012A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 08:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E2CF8012A
X-UUID: 0bf2b9a3ab0944e3b5f4daafc4e73dd5-20220408
X-UUID: 0bf2b9a3ab0944e3b5f4daafc4e73dd5-20220408
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 143315572; Fri, 08 Apr 2022 14:05:56 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Apr 2022 14:05:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 14:05:53 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nfraprado@collabora.com>,
 <tzungbi@google.com>
Subject: [v10 0/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Fri, 8 Apr 2022 14:05:48 +0800
Message-ID: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

The series reuses mt8192-mt6359-rt1015-rt5682.c for supporting machine
driver with rt1015p speaker amplifier and rt5682s headset codec.

Changes from v9:
  - Modify the commit messages to make them more clear.

Changes from v8:
  - fix typos.

Changes from v7:
  - "mediatek,hdmi-codec" is an optional property, the code and the
    binding document should match.

Changes from v6:
  - "speaker-codec" changes to "speaker-codecs" due to there may be two
    speaker codec.

Changes from v5:
  - "mediatek,headset-codec" and "mediatek,speaker-codec" drop prefix
    and move to properties from patternProperties.

Changes form v4:
  - split a large patch into three small patches for easy reviewing
  - correct coding style

Changes from v3:
  - fix build error: too many arguments for format
    [-Werror-format-extra-args]

Changes from v2:
  - fix build warnings such as "data argument not used by format string"

Changes from v1:
  - uses the snd_soc_of_get_dai_link_codecs to complete the
  configuration of dai_link's codecs
  - uses definitions to simplifies card name and compatible name

Jiaxin Yu (4):
  ASoC: dt-bindings: mt8192-mt6359: add new compatible and new
    properties
  ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
  ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of headset
  ASoC: mediatek: mt8192: support rt1015p_rt5682s

 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |  32 +++
 sound/soc/mediatek/Kconfig                    |   1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 199 +++++++++++-------
 3 files changed, 153 insertions(+), 79 deletions(-)

-- 
2.25.1

