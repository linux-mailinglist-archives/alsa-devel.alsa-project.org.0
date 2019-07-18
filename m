Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B9F6CC26
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7DE167A;
	Thu, 18 Jul 2019 11:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7DE167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563443159;
	bh=Vej1hwiT1+/0yWLzqJx8Tw2zYWBJIc9UdwkgtABb1hw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mpCz0VQ9SI7cIrMYsTO1O3dcOYuT2VGB+72zdSq2lw27toJozk9HQibKDA9PhoPhV
	 Vl/l66AnvSJcqw3qD/ZNnEr7mF48YLoUt3Nl1AmkwSwFEa/mXxEyyW9GUaxst9OI+q
	 1e54eBewK/rljBqA4iypAovD8CYl5N0H+7BJjdZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A07F803CF;
	Thu, 18 Jul 2019 11:43:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F300F800C0; Thu, 18 Jul 2019 11:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE8B0F800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE8B0F800C0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5BC0ABF4
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 09:43:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 18 Jul 2019 11:43:19 +0200
Message-Id: <20190718094321.16442-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/2] ALSA: AMD and Nvidia HD-audio component
	notifier support
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

this is a revival of my old patchset for adding the support of drm
audio component for AMD and Nvidia HDMI codecs.  This is only HD-audio
side, and we need the support in DRM side as well, but it's a step
forward to the better HDMI hotplug handling.  I'm going to submit the
radeon and nouveau patches later once after merging this for 5.4
kernel.

The first patch is somewhat new, a sort of optimization.  The second
patch has been slightly rewritten frm the previous version and the
support for Nvidia was added as well.

Lightly tested on a Dell desktop with Nvidia graphics.


Takashi

===

Takashi Iwai (2):
  ALSA: hda/hdmi - Don't report spurious jack state changes
  ALSA: hda/hdmi - Allow audio component for AMD/ATI and Nvidia HDMI

 sound/pci/hda/patch_hdmi.c | 265 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 229 insertions(+), 36 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
