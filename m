Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277ED274F3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 06:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A94991657;
	Thu, 23 May 2019 06:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A94991657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558584746;
	bh=qQ3ITOkx9kgEqi8ss+5CbQTLAW4THkOS7gJijHR/M+Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VNgpR01GsfSJQ7WHKvAoO2Qkm/dEEi87nkOIBapdWlIHDpmWGmcBxMcWj16aB3uxq
	 eOajgKJQQ56RY+XYDulu6x2fnrxYfPYeckt3yCesUubQyTGMfNQR5gC3e/weNXhufa
	 h5h9waBaDGPm61rFVWuyamnWL99loC9AnJoEoU4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BFA1F89670;
	Thu, 23 May 2019 06:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E930F89674; Thu, 23 May 2019 06:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0D94F8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 06:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0D94F8079B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 21:10:32 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga002.jf.intel.com with ESMTP; 22 May 2019 21:10:32 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 22 May 2019 21:10:31 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 22 May 2019 21:10:31 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.249]) with mapi id 14.03.0415.000;
 Thu, 23 May 2019 12:10:30 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix memory
 allocation
Thread-Index: AQHVELp8xHfh5vooqE+zpD1TQ3/5CKZ4GRrA
Date: Thu, 23 May 2019 04:10:29 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952841527@SHSMSX103.ccr.corp.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmY5NTg1NjctM2E4OS00Y2I5LWExYTItMGFkYjdhNTM5MDU1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSVQyVDBMc2cwNkZ1bFRqd0luMnJZQ0JWU2NJb3gyaU1LVGRhYkdOdnB2bW1GOWZBVCtYNzVqTFp5RFlGdXVcL3YifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>, "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
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

Please hold on this patch. It seems there is some corner case failed
because of this patch.

Regards,
Libin


>-----Original Message-----
>From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
>Sent: Thursday, May 23, 2019 12:22 AM
>To: alsa-devel@alsa-project.org
>Cc: tiwai@suse.de; broonie@kernel.org; Yang, Libin <libin.yang@intel.com>;
>Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>Subject: [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix memory allocation
>
>From: Libin Yang <libin.yang@intel.com>
>
>Align all users of the hdac library to use devm_kzalloc.
>
>Note for backports/stable: the patch ("ALSA: hdac: fix memory release for SST
>and SOF drivers") needs to be applied as well.
>
>Fixes: 5507b8103e26 ("ASoC: SOF: Intel: Add support for HDAudio codecs")
>Reviewed-by: Takashi Iwai <tiwai@suse.de>
>Signed-off-by: Libin Yang <libin.yang@intel.com>
>Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> sound/soc/sof/intel/hda-codec.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-
>codec.c index b8b37f082309..0d8437b080bf 100644
>--- a/sound/soc/sof/intel/hda-codec.c
>+++ b/sound/soc/sof/intel/hda-codec.c
>@@ -62,8 +62,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev,
>int address)
> 		address, resp);
>
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>-	/* snd_hdac_ext_bus_device_exit will use kfree to free hdev */
>-	hda_priv = kzalloc(sizeof(*hda_priv), GFP_KERNEL);
>+	hda_priv = devm_kzalloc(sdev->dev, sizeof(*hda_priv), GFP_KERNEL);
> 	if (!hda_priv)
> 		return -ENOMEM;
>
>@@ -82,8 +81,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev,
>int address)
>
> 	return 0;
> #else
>-	/* snd_hdac_ext_bus_device_exit will use kfree to free hdev */
>-	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
>+	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
> 	if (!hdev)
> 		return -ENOMEM;
>
>--
>2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
