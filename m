Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5C482556
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 18:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF741706;
	Fri, 31 Dec 2021 18:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF741706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640971017;
	bh=nC7xYY66INj0JLRuRs7clO5Us0814VH2mCJ6CAW/0I4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=txzeqEinXG0biuqq+Fm78UIWIxZrWLBadvaBtS/DRZxrDtgB0p6O9aJDc49BOixi6
	 ywhcE0uowE4cHzgGmwCNEeE4M2YkPux1ZdwkBUL5L9EL8sX5icdD1//o9deqO95UVB
	 goyzRHTuMDoDZj1Kj23CIt2/zAdyBAj4e5NFytYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E5AF800C9;
	Fri, 31 Dec 2021 18:15:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 897A3F80118; Fri, 31 Dec 2021 14:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
 by alsa1.perex.cz (Postfix) with ESMTP id 5528AF800EB
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 14:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5528AF800EB
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id DE23114042E; Fri, 31 Dec 2021 14:12:21 +0100 (CET)
Date: Fri, 31 Dec 2021 14:12:21 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: alsa-devel@alsa-project.org
Subject: hda/cs8409: Fix internal speaker detection
Message-ID: <20211231131221.itwotyfk5qomn7n6@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 31 Dec 2021 18:15:28 +0100
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

I have a DELL Inspirion 3501 laptop with a cirrus cs8904 HDA codec.
With more recent kernels the internal speakers stopped working.
I bisected the issue and tracked it down to this commit 

| commit c8b4f0865e82c14924c69c07d985af3ee9133316
| Author: Stefan Binding <sbinding@opensource.cirrus.com>
| Date:   Wed Aug 11 19:56:52 2021 +0100
|
|     ALSA: hda/cs8409: Remove unnecessary delays
        
After a bit of experimenting with the timeouts I came
up with the patch below that fixes the issue for me.

However, I don't have the specs for the chip, i.e. I don't
know what a theoretically correct value would be.

Suggested patch below, please consider inclusion.

     regards   Christian

From 9c796d221171c6d12fd84ae4f5c8315030c8c4ca Mon Sep 17 00:00:00 2001
From: "Christian A. Ehrhardt" <lk@c--e.de>
Date: Fri, 31 Dec 2021 10:33:19 +0100
Subject: [PATCH 1/2] ALSA: hda/cs8409: Increase delay during jack detection

Commit c8b4f0865e82 reduced delays related to cs42l42 jack
detection. However, the change was too aggressive. As a result
internal speakers on DELL Inspirion 3501 ac8b4f0865e82re not detected.

Increase the delay in cs42l42_run_jack_detect() a bit.

Fixes: c8b4f0865e82 ("ALSA: hda/cs8409: Remove unnecessary delays")
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 sound/pci/hda/patch_cs8409.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 039b9f2f8e94..bf5d7f0c6ba5 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -628,8 +628,8 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 	cs8409_i2c_write(cs42l42, 0x1b74, 0x07);
 	cs8409_i2c_write(cs42l42, 0x131b, 0xFD);
 	cs8409_i2c_write(cs42l42, 0x1120, 0x80);
-	/* Wait ~100us*/
-	usleep_range(100, 200);
+	/* Wait ~20ms*/
+	usleep_range(20000, 25000);
 	cs8409_i2c_write(cs42l42, 0x111f, 0x77);
 	cs8409_i2c_write(cs42l42, 0x1120, 0xc0);
 }
-- 
2.32.0


