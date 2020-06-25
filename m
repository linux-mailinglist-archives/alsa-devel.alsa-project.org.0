Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27220A2E1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 18:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4281922;
	Thu, 25 Jun 2020 18:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4281922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593102472;
	bh=p2m3B49vDTXiteO5iNtcCF9X6XFjZuQykWs5KqLaLPo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f3gKcvJu8TU8kHprDI++L11vxP+7wl9JtEYvsDfSdZIvhE5P4LucXGijcYBXMkdE1
	 W8fMdq2pHuxYIKEQLOrg+CW/VjMZBWgDCeCwKReCBeWFp7m+lpLoUsmlDtJzCXCRM8
	 fFnNCrG+HPZaXOe7OOGscjxIabnENA/EyJm2dDQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE65F80277;
	Thu, 25 Jun 2020 18:25:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40037F80249; Thu, 25 Jun 2020 18:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E02ABF80234
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 18:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E02ABF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1fc9KQbR"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C87E207E8;
 Thu, 25 Jun 2020 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593100025;
 bh=p2m3B49vDTXiteO5iNtcCF9X6XFjZuQykWs5KqLaLPo=;
 h=From:To:Cc:Subject:Date:From;
 b=1fc9KQbR086I5+qM5iVP52kq+GJLcfydg0p/EXgxGuhPK7g5D/toyXtHGlRAe6VNM
 cKqmLEMpWoLHwCK6Q1Fw5Lz6N11XPX+hFTXyr3zAsHb4MO5t8Z/eOoef6RxtDb1a9L
 SPWl3IRUcCEs1/kJilPUNn8ysOJSpP8SfE8bjcf0=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 0/3] ALSA: compress: Document stream states and fix gapless
 SM
Date: Thu, 25 Jun 2020 21:16:48 +0530
Message-Id: <20200625154651.99758-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Changes in v3:
 - Add pause->stop->free transition
 - Add setup->free transition
 - remove running->free as that goes thru stop

Changes in v2:
 - Added tested tag by Srini
 - Update compress SM with Free state and compr_stop() transitions

Vinod Koul (3):
  ALSA: compress: document the compress audio state machine
  ALSA: compress: document the compress gapless audio state machine
  ALSA: compress: fix partial_drain completion state

 .../sound/designs/compress-offload.rst        | 83 +++++++++++++++++++
 include/sound/compress_driver.h               | 12 ++-
 sound/core/compress_offload.c                 |  4 +
 3 files changed, 98 insertions(+), 1 deletion(-)

-- 
2.26.2

