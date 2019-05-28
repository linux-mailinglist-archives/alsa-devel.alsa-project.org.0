Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3D2BFF0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 09:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F320817D8;
	Tue, 28 May 2019 09:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F320817D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559027726;
	bh=1jMFPprSbsbd4nSQ5nzwoWm0djYopcAkUtG3V0Jpj6U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P+zyoRfSLcaI0LV74Y5GYwWl7xDuCH1qciqkESDdPwAL637N3E0NJlXcIHy+A2nQL
	 eR+s2xe0ESrvdlDtRBXG7BfhnSBhnZSrwp6IVqEWkDjfx9g5eCYwElfcWHOUCgQfgq
	 qTGIdI+MVGtSRiyzUVAaj8/KlMtK6JKQhEZUjtuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D876F8972E;
	Tue, 28 May 2019 09:12:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A90B8F8971D; Tue, 28 May 2019 09:12:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DDEF8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DDEF8072E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 124DAADEC
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 07:12:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 28 May 2019 09:11:56 +0200
Message-Id: <20190528071201.27400-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH v2 0/5] ALSA: line6 fixes and cleanups
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

this is a patchset I forgot to merge for fixing and impriving LINE6
drivers.  The v2 is rebased after the latest toneport fix, and
contains a cleanup with container_of(), too.


Takashi

===

Takashi Iwai (5):
  ALSA: line6: pod: Rewrite complex timer & work combo with a delayed
    work
  ALSA: line6: podhd: Rewrite complex timer & work combo with a delayed
    work
  ALSA: line6: variax: Rewrite complex timer & work combo with a delayed
    work
  ALSA: line6: Drop superfluous timer helper function
  ALSA: line6: Use container_of()

 sound/usb/line6/driver.c   |  11 ----
 sound/usb/line6/driver.h   |   9 ---
 sound/usb/line6/pod.c      | 108 +++++++++++------------------------
 sound/usb/line6/podhd.c    |  80 ++++----------------------
 sound/usb/line6/toneport.c |  14 ++---
 sound/usb/line6/variax.c   | 138 ++++++++++++++-------------------------------
 6 files changed, 94 insertions(+), 266 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
