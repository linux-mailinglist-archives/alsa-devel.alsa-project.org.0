Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340938C1BA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 10:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1064E16A4;
	Fri, 21 May 2021 10:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1064E16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621585525;
	bh=8S9xjRjz+ru9nImjilEiI+jNyVirPdNjjubjBsIntAU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OYEkkq1fEW27k7zr1B9B3mKxBT50kahi2JntbKFAYu4IXHDgLX+knXYbAZxBf16LT
	 2bKPLEruwT2kcR18qVqH++1KOrJmhYvEeS121GEuRZEO3/OQnviLrYKZ9zn3AfhBpZ
	 YS9DhtSxUHKhmRAiGDu39sbMH4mEkReBkQoTShVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B85F80246;
	Fri, 21 May 2021 10:23:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2368F800C1; Fri, 21 May 2021 10:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79AC8F800C1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 10:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79AC8F800C1
Received: by m.b4.vu (Postfix, from userid 1000)
 id 88F2560ABED3; Fri, 21 May 2021 17:53:34 +0930 (ACST)
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/2] ALSA: usb-audio: scarlett2: Fix device hang with ehci-pci
Date: Fri, 21 May 2021 17:50:11 +0930
Message-Id: <cover.1621584566.git.g@b4.vu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Geoffrey D. Bennett" <g@b4.vu>
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

This patchset fixes a show-stopper bug with the Scarlett Gen 2 mixer
driver not working with the ehci-pci host driver, and improves the
user experience with better driver startup messages.

Patch 1: Fixes the driver hanging the device by using the correct
direction pipe now.

Patch 2: Improves the user experience with more specific enabling
instructions, positive feedback when it is enabled or if
initialisation fails. The previous instructions were incomplete and
didn't confirm that the driver was enabled.

#Cc: stable@vger.kernel.org please (sorry, not sure if I should be
sending this there myself or if it gets added by Takashi after
review?)

Geoffrey D. Bennett (2):
  ALSA: usb-audio: scarlett2: Fix device hang with ehci-pci
  ALSA: usb-audio: scarlett2: Improve driver startup messages

 sound/usb/mixer_quirks.c        |  2 +-
 sound/usb/mixer_scarlett_gen2.c | 81 +++++++++++++++++++++------------
 sound/usb/mixer_scarlett_gen2.h |  2 +-
 3 files changed, 53 insertions(+), 32 deletions(-)

-- 
2.31.1

