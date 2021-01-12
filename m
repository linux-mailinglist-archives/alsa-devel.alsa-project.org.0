Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22F2F2E06
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 12:36:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0141711;
	Tue, 12 Jan 2021 12:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0141711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610451394;
	bh=MNWtjLGXIsBoOASgCpkaETGDupDjv9oE33OA11OdNPQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lQj/B4TIk2JH+6pF9vrJiKsqdsCrWNBh4wLAcDhP7hfPQ5eAGK13ShKSDjZ2GvBkb
	 g0oCCHK155/YPeu+i+k8UFbxXvS8NdTduQbUcPUNexHemuC7fASTICSkwxZhYLBAI8
	 dB6rckCD84ja54hRiDkQsinYuZKpdnbujnOxsibk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 164D3F80249;
	Tue, 12 Jan 2021 12:35:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96361F80279; Tue, 12 Jan 2021 12:35:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4772DF80249
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 12:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4772DF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="wxIPdIzi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=swing;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
 :Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uReOs71RZn0WTIHwETVrS2W0wh2gn72icejRyoIHHa4=; b=wxIPdIziIFvGGDsIMJLezWKNE2
 Va431sOFrGLomIslDKF5AOIV13roEOndxrKlYoL9e3MXKrGW6Cykkcbuh9HznLmkx6FZSLULS7kRK
 jF2Ak22e0a6MzVJR3TNdGA/EW4jwJTEubfuQOOtdwMNqmNVFUcsmGqXfebI2iuj2kkeM=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
 by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1kzHxR-000FuI-C9
 for alsa-devel@alsa-project.org; Tue, 12 Jan 2021 11:35:29 +0000
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id fb736d5b
 for <alsa-devel@alsa-project.org>;
 Tue, 12 Jan 2021 11:35:27 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:35:26 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: alsa-lib: snd_pcm_plugin_status() recently broken
Message-ID: <2101121120040.30404@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

The following assertion:

  relay: pcm_plugin.c:570: snd_pcm_plugin_status: Assertion `status->appl_ptr == *pcm->appl.ptr' failed.

It bisects to 28cc099, the introduction of that assertion.

  #4  0x00007ffff7d0dd03 in snd_pcm_plugin_status (pcm=0x633560, 
      status=0x7fffffffe1e0) at pcm_plugin.c:570
  570                     assert(status->appl_ptr == *pcm->appl.ptr);
  (gdb) print status->appl_ptr
  $1 = 0
  (gdb) print pcm->appl.ptr
  $2 = (volatile snd_pcm_uframes_t *) 0x6334f8
  (gdb) print *pcm->appl.ptr
  $3 = 47936

The calling code is single threaded on a dmix device, with these 
operations in order:

  snd_pcm_avail_update();
  snd_pcm_status();
  snd_pcm_mmap_begin();

Commenting out the assertion leaves me with a credible result from the 
function as it did previously; snd_pcm_status_get_delay() == 64.

-- 
Mark


From 28cc099d9ea3962b033cb1cb9c3e07db828d9ff7 Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Sun, 3 Jan 2021 16:41:29 +0100
Subject: [PATCH] pcm: plugin - optimize sync in snd_pcm_plugin_status()

Do hw_ptr sync only once after the status call. This avoids
double update.

Also, the application pointer must not change when
the status is called. Add assert() call for this condition.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 src/pcm/pcm_plugin.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/src/pcm/pcm_plugin.c b/src/pcm/pcm_plugin.c
index 83793397..6a815145 100644
--- a/src/pcm/pcm_plugin.c
+++ b/src/pcm/pcm_plugin.c
@@ -553,14 +553,11 @@ static int snd_pcm_plugin_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	snd_pcm_plugin_t *plugin = pcm->private_data;
 	snd_pcm_sframes_t err;
 
-	/* sync with the latest hw and appl ptrs */
-	snd_pcm_plugin_avail_update(pcm);
-
 	err = snd_pcm_status(plugin->gen.slave, status);
 	if (err < 0)
 		return err;
-	status->appl_ptr = *pcm->appl.ptr;
-	status->hw_ptr = *pcm->hw.ptr;
+	assert(status->appl_ptr == *pcm->appl.ptr);
+	snd_pcm_plugin_sync_hw_ptr(pcm, status->hw_ptr, status->avail);
 	return 0;
 }
 
-- 
2.17.5

