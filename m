Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C751671CA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 08:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4C016B5;
	Fri, 21 Feb 2020 08:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4C016B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582271845;
	bh=J12BU6v6skinvk/5A45oPZq3RlG0T1+MQhN1yxEUabk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8zZVHI4/3cZdvZkNxEGwKNmXaKikFvrovwvSOCGhhHboe6D32eZ2JP8r80BIY44Q
	 ZNB7ZjnNfjNBdmuNhubs8fPl/SZQqsIj1W5OcO3FfkxWnSfr8+12WGA0f2RWEb+wpb
	 +hG+MwpirlVeeUMCJdqUkeRoARK7bq+Nos2MMEO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 378D7F80273;
	Fri, 21 Feb 2020 08:55:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A32F8025F; Fri, 21 Feb 2020 08:55:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A575CF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 08:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A575CF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Igu85J2Z"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4852C222C4;
 Fri, 21 Feb 2020 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582271734;
 bh=J12BU6v6skinvk/5A45oPZq3RlG0T1+MQhN1yxEUabk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Igu85J2ZVC8jQDVOMtvergSNzYcQzhBBHnPAXB4K1eEXxLl5rHFzQvhzhlfUCD/qN
 t1+kVw7qzbh2G0IpVVgFZFKjbl7wbZAvnWpdUULpPtkvYWQSKKvwz32/tBBhJnGOQl
 1O5o3VmB2MdVt7/st0TBJ7/LgO9r1zTkd06oyfjU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.5 241/399] ASoC: txx9: Remove unused rtd variable
Date: Fri, 21 Feb 2020 08:39:26 +0100
Message-Id: <20200221072425.963014211@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221072402.315346745@linuxfoundation.org>
References: <20200221072402.315346745@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Paul Burton <paulburton@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
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

From: Paul Burton <paulburton@kernel.org>

[ Upstream commit ec0f6a4c4a987aa20b2e77e0db2ae555276e45e6 ]

Commit a857e073ffc6 ("ASoC: txx9: txx9aclc: remove snd_pcm_ops") removed
the last use of the rtd variable but didn't remove its definition,
leading to the following warning/error for MIPS rbtx49xx_defconfig
builds:

sound/soc/txx9/txx9aclc.c: In function 'txx9aclc_pcm_hw_params':
sound/soc/txx9/txx9aclc.c:54:30: error: unused variable 'rtd'
    [-Werror=unused-variable]
  struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
                              ^~~

Resolve this by removing the unused variable.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Fixes: a857e073ffc6 ("ASoC: txx9: txx9aclc: remove snd_pcm_ops")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20200109191422.334516-1-paulburton@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/txx9/txx9aclc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 33c78d33e5a1d..9a55926ebf07b 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -51,7 +51,6 @@ static int txx9aclc_pcm_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct txx9aclc_dmadata *dmadata = runtime->private_data;
 	int ret;
-- 
2.20.1



