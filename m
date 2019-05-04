Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5D140F1
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 18:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389FF18C2;
	Sun,  5 May 2019 18:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389FF18C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557072139;
	bh=sj/B+ZxdNRZcpgRnYcPunr+ZjP06QeZ7L3OZj/hHLGE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vj7lcaJ+XQ4sXxOIUgj9bh6hGaHgCK3RxgHsnKWenaZnN6Sgs6L1+mUXIyemJ9FMg
	 uS6UMCKksChmNoFcD2FIxz3/4yG+3yHFrFpO81CaAep1zgQ/6QYPQVNXm9tUJIvwrR
	 b+5yKAXbhPEAmWNN9vwhkqfwor6fiGKVQsL4qymk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 329BEF8974E;
	Sun,  5 May 2019 17:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A261AF896C7; Sat,  4 May 2019 17:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2D5EF8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 17:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D5EF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bdlXZixV"
Received: by mail-ed1-x541.google.com with SMTP id n17so9723418edb.0
 for <alsa-devel@alsa-project.org>; Sat, 04 May 2019 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZXaWE0cUJ2ctMMePGlWZ/g4c5AmBJC2blqgTYPGb2A=;
 b=bdlXZixVf3e5zBoE2EDSG9jmSG32no/0xGgcoH8v8cA2N8VbZHzXmn72Zt6rLNT5Qd
 Izg4Vd/l9jlMnjT+8xbrjXvLA2iCY3H42IkO2KqLd8dvOE9jz1/AB0P69dIxdEHzHpsM
 ipwVGdaIpAXro0eM1YiRFYro4A84TOkOAMenqxlFVe/0DSUearbblWe272VY8nzdZhTf
 Yz5qFYyguCCTESg4QX5WFpG9L5bSOrZhXEbTrL0HZDfwKsRNphUs6bq8hgUfDTSUwQj4
 ZmCzwgnjh8J4IoSG04spb4+NQ9t2UEQH71uiCq8/zF7f/u+r/IuZZSbjHcCsX0QGl188
 eS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uZXaWE0cUJ2ctMMePGlWZ/g4c5AmBJC2blqgTYPGb2A=;
 b=HdneTbnvv1ZkTE97+NMo+MfxpG1CfJxb2DBjFzEZNnurXaVIyljdCNIZS8wV0TlRmy
 wE1/ZIQyrVYwhjTP1+6dXaKpOlq6Lc3N9ROtkEZ4A3wNMxroZix2zd1LFasMmLNoBGe+
 xrQVIB24rwL338fX5+N6GwMhxkmqpWIT33uPg2ZRfayGP3wZYLT1/EG3Q6P1IFMTF6FG
 O03yJuM0qFBRdjjGcHQOAe2RV5aB0UwiQjnnYnGJB10uf+euQyEkqfB2BmVbyomLVP3Q
 jA0oxbxqPFugMLzlxUpXiziQ0TM0kXrjFssJj2ek/72zD4UbNJ1yt4jkDRKALtG6l6am
 MNow==
X-Gm-Message-State: APjAAAUSGXNcBSxQcYlMIcHdMokL166+yZtQORh4LYwOQWd7z1rfLw4U
 mU3iHZbEy5zoADP7GYnykMY=
X-Google-Smtp-Source: APXvYqwqL8zRsW7ZKnmvsZt3KOsmnwZ984201fWB106vclGPjyd0LSLiOowgXGCcI+RaUVMePdqDNg==
X-Received: by 2002:a17:906:1ed2:: with SMTP id
 m18mr11505783ejj.106.1556983026467; 
 Sat, 04 May 2019 08:17:06 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id l18sm1445711edc.33.2019.05.04.08.17.05
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 May 2019 08:17:05 -0700 (PDT)
From: Nariman <narimantos@gmail.com>
X-Google-Original-From: Nariman <root>
To: linux-kernel@vger.kernel.org
Date: Sat,  4 May 2019 17:16:50 +0200
Message-Id: <20190504151652.5213-2-user@elitebook-localhost>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504151652.5213-1-user@elitebook-localhost>
References: <20190504151652.5213-1-user@elitebook-localhost>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:02 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 hdegoede@redhat.com, broonie@kernel.org,
 Damian van Soelen <dj.vsoelen@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: cht_bsw_rt5645.c: Remove buffer
	and snprintf calls
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

The snprintf calls filling cht_rt5645_cpu_dai_name / cht_rt5645_codec_aif_name
always fill them with the same string ("ssp0-port" resp "rt5645-aif2") so
instead of keeping these buffers around and making the cpu_dai_name /
codec_aif_name point to this, simply update the foo_dai_name and foo_aif_name pointers to
directly point to a string constant containing the desired string.

Signed-off-by: Damian van Soelen <dj.vsoelen@gmail.com>
---
 sound/soc/intel/boards/cht_bsw_rt5645.c | 26 ++++---------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index cbc2d458483f..b15459e56665 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -506,8 +506,6 @@ static struct cht_acpi_card snd_soc_cards[] = {
 };
 
 static char cht_rt5645_codec_name[SND_ACPI_I2C_ID_LEN];
-static char cht_rt5645_codec_aif_name[12]; /*  = "rt5645-aif[1|2]" */
-static char cht_rt5645_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 
 static bool is_valleyview(void)
 {
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
-		cht_dailink[dai_index].codec_dai_name =
-			cht_rt5645_codec_aif_name;
-	}
+		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
+			cht_dailink[dai_index].codec_dai_name = "rt5645-aif2";
 
 	if ((cht_rt5645_quirk & CHT_RT5645_SSP0_AIF1) ||
-		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
-
-		/* fixup cpu dai name name */
-		snprintf(cht_rt5645_cpu_dai_name,
-			sizeof(cht_rt5645_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		cht_dailink[dai_index].cpu_dai_name =
-			cht_rt5645_cpu_dai_name;
-	}
+		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
+			cht_dailink[dai_index].cpu_dai_name = "ssp0-port";
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
