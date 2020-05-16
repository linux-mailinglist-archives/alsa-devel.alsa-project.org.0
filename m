Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA61D5F1E
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 08:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7B01669;
	Sat, 16 May 2020 08:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7B01669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589610651;
	bh=6kCMl6h/eb2fCnGsH7eUqC6yl8RzioKQW+yOOzg4TUc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RQivpBZJBqZ1wLsptNvnix1gFVvvVWC0AlKV6G6MspxfzFIrNHcbVWUtCccbgWUbg
	 EyLKd/2b8PH/bq8U3Y1ehCyElF3nA0FtZxbPp2J2r0fqoUia5wkjGtpj3hMnrAeCcr
	 DbP+RnT1XE7Vm8vaDxY+GQCY7m4suL2RiSrXEl+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1784F8014C;
	Sat, 16 May 2020 08:29:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7CE2F801DB; Sat, 16 May 2020 08:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13109F800DD
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 08:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13109F800DD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F956ABEC
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 06:28:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: hda: Cleanup helpers
Date: Sat, 16 May 2020 08:28:52 +0200
Message-Id: <20200516062854.22141-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

Some helper functions are used only locally or not used, here just
a simple cleanup.


Takashi

===

Takashi Iwai (2):
  ALSA: hda: Drop unused snd_hda_queue_unsol_event()
  ALSA: hda: Unexport some local helper functions

 include/sound/hda_codec.h   | 7 -------
 include/sound/hdaudio.h     | 3 ---
 sound/hda/hdac_bus.c        | 2 --
 sound/hda/hdac_controller.c | 1 +
 sound/hda/local.h           | 3 +++
 5 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.16.4

