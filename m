Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1F4ED0B0
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 02:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752411AA9;
	Thu, 31 Mar 2022 02:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752411AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648685257;
	bh=kBqmLJyK45UwHLatmSNkgmTzdLqU4v/Zl/8onBfplDk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rgv5jKTmSbWKbvp9+BApc6GlaAKT79FbtruwCnhWWgRzd85XYf5W1hmCdV4p/pfaM
	 xlS/Pp2DRmO8sLFUYe/iAtRJ38cgUWL6XZpK6MLleeIFnVBoMNx2AcUoW1aRbLwX52
	 Xo2unSVMJItp6hZusBEioI8FmtBWMLjopbw3SwAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C2C9F804B4;
	Thu, 31 Mar 2022 02:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE992F80518; Thu, 31 Mar 2022 02:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98901F80254
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 02:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98901F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="aN/8a0qf"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648685132; bh=SeiIUiZeJW/WU1eEvgOIqMuWCeT5CiLubwaCNwTIB44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aN/8a0qfTlacb8dkUsL9qNzNhslN5RAhSevBw6Ynn92QaDWLBR/+XW0cT6sDqo6Mk
 E2/xOWMdeUhPjHnUAIK+KYx93csU11L+jqfr5v7cswdYDU5sktP9sBxD8hG1hNDJkl
 I7PW6+g6HIA4W7v9ejkAvnTSXoyvnLB22q6pz2To=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 3/5] HACK: ASoC: Tolerate N-cpus-to-M-codecs links
Date: Thu, 31 Mar 2022 02:04:47 +0200
Message-Id: <20220331000449.41062-4-povik+lin@cutebit.org>
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Tolerate N-to-M DAI links while using the first CPU DAI to decide
playback/capture abilities.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/soc-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9a954680d492..770cf367a147 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2781,9 +2781,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			} else if (rtd->num_cpus == rtd->num_codecs) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, i);
 			} else {
+#if 0
 				dev_err(rtd->card->dev,
 					"N cpus to M codecs link is not supported yet\n");
 				return -EINVAL;
+#endif
+				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			}
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-- 
2.33.0

