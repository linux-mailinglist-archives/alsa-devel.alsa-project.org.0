Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D0C507750
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 20:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DC281941;
	Tue, 19 Apr 2022 20:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DC281941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650391983;
	bh=LvnkFNrz/vSm7u8FmLhD5GqqbL3/DLWRoe48drE1qRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eyijo6vdno4ql/tOuFaHkBVEcaDhXA+Ik+BidN4Ihpi19pO+eAAMU9dY1DtGUTatp
	 xaHWNOpaY1GI5pJDgb/bRAmfjmanzYwo9Ymurk7KtJ9UPSNU/Uobj4/ua084AroUWC
	 BzPt8nUZ7ySZnTbDHjvJDWG5yA520YnZwk67ybSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97018F80116;
	Tue, 19 Apr 2022 20:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16168F804FD; Tue, 19 Apr 2022 20:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0352F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 20:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0352F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a1vKQfiu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B47160C92;
 Tue, 19 Apr 2022 18:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B01C385A5;
 Tue, 19 Apr 2022 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650391898;
 bh=LvnkFNrz/vSm7u8FmLhD5GqqbL3/DLWRoe48drE1qRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1vKQfiuSx/gNqc5wgReRPCZCHnNubXSC3tYuvy1DVtWocGintRGjUek0rbuuhnvp
 ZaACVtbIa+tQ6fFX6pxw7CV9yt6tGVN/Jp3yoBFyUT/11luu81utQapqQmCHmRUF+F
 QnhTeYGo6TxTViJbhTQk3l4C5TLNNWpuGaiQdURjyWdgaBr/r9dwO4aWYu1CyYlm4z
 Xc8s79XBZdY7qF2mcU1N3mZAH9F7BGhZhEJy3+s6l4PyjCFcD7DzJdOCzlaVdOP+Bm
 D0p2td3k5e4A4t4ioM/Fmt5WxoT473jPFe9Jjt9Mfw3mQt2jPO7FKfwKqp0pyHzKki
 QnU7RlM7lPCeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 10/34] ALSA: hda: intel-dsp-config: update
 AlderLake PCI IDs
Date: Tue, 19 Apr 2022 14:10:37 -0400
Message-Id: <20220419181104.484667-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181104.484667-1-sashal@kernel.org>
References: <20220419181104.484667-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com, peter.ujfalusi@linux.intel.com,
 brent.lu@intel.com
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

[ Upstream commit d52eee988597ac2a2c5d17d842946616d7d41070 ]

Add missing AlderLake-PS and RaptorLake-S PCI IDs (already in HDaudio
and SOF drivers), add comments and regroup by skew.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220406190418.245044-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 70fd8b13938e..8b0a16ba27d3 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -390,22 +390,36 @@ static const struct config_entry config_table[] = {
 
 /* Alder Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
+	/* Alderlake-S */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x7ad0,
 	},
+	/* RaptorLake-S */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51c8,
+		.device = 0x7a50,
 	},
+	/* Alderlake-P */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
-		.device = 0x51cc,
+		.device = 0x51c8,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51cd,
 	},
+	/* Alderlake-PS */
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51c9,
+	},
+	/* Alderlake-M */
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51cc,
+	},
+	/* Alderlake-N */
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x54c8,
-- 
2.35.1

