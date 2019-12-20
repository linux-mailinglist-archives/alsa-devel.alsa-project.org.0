Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AB127F6C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3496C15E0;
	Fri, 20 Dec 2019 16:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3496C15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576856169;
	bh=f8wE9hcgOeTF7rbhvDXN5k5d7WxpyDz+gFQCjmn/VX0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UzdYrSm8gt8RaFqSvSYKuAUaKXEslFP0Ov1rroer2sHCNElYW3R/DE8+yApDR+Swj
	 mvKn+WUpXH+MCoRXPzfdBchv5jqu/3I0ADUkEMbxneRsxm2QI/WqXga+wNxPdmIx4C
	 SlL3wH94XtouENEd7qr9ax0oeI04wuXlPZJy63Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E9CDF8025F;
	Fri, 20 Dec 2019 16:34:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00A5BF8015A; Fri, 20 Dec 2019 16:34:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A15F80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A15F80059
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57723AE37
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 15:34:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 16:34:10 +0100
Message-Id: <20191220153415.2740-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/5] ALSA: Fix uapi headers
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

here is a series of fixes for include/uapi/sound/*.h files and the
relevant code changes, so that they can be used for building
alsa-tools programs again.

The corresponding alsa-lib update will be followed.


Takashi

===

Takashi Iwai (5):
  ALSA: emu10k1: Make uapi/emu10k1.h compilable again
  ALSA: hdsp: Make uapi/hdsp.h compilable again
  ALSA: hdspm: Drop linux/types.h inclusion in uapi header
  ALSA: uapi: Fix typos and header inclusion in asound.h
  ALSA: uapi: Drop asound.h inclusion from asoc.h

 include/uapi/sound/asoc.h    |  1 -
 include/uapi/sound/asound.h  |  6 +++---
 include/uapi/sound/emu10k1.h | 38 ++++++++++++++++++++++++++------------
 include/uapi/sound/hdsp.h    |  4 +---
 include/uapi/sound/hdspm.h   |  2 --
 sound/pci/emu10k1/emufx.c    | 26 ++++++++++++++------------
 sound/pci/rme9652/hdsp.c     |  2 +-
 7 files changed, 45 insertions(+), 34 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
