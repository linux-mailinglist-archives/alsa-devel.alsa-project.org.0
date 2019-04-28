Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D3BB588
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3F187E;
	Sun, 28 Apr 2019 09:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3F187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556437043;
	bh=FQyq31wGYxmUzPn75uDADZiQhw+Tzd4bQ97HoOkYT1I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RagPUf/0R/Z1yCZECeuAKiTl0qi7JMUeIengBJ8ntJJEYF/O9zOxgf2Ak8nahdWNi
	 kD2WjUib2PXRdfeJDHyIaWL9f1LWRk0nwhDaqT3ZF/0zmLMVFbrnN8gYpw8readbYb
	 fyvYQAYl07Sv/XjpJNJdSvudbBDDDrGlXNuo7DjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB5A2F8973E;
	Sun, 28 Apr 2019 09:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254DDF80CAD; Sun, 28 Apr 2019 03:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HTML_MESSAGE,PRX_BODY_135,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAFFCF8070B
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 03:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFFCF8070B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2019 18:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,403,1549958400"; 
 d="scan'208,217";a="138058807"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga008.jf.intel.com with ESMTP; 27 Apr 2019 18:47:00 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sat, 27 Apr 2019 18:46:59 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sat, 27 Apr 2019 18:46:59 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.164]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.206]) with mapi id 14.03.0415.000;
 Sun, 28 Apr 2019 09:46:57 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: "tiwai@suse.de" <tiwai@suse.de>, "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: snd_hdac_device_unregister is called twice on ASoC driver
Thread-Index: AdT9X8C1slpjdBrPSy24vaPNkKAoGA==
Date: Sun, 28 Apr 2019 01:46:56 +0000
Message-ID: <567A313375B6F043A9BE3A1D9B8C6E7F0B425509@SHSMSX101.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTQzNjI2ZWYtZjIwNC00NTdlLTkyMTctNDg3MTI2OGQ5NDU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidGlNdWpEa0toS0ZoUDlFYnhhd2RrUlNmNld2dmtZM0JGMGQ3eFZLcGxoakNETTBiVlwvUGo0M290eVM5QUx5MFEifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Girdwood,
 Liam R" <liam.r.girdwood@intel.com>, "Bossart, 
 Pierre-louis" <pierre-louis.bossart@intel.com>
Subject: [alsa-devel] snd_hdac_device_unregister is called twice on ASoC
	driver
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

Hi Takashi and all,

We meet a problem that snd_hdac_device_unregister will be called twice
on ASoC driver. We will call snd_hdac_ext_bus_device_init ->
snd_hdac_device_register and snd_hdac_ext_bus_device_remove ->
snd_hdac_device_unregister on ASoC driver. It looks even to me.
However, hdac_hda_codec_probe will call snd_hda_codec_device_new
to create a hda codec device. And it will assign snd_hda_codec_dev_free
to the .dev_free ops where snd_hdac_device_unregister will be called.
That's why snd_hdac_device_unregister will be call twice on ASoC driver.
Below patch can "fix" this issue, but I don't know if it is the right way
to fix it. Could you take a look and give me some advice?

--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -841,7 +841,13 @@ static int snd_hda_codec_dev_free(struct snd_device *device)
        struct hda_codec *codec = device->device_data;

        codec->in_freeing = 1;
-       snd_hdac_device_unregister(&codec->core);
+       /*
+        * snd_hda_codec_device_new() is used by legacy HDA and ASoC driver.
+        * We can't unregister ASoC device since it will be unregistered in
+        * snd_hdac_ext_bus_device_remove().
+        */
+       if (codec->core.type == HDA_DEV_LEGACY)
+               snd_hdac_device_unregister(&codec->core);
        codec_display_power(codec, false);
        put_device(hda_codec_dev(codec));
        return 0;

--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -328,6 +328,12 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
                dev_err(&hdev->dev, "failed to create hda codec %d\n", ret);
                goto error_no_pm;
        }
+       /*
+        * Overwrite type to HDA_DEV_ASOC since it is a ASoC driver
+        * hda_codec.c will check this flag to determine if unregister
+        * device is needed.
+        */
+       hdev->type = HDA_DEV_ASOC;

        /*
         * snd_hda_codec_device_new decrements the usage count so call get pm
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
