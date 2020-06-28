Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50F20C8D6
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 17:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223B41675;
	Sun, 28 Jun 2020 17:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223B41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593359716;
	bh=pnU6eHhCF13EpJU0xFwpuXoIveiCnAemmEKqN2ztliQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lib6DxY275WCS1K5QuJOtLpmb6pFYdZdFjy1y8K4DjNRdMEKL9YI2RdffXXv7tccg
	 O+mOWIikGu8wNNNlfeAbRYCp9kerJmBLCnk8R3TEsdueRRPFJKd4cH/pLQ0MTzwOgW
	 512MN8w0tCTvXq7H6i3DBni/yqxfWFFudI9gle9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BFEEF80252;
	Sun, 28 Jun 2020 17:52:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69218F8022D; Sun, 28 Jun 2020 17:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06106F800F0
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 17:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06106F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="QDplHabp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593359559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tup3JNhnMrSyWfFhwMz3iwoU167e7gBF13OGzA9K/z8=;
 b=QDplHabpasZw3CQh1mGa2ehv4egkarWEn/iTdQwYk0vM5zmKtotq/IOpDTGBnFPSdip7jV
 kDmk6YoJsOycguYwaP9V1Wnsx2RsNNDC9VZmL6K9v+7Q3kSimhE0c9sQeHBPb3lm8nfyk2
 0GIAofrJ6+G/iboIcviF8E0vdfTA7to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-wmrIUZHTO2G7hDKsI0Aipg-1; Sun, 28 Jun 2020 11:52:38 -0400
X-MC-Unique: wmrIUZHTO2G7hDKsI0Aipg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6921D107ACCD;
 Sun, 28 Jun 2020 15:52:36 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8CAD1944D;
 Sun, 28 Jun 2020 15:52:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S 2
 channel
Date: Sun, 28 Jun 2020 17:52:26 +0200
Message-Id: <20200628155231.71089-2-hdegoede@redhat.com>
In-Reply-To: <20200628155231.71089-1-hdegoede@redhat.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

Cc: stable@vger.kernel.org
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786723
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

