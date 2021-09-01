Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AE3FD1F3
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 05:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A656D1752;
	Wed,  1 Sep 2021 05:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A656D1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630468143;
	bh=ByLZo9tWn9H9y9y6ZScc+JZD81UD1GCuZBgZVsls+2Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JW5A7NuH5xvB0MN7ZN/RaigByPFqMOQ6/9A9egGNGyF6X5UscbewS0ONADk7UeGIL
	 3lbFqsHdkTVwbGzFSFsMljkUYJQkYMGUwM50pUDC04kn8elbTv4/ZEUAQzIVIx058I
	 BfjUP3eZGgsu5bF7WVbRqcwsGHRt78cAaSNmt/XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AB4EF80256;
	Wed,  1 Sep 2021 05:47:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE96F80254; Wed,  1 Sep 2021 05:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93312F80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 05:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93312F80171
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id ED800CFD10;
 Wed,  1 Sep 2021 11:47:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P10690T140033205974784S1630468054398410_; 
 Wed, 01 Sep 2021 11:47:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <ed0c6444b4db858f624370675799cce8>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v3 0/7] Patches to update for rockchip pdm
Date: Wed,  1 Sep 2021 11:47:19 +0800
Message-Id: <1630468039-7186-1-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

These patches fixup or update for rockchip pdm.

Changes in v3:
- Fix property 'path-map' suggested by Rob Herring.

Changes in v2:
- Fix yamllint errors.

Sugar Zhang (7):
  ASoC: rockchip: Add support for rv1126 pdm
  ASoC: dt-bindings: rockchip: Add binding for rv1126 pdm
  ASoC: rockchip: pdm: Add support for rk3568 pdm
  ASoC: dt-bindings: rockchip: Add binding for rk3568 pdm
  ASoC: rockchip: pdm: Add support for path map
  ASoC: dt-bindings: rockchip: pdm: Document property
    'rockchip,path-map'
  ASoC: dt-bindings: rockchip: Convert pdm bindings to yaml

 .../devicetree/bindings/sound/rockchip,pdm.txt     |  46 --------
 .../devicetree/bindings/sound/rockchip,pdm.yaml    | 120 +++++++++++++++++++++
 sound/soc/rockchip/rockchip_pdm.c                  | 112 +++++++++++++++++--
 sound/soc/rockchip/rockchip_pdm.h                  |   6 ++
 4 files changed, 232 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.yaml

-- 
2.7.4



