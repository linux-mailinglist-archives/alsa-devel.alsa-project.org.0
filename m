Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DE106F3
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 12:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9877616E5;
	Wed,  1 May 2019 12:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9877616E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556706308;
	bh=LNXxsO1QcEA20/8z2qgUtQ6u9Nmr1hfvkr1MdK6Q/LI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3OoKs0fox509tdPYExlwJxQwhk3b4Q3DlYus7dx1hNKYXJ4d0OLhx0WKR/p/1AFu
	 IKE0zxVrX7AXK+MNveR9KcBYPjuOqyaUZscQYI+s6kwFDMtDieUyaCCvOElvRZzbKF
	 MALkDPHWKPARbzQs+nL0r5G/SO6BrP0SN6TpSUDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3D9F896CB;
	Wed,  1 May 2019 12:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD32EF896B7; Wed,  1 May 2019 12:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CF14F8065C
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 12:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF14F8065C
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hLmOL-0004HA-AE; Wed, 01 May 2019 10:23:09 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 11:23:08 +0100
Message-Id: <20190501102308.30390-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH][next] ASoC: SOF: Intel: fix spelling mistake
	"incompatble" -> "incompatible"
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a hda_dsp_rom_msg message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b8fc19790f3b..84baf275b467 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -54,7 +54,7 @@ static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
 	{HDA_DSP_ROM_L2_CACHE_ERROR, "error: L2 cache error"},
 	{HDA_DSP_ROM_LOAD_OFFSET_TO_SMALL, "error: load offset too small"},
 	{HDA_DSP_ROM_API_PTR_INVALID, "error: API ptr invalid"},
-	{HDA_DSP_ROM_BASEFW_INCOMPAT, "error: base fw incompatble"},
+	{HDA_DSP_ROM_BASEFW_INCOMPAT, "error: base fw incompatible"},
 	{HDA_DSP_ROM_UNHANDLED_INTERRUPT, "error: unhandled interrupt"},
 	{HDA_DSP_ROM_MEMORY_HOLE_ECC, "error: ECC memory hole"},
 	{HDA_DSP_ROM_KERNEL_EXCEPTION, "error: kernel exception"},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
