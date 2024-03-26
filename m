Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A886F88C8BE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DC822CE;
	Tue, 26 Mar 2024 17:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DC822CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469664;
	bh=CGW9WwILyoWL0VUVn+vNHuA24fw6YkjS/KusTPXlIlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J9PtblEK1f7Eiw4aJ976cSSCWLhjAJkIi84jkWoknz3XCnsGbYK8aAt8UgEaN+Cg4
	 1VtpqWlkHSGmp/4pMfkojsQNzzkmL0BhM2uJNWrPRbmwNwnNv0PVZE1OZ/ktIh6Fj6
	 hZlsKmHeTMZcL6+SIM8AHpTBr94WiexdPHWQ1N6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2EC9F897BE; Tue, 26 Mar 2024 17:07:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E11BCF897E3;
	Tue, 26 Mar 2024 17:07:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD1D5F80605; Tue, 26 Mar 2024 17:06:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 255D5F8057F
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 255D5F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gpr7lJMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469160; x=1743005160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGW9WwILyoWL0VUVn+vNHuA24fw6YkjS/KusTPXlIlk=;
  b=gpr7lJMzuTh19zRKXctsoRTVOQeqboXPTMIGAD+9WUB1eYFuSkaAiujo
   g2tKSYcIxPjJEcGlanLBNJvpJSd4OE0j6iONzET8CoXQvdR62GQPBcAyu
   stIU6Ki+TnsoxmYaqQciGGsNo2ePsVTxLJRSAmBpiMMluRpDBvyVXikXj
   PFeWAIwA9+5ObfDEMefOWBorOAjxTMHKlBWoyOKtAJh3gC77t986G67SI
   uJ2Fx/Z+GRSE9KMlb4+75aT54gVmQcA2Aaji68HwYo0wrNJ9Ofyb7V3Mf
   v+jNEz546raRZTjueKsxtdcR3lICutGa9i3ztgIIO37E32Ys7HNGXDuBE
   A==;
X-CSE-ConnectionGUID: /H6pyek1SRSAyG1BeADd9w==
X-CSE-MsgGUID: Zib7LsNwTq2wG6JqgH/D9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260532"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482438"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 28/34] ASoC: rt715-sdca: rename dai name with rt715-sdca
 prefix
Date: Tue, 26 Mar 2024 11:04:23 -0500
Message-Id: <20240326160429.13560-29-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DD4WMJOKGDCRQPF5M6BNT3WZMUPNM4ZY
X-Message-ID-Hash: DD4WMJOKGDCRQPF5M6BNT3WZMUPNM4ZY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DD4WMJOKGDCRQPF5M6BNT3WZMUPNM4ZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai name are the same as rt715 codec. Rename them with rt715-sdca
prefix allow machine driver to distinguish rt715 and rt715-sdca from
dai name.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 3fb7b9adb61d..3a6dfe1f6c48 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -933,7 +933,7 @@ static const struct snd_soc_dai_ops rt715_sdca_ops = {
 
 static struct snd_soc_dai_driver rt715_sdca_dai[] = {
 	{
-		.name = "rt715-aif1",
+		.name = "rt715-sdca-aif1",
 		.id = RT715_AIF1,
 		.capture = {
 			.stream_name = "DP6 Capture",
@@ -945,7 +945,7 @@ static struct snd_soc_dai_driver rt715_sdca_dai[] = {
 		.ops = &rt715_sdca_ops,
 	},
 	{
-		.name = "rt715-aif2",
+		.name = "rt715-sdca-aif2",
 		.id = RT715_AIF2,
 		.capture = {
 			.stream_name = "DP4 Capture",
-- 
2.40.1

