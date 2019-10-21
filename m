Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C20DF4B0
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 20:04:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E9E166C;
	Mon, 21 Oct 2019 20:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E9E166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571681053;
	bh=/PrbPI1nxwpQAHVTW6Xro8qMWGnBdlhprbo25W77rrM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IqfyET8txcjVpnSmUfz0Ka5Coc2uF3ueCU4pP8JYf4boxmWQBVMSrEg4yVpqmHDdV
	 YYg3FxFg9fwBmSZD+S4Zs3ljgd7ojIIxkt5s7A4GtNF6SEyufnlKn6GiS/asIVsLoO
	 oIAocVo0EBSUMFPuKpCTeLRKkKcLLjYadgn04afw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B40F805FE;
	Mon, 21 Oct 2019 20:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CED0F805FC; Mon, 21 Oct 2019 20:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31010F8036F
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 20:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31010F8036F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="V7gI5yvw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=b9z1pQ9mAvur/PgoNbDLn3mafTIDh3+vOexkqZCw3Pk=; b=V7gI5yvwfWPK
 ev+AIZPUPowyVb68gJVUr5k1/A2qthQ5ur7XAVLAbXxbfJ/wj6oGRD9Tk2DXEfrlH9/2MQAMl5oeO
 PqAKDrpBRzWsYpmb9W7o1V5AkJd0puMtvhFDQAdc7lslsXgwuXRNSN9O0Irvtm7CjIeEmi/rtllK9
 1DGeA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMbz5-0004bn-FO; Mon, 21 Oct 2019 18:00:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B95582743297; Mon, 21 Oct 2019 19:00:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Xiaojun Sang <xsang@codeaurora.org>
In-Reply-To: <20191021095432.5639-1-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20191021180046.B95582743297@ypsilon.sirena.org.uk>
Date: Mon, 21 Oct 2019 19:00:46 +0100 (BST)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, tiwai@suse.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] Applied "ASoC: compress: fix unsigned integer overflow
	check" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: compress: fix unsigned integer overflow check

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d3645b055399538415586ebaacaedebc1e5899b0 Mon Sep 17 00:00:00 2001
From: Xiaojun Sang <xsang@codeaurora.org>
Date: Mon, 21 Oct 2019 10:54:32 +0100
Subject: [PATCH] ASoC: compress: fix unsigned integer overflow check

Parameter fragments and fragment_size are type of u32. U32_MAX is
the correct check.

Signed-off-by: Xiaojun Sang <xsang@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20191021095432.5639-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/core/compress_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 99b882158705..942af8c29b79 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -528,7 +528,7 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 {
 	/* first let's check the buffer parameter's */
 	if (params->buffer.fragment_size == 0 ||
-	    params->buffer.fragments > INT_MAX / params->buffer.fragment_size ||
+	    params->buffer.fragments > U32_MAX / params->buffer.fragment_size ||
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
