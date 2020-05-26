Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0BF1E3A09
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 09:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7E217A0;
	Wed, 27 May 2020 09:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7E217A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590563619;
	bh=QIjhQ4Par3PTlHb3lwqGlXHhYG1dps4BYkXKJ8nNa3Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xcf9FaCjW62yvvLa0zDUGvbYBWmhnhtWRoS0pWubywa8Zk0co6j6oYErJr3AFWRPu
	 1qzuiauN031f2mypkjQK+Dfa3QGd2hTr8HbT1kUBxQNfF5QoCCtni8Yg2Qk47VJlu7
	 aGOoaJTGeiNg2TejYx5hJVcLS6F3vwROw+uvBNYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AAE9F802A0;
	Wed, 27 May 2020 09:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22556F80100; Tue, 26 May 2020 23:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EAD2EF80100
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 23:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD2EF80100
X-IronPort-AV: E=Sophos;i="5.73,437,1583161200"; d="scan'208";a="47867520"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 27 May 2020 06:01:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B82C40DAAC6;
 Wed, 27 May 2020 06:01:50 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] RZ/G1H enable sound support
Date: Tue, 26 May 2020 22:01:42 +0100
Message-Id: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 27 May 2020 09:10:26 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>
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

Hi All,

This patch series adds support for sound in R8A7742 SoC DT.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
  ARM: dts: r8a7742: Add audio support

 .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
 arch/arm/boot/dts/r8a7742.dtsi                     | 284 +++++++++++++++++++++
 2 files changed, 285 insertions(+)

-- 
2.7.4

