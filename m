Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAFD4EC0D3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20FC18C0;
	Wed, 30 Mar 2022 13:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20FC18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641238;
	bh=ESR58k0+i9Fcq2CL1NwXMkUZoliC3eLirvD6WS7Nz4E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSVA3rsaJ5n3NwkXaZ2EPqL/7rx1vsC/ewdMkABgy3ePwIINZAQ4GSqHEfg47baCN
	 VmYIeuMjwmo3PDjV7Li3vfvFJemXY6SXefROUmrvyfqJyQA4KKYMZiobP/OjJdfqQH
	 Nu8NS1wOupEOvYwsGVC4b+CwBDeQWMi4n9cc2VjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8E4F805B1;
	Wed, 30 Mar 2022 13:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7FF2F80589; Wed, 30 Mar 2022 13:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34EC1F8056F
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34EC1F8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VVwb4Kud"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A91886163F;
 Wed, 30 Mar 2022 11:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23FDC34112;
 Wed, 30 Mar 2022 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640896;
 bh=ESR58k0+i9Fcq2CL1NwXMkUZoliC3eLirvD6WS7Nz4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VVwb4Kudegm6xzzzcGg8Go2dn83sEGEz2jjVnuzRjp+6K0Do131AuzLIpifWqoVU9
 XtbMt6fqvTwCrqj9uFSRlvX6yiI3E4/v/c888whd+6wvO9uJjr7e+y7W7emqq5si7K
 s1YLALGWMpQ3P9NV9SYR2GWhR+F+tlo//ELFhvZrcIoc9CKybFhPyDj5ZwuIRrHaPa
 JBuUWcT5V1RRcnaV6coozfLe2Ci978Tzg8MFAv5B6ZJV/FT0HeHTHmn7x59RgPVm78
 +GbPA4Up4jRfMi6lFA/o5J8+RF6+LIy6h/lE/nVAgxWcRNYqUZYZOhqCizm8bqppvt
 +ForFtUMZDBnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 57/66] ALSA: intel-dspconfig: add ES8336 support
 for CNL
Date: Wed, 30 Mar 2022 07:46:36 -0400
Message-Id: <20220330114646.1669334-57-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit cded07a2dccd5493696a3adce175f01e413423c6 ]

We're missing this check for the CNL PCI id

Reported-by: Nikolai Kostrigin <nickel@altlinux.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Acked-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20220308192610.392950-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b9b7bf5a5553..70fd8b13938e 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -199,6 +199,11 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = 0x09dc8,
+		.codec_hid =  &essx_83x6,
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x9dc8,
-- 
2.34.1

