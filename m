Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF05F9443
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496AD16DC;
	Mon, 10 Oct 2022 01:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496AD16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359667;
	bh=czNl4+zmuXGorycVi+NqCYslMNtgLRZLXGWQqwWbTkc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rU7bBuPLeY8crzHCmJ7t3mPhiU/jysV0XaK8owzvwpCqaMXunU2XSTTQVteNQHj1v
	 XfWm5vOet54dNXxMFEJPJqCW6FyGr88ZxJl6B0hXQqOOwofcXNMj6vyYbbCxBPPSjD
	 o1PdjmJfezl5v31cXjvp3JLpPLCIAbZOLIVRIqec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2AFDF80543;
	Mon, 10 Oct 2022 01:53:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E788F8053D; Mon, 10 Oct 2022 01:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 578CFF800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 578CFF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IZ+Du8KK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28C6760C2B;
 Sun,  9 Oct 2022 23:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D201C433D7;
 Sun,  9 Oct 2022 23:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359607;
 bh=czNl4+zmuXGorycVi+NqCYslMNtgLRZLXGWQqwWbTkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IZ+Du8KKOjgiCzHrSjpuJIHVrXsCfDseoeReD7oXVf9bUG2mB7TWTelkodsm4IkYj
 Le4fqWLEXk+is0d+Lw34BPhtyxxg6YvscBjrdrEFTtHk7hXrNrpRmtEnRDIucYcKKx
 zxSYU3AempnL/58BgRBJoO9iMPwF5Bso4AoZ21j5vwKr7fN2jk65Zsg+FpEqLES1r5
 YkCi2ScU5tpiMScV5k/u2mmoSS707VpSgvadGMIjwQVph+efYwX3V8e7kHdKfUjpzu
 VJzRAWcBifGPJ0qUOSGWruUO/bDVhhcONJCglYQare6KhlHiIVkgqqtPzAAZNf2XGN
 jcqlPt2P4fITg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 22/36] ALSA: intel-dspconfig: add ES8336 support
 for AlderLake-PS
Date: Sun,  9 Oct 2022 19:52:08 -0400
Message-Id: <20221009235222.1230786-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 gongjun.song@intel.com, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 yung-chuan.liao@linux.intel.com, brent.lu@intel.com
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

From: Muralidhar Reddy <muralidhar.reddy@intel.com>

[ Upstream commit 9db1c9fa214ef41d098633ff40a87284ca6e1870 ]

added quirks for ESS8336 for AlderLake-PS

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Muralidhar Reddy <muralidhar.reddy@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220919114548.42769-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index ec9cbb219bc1..dbc7dfd00c44 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -422,6 +422,11 @@ static const struct config_entry config_table[] = {
 		.device = 0x51cd,
 	},
 	/* Alderlake-PS */
+	{
+		.flags = FLAG_SOF,
+		.device = 0x51c9,
+		.codec_hid =  &essx_83x6,
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51c9,
-- 
2.35.1

