Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC32E201A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87F1517AD;
	Wed, 23 Dec 2020 18:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87F1517AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745585;
	bh=x1O5LgcbaHD9MxXgOnWSSaRI6s+WNBNY7Yke+Du5Xeo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TR4ZMFZYCCFOwqZfyisXDdvAZlOlY9gPp9ppGOFzynPFG/iAbfJUElCvhFcDKiFdE
	 JJjwoG7xMaE7hktG2lRnDCqs4QSNXgxaVdkHaImE9KKhwptqguRr3BUdK8j8Gw41L+
	 lWXMXfx4UJTE+sOt83fNottmwpGR47LX56XRRP0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E21F804CA;
	Wed, 23 Dec 2020 18:44:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CC8F8028D; Wed, 23 Dec 2020 18:44:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 426A9F80116
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 426A9F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="muEqi7OX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=vNAO0qpQTEDAwxeTeFUszTx4l2svQj0M41VpsnGx4uY=; b=muEqi7OX1Dg3vONGHcX9p7VM30
 SPDwE2LurcTsiXhMhQng8hqNK/tpxXKc1NaYf+D3W02sfIBe79/+IGq9Ct+7DsRlDgaUcbAl1cJ15
 4TM900q0SFxgunP0K5BTvuVqTxaXV3UGwBMe467/JBUZ5CYhI5yFrbq96LQNSIQy3vaSCrAoHoNJT
 jaDltVsJ376CbFFatpVeOqb+saNRnF8eB/HzVy8t/2ktUtZ/DzyJNfLEcBMF6eMaZ1sKLPPOT+Jw0
 au5ABlzR93WRVtOFHJbQMc0jEghjWfq7Xh+dxtdNH0EXYqnMXBOp/ASzTE1+5n1TaV9CQciOOmiLJ
 iwb1i9AA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks8Ba-0001Oe-Dv; Wed, 23 Dec 2020 18:44:30 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-MY; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 13/18] ALSA: oss: Use DIV_ROUND_CLOSEST() instead of
 open-coding it
Date: Wed, 23 Dec 2020 18:22:24 +0100
Message-Id: <20201223172229.781-13-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_CLOSEST() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-((x) + ((y) / 2)) / (y)
+DIV_ROUND_CLOSEST(x, y)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/core/oss/mixer_oss.c | 2 +-
 sound/core/oss/rate.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index f702c96a7478..af5de08f9819 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -418,7 +418,7 @@ static long snd_mixer_oss_conv(long val, long omin, long omax, long nmin, long n
 	
 	if (orange == 0)
 		return 0;
-	return ((nrange * (val - omin)) + (orange / 2)) / orange + nmin;
+	return DIV_ROUND_CLOSEST(nrange * (val - omin), orange) + nmin;
 }
 
 /* convert from alsa native to oss values (0-100) */
diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index d381f4c967c9..98269119347f 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -193,7 +193,7 @@ static snd_pcm_sframes_t rate_src_frames(struct snd_pcm_plugin *plugin, snd_pcm_
 	if (plugin->src_format.rate < plugin->dst_format.rate) {
 		res = (((frames * data->pitch) + (BITS/2)) >> SHIFT);
 	} else {
-		res = (((frames << SHIFT) + (data->pitch / 2)) / data->pitch);		
+		res = DIV_ROUND_CLOSEST(frames << SHIFT, data->pitch);
 	}
 	if (data->old_src_frames > 0) {
 		snd_pcm_sframes_t frames1 = frames, res1 = data->old_dst_frames;
@@ -224,7 +224,7 @@ static snd_pcm_sframes_t rate_dst_frames(struct snd_pcm_plugin *plugin, snd_pcm_
 		return 0;
 	data = (struct rate_priv *)plugin->extra_data;
 	if (plugin->src_format.rate < plugin->dst_format.rate) {
-		res = (((frames << SHIFT) + (data->pitch / 2)) / data->pitch);
+		res = DIV_ROUND_CLOSEST(frames << SHIFT, data->pitch);
 	} else {
 		res = (((frames * data->pitch) + (BITS/2)) >> SHIFT);
 	}
-- 
2.20.1

