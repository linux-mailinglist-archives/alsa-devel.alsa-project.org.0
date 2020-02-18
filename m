Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E716351F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 22:34:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE18A1697;
	Tue, 18 Feb 2020 22:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE18A1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582061645;
	bh=cMzdajJ5h7WY8PhgD0xY+Vj9Db7UHtOZRvJeKJ5Q0uI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D+BxTGBCR9QqPelgh48fARyhlhBE6Oz+IKTgSLpEMsvSbndRZ8eeeaRfNhfFfZqCd
	 vV4+VgoA/iHVQpM0XAQHoKSX08gr5oNhD+fB5G7HYWj/dXvm2svqXrtqck7Pq7GbbH
	 6dmHWdSPcY/qrNR0RyeLxq5PmQcnKTDlgzt5nd+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E5CF8015C;
	Tue, 18 Feb 2020 22:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A655F8014C; Tue, 18 Feb 2020 22:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DC5C9F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 22:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC5C9F800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD841FB;
 Tue, 18 Feb 2020 13:32:15 -0800 (PST)
Received: from DESKTOP-VLO843J.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA3723F68F;
 Tue, 18 Feb 2020 13:32:13 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v2 0/3] Clean up RK3328 audio codec GPIO control
Date: Tue, 18 Feb 2020 21:31:57 +0000
Message-Id: <cover.1581376744.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pgwipeout@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
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

Hi all,

Since nobody said anything resembling "that looks like a terrible idea!"
to what I propsed on top of v1, resending as a full v2 per Mark's
request.

Robin.


Robin Murphy (3):
  ASoC: dt-bindings: Make RK3328 codec GPIO explicit
  ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit
  arm64: dts: rockchip: Describe RK3328 GPIO_MUTE users

 .../bindings/sound/rockchip,rk3328-codec.txt  |  7 ++++-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts    |  1 +
 .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  1 +
 sound/soc/codecs/rk3328_codec.c               | 31 ++++++++++---------
 4 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.17.1

