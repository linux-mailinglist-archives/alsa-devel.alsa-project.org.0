Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFE2DE534
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 15:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0EB178F;
	Fri, 18 Dec 2020 15:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0EB178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608303491;
	bh=+nsNgCwumN1M+k+Ea18+AOnm1/yjOSte+ofP7N1o1PI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jx7wXsWkMpgpApu+hmkVEFx7Qo9tvCa4wYlc8sAnHVOk9X02HDMof7XjtTClUge/U
	 xzgCOjMMsLPwGaTNnZHSRQ0GlXK3bH7gwhGm/rLhcxm7tZmeq3HLJpdAnq63jUzG6C
	 FOzj72Kx6HUZmKwfFHQkbUUGPnxTvshCbrWvND+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C28FBF80264;
	Fri, 18 Dec 2020 15:56:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7420CF80245; Fri, 18 Dec 2020 15:56:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBD1EF801F7
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 15:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBD1EF801F7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6347ACF5;
 Fri, 18 Dec 2020 14:56:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: Clear PCM buffers more properly
Date: Fri, 18 Dec 2020 15:56:23 +0100
Message-Id: <20201218145625.2045-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Robin Gong <yibin.gong@nxp.com>, Lars-Peter Clausen <lars@metafoo.de>
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

here are two small fix patches for PCM buffer allocations.
Basically those address two things that have been discussed in the
recent thread [1]:
* Clear the remaining bytes in PCM buffer pages that are exposed via
  mmap
* Assure the page aligned allocations for genalloc

This doesn't cover the cases where non-standard PCM buffer allocation
is used.  Those should handle the buffer clearance by themselves.


Takashi

[1] https://lore.kernel.org/r/05c824e5-0c33-4182-26fa-b116a42b10d6@metafoo.de

===

Takashi Iwai (2):
  ALSA: memalloc: Align buffer allocations in page size
  ALSA: pcm: Clear the full allocated memory at hw_params

 sound/core/memalloc.c   | 1 +
 sound/core/pcm_native.c | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.26.2

