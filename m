Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6996333B69
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 12:30:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEAA1773;
	Wed, 10 Mar 2021 12:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEAA1773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615375803;
	bh=QCNrM+GLeF/2er9j9n3Rh4efjOkGWpL39REymNtklUM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=om/t7WHURD9+ioTJoxjSHCCfjPwRXIPbrI1CHz2EdlAa5Ad+Of5F/iLntQfjoM/zy
	 R+M9oD8+KKtm8u2+g8n0eWSB6Ztv230V3fdt5/DGVNi/Vm9YhxJoW/ELXKPFqdGh7V
	 GEMA67Tp8jPVSitY+jHJtqQZ+x8i3vVH58836wl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C37BCF801D8;
	Wed, 10 Mar 2021 12:28:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB4C3F80217; Wed, 10 Mar 2021 12:28:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB700F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 12:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB700F8012F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7546CAEB6;
 Wed, 10 Mar 2021 11:28:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: hda: Flush pending unsolicited events before suspend
Date: Wed, 10 Mar 2021 12:28:07 +0100
Message-Id: <20210310112809.9215-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310112809.9215-1-tiwai@suse.de>
References: <20210310112809.9215-1-tiwai@suse.de>
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

The HD-audio controller driver processes the unsolicited events via
its work asynchronously, and this might be pending when the system
goes to suspend.  When a lengthy event handling like ELD byte reads is
running, this might trigger unexpected accesses among suspend/resume
procedure, typically seen with Nvidia driver that still requires the
handling via unsolicited event verbs for ELD updates.

This patch adds the flush of unsol_work to assure that pending events
are processed before going into suspend.

Buglink: https://bugzilla.suse.com/show_bug.cgi?id=1182377
Reported-and-tested-by: Abhishek Sahu <abhsahu@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5b492c3f816c..5eea130dcf0a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1026,6 +1026,8 @@ static int azx_prepare(struct device *dev)
 	chip = card->private_data;
 	chip->pm_prepared = 1;
 
+	flush_work(&azx_bus(chip)->unsol_work);
+
 	/* HDA controller always requires different WAKEEN for runtime suspend
 	 * and system suspend, so don't use direct-complete here.
 	 */
-- 
2.26.2

