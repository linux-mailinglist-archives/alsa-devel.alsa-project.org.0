Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD165B72D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 21:32:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0824BA8C9;
	Mon,  2 Jan 2023 21:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0824BA8C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672691520;
	bh=LwgfX1nuvuxjaGMvY2eRkuLAJY23wtVpSS451UENzDA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FVD/viA12LOsn9WrtZIovXOCb00s5L8HmFOzmWiri/18K+tq2HdLfcspaIU8Uh5wy
	 etyArLgpDH7m8SnDHO+qkDkY7RITUuxKayOv2MQgh0UqW1M1QwTKFA2k+gfD7nKgUD
	 7oI+9VNmpWVIdZyKS2cmi9+CfHRUVewGzj+RdNRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02503F801EB;
	Mon,  2 Jan 2023 21:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E090EF8053C; Mon,  2 Jan 2023 21:30:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 972DFF8032D
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 21:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 972DFF8032D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JR1K/6m5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672691397; x=1704227397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LwgfX1nuvuxjaGMvY2eRkuLAJY23wtVpSS451UENzDA=;
 b=JR1K/6m5dN94BjsSbxOEiHpPwcywEGA5gpeBNEXfwKFB/zGgnRIZWVh3
 KqGvGuF/WJz4wnuoiOYvwfS3fZz7DDPC4mtHJi2giA1EZJ0ghfThNIfew
 INu+HSxCzseFLfzsPc5Yz0zWWZJqJARyhcvXZOoWfucSXaT+oDWV2N0Nq
 QSH95f09PsM9iCsufAHFgV2KCFkZS9+/NCJwwBE+V9pysO3qgGBDjnYOA
 K55He6UZipQGwDgqg3/fraO5t8RbbLiiTEjUn4dBJkkMnhHj7dTniA9Tn
 0WPSnsY0DkmrzKvVpmI3t4dy+8GYQ2HQrbR4PKMSZdsWoZymR59v0dzZ2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="320252201"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; d="scan'208";a="320252201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 12:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="685170321"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; d="scan'208";a="685170321"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 02 Jan 2023 12:29:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E10DD220; Mon,  2 Jan 2023 22:30:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] ASoC: Intel: sof_es8336: Drop reference count of ACPI
 device after use
Date: Mon,  2 Jan 2023 22:30:14 +0200
Message-Id: <20230102203014.16041-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230102203014.16041-1-andriy.shevchenko@linux.intel.com>
References: <20230102203014.16041-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Theoretically the device might gone if its reference count drops to 0.
This might be the case when we try to find the first physical node of
the ACPI device. We need to keep reference to it until we get a result
of the above mentioned call. Refactor the code to drop the reference
count at the correct place.

While at it, move to acpi_dev_put() as symmetrical call to the
acpi_dev_get_first_match_dev().

Fixes: a164137ce91a ("ASoC: Intel: add machine driver for SOF+ES8336")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 773e5d1d87d4..894b6610b9e2 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -681,7 +681,6 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	if (adev) {
 		snprintf(codec_name, sizeof(codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
-		put_device(&adev->dev);
 		dai_links[0].codecs->name = codec_name;
 
 		/* also fixup codec dai name if relevant */
@@ -692,16 +691,19 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	ret = snd_soc_fixup_dai_links_platform_name(&sof_es8336_card,
-						    mach->mach_params.platform);
-	if (ret)
-		return ret;
-
 	codec_dev = acpi_get_first_physical_node(adev);
+	acpi_dev_put(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
 	priv->codec_dev = get_device(codec_dev);
 
+	ret = snd_soc_fixup_dai_links_platform_name(&sof_es8336_card,
+						    mach->mach_params.platform);
+	if (ret) {
+		put_device(codec_dev);
+		return ret;
+	}
+
 	if (quirk & SOF_ES8336_JD_INVERTED)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
 
-- 
2.35.1

