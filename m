Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592213C9FC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 17:51:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61FE817A9;
	Wed, 15 Jan 2020 17:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61FE817A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579107064;
	bh=fOqxnYWXgcvFif133hNTkOwsWuP+Kfm/ghS7lLNcavU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtM1ZU65sCCO2Z/ytjBWlM90rVej/NWQp0jP08nihiyT7ktKYMbKp2T+/Px0o7ngd
	 xi7weuWwLxkhjzn9TUH2vJ6AdwqVhA+utTsloE/cd8Sb5Y94fhs2g7eyFJMrDFI/Kq
	 aif+k+SftWR/o1cOekt/BVL7RTo0SKla76JWSYno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A9DF80290;
	Wed, 15 Jan 2020 17:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72DABF8027B; Wed, 15 Jan 2020 17:46:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5599EF801F8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 17:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5599EF801F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="P9/x85EA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579106796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UA5eXsXBgMLbhncbYnFlApjZvvSwxe2Y5I2xGkrPN7c=;
 b=P9/x85EA+jalycctjO/x1SI/di92EY2SLtHTNzGnOKNmjxq030++B+FaW30xZOlKHkwk5E
 aY9DzQeFr6ynYwvL5Q/9hq13u7S99FXnrRs0pIOiOieyqIJcBSP08AxiRtGyQS5/1rsfB+
 FPB66/Bx+2NpbErsjnITpWhd0ElgOPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-zdRVg_kaNZiU-hb7vp2xEA-1; Wed, 15 Jan 2020 11:46:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13CF318B5F7A;
 Wed, 15 Jan 2020 16:46:31 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-188.ams2.redhat.com
 [10.36.116.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC40688890;
 Wed, 15 Jan 2020 16:46:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 15 Jan 2020 17:46:18 +0100
Message-Id: <20200115164619.101705-4-hdegoede@redhat.com>
In-Reply-To: <20200115164619.101705-1-hdegoede@redhat.com>
References: <20200115164619.101705-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: zdRVg_kaNZiU-hb7vp2xEA-1
X-Mimecast-Spam-Score: 0
Cc: Nariman Etemadi <narimantos@gmail.com>, alsa-devel@alsa-project.org,
 Jordy Ubink <jordyubink@hotmail.nl>, Hans de Goede <hdegoede@redhat.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>,
 Erik Bussing <eabbussing@outlook.com>
Subject: [alsa-devel] [PATCH 3/4] ASoC: Intel: bytcr_rt5651: Remove
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

From: Jordy Ubink <jordyubink@hotmail.nl>

The snprintf calls filling byt_rt56*_codec_aif_name/byt_rt56*_cpu_dai_name
always fill them with the same string ("rt56*-aif2" resp. ssp0-port").
So instead of keeping these buffers around and making codecs->dai_name /
cpus->dai_name point to them, simply update the *->dai_name pointers to
directly point to a string constant containing the desired string.

Signed-off-by: Jordy Ubink <jordyubink@hotmail.nl>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index c0d322a859f7..09641cd7e0c2 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -795,8 +795,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 
 /* SoC card */
 static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
-static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
-static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
 #endif
@@ -1043,26 +1041,12 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) ||
-	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
-		/* fixup codec aif name */
-		snprintf(byt_rt5651_codec_aif_name,
-			sizeof(byt_rt5651_codec_aif_name),
-			"%s", "rt5651-aif2");
-
-		byt_rt5651_dais[dai_index].codecs->dai_name =
-			byt_rt5651_codec_aif_name;
-	}
+	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
+		byt_rt5651_dais[dai_index].codecs->dai_name = "rt5651-aif2";
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP0_AIF1) ||
-	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
-		/* fixup cpu dai name name */
-		snprintf(byt_rt5651_cpu_dai_name,
-			sizeof(byt_rt5651_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		byt_rt5651_dais[dai_index].cpus->dai_name =
-			byt_rt5651_cpu_dai_name;
-	}
+	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
+		byt_rt5651_dais[dai_index].cpus->dai_name = "ssp0-port";
 
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
 		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
