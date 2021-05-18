Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0A387DEC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83B411710;
	Tue, 18 May 2021 18:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83B411710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621356817;
	bh=P+WxpDnl2/W7jdrcvy2TJgre9v+IWkj2Rw9PEEBBC8w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sp3DOzjJ7Z8BWQI765xJWcLCem0VQ7wrhDMmLlr9TZGeh69WrCWTbEByfQClppeOu
	 rPbMksypx+3/QO/7dy9bzaJ7YDVb0OugNc8XCNieJ3uk5nM7c12ytPOF3Jl9xDZ5rm
	 7F/D5mkEtMnesDxv5Mq/Pktwf0VJU9GfLTmhK4qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D250F8027D;
	Tue, 18 May 2021 18:52:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DCDFF80424; Tue, 18 May 2021 18:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D78ABF8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78ABF8014C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A38DAFF4;
 Tue, 18 May 2021 16:52:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ALSA: Prep work for PCI rescan support
Date: Tue, 18 May 2021 18:51:54 +0200
Message-Id: <20210518165201.24376-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

this is a patch set as a prep work for the future-planned PCI rescan
support(*).  The essential part is the patch to track in-flight tasks,
and the rest are cleanups and fixes in the core code.  With those
changes, the driver can perform a sort of software suspend on the
device without the hardware intervention, which is required during the
PCI BAR movement, for example.


Takashi

(*) https://lore.kernel.org/alsa-devel/e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com/

===

Takashi Iwai (7):
  ALSA: core: Use READ_ONCE() / WRITE_ONCE() for power state change
  ALSA: control: Add power state check commonly for ioctl handlers
  ALSA: control: Drop superfluous snd_power_wait() calls
  ALSA: control: Minor optimization for SNDRV_CTL_IOCTL_POWER_STATE
  ALSA: control: Track in-flight control read/write/tlv accesses
  ALSA: pcm: Block the release until the system resume finishes
  ALSA: Drop superfluous argument from snd_power_wait()

 include/sound/core.h        | 39 +++++++++++++++++++++---
 sound/core/control.c        | 41 +++++++++++++-------------
 sound/core/control_compat.c | 17 +++++------
 sound/core/init.c           | 59 ++++++++++++++++++++++++++++++++-----
 sound/core/pcm_native.c     |  6 +++-
 sound/soc/soc-core.c        |  2 +-
 sound/usb/usx2y/us122l.c    |  2 +-
 7 files changed, 121 insertions(+), 45 deletions(-)

-- 
2.26.2

