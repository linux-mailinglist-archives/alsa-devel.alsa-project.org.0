Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC030C30B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020F6175C;
	Tue,  2 Feb 2021 16:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020F6175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612278537;
	bh=NOcRe0VCK/Dl7v9QBx5nOMkcdzVJUUGVG2DqpXFpPcI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T11ops0M0F0JGZT1lIKak3YOvZgf34Lvv67Je9NiJlSeAmO43WDzpp/Ki4rA6NIA5
	 HdSlDSdax55PhbQJ8DWegAmBML0PzEwhk6hoMBY2DDYMyKrOgS+TbU7SnELIf7We6f
	 oVj6vRmpVjCl9av9riWvYJHbo4WXsi+UzSfq8dg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADEFF8023E;
	Tue,  2 Feb 2021 16:06:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E486F8025D; Tue,  2 Feb 2021 16:06:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 206FCF80152
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:06:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 206FCF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pWd7wAuX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7409664E8C;
 Tue,  2 Feb 2021 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612278389;
 bh=NOcRe0VCK/Dl7v9QBx5nOMkcdzVJUUGVG2DqpXFpPcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pWd7wAuXzDRbV6r9586bg/orrGun/9o2Sh7sLT9533KjNApGp/zRGWveLyEr3X3r9
 964VFMLxzRNWpYdVBoVeYlCNMMI14MTdELcKXIicllU7HhFL6SFy9rXJYx1Tm4+ot/
 TVXlVJYJlx/M154nIv+KrogO/JlKwm4RtKNLEEP7vRknx8fuAXGP50iCuT1dX4MmH9
 VgLnEy4UQLtVP4U5dXm4Y21ED87lBxSEhjW+Z2sQVlOVQCQp+DjrnCFEqC0ohdPZpJ
 F85YEexEQRWKymQ4kXjVu3Rj0W+97Z2EvQ1Lh49CEmC+rG8tGW1Wty7ltwVIkPPr+K
 L1xggGAKWao3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 10/25] ALSA: hda: intel-dsp-config: add PCI id
 for TGL-H
Date: Tue,  2 Feb 2021 10:06:00 -0500
Message-Id: <20210202150615.1864175-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202150615.1864175-1-sashal@kernel.org>
References: <20210202150615.1864175-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Xiuli Pan <xiuli.pan@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Bard Liao <bard.liao@intel.com>

[ Upstream commit c5b5ff607d6fe5f4284acabd07066f96ecf96ac4 ]

Adding PCI id for TGL-H. Like for other TGL platforms, SOF is used if
Soundwire codecs or PCH-DMIC is detected.

Signed-off-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Xiuli Pan <xiuli.pan@intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20210125083051.828205-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 1c5114dedda92..fe49e9a97f0ec 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -306,6 +306,10 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0xa0c8,
 	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x43c8,
+	},
 #endif
 
 /* Elkhart Lake */
-- 
2.27.0

