Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A3333B6A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 12:30:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C331F177E;
	Wed, 10 Mar 2021 12:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C331F177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615375815;
	bh=k/kOLf7vyDkIdrVDw42NKXl95W9UpVNTu/6TaH5xdm4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=azLFNkQ37arw0mqT9DY8B59/9M+k4xpPLZLEIARaoSZUTV+E3mRd9oFZ1/yJTGWhe
	 84mIG8og0A1AwaipN64ajGFkBQD0oA/eWBG/3jh6efHpw9psH2GNYzoA9cMIEZLdDY
	 sArB5Gbbpg6h+iLusKdfbmS0I/yo/mIHbxCXq15U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A418AF80279;
	Wed, 10 Mar 2021 12:28:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 806D8F8020D; Wed, 10 Mar 2021 12:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB847F801ED
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 12:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB847F801ED
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 679ECAE89;
 Wed, 10 Mar 2021 11:28:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: hda: Fix potential bad accesses at suspend/resume
Date: Wed, 10 Mar 2021 12:28:06 +0100
Message-Id: <20210310112809.9215-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Abhishek Sahu <abhsahu@nvidia.com>
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

this is a small patch series to address the bugs that triggers the
unexpected accesses during the system suspend/resume.  It happens
often with Nvidia driver and HDMI codec driver, and it may lead to the
serious CORB/RIRB errors.

Although the issues are seen mostly on DP/HDMI, a part of the problems
is rather generic to all platforms.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: Flush pending unsolicited events before suspend
  ALSA: hda: Avoid spurious unsol event handling during S3/S4
  ALSA: hda/hdmi: Cancel pending works before suspend

 sound/pci/hda/hda_bind.c   |  4 ++++
 sound/pci/hda/hda_intel.c  |  2 ++
 sound/pci/hda/patch_hdmi.c | 13 +++++++++++++
 3 files changed, 19 insertions(+)

-- 
2.26.2

