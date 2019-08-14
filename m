Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3D8DDFC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:41:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336C0167A;
	Wed, 14 Aug 2019 21:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336C0167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565811661;
	bh=w2e5iajyKXpPIWbzQI8kDO/ORRdv0ENsp7HoleOTh+A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JRW1msbA/FoXbGLMcQlJTXmfZ/WdsjE+YziyXXEYQMqToM5Ip5MYyVolT/Ac87K89
	 CynfIt5oA7Bkgp98xncBWjRhkDCDuVI6Mgm6ZAhOFAB3mvgB2R94zNlMM6hK3R6nnx
	 MjirV8adOqGH7kJu3AOXpAfpSZvjyS63bQNbiwK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2B42F80446;
	Wed, 14 Aug 2019 21:39:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53289F8048D; Wed, 14 Aug 2019 21:39:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC32F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC32F8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A1DEBABB1
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 19:39:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 21:39:01 +0200
Message-Id: <20190814193905.5530-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/4] A few more HD-audio core fixes / cleanups
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

this is a series of yet another patches for HD-audio core stuff.
The first two are workarounds for possible races in the driver
registration and other two are merely cleanups.


Takashi

===

Takashi Iwai (4):
  ALSA: hda - Drop unsol event handler for Intel HDMI codecs
  ALSA: hda: Add codec on bus address table lately
  ALSA: hda: Drop export of snd_hdac_bus_add/remove_device()
  ALSA: hda: Unexport a few more stuff

 include/sound/hdaudio.h    |  9 ---------
 sound/hda/hdac_bus.c       |  8 ++++----
 sound/hda/hdac_device.c    | 27 ++++++++++++++-------------
 sound/hda/hdac_regmap.c    |  1 +
 sound/hda/local.h          |  7 +++++++
 sound/pci/hda/patch_hdmi.c |  9 ++++++++-
 6 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
