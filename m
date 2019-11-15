Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8E7FDB61
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 11:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8F01615;
	Fri, 15 Nov 2019 11:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8F01615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573813761;
	bh=M5swG8FmBNx0NoniYtrMWZ+u7p+7Q+hLgws8PPrcaIY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FC1X+DiiL40X//lL1rF3WipItPC4dxUKpuoU1LHUZ9stTaSFoYQ9jZtLHSmnrADxb
	 Bhv3WDSMg5JONmOAFvIsph996KCxf02Y5l9JaGI+bL2nlWchED9LpJLreibH2jh42y
	 tb+biO7l9c/7QVCAwySZRI0za/NM69m3a7hCZQSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3013F80105;
	Fri, 15 Nov 2019 11:27:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40D83F80103; Fri, 15 Nov 2019 11:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBFE0F800FF
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 11:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFE0F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0pNE3cJF"
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89AB5206C0;
 Fri, 15 Nov 2019 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573813649;
 bh=3MTIp3EVNTi3pvV+fHXDuaEdbhizPCO8hiADThBPsC4=;
 h=From:To:Cc:Subject:Date:From;
 b=0pNE3cJFCKKJSbBsfE6KujE7e3TK1Rx5HbjMLI09Yc4TJ6W0YwH2R32B08BOYiyVu
 /QptkQZPCeK1MCCpBfuXbz2pjXbUHpythsdbzI80zSnRo4F7EgrSecjyjE4bQxHmJZ
 zbhEseG4zftbLT+1WnQpkRbxbaQK6L8cZxaowZoE=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Date: Fri, 15 Nov 2019 15:57:02 +0530
Message-Id: <20191115102705.649976-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RFC PATCH 0/3] ALSA: compress: Add support for FLAC
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

I think we should also bump the (minor) version if this proposal is
acceptable so the userspace can check and populate flac specific structure.

Along, with the core header change, patches are added to support FLAC
in Qualcomm drivers. This was tested on 96boards db845c

Srinivas Kandagatla (1):
  ASoC: qcom: q6asm: add support to flac config

Vinod Koul (2):
  ALSA: compress: add flac decoder params
  ASoC: qcom: q6asm-dai: add support to flac decoder

 include/uapi/sound/compress_params.h | 10 +++++
 sound/soc/qcom/qdsp6/q6asm-dai.c     | 35 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6asm.c         | 55 ++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h         | 15 ++++++++
 4 files changed, 114 insertions(+), 1 deletion(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
