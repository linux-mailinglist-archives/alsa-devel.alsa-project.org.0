Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCC11D6E3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 20:12:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A488170C;
	Thu, 12 Dec 2019 20:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A488170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576177971;
	bh=jUSuO0hdS+yDxRwMnXTucz6ckd5uhpz/r/Dr7XerqTY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=anwq2RBM/qa4kGrMALSShXW7QzKrIzY8BQIXAtwm08oXFvVDIm3t1WClGmJltygR9
	 UAQ/V5XYD7CXKXYpIWQeag5p8nktoPQXmzdHS96JRv6f7Q4APaSG8fNpw8e/e1qBXa
	 KL2ltwMupHS3+0hbX2KXJUFG8dCfpWt7Rc6i/Pvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F4EF80248;
	Thu, 12 Dec 2019 20:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D88C4F80232; Thu, 12 Dec 2019 20:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E543F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 20:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E543F800EC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17522AFDF;
 Thu, 12 Dec 2019 19:11:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 12 Dec 2019 20:10:59 +0100
Message-Id: <20191212191101.19517-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/2] ALSA: hda: Use RIRB waitq commonly
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

this is a follow-up patch set for adapting the RIRB waitq to HD-audio
core, and a cleanup with it.


Takashi

===

Takashi Iwai (2):
  ALSA: hda: Use waitqueue for RIRB in HDA-core helper, too
  ALSA: hda: Unify get_response handling

 include/sound/hda_codec.h      |  1 -
 include/sound/hdaudio.h        |  1 +
 sound/hda/hdac_controller.c    | 25 +++++++++++++++++++--
 sound/pci/hda/hda_controller.c | 49 ++++--------------------------------------
 sound/pci/hda/hda_intel.c      |  2 +-
 sound/pci/hda/hda_tegra.c      |  2 +-
 sound/pci/hda/patch_ca0110.c   |  2 +-
 sound/pci/hda/patch_sigmatel.c |  2 +-
 8 files changed, 32 insertions(+), 52 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
