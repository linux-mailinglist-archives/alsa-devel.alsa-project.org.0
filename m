Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C5917C96
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 16:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E651AA9;
	Wed,  8 May 2019 16:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E651AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557327208;
	bh=wzqslpY2uZuX8gTVx32nEOcyUzj72tZfSpeFvD0FB2E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GsY1grVi8qmY9aUK4nAfDsX+62zgTku8aR2HDUskYQr8793gt8a7yyT+MZqSaG0i1
	 mcfplZvUCM00oVEKY1TAAL4x43emMP43Shy522jKKS1BO2wMo+A1VGmzV69k89iLQI
	 V5o7yqeMhR08dffyquZxyTABe4potwd627e4K4X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8EBF8972E;
	Wed,  8 May 2019 16:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F89BF896FF; Wed,  8 May 2019 16:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8B9CF896E6
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 16:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B9CF896E6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEF8EAE9D
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 14:49:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  8 May 2019 16:49:39 +0200
Message-Id: <20190508144943.8139-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/4] ALSA: line6: Cleanup startup sequences
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

while debugging line6 toneport driver bug, I noticed that other line6
drivers have too complex and fragile startup sequences.  This is the
result of the rewrites with a single delayed work.  Maybe for 5.3, as
these are no critical fixes.


Takashi

===

Takashi Iwai (4):
  ALSA: line6: pod: Rewrite complex timer & work combo with a delayed
    work
  ALSA: line6: podhd: Rewrite complex timer & work combo with a delayed
    work
  ALSA: line6: variax: Rewrite complex timer & work combo with a delayed
    work
  ALSA: line6: Drop superfluous timer helper function

 sound/usb/line6/driver.c |  11 -----
 sound/usb/line6/driver.h |   9 ----
 sound/usb/line6/pod.c    |  85 ++++++++++++--------------------
 sound/usb/line6/podhd.c  |  73 +++++----------------------
 sound/usb/line6/variax.c | 125 ++++++++++++++---------------------------------
 5 files changed, 78 insertions(+), 225 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
