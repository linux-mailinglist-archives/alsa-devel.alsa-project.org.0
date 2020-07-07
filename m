Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D655E2179FD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D811680;
	Tue,  7 Jul 2020 23:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D811680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594156073;
	bh=zXmQM+22xxE5ey9zRaXVHOzzuW5S2ibWp9PTout4Lvc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WPPWC4GLKTteqnDw9HmfuzF9Vq1r3aPFvUqt6iUYL2qo6BR2fcLkxi5KZhijUL/H0
	 fNQmX5jhWvDBoz6w34B02S2+1jYDVMQDDH32x6o7K6eJG5fP5fB7v3VD1TGrejCGKG
	 RHaxUX/0eolZLaJ4gpDGma8/mUJ3jzyfrfbXElqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC64F802BC;
	Tue,  7 Jul 2020 23:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340BFF8025A; Tue,  7 Jul 2020 23:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82ACF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 23:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82ACF801F9
IronPort-SDR: agUaHMPIqQiWpvU22owSeEjAAxXgtJCr2sWjOnln/i9Wc0Un94Bcc9GRoA5Z7GmihnC7g+zBO+
 agFEznMX25kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="127777250"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="127777250"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:04:58 -0700
IronPort-SDR: HwnPy8jsjzdmyJy5JDLo0yxx4Uw0tj7hQEOymhl8I5vWJQtXsfsDadFBsi5A5wRdrDYjUdiTVF
 kadDd0KZlfcg==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483648069"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:04:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: bdw-rt5677: fix non BE conversion
Date: Tue,  7 Jul 2020 16:04:38 -0500
Message-Id: <20200707210439.115300-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
References: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org
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

When SOF is used, the normal links are converted into DPCM ones. This
generates an error

[ 58.276668] bdw-rt5677 bdw-rt5677: CPU DAI spi-RT5677AA:00 for rtd
Wake on Voice does not support playback
[ 58.276676] bdw-rt5677 bdw-rt5677: ASoC: can't create pcm Wake on
Voice :-22

Fix by forcing the capture direction.

Fixes: b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index c9da91147770..725304779426 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -367,6 +367,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 	{
 		.name = "Codec DSP",
 		.stream_name = "Wake on Voice",
+		.capture_only = 1,
 		.ops = &bdw_rt5677_dsp_ops,
 		SND_SOC_DAILINK_REG(dsp),
 	},
-- 
2.25.1

