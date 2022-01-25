Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572D49B504
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 14:26:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76F6D2051;
	Tue, 25 Jan 2022 14:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76F6D2051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643117191;
	bh=TGw1hAS30CLmTl6z/wxvzlRIpL/R5waCnZgjfYHN8sY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i8TL7D6U5OZmNtlO2eWzvyDTXS7espYeKrjcMVbG28crGyNUOxk05J/YtLaUzMAlV
	 Hl6YbFkguHPvESI67UK06Yazgf1u2Toq0DQh96DC8r1q+L8Ik15G8qKhvdhZDP7AqK
	 2ZlnljNpUAwk5HiReVvUyEhNVsGVDtZCud8lbOR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B848CF804D6;
	Tue, 25 Jan 2022 14:25:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29423F804D2; Tue, 25 Jan 2022 14:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id A823AF80118
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 14:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A823AF80118
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; d="scan'208";a="107606144"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2022 22:25:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id AEAF54295952;
 Tue, 25 Jan 2022 22:25:09 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH 0/3] ASoC: sh: rz-ssi: Trivial changes
Date: Tue, 25 Jan 2022 13:24:54 +0000
Message-Id: <20220125132457.14984-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series has trivial changes for rz-ssi driver. Patches 1
(partial) & 2 are from series [3].

patch 1/3 is just a cosmetic change which was part of patch [0] where it
uses a do-while instead of while-do. Patch 2/3 is from series [1] where a
helper function is added and patch 3/3 is a new patch which removes
duplicate macros.

All the patches apply to [2] (sound -next)

[0] https://patchwork.kernel.org/project/alsa-devel/patch/
20220115012303.29651-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://patchwork.kernel.org/project/alsa-devel/patch/
20220115012303.29651-6-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/
[3] https://patchwork.kernel.org/project/alsa-devel/list/?series=605672

Cheers,
Prabhakar

Lad Prabhakar (3):
  ASoC: sh: rz-ssi: Use a do-while loop in rz_ssi_pio_recv()
  ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
  ASoC: sh: rz-ssi: Remove duplicate macros

 sound/soc/sh/rz-ssi.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

-- 
2.17.1

