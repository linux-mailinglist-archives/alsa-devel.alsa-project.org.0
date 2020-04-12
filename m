Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F61A5D73
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 10:17:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EBE216D7;
	Sun, 12 Apr 2020 10:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EBE216D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586679429;
	bh=AYD9Ys+9NCCxqsrAUQ7vy5Io3DcHAH6gEtMoOLhAoxU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ta8RYNhWfh+lmP3UxFwYrkynRJTS0zweHYISYqX9Ro014KtRJiKXqB/vdTdMP6da9
	 dEVg5MBD33b2sAEECWOPPOO8L9Qu/qFud8/OeeJlK0Ro1lRdDdVuZVq23kQDiWp33t
	 ELTnHH0mVsdnLxNCYcjJy8YqR33On9t0XZ1wvXL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72297F8028F;
	Sun, 12 Apr 2020 10:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01F43F8016F; Sun, 12 Apr 2020 10:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB4A1F8014E
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 10:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB4A1F8014E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F683AC84
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 08:13:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: usb-audio: More workarounds for TRX40-mobos
Date: Sun, 12 Apr 2020 10:13:27 +0200
Message-Id: <20200412081331.4742-1-tiwai@suse.de>
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

Hi,

it turned out that the recent mobos shipped with Realtek codec need
more workarounds.  In the end, most of the fixes here are generic
issues, hence marked for stable.

The bugtracker is at:
  https://bugzilla.kernel.org/show_bug.cgi?id=206873

Takashi

===

Takashi Iwai (4):
  ALSA: usb-audio: Filter error from connector kctl ops, too
  ALSA: usb-audio: Don't override ignore_ctl_error value from the map
  ALSA: usb-audio: Don't create jack controls for PCM terminals
  ALSA: usb-audio: Check mapping at creating connector controls, too

 sound/usb/mixer.c      | 31 +++++++++++++++++++------------
 sound/usb/mixer_maps.c |  4 +++-
 2 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.16.4

