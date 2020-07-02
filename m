Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F93212069
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 11:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF3616DB;
	Thu,  2 Jul 2020 11:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF3616DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593683743;
	bh=lJzfA7AcKSurYZeRDXy0lFMGhOMsaMjwM7Lcqz95NOc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtvueHMXOeh4m8x0O1R0dig5b+ECjchCKpE9E4FaIUkcxOCkUhvNIhp/VG4YjKi0T
	 VqCXlqCRINx8gg0y9vF0YIsHMWz31hi5hrMjJlDw7rY9CbtRQYl6jJCb/oEV+dhrm2
	 2tj0YOJhIAg5lWXCgACThMeguwgFOUV0JLDfePkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC391F800ED;
	Thu,  2 Jul 2020 11:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90603F8022D; Thu,  2 Jul 2020 11:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 914DAF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 11:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914DAF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="uQ46cWuX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5EksP0KRuehAWHUCa3CHOPauq8Sx4MlqVo0ALYHv/dY=; b=uQ46cWuXz+OlVm2pwgeqEjRRyk
 y4VDd+pkS88ZlECDs/2yA1PEHur1MLql4mOlwCiAwA/ZAds3ADvfM8S4vP0UKnQSrfY2+aPa0CJe1
 NVwbTBxdTtnXPyPWaClSnstnhY+4RPt80s5DrHX3jPevJ64ZHmX2g07M21eqB8B2OOJjB/bMFKN60
 ez2erhsLdvZhmzZKNAbMMCLAkoSvHZHhE6c3l8a4rUOPfzlyEP9NaxjlxIHAEEnWrQZWHi+mrkI/0
 3L0Tw2IXhXadDccsyl0P2pX+Tl10F8ZKTmxBLnEJpCAhXU0q6FfK0Epf9ONUktEpqHNz/JX9L/h+v
 y0pIuN/g==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jqvuh-000Brl-Qp; Thu, 02 Jul 2020 10:53:51 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jqvuh-0002iu-Gu; Thu, 02 Jul 2020 10:53:51 +0100
Date: Thu, 2 Jul 2020 10:53:51 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] echoaudio: Race conditions around "opencount"
In-Reply-To: <202007020108.pW8giznF%lkp@intel.com>
Message-ID: <2007021037270.2435@stax.localdomain>
References: <20200701122723.17814-1-mark@xwax.org>
 <202007020108.pW8giznF%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

Takashi, my apologies, it looks like this patch broke the build of the 
Mona driver.

Thankfully the change is simple, as it just looks like a bit of confusion 
of responsibilies in the code for the Mona interface; the correct fix is 
to remove the code.

That is a lesson for working with only the echo3g driver enabled. Now I 
have done a full build of all echoaudio drivers, with no warnings or 
errors.

Here's a patch, or it can be squashed into the original patch if 
necessary.

-- 
Mark


From 3c56faaa51436ca08dfe107aa1b06162904c216f Mon Sep 17 00:00:00 2001
From: Mark Hills <mark@xwax.org>
Date: Thu, 2 Jul 2020 10:25:43 +0100
Subject: [PATCH] echoaudio: The Mona build was broken by changes to opencount

The correct fix is to remove this check as it is always false.

It's not the responsibilty of the device-specific driver to make
this check, as it is already checked in snd_echo_digital_mode_put
before this code is called.

I do not have a Mona interface to test this change.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/mona_dsp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/echoaudio/mona_dsp.c b/sound/pci/echoaudio/mona_dsp.c
index dce9e57d01c4..f77db83dd73d 100644
--- a/sound/pci/echoaudio/mona_dsp.c
+++ b/sound/pci/echoaudio/mona_dsp.c
@@ -300,11 +300,6 @@ static int set_input_clock(struct echoaudio *chip, u16 clock)
 	u32 control_reg, clocks_from_dsp;
 	int err;
 
-
-	/* Prevent two simultaneous calls to switch_asic() */
-	if (atomic_read(&chip->opencount))
-		return -EAGAIN;
-
 	/* Mask off the clock select bits */
 	control_reg = le32_to_cpu(chip->comm_page->control_register) &
 		GML_CLOCK_CLEAR_MASK;
-- 
2.17.5

