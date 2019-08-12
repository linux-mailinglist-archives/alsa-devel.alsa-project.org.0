Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A777289A92
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 11:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F03167A;
	Mon, 12 Aug 2019 11:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F03167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565603775;
	bh=4vaRubXs4VaSOlGYpfylN3bWlvi84RsuQfq0XUY9MsM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ccpBpTvQ0ioaCf9eW30BiATNTMbnwrh8/gppShlJlYL5YR/+P4qgwD4XmcsN27NLf
	 +XrnNNBNfqpr7kRkQGVCWyzW4tS6okGBVGb8lMPpjvVkUgnB90DQFM9jJm9L0YGhZi
	 FJluDolXS8lsTRAWOkBpDyzHey+FtSjrPg7JsCsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9422F805FC;
	Mon, 12 Aug 2019 11:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BB74F805FB; Mon, 12 Aug 2019 11:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D48BF805FB
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 11:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D48BF805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ie6FnjL2"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7C9qthf114398;
 Mon, 12 Aug 2019 04:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565603575;
 bh=K0go0bNjKbnONPvFlqaM3kvy/pPX6kU+nXXAbmGnIAQ=;
 h=From:To:CC:Subject:Date;
 b=ie6FnjL2+UiPSYCBmLMh4kJvc2Ve+fJYHqeB+r4YptA3+YVDhTCwOYOtcXYaojeNs
 UM6MMhm01oD/JzqijG78rqK4sK47PHyfVai1E7QqyThz4MzcyuJ7l9tJMjwbla1M81
 ve/SIyp9R0D0oAOHg+EDPsxTixoMYLGTU0lEuUEE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7C9qttG106696
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Aug 2019 04:52:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 04:52:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 04:52:54 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7C9qqtk045733;
 Mon, 12 Aug 2019 04:52:52 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 12 Aug 2019 12:53:04 +0300
Message-ID: <20190812095304.19030-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, jsarha@ti.com
Subject: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Protect hw_params
	callback against race
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the playback and capture of the same McASP is connected to different
dai link (non duplex PCM links, like with pcm3168a codec) then there is
a high probability of race between the two direction leaving McASP in a
confused state.

Protect the hw_params() with a mutex to make sure that this is not
happening.

The concurrent execution of hw_params for capture and playback can be
easily triggered with custom .asoundrc file (for pcm3168a codec):

pcm.dmixed8 {
    type dmix
    ipc_key 2048
    ipc_perm 0666
    slave {
        pcm "hw:0,0"
        format S24_LE
        channels 8
        rate 96000
    }
    bindings {
        0 0
        1 1
        2 2
        3 3
        4 4
        5 5
        6 6
        7 7
    }
}

pcm.cpb-headset-1 {
    type plug
    slave.pcm dmixed8

    hint {
         show on
         description "Headset 1 jack"
    }
    ttable.0.0 1
    ttable.1.4 1
}

pcm.dsnooped6 {
    type dsnoop
    ipc_key 2049
    ipc_perm 0666
    slave {
        pcm "hw:0,1"
        format S24_LE
        channels 6
        rate 96000
    }
    bindings {
        0 0
        1 1
        2 2
        3 3
        4 4
        5 5
    }
}

pcm.cpb-mic-1 {
    type plug
    slave.pcm "dsnooped6"

    hint {
         show on
         description "Microphone 1 jack"
    }
    ttable.0.0 1
    ttable.1.3 1
}

Then running:
arecord -D cpb-mic-1 -f S24_LE -c2 -r48000 | aplay -D cpb-headset-1 -f S24_LE -c2 -r48000

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 7aa3c32e4a49..fe7a0b3572e2 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -111,6 +111,7 @@ struct davinci_mcasp {
 	u32	channels;
 	int	max_format_width;
 	u8	active_serializers[2];
+	struct mutex mutex;
 
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
@@ -1169,6 +1170,8 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	int period_size = params_period_size(params);
 	int ret;
 
+	mutex_lock(&mcasp->mutex);
+
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_U8:
 	case SNDRV_PCM_FORMAT_S8:
@@ -1197,12 +1200,13 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 
 	default:
 		printk(KERN_WARNING "davinci-mcasp: unsupported PCM format");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	ret = davinci_mcasp_set_dai_fmt(cpu_dai, mcasp->dai_fmt);
 	if (ret)
-		return ret;
+		goto out;
 
 	/*
 	 * If mcasp is BCLK master, and a BCLK divider was not provided by
@@ -1223,7 +1227,7 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	ret = mcasp_common_hw_param(mcasp, substream->stream,
 				    period_size * channels, channels);
 	if (ret)
-		return ret;
+		goto out;
 
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
 		ret = mcasp_dit_hw_param(mcasp, params_rate(params));
@@ -1232,7 +1236,7 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 					 channels);
 
 	if (ret)
-		return ret;
+		goto out;
 
 	davinci_config_channel_size(mcasp, word_length);
 
@@ -1242,7 +1246,10 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 			mcasp->max_format_width = word_length;
 	}
 
-	return 0;
+out:
+	mutex_unlock(&mcasp->mutex);
+
+	return ret;
 }
 
 static int davinci_mcasp_trigger(struct snd_pcm_substream *substream,
@@ -2335,6 +2342,8 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (ret)
 		return -EINVAL;
 
+	mutex_init(&mcasp->mutex);
+
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					&davinci_mcasp_component,
 					&davinci_mcasp_dai[pdata->op_mode], 1);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
