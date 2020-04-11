Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5E31A560D
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 01:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9689316B4;
	Sun, 12 Apr 2020 01:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9689316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586646866;
	bh=gBIiINfZVDVqHSfSGPKg1OdDvQLhSXtd5hAhwzOamTM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kwj19Jk3IDH7svpqid5WBSFyd75roCr0jdrHwKVyCqQQfC2TaoWuAaCPnYAMJegLM
	 polGFN5GiK8qC3A47/OYFZd3Elbpo0VufT+h0r5vbchqTKEcvi46I4piAT0zNjs6JH
	 oSnbu1GoNcQWZKw7pRy810e1hPQeSLo9qSZr0Qbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33207F801DA;
	Sun, 12 Apr 2020 01:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B213F801F9; Sun, 12 Apr 2020 01:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D44BF8007E
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 01:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D44BF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BihWNkA6"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B51C21744;
 Sat, 11 Apr 2020 23:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646788;
 bh=gBIiINfZVDVqHSfSGPKg1OdDvQLhSXtd5hAhwzOamTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BihWNkA6UCrJ1GCaGZtvL+6wePsMIoPeo1iimruEsXVeY6UtqHudSw/WPx+ptFee/
 S5gMYWR6O0E/HJn6ai7mexyJIKChM+LKqLBbMjJYP2dqMA/7TUoH4r+Rnwig26oUpb
 NRO1MpHx6Wt396O1QsMd3NJV+3OmIE0RNj5MowF4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 53/66] ASoC: Intel: Skylake: Enable codec wakeup
 during chip init
Date: Sat, 11 Apr 2020 19:11:50 -0400
Message-Id: <20200411231203.25933-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231203.25933-1-sashal@kernel.org>
References: <20200411231203.25933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit e603f11d5df8997d104ab405ff27640b90baffaa ]

Follow the recommendation set by hda_intel.c and enable HDMI/DP codec
wakeup during bus initialization procedure. Disable wakeup once init
completes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-4-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/skylake/skl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 50f16a0f6535f..463078c2346f9 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -128,6 +128,7 @@ static int skl_init_chip(struct hdac_bus *bus, bool full_reset)
 	struct hdac_ext_link *hlink;
 	int ret;
 
+	snd_hdac_set_codec_wakeup(bus, true);
 	skl_enable_miscbdcge(bus->dev, false);
 	ret = snd_hdac_bus_init_chip(bus, full_reset);
 
@@ -136,6 +137,7 @@ static int skl_init_chip(struct hdac_bus *bus, bool full_reset)
 		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 
 	skl_enable_miscbdcge(bus->dev, true);
+	snd_hdac_set_codec_wakeup(bus, false);
 
 	return ret;
 }
-- 
2.20.1

