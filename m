Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737F1044FF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 21:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E1416DA;
	Wed, 20 Nov 2019 21:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E1416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574281533;
	bh=AYEFALDHT222pWx8/9fIsM6YTdY0Jb6YW4yPAxATFSU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=goPg3BfzgATWDkSWfRgn98Dpzu2G+t/1IuKgzamsUPW1EgaKJlSs6O/cs2TwliClX
	 AvHOxCEYBQace+SwQ1QX4L2rJIVJmIBrUkEYuYrwtGPRvQfZoToKxkgj6h7we2mjss
	 Hw8hR5x2+BMz1UcC+OnmbesER7OjsCnqO2Qcfzus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 696A3F8013F;
	Wed, 20 Nov 2019 21:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB1BF8013D; Wed, 20 Nov 2019 21:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.noc-kru.de (smtp.noc-kru.de [88.218.226.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37EC9F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 21:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37EC9F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=krude.de header.i=@krude.de
 header.b="bgw0iKs4"
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mx.noc-kru.de (Postfix) with ESMTP id 808F25A20FA;
 Wed, 20 Nov 2019 21:23:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at idefix.krude.de
Received: from smtp.noc-kru.de ([88.218.226.4])
 by localhost (idefix.noc-kru.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HinDjdqxgF5H; Wed, 20 Nov 2019 21:23:39 +0100 (CET)
Received: from phlox.h.transitiv.net
 (2001-4dd0-2d41-0-504-2eb-3357-9f2b.ipv6dyn.netcologne.de
 [IPv6:2001:4dd0:2d41:0:504:2eb:3357:9f2b])
 (using TLSv1.2 with cipher DHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (Client did not present a certificate)
 by mx.noc-kru.de (Postfix) with ESMTPSA id 5145A5A21D9;
 Wed, 20 Nov 2019 21:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=krude.de; s=mail;
 t=1574281419; bh=svCBG++UX037Xxz5z+dkMnxZma9y1/ueSMW0Rq7VhhM=;
 h=Date:From:To:Cc:Subject:From;
 b=bgw0iKs4ph4+NN6r2h66E0I2Ct/wfEttZTAZMEf9V63XKpoq1ZDvN4xQ5nJ9nJgrM
 M0OQtLeip36/jN2IqgVIpaOigbg6VrFlSoo/YS26FLWxE7Z6oLNuU6jFsYwayRpaXw
 SjfoHAMAyhjy490/GdUD0TDPqIPp0ZHKLps57UVg=
Date: Wed, 20 Nov 2019 21:23:34 +0100
From: Johannes Krude <johannes@krude.de>
To: alsa-devel@alsa-project.org
Message-ID: <20191120202334.GA4579@phlox.h.transitiv.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH] sound/soc: only first codec is master in
	multicodec setup
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

When using multiple codecs, at most one codec should generate the master
clock. All codecs except the first are therefore configured for slave
mode. Before this patch all codecs in a multicodec setup had to be 
slaves. This is needed when e.g., connecting multiple sound hats for 
simultaneous playback to the raspberry pi I2S output and one of the 
sound hats generates the I2S clocks 
(https://github.com/raspberrypi/linux/pull/3337).

I checked the raspberry pi kernel tree for multicodec usage with
`fgrep num_codecs -R sound/soc/` and verified that all existing 
multicodec drivers with hardcoded format have indeed configured all 
codecs for slave mode. Doing a similar check on the current for-5.5 tree 
is more difficult since .num_codecs is now hidden behind a preprocessor 
macro.

Signed-off-by: Johannes Krude <johannes@krude.de>
---
 sound/soc/soc-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 058e038df..cb8952527 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1688,6 +1688,14 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		unsigned int codec_dai_fmt = dai_fmt;
+
-		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
+		// there can only be one master when using multiple codecs
+		if (i && (codec_dai_fmt & SND_SOC_DAIFMT_MASTER_MASK)) {
+			codec_dai_fmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
+			codec_dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		}
+
+		ret = snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_warn(codec_dai->dev,
 				 "ASoC: Failed to set DAI format: %d\n", ret);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
