Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C894EC1B7
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF3A18FA;
	Wed, 30 Mar 2022 13:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF3A18FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641484;
	bh=v1luuvpj5UTKQupxrRu/rhsBPsNSE/Jx1YwX0tOiZ3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nK5L6jI7pIN+XeNvKp5Z7u/xogo0B+PceVfUNpobvktsM2YAZ9k2BdLhmJHxw19ix
	 uPpoFIGab1b2NiCvPXEJqk7w2IHy+hFPxFJgSTWwtWMJlcM3u9KpHai1C9kxItxZfh
	 tkLgZ0qQAHUGefGJQgQ0voZBlsvHpFS8aoZEFIiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F21F8052E;
	Wed, 30 Mar 2022 13:49:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3761F805FB; Wed, 30 Mar 2022 13:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5386F805F7
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5386F805F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sZWHiwuG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 209CDB81C28;
 Wed, 30 Mar 2022 11:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FD4C340EE;
 Wed, 30 Mar 2022 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640982;
 bh=v1luuvpj5UTKQupxrRu/rhsBPsNSE/Jx1YwX0tOiZ3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sZWHiwuGqlLW1c8voCZk4tS8lex4t0Sis/xZwkStFSgr/qRB9m9L7hBkrXFOmqsgi
 eA5lE4Qoy6XhBk7bCiezc1C4jenaLPKKG9YKMlVgbO+IYmuU5U30PENpxF7nfs213j
 Agp4ClVd8E8zzqxkaovzZUV76sn33HfZm7b/9P7/Gd4UMZLMYafgg1WSv9sbNYqGXB
 yEbX/oCWIhQghK84+tEh2IVVx5Lm/IcayYd2/lOFIy+/oFtiVEpV3Xb79mn7Q7dSHD
 850msC16xvlCd1SiXiyheWL5IMZEIQhCixMhTCwXyMM9OmUqYO0H8XJWGea4YotW3U
 w+txDPgdGPc2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 45/59] ASoC: amd: vangogh: fix uninitialized
 symbol warning in machine driver
Date: Wed, 30 Mar 2022 07:48:17 -0400
Message-Id: <20220330114831.1670235-45-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[ Upstream commit 6f989800639a7a29ab9a02e165b04dc144dd4f2b ]

Fixed below smatch static checker warning.
sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params()
error: uninitialized symbol 'ret'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20220225193054.24916-4-Vijendar.Mukunda@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 14cf325e4b23..5d7a17755fa7 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -165,6 +165,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	unsigned int num_codecs = rtd->num_codecs;
 	unsigned int bclk_val;
 
+	ret = 0;
 	for (i = 0; i < num_codecs; i++) {
 		codec_dai = asoc_rtd_to_codec(rtd, i);
 		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
-- 
2.34.1

