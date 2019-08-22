Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B085D98C7A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 09:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC2B950;
	Thu, 22 Aug 2019 09:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC2B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566459347;
	bh=IXiVWAbo30E7iGooujLom15ggwTMGzp7Im/cLDzWNTI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ixEpk4qSFkDEHVghrLyV/J2xlmtNs2gcbDmNmm0AQ7cQRl5yWvrMsft9LSZlZxhnD
	 6t8eN2XlClbTYrDQzwg9Kq6eg+ZOjPY5+RYkARsf96sBDaNV7e2nmo2RDIYV+THBP+
	 mJff01PpPxWmLtJ2ThXDpzTUuWwjQxnN7eNF9/Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E723F805F6;
	Thu, 22 Aug 2019 09:32:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 796DDF803F3; Thu, 22 Aug 2019 09:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB720F80391
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 09:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB720F80391
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00799AFA9
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 07:32:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 09:32:02 +0200
Message-Id: <20190822073207.8696-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/4] ALSA: usb-audio: More strict validation
	and cleanups
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

this patchset introduces a more comprehensive validation code for
USB-audio descriptor units, mainly for mixer stuff, for yet more
hardening against the malformed descriptors.  The rest are rather
cleanups.


Takashi

===

Takashi Iwai (4):
  ALSA: usb-audio: More validations of descriptor units
  ALSA: usb-audio: Simplify parse_audio_unit()
  ALSA: usb-audio: Unify the release of usb_mixer_elem_info objects
  ALSA: usb-audio: Remove superfluous bLength checks

 sound/usb/Makefile   |   3 +-
 sound/usb/clock.c    |  14 +--
 sound/usb/helper.h   |   4 +
 sound/usb/mixer.c    | 237 ++++++++++++------------------------
 sound/usb/power.c    |   2 +
 sound/usb/quirks.c   |   3 +
 sound/usb/stream.c   |  25 ++--
 sound/usb/validate.c | 332 +++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 439 insertions(+), 181 deletions(-)
 create mode 100644 sound/usb/validate.c

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
