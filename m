Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EE2ECF5A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 13:09:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845201681;
	Thu,  7 Jan 2021 13:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845201681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610021384;
	bh=nLbMsXzHeMvaB60dtUxYrznBcQpy1jT3ZXpYyfnyxds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=igef8VgXFyp32Qo/MJVnbISLAUfyQKW8pycDYpbjJIXZMQzQWdToUtFMhqPCTn/pc
	 maxrw2SFK/JqIm3Vv+llMIa3v6rwKNKf28IhCfs3ZILJ8mBHaoZVEz39Vo260U1BFy
	 BisnXHRhBhqpNzExmP0Jr1CEMY1JcYQM1ZA1Hsjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE42F80258;
	Thu,  7 Jan 2021 13:08:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F345F80258; Thu,  7 Jan 2021 13:08:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F7E4F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 13:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7E4F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VtZ3VImg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610021285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dclVRl4AvLjpUYzjvBr6r3I2uV6SBIZbF0M5sY+YGso=;
 b=VtZ3VImglhFOVPBPKQxEzZhcABE+PYOEsrCpw9XvO/CePXj2QzPy1g3opObvfL4j+6XmJO
 QQkLSl7N0Xy66NvlyYQGwjSMGXPxUsJ9VzknKwtBWvZ80WWU2GExC8PR0pd1wK1+2nNIGY
 fWW8kkt1rf9/oRJpUrY7zMEUcGH0V1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-IfyUBBIvPR2UEogtkUuihg-1; Thu, 07 Jan 2021 07:08:01 -0500
X-MC-Unique: IfyUBBIvPR2UEogtkUuihg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C5E107ACE3;
 Thu,  7 Jan 2021 12:07:59 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-236.ams2.redhat.com [10.36.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBC8C1001281;
 Thu,  7 Jan 2021 12:07:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: bytcht_es8316: Remove comment about SSP0 being
 untested
Date: Thu,  7 Jan 2021 13:07:57 +0100
Message-Id: <20210107120757.12051-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Remove a stale comment about SSP0 being untested, the
bytcht_es8316 has supported SSP0 for a while now and this has
been successfully tested on a GP electrinic T701 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 892cf684216e..06df2d46d910 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -331,9 +331,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 
 		/* back ends */
 	{
-		/* Only SSP2 has been tested here, so BYT-CR platforms that
-		 * require SSP0 will not work.
-		 */
 		.name = "SSP2-Codec",
 		.id = 0,
 		.no_pcm = 1,
-- 
2.28.0

