Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171613C9F6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 17:49:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76BBB17A9;
	Wed, 15 Jan 2020 17:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76BBB17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579106992;
	bh=tFlypqmnNiUg9cnfsLh1JfiNwzwln4VIyk2afhda5/4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dYin66ThbeaFI8BiS1/K10ddK33ohsdW7GGNQ5ZfQDvbBuXqE3B0FgpjL9OP15iDk
	 vQJw4iyUKm+W49O5a6DuF5DXyHDlsnN8dimUcb7rGJX1pea9RuWH2bKQN249gLd0iD
	 yABlNMIlyCad8dpLCQDFkkLzNrWv8uNK7B1ZoRfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F6EAF801F8;
	Wed, 15 Jan 2020 17:46:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 598ADF80278; Wed, 15 Jan 2020 17:46:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C610F80271
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 17:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C610F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SU39CxKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579106798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inrH6wqiEYbnEw/TcAUOnIVGA9s1yVMDM5FknfWzNo0=;
 b=SU39CxKctegVHnZ6EYXdYutp8wclBNSuOs78cxvkg9gWBzTBAscGauscXWozK+rAGG6zGW
 T/X2V4DI2ZFyGXhGyrSpiTQaCtf+O9r5lJJypx51Y82aR0652wLjEffcQOqGsH7MkCxefI
 xg3AW9yw2zR1wMlfOx+xk9+QXZVJbME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-cSlUqsxoP1-5JOVcYAFbDA-1; Wed, 15 Jan 2020 11:46:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B9A1100551C;
 Wed, 15 Jan 2020 16:46:33 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-188.ams2.redhat.com
 [10.36.116.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 604BC6609E;
 Wed, 15 Jan 2020 16:46:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 15 Jan 2020 17:46:19 +0100
Message-Id: <20200115164619.101705-5-hdegoede@redhat.com>
In-Reply-To: <20200115164619.101705-1-hdegoede@redhat.com>
References: <20200115164619.101705-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cSlUqsxoP1-5JOVcYAFbDA-1
X-Mimecast-Spam-Score: 0
Cc: Nariman Etemadi <narimantos@gmail.com>, alsa-devel@alsa-project.org,
 Jordy Ubink <jordyubink@hotmail.nl>, Hans de Goede <hdegoede@redhat.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>,
 Erik Bussing <eabbussing@outlook.com>
Subject: [alsa-devel] [PATCH 4/4] ASoC: Intel: cht_bsw_rt5645: Remove
	unnecessary string buffers and snprintf calls
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

From: Damian van Soelen <dj.vsoelen@gmail.com>

The snprintf calls filling cht_rt5645_cpu_dai_name /
cht_rt5645_codec_aif_name always fill them with the same string
("ssp0-port" resp "rt5645-aif2") so instead of keeping these buffers
around and making cpus->dai_name / codecs->dai_name point to this,
simply update the *->dai_name pointers to directly point to a string
constant containing the desired string.

Signed-off-by: Damian van Soelen <dj.vsoelen@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_rt5645.c | 26 ++++---------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index c68a5b85a4a0..b5b016d493f1 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -515,8 +515,6 @@ static struct cht_acpi_card snd_soc_cards[] = {
 };
 
 static char cht_rt5645_codec_name[SND_ACPI_I2C_ID_LEN];
-static char cht_rt5645_codec_aif_name[12]; /*  = "rt5645-aif[1|2]" */
-static char cht_rt5645_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 
 struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 	u64 aif_value;       /* 1: AIF1, 2: AIF2 */
@@ -641,28 +639,12 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((cht_rt5645_quirk & CHT_RT5645_SSP2_AIF2) ||
-		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
-
-		/* fixup codec aif name */
-		snprintf(cht_rt5645_codec_aif_name,
-			sizeof(cht_rt5645_codec_aif_name),
-			"%s", "rt5645-aif2");
-
-		cht_dailink[dai_index].codecs->dai_name =
-			cht_rt5645_codec_aif_name;
-	}
+	    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
+		cht_dailink[dai_index].codecs->dai_name = "rt5645-aif2";
 
 	if ((cht_rt5645_quirk & CHT_RT5645_SSP0_AIF1) ||
-		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
-
-		/* fixup cpu dai name name */
-		snprintf(cht_rt5645_cpu_dai_name,
-			sizeof(cht_rt5645_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		cht_dailink[dai_index].cpus->dai_name =
-			cht_rt5645_cpu_dai_name;
-	}
+	    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
+		cht_dailink[dai_index].cpus->dai_name = "ssp0-port";
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
