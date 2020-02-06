Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF34015493C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:31:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78ED216A4;
	Thu,  6 Feb 2020 17:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78ED216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006666;
	bh=vlRqPBiDS5lKSDejDC+RA0fD8JA1SeyTgDw/RKRxF5g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HAKdQS33jRfV8VAJ7lEIi0QhCZL90va8IUHzL0j0fi1MN1iJ6F2hq8yrzTvnqRS4r
	 B6gfpayNeAwditUmxPcN2qR/0Men7j3AmAhbmWyyMgvEvfWKJTyMzuhJe6u3ORMLu8
	 +unoDbQ4/rASs7bOAa6XfeF35nJbQqfz/EojV8ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C3DBF80273;
	Thu,  6 Feb 2020 17:28:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA6A6F80212; Thu,  6 Feb 2020 17:28:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7813F8015B
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7813F8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE76CAE9A;
 Thu,  6 Feb 2020 16:28:07 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:28:00 +0100
Message-Id: <20200206162804.4734-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ALSA: hda/hdmi: Clean up jack handling
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

this is a series of cleanup of the jack handling in HD-audio HDMI
codec driver, which I realized after the recent regression fix.
Basically this changes the jack handling from hda_jack to the own jack
objects as Intel HDMI did but applying now to all (generic) codecs.
It resulted in a good amount of code reduction in the end.

As this is no real fixes, and I'd like to rather share the code
between 5.5 and 5.6, it's targeted for 5.7.

Only lightly tested on Intel and nouveau.


Takashi

===

Takashi Iwai (4):
  ALSA: hda/hdmi: Reduce hda_jack_tbl lookup at unsol event handling
  ALSA: hda/hdmi: Don't use standard hda_jack for generic HDMI jacks
  ALSA: hda/hdmi: Move runtime PM resume into
    hdmi_present_sense_via_verbs()
  ALSA: hda/hdmi: Move ELD parse and jack reporting into update_eld()

 sound/pci/hda/patch_hdmi.c | 313 +++++++++++++--------------------------------
 1 file changed, 90 insertions(+), 223 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
