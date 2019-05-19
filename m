Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E300022825
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 19:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 515881668;
	Sun, 19 May 2019 19:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 515881668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558288754;
	bh=7AUhbhZKATSv/0y5782e5uGJDHMszHyGYK16qKU5Jt0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcfCpzErajgVpoPs0+kyYwIQ9vboOaseYt1ayvk43PuOz6mbxg/xGnhtgnXGIz7Yo
	 0Re1RebPvi368VHYSlFay9MxRk6VGH3sRlTBJu3V1g9EdsjDKnG7obfv95YxlZa+fg
	 RF5ZPCli4EzKMXPqIAdz/Ay7fODpLZAXu/kSaN/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF782F89630;
	Sun, 19 May 2019 19:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08749F89633; Sun, 19 May 2019 19:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 605D8F806E7
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 19:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 605D8F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l+8759gG"
Received: by mail-ed1-x543.google.com with SMTP id w37so19969272edw.4
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KDJMNJfIv5qLkX9gjcuIru5PdS9zm2I9aje75Yv/6w=;
 b=l+8759gGZy5S/jxlabgPPs2V+a/SRM9cdSQ0+67gyx5DqfYk/5qoGhbTTHeO+8/kt1
 vAga7RE/6uB7F6XPw1TefZgf+ucaQEcCOgkaBina5W5iFyhc26yYaa7UZL1LO8r1sApo
 7Fhqa3UuuFLVKn2j4VMOtnn1zO6z7KVCsfhg+6vH9/fyEbe6ntyEqCuWcXz9WoLkRdiI
 YPXcl30wRvNkI556ukv4n3zPklKb6nyhgyY6tW87V7iaR4qeCPxHh2Ztdxv5pKp7KTuD
 6X7BpL+Pzw3I1efXxXSYLs9ZtXrOMIYiaO9UMiRN6PiTaIxeM3djj7cQwnbPjeuaSRtT
 rDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KDJMNJfIv5qLkX9gjcuIru5PdS9zm2I9aje75Yv/6w=;
 b=Ot+SYFjz0QPTyPmeL/6BYl0Z1YhM52U/xlYFPo5NTPW/WSK24GaIJQ/P2MWAUWyBid
 amG7tTy8djmMdST6yYKHfw54pNw2LvMEGaIRVA5HAjHu0Jw/YopQJYPRhg6vTejpd5sT
 CjjdnzQzHY/Mwkm85apcb/yj07p883aIbIzIPry5gEi8dol6cWb7oNEokUAoJiL0p2vu
 J5RjZe9hbXbGjAEFpk6FXCBhZCzBwMP5QAWYTIahIxh3e+3fdP8B93e4uZiM9uBGqJl3
 9mfYuUS6V13Jk9091Yt9pA0xRgAevAd2jQg+AzpXkDKX67HugmtBS9todasGl2S6XIDw
 DDwQ==
X-Gm-Message-State: APjAAAUPQUnKCOED4CTezIyH7jK0NOZdH7J/1cXrb9B8uuLtXT07PxYm
 FaNA1zM3jOXVPbKnQn3G4o3j61nglWpNcw==
X-Google-Smtp-Source: APXvYqzEvNUVnANyNFltuSglkuQsB1moXN98HHJaC97f/0xeIx8YKGzQqYpDqwYWt1s50urnsGQjHw==
X-Received: by 2002:a17:906:3955:: with SMTP id
 g21mr54442419eje.61.1558288643498; 
 Sun, 19 May 2019 10:57:23 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id z10sm4921920edl.35.2019.05.19.10.57.22
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 19 May 2019 10:57:22 -0700 (PDT)
From: nariman <narimantos@gmail.com>
To: broonie@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Date: Sun, 19 May 2019 19:57:04 +0200
Message-Id: <20190519175706.3998-2-narimantos@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519175706.3998-1-narimantos@gmail.com>
References: <20190519175706.3998-1-narimantos@gmail.com>
MIME-Version: 1.0
Cc: Nariman Etemadi <narimantos@gmail.com>,
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
Signed-off-by: Nariman Etemadi <narimantos@gmail.com>
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
