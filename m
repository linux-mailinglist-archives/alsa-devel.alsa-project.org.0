Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774642792
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 15:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE651742;
	Wed, 12 Jun 2019 15:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE651742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560346367;
	bh=e8KpVdz+3QD8iVnE8Aw217cKh6+XlGLT7m8bo6NbK8U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RWHaSkP0PRgCGQSGy0U96zTiL0gr25Mx71YpSxobLOxSMOvgsMBqxa27ho3YRS3d3
	 +meAatPuBYSYMpZxhnLuBlMLPdPtlOYRf5O1ICiJGs1EvsOWGCQzSHw6BSyeMqBCI3
	 k2qbFIZePGQfsimuFdpljlRDarjVm52C7GylRpMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B94F8F89728;
	Wed, 12 Jun 2019 15:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E10EF8970C; Wed, 12 Jun 2019 15:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9EABF80794
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 15:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9EABF80794
Received: from [167.98.27.226] (helo=xylophone.i.decadent.org.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hb3Ku-0003vA-Ci; Wed, 12 Jun 2019 14:30:44 +0100
Date: Wed, 12 Jun 2019 14:30:40 +0100
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Message-ID: <20190612133040.5kgtio7gidxx64gh@xylophone.i.decadent.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, Gen Zhang <blackgod016574@gmail.com>
Subject: [alsa-devel] [PATCH] Revert "wcd9335: fix a incorrect use of
	kstrndup()"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit a54988113985ca22e414e132054f234fc8a92604.
The strings being duplicated are not fixed-length, so kstrndup()
is the correct function to use.

Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
---
 sound/soc/codecs/wcd9335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 85737fe54474..a04a7cedd99d 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2734,7 +2734,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);
+	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
 	if (!widget_name)
 		return -ENOMEM;
 
-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
