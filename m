Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6E400077
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 15:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403CF1878;
	Fri,  3 Sep 2021 15:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403CF1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630675485;
	bh=8dHtJwHXh57s/F2nBZxq0kJzyK8Q2AntNxx0GQbX0RI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SBCB/N43SNhzKx6+y79Rte3xF4d98rg4HEVuAH+OKP9iFjhSB5Y4D59jt9YHzGpqs
	 i8dxADLbCsUh57oaOM+e4KsjnVC8m0ozJLI5nY4DyF7iXaKrl7wWkB3KjXnK88KEdw
	 qHZmgt18ssz+roRxzZrefSil3ZfWd1nZuWgxoK0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58ACF8020D;
	Fri,  3 Sep 2021 15:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E1DF80254; Fri,  3 Sep 2021 15:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA85AF800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 15:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA85AF800B5
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id 426A7CFB46;
 Fri,  3 Sep 2021 21:23:00 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P10690T140033392494336S1630675380363840_; 
 Fri, 03 Sep 2021 21:23:01 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6b58d55599e902373e8be39cca1af432>
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
Subject: [PATCH v4 0/7] Patches to update for rockchip pdm
Date: Fri,  3 Sep 2021 21:22:37 +0800
Message-Id: <1630675357-3286-1-git-send-email-sugar.zhang@rock-chips.com>
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

Changes in v4:
- Acked by Rob Herring

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



