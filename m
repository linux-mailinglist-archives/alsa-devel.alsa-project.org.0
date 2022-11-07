Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E390E61F847
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:05:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7799210E;
	Mon,  7 Nov 2022 17:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7799210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667837147;
	bh=Oi0RHcTQN65JIvkiYPMhcF3SS42wYwO3Fdb2TrzpUD4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p0n97LKd53VCCvRH+5RkJYrhSH2AeBjOXSKn3ra3U9n4SlUlw3MQHJkD8IEHBNlB7
	 1v/bFp/gTW0wLiVDslTbDAaYqGrgtSrTmSwarwdbndnLMRQX0dQLipR2rR0NgqhyGW
	 eJb020HkStrDgkW6hsFoQGwcDmGtbfEO9fHsmqCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFDB1F8024C;
	Mon,  7 Nov 2022 17:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DA80F8025A; Mon,  7 Nov 2022 17:04:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C1AEF80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C1AEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="NTlGef0m"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4336466023A6;
 Mon,  7 Nov 2022 16:04:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667837086;
 bh=Oi0RHcTQN65JIvkiYPMhcF3SS42wYwO3Fdb2TrzpUD4=;
 h=From:To:Cc:Subject:Date:From;
 b=NTlGef0mw3ZejCKzC3iMLReUv53Q7SF3Y8bR0vKyLf6l78aB2ozL6gcg2jcXx+xF7
 bu7ERg7xqnCGL58kW8yRU27x01mEnV/abUs5ikXzw8u+f8F3JrsRu70g2cXJIkkQ7v
 sS71xRZrLSKin3gIsWEU5Amk8dgMA36qzp9PuuTMhDqGb+EwHBz95ZV8vpJdXc58MN
 gulSazNAdzLPMn4vSPmjV1N0L4WM0Flip8UGGh0w/K1WElgMIkPqmGYC2RNi5Rcte1
 vrPBqhAZMkCVnPw0GwoGYb5zHAnWo9XGfdcnmFssWktOghvII9o7vnD/8DXDLhBqfv
 LPag6tKbpaDyw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/9] ASoC: mediatek: Register machine drivers to module device
 table
Date: Mon,  7 Nov 2022 11:04:28 -0500
Message-Id: <20221107160437.740353-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


Some ASoC machine drivers for MediaTek platforms were not being
registered to the module device table, preventing them to be
automatically loaded when built as modules. This series adds the missing
registration to the drivers.


Nícolas F. R. A. Prado (9):
  ASoC: mediatek: mt2701-cs42448: Register to module device table
  ASoC: mediatek: mt2701-wm8960: Register to module device table
  ASoC: mediatek: mt6797-mt6351: Register to module device table
  ASoC: mediatek: mt8183-da7219: Register to module device table
  ASoC: mediatek: mt8183-mt6358: Register to module device table
  ASoC: mediatek: mt8186-da7219: Register to module device table
  ASoC: mediatek: mt8186-rt5682: Register to module device table
  ASoC: mediatek: mt8192-mt6359: Register to module device table
  ASoC: mediatek: mt8195-mt6359: Register to module device table

 sound/soc/mediatek/mt2701/mt2701-cs42448.c                 | 1 +
 sound/soc/mediatek/mt2701/mt2701-wm8960.c                  | 1 +
 sound/soc/mediatek/mt6797/mt6797-mt6351.c                  | 1 +
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 1 +
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 1 +
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c  | 1 +
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c   | 1 +
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 1 +
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 1 +
 9 files changed, 9 insertions(+)

-- 
2.38.1

