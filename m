Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E53EB265
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 10:14:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FDB718BE;
	Fri, 13 Aug 2021 10:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FDB718BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628842467;
	bh=1CsAIXVABNQVdS+JVNnQUYjvOXx/5SdzIRFAux/7CAM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eB1+dMtOpoKgJZp6Jh+XQxmFwcRC1KlWlYoCAg/KZpFl+F4GzTkU3J6xykCdfaKJa
	 3kdLS0VNNQNWwM9n8h7rTYY2XCBQS+jh9x4aDkWIr+VOV2hD2Ix9V4qLGqoDAgd9qe
	 LQXet0r1IVYUgswEwLpglWhYT1zG0xw91J1SV4HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE7FF804BB;
	Fri, 13 Aug 2021 10:12:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 669CEF804B0; Fri, 13 Aug 2021 10:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB560F800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB560F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QJd0BGnm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6ZmQMcLN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B5BFE1FF8F;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628842353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2xuBcok/B9v4YPD/PXWCSYWi60JM8NYK+xbQmssEzNQ=;
 b=QJd0BGnms1If6TFSWgEDCsc8t/QiCccukN2ujg2HFg3WN7YgYVVKBP9JHZdaql6DTUIDiD
 oykJIz2zQazhJHid2srPo4/b+WsWiEFHYNS5/be3Fq6gPdmWwzeAjy87qM6Vh2DJdQ4sVF
 8CwFcwiWx1VEXW5fdgNTjDSwE0NaETk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628842353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2xuBcok/B9v4YPD/PXWCSYWi60JM8NYK+xbQmssEzNQ=;
 b=6ZmQMcLNZhZnEfYxvxGPCTQErDA99/ActE+NrSkcKNClT1yZjlfy3NufeznrYSjZmzMAmb
 8fnr2A0nxZSq+tDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9B8B1A3B84;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: hda: Forcibly suspend codec at shutdown
Date: Fri, 13 Aug 2021 10:12:27 +0200
Message-Id: <20210813081230.4268-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: youling257@gmail.com, Imre Deak <imre.deak@intel.com>
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

this is a patch set for fixing the issue at shutdown/reboot with
HD-audio.  The recent regression report brought me to check the
shutdown code execution and it turned out that we don't do right for
the codec shutdown while powering off the controller side.
As a simple but big-hammer solution, this changes the codec driver's
shutdown callback to forcibly (runtime-)suspend.  It assures the
proper power-off and the mute, as done at the usual suspend/resume.

Currently my plan is to apply this for 5.15, as the impact is
significant and it's a bit too late for 5.14 shortly before the
final.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: conexant: Turn off EAPD at suspend, too
  ALSA: hda: Suspend codec at shutdown
  ALSA: hda: Nuke unused reboot_notify callback

 include/sound/hda_codec.h      |  1 -
 sound/pci/hda/hda_bind.c       |  8 +-------
 sound/pci/hda/hda_codec.c      | 14 ++++++++++++++
 sound/pci/hda/hda_generic.c    | 19 -------------------
 sound/pci/hda/hda_generic.h    |  1 -
 sound/pci/hda/hda_local.h      |  2 ++
 sound/pci/hda/patch_analog.c   |  1 -
 sound/pci/hda/patch_ca0132.c   |  6 ------
 sound/pci/hda/patch_conexant.c | 15 +++++++++++----
 sound/pci/hda/patch_realtek.c  | 13 -------------
 sound/pci/hda/patch_sigmatel.c |  1 -
 11 files changed, 28 insertions(+), 53 deletions(-)

-- 
2.26.2

