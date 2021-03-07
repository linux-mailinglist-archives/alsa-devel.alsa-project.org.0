Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221A330468
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 21:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A5E18F9;
	Sun,  7 Mar 2021 21:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A5E18F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615147513;
	bh=Wmj2zpdQmIMbSwZCxl4yeiGgswPpCpbQl34Nqym2DWg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRmIcMvF4RciatHk6vnu5KcWX0YSmAfbYgfxSWf/6u1lBMMBgk2FdrHOiqvYzlxOr
	 KzDUyslv7bUTZhyrjbZugMElUHowKAfGSSuFJgjwGNzWwBMAYKsa+xmjqe6PZbVMgV
	 A1TKkbQCDNZGHF2qSAXbnJgjKGtQ1E8RnvSP5iRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A8DF80139;
	Sun,  7 Mar 2021 21:03:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E45FF80275; Sun,  7 Mar 2021 21:03:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCE7BF800ED
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 21:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE7BF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OHpkbcX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615147398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+nhyO38vizETGP7h3BJpXv/cVrIDfIU9N1mcLpZy7c=;
 b=OHpkbcX4rqhm12dIzGnHV/V8Fw/F0LeGuG5/D0wIsf9RIg9WqOjB/EvqMHJiQDN8JJ5ZIw
 qFlzOK8S/9/QkdNi6n0WBcsC52zM5RZVzuOeKg19EfWXOHs5LZUK/PvHWHbOCEY8q2wPgq
 Wdb1AzybVXdy11ovkx63uqp+R5t1R+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-q0Y8eOZTN0GAUYm-kw2SMw-1; Sun, 07 Mar 2021 15:03:14 -0500
X-MC-Unique: q0Y8eOZTN0GAUYm-kw2SMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97BD1108BD06;
 Sun,  7 Mar 2021 20:03:13 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35E5310016F9;
 Sun,  7 Mar 2021 20:03:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 2/3] codecs/es8316: Fix 'HP Mixer Volume' setting
Date: Sun,  7 Mar 2021 21:03:07 +0100
Message-Id: <20210307200308.136385-2-hdegoede@redhat.com>
In-Reply-To: <20210307200308.136385-1-hdegoede@redhat.com>
References: <20210307200308.136385-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

The 'HP Mixer Volume' control is interesting in that it has a hole
in its range which should not be used (described in the tlv table),
valid values are 0-4 and 8-11

I assume that the "Set HP mixer vol to -6 dB (4/7) louder does not work"
comment which this patch changes comes from attempts to use values in
that hole in the range (also notice the wrong max value in the comment).

Setting the HP mixer to -6 dB causes the sound to be significantly
softer then under Windows. This commit fixes this by initializing the
HP mixer control to 11 / 0 dB.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/es8316/EnableSeq.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ucm2/codecs/es8316/EnableSeq.conf b/ucm2/codecs/es8316/EnableSeq.conf
index 272ef1a..147ce53 100644
--- a/ucm2/codecs/es8316/EnableSeq.conf
+++ b/ucm2/codecs/es8316/EnableSeq.conf
@@ -7,8 +7,8 @@ EnableSequence [
 
 	# Set HP vol to 0 dB (3/3)
 	cset "name='Headphone Playback Volume' 3"
-	# Set HP mixer vol to -6 dB (4/7) louder does not work
-	cset "name='Headphone Mixer Volume' 4"
+	# Set HP mixer vol to 0 dB 
+	cset "name='Headphone Mixer Volume' 11"
 	# Set DAC vol to 0 dB (192/192)
 	cset "name='DAC Playback Volume' 192"
 
-- 
2.30.1

