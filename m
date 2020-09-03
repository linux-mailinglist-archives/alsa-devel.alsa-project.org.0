Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D725BF80
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:51:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED6BE191E;
	Thu,  3 Sep 2020 12:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED6BE191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130314;
	bh=9ewmGijru5K5XWHREyKbu2JyXAi93fxIJVyEj1sFnUk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZaDj+bM51phgv90G48WePTTjNm12/yPrY6Eo6sZKRPijkVBPqsy7kC6O4HQbrkQzr
	 5WMTKIC106HUSYrlKcgy7xsMUPYgECzDLC+G9pN4TwOctVfGIHasVP8cjxv4MnSDdh
	 M09jQTgEsgKZMsjKyIVI91Mi0HLOkLjjdZMOwbRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1644DF802DC;
	Thu,  3 Sep 2020 12:48:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4012DF802A9; Thu,  3 Sep 2020 12:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5436F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5436F800F0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81097B01D;
 Thu,  3 Sep 2020 10:47:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Kill tasklet usage
Date: Thu,  3 Sep 2020 12:47:46 +0200
Message-Id: <20200903104749.21435-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

Hi,

this is another series of patches to kill tasklet usages in sound
tree, at this time, applied to ASoC drivers.
The patches are applied on top the tasklet API conversion patches,
found in topic/tasklet-convert branch of sound git tree, which will be
included in 5.9-rc4.


Takashi

===

Takashi Iwai (3):
  ASoC: fsl: Replace tasklet with work
  ASoC: sh: Replace tasklet with work
  ASoC: txx9: Replace tasklet with work

 sound/soc/fsl/fsl_esai.c  | 14 +++++++-------
 sound/soc/sh/siu.h        |  2 +-
 sound/soc/sh/siu_pcm.c    | 21 +++++++++++----------
 sound/soc/txx9/txx9aclc.c | 11 ++++++-----
 sound/soc/txx9/txx9aclc.h |  2 +-
 5 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.16.4

