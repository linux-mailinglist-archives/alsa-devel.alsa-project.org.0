Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6F60BCEF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 00:01:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D2644CE;
	Tue, 25 Oct 2022 00:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D2644CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666648882;
	bh=NtMGJEqZV/bhhhU6Mak10T8YkbJeZuq93Ltw2LeDx/0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XjCW3iZc+Y60+1uBgbXHzAfH+m2uPJWOpmrbq+vKVQVTi5yQLTddAzimZIKppC+og
	 euek9eFcj9BeDxJQZI2mzRXZgPs4YXus8WC08+mjDJYcmwvJNHPNzfPwHM25t7+2GK
	 1yQOPN74KZCLjB7ykAt7QX5RD0CnY6KFcFdNNRKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76D8F80542;
	Tue, 25 Oct 2022 00:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DAECF8053D; Tue, 25 Oct 2022 00:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B850F80431
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 00:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B850F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="iysEC5LQ"
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 91BE2660239F;
 Mon, 24 Oct 2022 23:00:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666648822;
 bh=NtMGJEqZV/bhhhU6Mak10T8YkbJeZuq93Ltw2LeDx/0=;
 h=From:To:Cc:Subject:Date:From;
 b=iysEC5LQF8tCDhWXCo+bBRGap4iZPdrPXgR5kbGSjQcHMcU2DeBzM7ose8sOIEJZ5
 ozgEif9d3HN1bC7hwh+Vd797EollcuX2qxUp06A9/aOFQqrbUSdBBoJsJ3oJFXw2xs
 Rgm+wkfdbDhkvB1cgOC/76RsAhVLiOGZ0OTUCUo1bzMpTApgPdjql0jN9/055D0Df3
 T6vRdgGteqBwF5E0CRlqNJFIsziHSjo6uBf4Ak+wKPNktpdCzK6CJtCo1jnnaFn6RC
 9KK6z6RBP1o+dR5sqdMWyFee64OU8fV51bqdBceghtYxjisY8ccImdB2dVAMeXA+mG
 tdaHMk1O5naoA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/4] Add missing dt-binding properties to rt5682(s)
Date: Mon, 24 Oct 2022 18:00:11 -0400
Message-Id: <20221024220015.1759428-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
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


This series adds the missing sound-dai-cells to rt5682s and supplies for
both rt5682s and rt5682.

These properties are already used by sc7180-trogdor.dtsi (and derived
DTs like sc7180-trogdor-kingoftown.dtsi), so the commits in this series
are really just documenting their usage.

v1: https://lore.kernel.org/all/20221021190908.1502026-1-nfraprado@collabora.com/

Changes in v2:
- Changed sound-dai-cells to 1 on rt5682s
- Added commit fixing sound-dai-cells on rt5682
- Added mention to commit messages that properties are already being
  used by DTs

Nícolas F. R. A. Prado (4):
  ASoC: dt-bindings: realtek,rt5682s: Add #sound-dai-cells
  ASoC: dt-bindings: realtek,rt5682s: Add AVDD and MICVDD supplies
  ASoC: dt-bindings: rt5682: Set sound-dai-cells to 1
  ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT supplies

 .../devicetree/bindings/sound/realtek,rt5682s.yaml        | 7 +++++++
 Documentation/devicetree/bindings/sound/rt5682.txt        | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.38.1

