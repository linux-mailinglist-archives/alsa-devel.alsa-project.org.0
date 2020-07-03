Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41D2138B5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 12:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789BD16E6;
	Fri,  3 Jul 2020 12:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789BD16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593772837;
	bh=mhjcpymOXNuacPnUh6Z5ZYApKV7KkVlL7LhpqGfsHHM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aExC50s23S69IUYvXt7hIj96olwWOMPMQSE2poSf86jaPF+dkcccIs8NCDupL1vjK
	 djyPK7+HgP7Yp4OnFCSx+Q6EWm04D9fTmjQqPFVpesMlnHGRlGtKQhnapmHVe0DbI+
	 vb1hb0sYsvafZCgRWaKPO2NUSgjxKjeYRmtqvilQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A667F800E0;
	Fri,  3 Jul 2020 12:38:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22757F80217; Fri,  3 Jul 2020 12:38:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31BFFF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31BFFF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="TlFTWY6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593772727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ALviRvjDfpClclH7KUhuvk/t+IK+sAH6lMRhR+W5jk=;
 b=TlFTWY6j4R7NBsyOlI0EjDhe02FtBmgKsmcjfIomkO5j3uBUOE761GH+2qZKpb4RvPl7qM
 VnL5Ds4gCi3s+hvD+pfMCegPy9tzIXt9b2VIf7rU/mQuPkzkOUX/Tqq3HFqv3FZAVSqMgP
 kYeYp96EOIydRWocL+/teOxjitBQ7rQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-_jYBFlogMdC7uIZNimjEww-1; Fri, 03 Jul 2020 06:38:45 -0400
X-MC-Unique: _jYBFlogMdC7uIZNimjEww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E52B9107B0F1;
 Fri,  3 Jul 2020 10:38:43 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDB09CF921;
 Fri,  3 Jul 2020 10:38:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH] ASoC: Intel: cht_bsw_rt5672: Improve dai-set-fmt comment in
 cht_codec_fixup()
Date: Fri,  3 Jul 2020 12:38:40 +0200
Message-Id: <20200703103840.333732-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

As Pierre-Louis Bossart pointed out, saying that the default mode for the
SSP is TDM 4 slot is not entirely accurate.

There really are 2 default modes:
The default mode for the SSP configuration is TDM 4 slot for the
cpu-dai (hard-coded in DSP firmware),
The default mode for the SSP configuration is I2S for the codec-dai
(hard-coded in the 'SSP2-Codec" .dai_fmt masks, so far unused).

This commit updates the comment in cht_codec_fixup() to properly reflect
this.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 1470c3de7895..1812b786d33b 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -253,13 +253,17 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
 	/*
-	 * Default mode for SSP configuration is TDM 4 slot. One board/design,
-	 * the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2. The
-	 * second piggy-backed, output-only codec is inside the keyboard-dock
-	 * (which has extra speakers). Unlike the main rt5672 codec, we cannot
-	 * configure this codec, it is hard coded to use 2 channel 24 bit I2S.
-	 * Since we only support 2 channels anyways, there is no need for TDM
-	 * on any cht-bsw-rt5672 designs. So we simply use I2S 2ch everywhere.
+	 * The default mode for the cpu-dai is TDM 4 slot. The default mode
+	 * for the codec-dai is I2S. So we need to either set the cpu-dai to
+	 * I2S mode to match the codec-dai, or set the codec-dai to TDM 4 slot
+	 * (or program both to yet another mode).
+	 * One board, the Lenovo Miix 2 10, uses not 1 but 2 codecs connected
+	 * to SSP2. The second piggy-backed, output-only codec is inside the
+	 * keyboard-dock (which has extra speakers). Unlike the main rt5672
+	 * codec, we cannot configure this codec, it is hard coded to use
+	 * 2 channel 24 bit I2S. For this to work we must use I2S mode on this
+	 * board. Since we only support 2 channels anyways, there is no need
+	 * for TDM on any cht-bsw-rt5672 designs. So we use I2S 2ch everywhere.
 	 */
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
-- 
2.26.2

