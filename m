Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC520C8BF
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 17:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11141678;
	Sun, 28 Jun 2020 17:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11141678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593358891;
	bh=cp6ychLjaNlfb+ZwY8ijr6CMrwo3TiqLhnW2wzpwJqU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oQG/FFhN4ybJVDI8oWOViYX3vLuchO0cQzZgv8vGYRId2qKtciBydEnrfNfiULTGg
	 9JnHazY++jHVpL+ew03M2/zRXR+s8hCXHpT59Fdw0EE/kJXkAECXpeDppkb4yE97Ns
	 uwzyf/Tn2LH6nn72D+km5KEogDkVj5vbc5/5trz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4656F80096;
	Sun, 28 Jun 2020 17:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECFC1F80245; Sun, 28 Jun 2020 17:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FA34F80096
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 17:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA34F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PNUKfu8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593358783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C3LpD2mlcJNMtbsD9v32FPjMwTU1WWu2E9HMpLcuDz0=;
 b=PNUKfu8cYtKHsu1+2fK9jkE+mszyDOc6SnhHsSlIyBC87M3ykIqEdTjO4emD9pZRpBjzZ9
 cp53e4fe2vSqmXLBRXY3MFpXlFoO3NcKlGcb6jPBcnOO78lZOOwlssrOlX71WI+4sZxe36
 RlzsnguoVD6KR1qZJXY6+L/Tebi3dgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-5c2xL9kcPOuEZ9TC6XHuHQ-1; Sun, 28 Jun 2020 11:39:39 -0400
X-MC-Unique: 5c2xL9kcPOuEZ9TC6XHuHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B3EFBFC0;
 Sun, 28 Jun 2020 15:39:37 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6AC62857F;
 Sun, 28 Jun 2020 15:39:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S 2
 channel
Date: Sun, 28 Jun 2020 17:39:28 +0200
Message-Id: <20200628153933.70538-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

The default mode for SSP configuration is TDM 4 slot and so far we were
using this for the bus format on cht-bsw-rt56732 boards.

One board, the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2.
The second piggy-backed, output-only codec is inside the keyboard-dock
(which has extra speakers). Unlike the main rt5672 codec, we cannot
configure this codec, it is hard coded to use 2 channel 24 bit I2S.

Using 4 channel TDM leads to the dock speakers codec (which listens in on
the data send from the SSP to the rt5672 codec) emiting horribly distorted
sound.

Since we only support 2 channels anyways, there is no need for TDM on any
cht-bsw-rt5672 designs. So we can simply use I2S 2ch everywhere.

This commit fixes the Lenovo Miix 2 10 dock speakers issue by changing
the bus format set in cht_codec_fixup() to I2S 2 channel.

This change has been tested on the following devices with a rt5672 codec:

Lenovo Miix 2 10
Lenovo Thinkpad 8
Lenovo Thinkpad 10 (gen 1)

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 7a43c70a1378..22e432768edb 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -253,21 +253,20 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
 	/*
-	 * Default mode for SSP configuration is TDM 4 slot
+	 * Default mode for SSP configuration is TDM 4 slot. One board/design,
+	 * the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2. The
+	 * second piggy-backed, output-only codec is inside the keyboard-dock
+	 * (which has extra speakers). Unlike the main rt5672 codec, we cannot
+	 * configure this codec, it is hard coded to use 2 channel 24 bit I2S.
+	 * Since we only support 2 channels anyways, there is no need for TDM
+	 * on any cht-bsw-rt5672 designs. So we simply use I2S 2ch everywhere.
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
-				  SND_SOC_DAIFMT_DSP_B |
-				  SND_SOC_DAIFMT_IB_NF |
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+				  SND_SOC_DAIFMT_I2S     |
+				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_CBS_CFS);
 	if (ret < 0) {
-		dev_err(rtd->dev, "can't set format to TDM %d\n", ret);
-		return ret;
-	}
-
-	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
-	if (ret < 0) {
-		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
+		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
 	}
 
-- 
2.26.2

