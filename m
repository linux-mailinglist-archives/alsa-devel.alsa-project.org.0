Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A518200174
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 06:56:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7CBF167C;
	Fri, 19 Jun 2020 06:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7CBF167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592542615;
	bh=bFexccscXk2UlaIa+BaEhorrfA99CZlAzpnuwyv3vSg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RfcLvFlV+IbrWI9Yeex9N/7uYCGq7LvC8XFPH+Wyq8qrJjjrw6ayT+sGa5sHDllTQ
	 6A6coQnMz3hpcBUpslowuISnX9u9meg/XTmsbgjDYUaQwJZsrwMaVHQEFATh6AzGSf
	 oBj0YvdROIGQavNQ1kcANO5SMXF0ZPnR3ae0VjCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD42FF800B5;
	Fri, 19 Jun 2020 06:55:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FC14F80252; Fri, 19 Jun 2020 06:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A161F80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 06:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A161F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LnGKm3Z2"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5FF220890;
 Fri, 19 Jun 2020 04:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592542502;
 bh=bFexccscXk2UlaIa+BaEhorrfA99CZlAzpnuwyv3vSg=;
 h=From:To:Cc:Subject:Date:From;
 b=LnGKm3Z2NDS1Q4yfFCee0znsKJe5Whm49EzlQ8HMzD5RrWZGsRVFNp2o3ULielKJD
 u9jM6X0PdR2qWV1GMfwV6Gava33WXp6GOgV6yBXS/fJ9v+SmdZBL09VhI5BODQiHbC
 Rj92N5hz4OKVc+QsVudgvfjkZj5e3LjOaS/MuONw=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/3] ALSA: compress: Document stream states and fix gaplless SM
Date: Fri, 19 Jun 2020 10:24:45 +0530
Message-Id: <20200619045449.3966868-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Srini found issue with gapless implementation which prompted to look deeper
into SM for compressed stream.

So documenting SM was first step, so first two patches add that. Last patch
fixes the issue by keeping track on partial_drain and then moving state to
'running' in snd_compr_drain_notify() for partial_drain case on success.
While at it, noticed snd_compr_drain_notify() is lockless state change, so
fixed that as well.

I have tested this on Dragon board RB3, compressed audio works out of the
box on that platform and Srini will send driver and fcplay patches for
gapless soon.

Vinod Koul (3):
  ALSA: compress: document the compress audio state machine
  ALSA: compress: document the compress gapless audio state machine
  ALSA: compress: fix partial_drain completion state

 .../sound/designs/compress-offload.rst        | 84 +++++++++++++++++++
 include/sound/compress_driver.h               | 12 ++-
 sound/core/compress_offload.c                 |  4 +
 3 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.26.2

