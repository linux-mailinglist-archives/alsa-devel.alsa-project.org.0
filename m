Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB872666CF
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 19:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B721677;
	Fri, 11 Sep 2020 19:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B721677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599845617;
	bh=bO0PFQSYgsmsj9KXWwBYksrFr6D6vxjIDhBZ2Aihc90=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ltorQ3nuO7hIeR1imw4pEM5yHU7pnQOxMKiFPGDQoYRcjAdhk+dz1XM7ZWnKxzYMi
	 ZYz/JxWjhnO9KFHjCcxxn9E8Cyz5stFRPgUarkeebnplKn6NsmmHsZFlHkhSB4D97C
	 kbx4WGYLJxlMSFtez0AwyFu3ZrM5IrmgWep11h8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8D9F800E9;
	Fri, 11 Sep 2020 19:31:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D4BF80274; Fri, 11 Sep 2020 19:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B168F800E9
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 19:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B168F800E9
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 581EA1BF206;
 Fri, 11 Sep 2020 17:31:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/3] tlv320aic3xx4 updates
Date: Fri, 11 Sep 2020 19:31:37 +0200
Message-Id: <20200911173140.29984-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
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

Hello,

While doing a kernel update on a sama5-based board I figured out the
sound system was not working anymore, the debug session led me to the
following commits. As I am not an audio expert at all, I am fully open
to comments and suggestions.

Thanks,
Miquèl

Miquel Raynal (3):
  ASoC: tlv320aic32x4: Ensure a minimum delay before clock stabilization
  ASoC: tlv320aic32x4: Fix bdiv clock rate derivation
  ASoC: tlv320aic32x4: Enable fast charge

 sound/soc/codecs/tlv320aic32x4-clk.c |  9 ++++++++-
 sound/soc/codecs/tlv320aic32x4.c     | 17 ++++++++++++++---
 sound/soc/codecs/tlv320aic32x4.h     |  7 +++++++
 3 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.20.1

