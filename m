Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B405D1DF66A
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 11:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38ACA1864;
	Sat, 23 May 2020 11:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38ACA1864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590226691;
	bh=IP1yQeGuHyFbvO9JocIkhl9Z2YWDtJ/0AAFGaIhZxvc=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGK66X8c1/buqjns34udYVHSXnSV+u5jr4VWHsRaHhrO527WlMfdyUefO4TEpUQc6
	 HHGV60BCTc3EwIdu6IsaPTUpl37tiwfhjzJt6GpMHcop/6cTznXZZbBy3NLoPyr/as
	 kxMezQiA7DMqb0BMRD8Y1zjGM/ogrbRNEGYEeg+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 497AEF801A3;
	Sat, 23 May 2020 11:36:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF9DF801D8; Sat, 23 May 2020 11:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.noc-kru.de (smtp.noc-kru.de [88.218.226.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E912AF80121
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 11:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E912AF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=krude.de header.i=@krude.de
 header.b="D1/+Likt"
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mx.noc-kru.de (Postfix) with ESMTP id 25AA65A22A3
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 11:36:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at idefix.krude.de
Received: from smtp.noc-kru.de ([88.218.226.4])
 by localhost (idefix.noc-kru.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1jKc0P9hDgp for <alsa-devel@alsa-project.org>;
 Sat, 23 May 2020 11:36:16 +0200 (CEST)
Received: from phlox.h.transitiv.net
 (2001-4dd0-2d41-0-6d82-45af-e777-e8a7.ipv6dyn.netcologne.de
 [IPv6:2001:4dd0:2d41:0:6d82:45af:e777:e8a7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mx.noc-kru.de (Postfix) with ESMTPSA id 8D1DB5A2148
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 11:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=krude.de; s=mail;
 t=1590226576; bh=IP1yQeGuHyFbvO9JocIkhl9Z2YWDtJ/0AAFGaIhZxvc=;
 h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:From;
 b=D1/+LiktRwiMBhMfSF6vW7B9NHtJwRcZAWgH7G1a7uHkK8LjfJ6hnXK+bHLWWpna2
 UdD+33fzAOo3cTFy+BZWL1C/jge366R7HTRXT5oykIqOa34Oc/l0Scgh70waAeXmKj
 7vG7QIanbV/wsNwQmoOn6x+IbNfgAXEHwPElsTRA=
Resent-From: Johannes Krude <johannes@krude.de>
Resent-Date: Sat, 23 May 2020 11:36:12 +0200
Resent-Message-ID: <20200523093612.GA2921@phlox.h.transitiv.net>
Resent-To: alsa-devel@alsa-project.org
Date: Fri, 22 May 2020 17:08:34 +0200
From: Johannes Krude <johannes@krude.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: only first codec is master in multicodec setup
Message-ID: <20200522150829.GA115766@phlox.h.transitiv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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

When using multiple codecs, at most one codec should generate the master
clock. All codecs except the first are therefore configured for slave
mode.

Signed-off-by: Johannes Krude <johannes@krude.de>
---
 sound/soc/soc-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e697258d2..13a7d5b52 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1417,7 +1417,15 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	int ret;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
+		unsigned int codec_dai_fmt = dai_fmt;
+
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
2.25.1

