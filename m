Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3838DA9D
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4720316AE;
	Sun, 23 May 2021 11:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4720316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761111;
	bh=lJZCP9ztGbOTVMnRcoE58Q0ZdOxl6dD9U/mq124LxMw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KvXAIp07EmIAOdh7gbjg82KKTs82ojr7uaXhh7G+AzWjvDpQInsPRnR762s9E6DTd
	 Ekw+iHuOsc/X2jPbAIGwxBR0MqHToqHuRu5NBROS4o4DTiSKlhymTvLBZxl1crrrtn
	 LoM81bj2vicvx1t2cuMMjVjuZCaGGihHqQxZ/MO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B3F2F8016D;
	Sun, 23 May 2021 11:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62F76F80274; Sun, 23 May 2021 11:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17A0FF801EB
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17A0FF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="V3Dhxdrm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xeihv3BG"
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621760962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TTORx3imQBPCwUl0IQI/q3pTyzdhT/VrlhX4mdSeJEs=;
 b=V3DhxdrmHQl6eqLkwHjLHSBI3I3ha1iITqs+zPiHfuvgCzqMoP8suUAalPz2aov+fl8JdV
 IKPjH+QKBpefE/f49iGRSbfJdxeuAxiNEPcuUQYXJsJFsoMa3iQKertV/aBKqws4nv2twU
 pjcqUvF0cEmXEoDfeMvVQeRJ1pKrxeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621760962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TTORx3imQBPCwUl0IQI/q3pTyzdhT/VrlhX4mdSeJEs=;
 b=xeihv3BG33pshQ83WRk3sTTP0wQiJ0SOZ4p5j/pzulDeJnXp3jg2vMjicsGi9pMoaPHZbg
 SH4XTtMSM/7auXCQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8DB2AAFD;
 Sun, 23 May 2021 09:09:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/6] ALSA: Prep work for PCI rescan support
Date: Sun, 23 May 2021 11:09:14 +0200
Message-Id: <20210523090920.15345-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

this is a revised patch set as a prep work for the future-planned PCI
rescan support(*).  The essential part is the patch to track in-flight
tasks, and the rest are cleanups and fixes in the core code.  With
those changes, the driver can perform a sort of software suspend on
the device without the hardware intervention, which is required during
the PCI BAR movement, for example.

v1->v2:
* Move / drop unnecessary snd_power_wait() calls
* Rephrase changelogs and comments, reorder patches


Takashi

(*) https://lore.kernel.org/alsa-devel/e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com/

===

Takashi Iwai (6):
  ALSA: core: Use READ_ONCE() / WRITE_ONCE() for power state change
  ALSA: control: Track in-flight control read/write/tlv accesses
  ALSA: control: Drop superfluous snd_power_wait() calls
  ALSA: control: Minor optimization for SNDRV_CTL_IOCTL_POWER_STATE
  ALSA: Drop superfluous argument from snd_power_wait()
  ALSA: pcm: Block the release until the system resume finishes

 include/sound/core.h        | 50 ++++++++++++++++++++++++++++++++++---
 sound/core/control.c        | 38 +++++++++++++---------------
 sound/core/control_compat.c | 14 +++--------
 sound/core/init.c           | 46 ++++++++++++++++++++++++++++------
 sound/core/pcm_native.c     |  6 ++++-
 sound/soc/soc-core.c        |  2 +-
 sound/usb/usx2y/us122l.c    |  2 +-
 7 files changed, 113 insertions(+), 45 deletions(-)

-- 
2.26.2

