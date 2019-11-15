Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73564FDB67
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 11:30:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAD8F1616;
	Fri, 15 Nov 2019 11:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAD8F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573813808;
	bh=rKKD7uTSggPrEX0Examk9TXazoAF5TkOfdQ1UznFqqQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvsW/8BYUeFUyoTeORcbZcSCpeTTXLsy4+mgU0fDN9MITAbR2xRlqSg4teVXuJg9s
	 YJKOHPCVQumSf5S3K7KACbWFY+srdVgxp1rSnbBM2pCwzqTg7Q2AzEJJUhdn0FGCfW
	 SNMuekd9/TUZrAXrfZ+DIOp3bXvWpP7kN5jahudY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CCCF80109;
	Fri, 15 Nov 2019 11:27:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D289F80108; Fri, 15 Nov 2019 11:27:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F29F800FF
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 11:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F29F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fEDenBFl"
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C866206DB;
 Fri, 15 Nov 2019 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573813654;
 bh=bxGJpK7tv7bQQozkMi1XqMUsT6+l0OMXL5gob7QPqgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEDenBFl6KVKiecFUu8HgEUpWy3sCD5ee//Xa4t73KpmsONmOp0KF0/M3T+t+HX5X
 Ndu3gZi7a32+shXpgB9uJ4S8j2jFZQYqv9OLXnSMi6u/007ILHDkd0kOetTnSVcHrO
 3bxc3r08CpP2WLbThfCgBT9BfAItGGE+Sipg2f1Q=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Fri, 15 Nov 2019 15:57:03 +0530
Message-Id: <20191115102705.649976-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115102705.649976-1-vkoul@kernel.org>
References: <20191115102705.649976-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RFC PATCH 1/3] ALSA: compress: add flac decoder params
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

The current design of sending codec parameters assumes that decoders
will have parsers so they can parse the encoded stream for parameters
and configure the decoder.

But this assumption may not be universally true and we know some DSPs
which do not contain the parsers so additional parameters are required
to be passed.

So add these parameters starting with FLAC decoder. The size of
snd_codec_options is still 120 bytes after this change (due to this
being a union)

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index 3d4d6de66a17..9c96fb0e4d90 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -317,12 +317,22 @@ struct snd_enc_generic {
 	__s32 reserved[15];	/* Can be used for SND_AUDIOCODEC_BESPOKE */
 } __attribute__((packed, aligned(4)));
 
+struct snd_dec_flac {
+	__u16 sample_size;
+	__u16 min_blk_size;
+	__u16 max_blk_size;
+	__u16 min_frame_size;
+	__u16 max_frame_size;
+	__u16 reserved;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
 	struct snd_enc_real real;
 	struct snd_enc_flac flac;
 	struct snd_enc_generic generic;
+	struct snd_dec_flac flac_d;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
