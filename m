Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D726069C8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 22:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E46C8BC23;
	Thu, 20 Oct 2022 22:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E46C8BC23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666298850;
	bh=Z2QQbx0JnHBxzfxbiRZ6u8tG5z0/KILsa+1lgd4u80E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XIp9L7NaRu5d6FKUZ0L5R8SPT+O+BN7RXPlDIzAdjwuDA9HTCw9BSCP7IW7FmlD4S
	 jAJQSaHuXI/flzpFrhi0TSSWUqeVgaBC2+QZ0sdMxHlM6GkPsR0+WnKJNKKah63aB/
	 KaI8a5IdtOiuqnLFlFA7HBGPg+4IbZ3ibN5tB9og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B18FF80137;
	Thu, 20 Oct 2022 22:46:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39055F800B5; Thu, 20 Oct 2022 22:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from vps-vb.mhejs.net (vps-vb.mhejs.net [37.28.154.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1058F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 22:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1058F800B5
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1olcQy-0007Uc-He; Thu, 20 Oct 2022 22:46:32 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/6] Fix direct renaming of hashed controls
Date: Thu, 20 Oct 2022 22:46:20 +0200
Message-Id: <cover.1666296963.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

I've noticed that some of mixer controls on my sound card seem to
be partially broken on the 6.0 kernel - alsactl wasn't able to find them
when restoring the mixer state.

The issue was traced down to the recent addition of hashed controls lookup
in commit c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups").

Since that commit it is *not* enough to just directly update the control
name field (like some of ALSA drivers were doing).
Now the hash entries for the modified control have to be updated too.

This patch set adds a snd_ctl_rename() function that takes care of doing
this operation properly for callers that already have the relevant
struct snd_kcontrol at hand and hold the control write lock (or simply
haven't registered the card yet).

These prerequisites hold true for all the call sites modified.
    
The core controls change and the emu10k1 patch were runtime tested.
Similar patches for other devices were only compile tested.

 include/sound/control.h         |  1 +
 sound/core/control.c            | 23 +++++++++++++++++++++++
 sound/pci/ac97/ac97_codec.c     | 32 ++++++++++++++++++++++++--------
 sound/pci/ca0106/ca0106_mixer.c |  2 +-
 sound/pci/emu10k1/emumixer.c    |  2 +-
 sound/pci/hda/patch_realtek.c   |  2 +-
 sound/usb/mixer.c               |  2 +-
 7 files changed, 52 insertions(+), 12 deletions(-)

