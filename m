Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A4487B45
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 18:19:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2294918F7;
	Fri,  7 Jan 2022 18:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2294918F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641575976;
	bh=6NbP2uY9mTfghNJFdXxg5HcJgIsc0SiL/pn0Z18FaNY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Csxfl67R+DWmQL0nfQ7S3uiNRReZ/XHnkSVjiB02/R+wpelupSEOicqxAX2adfhxd
	 O4BTbMKZoipDrP7svOzhwOdS957RWL/q32HOfbJWm9Rje3ZQ9Pfn1u0EG57ppJOKF8
	 8A9Lp9jhSAOKpxYyzcEKjKlEspSIRZQB8bMyOpAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D2AAF80254;
	Fri,  7 Jan 2022 18:18:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 137CCF80155; Thu,  6 Jan 2022 10:29:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED4A1F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 10:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED4A1F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aM/LrGv2"
Received: by mail-pl1-x631.google.com with SMTP id x15so2125717plg.1
 for <alsa-devel@alsa-project.org>; Thu, 06 Jan 2022 01:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fPr1nBHiTSgph/tTGH5kJPnXHbDmfAq4bys7S0VY+v0=;
 b=aM/LrGv2rQk/Pv4J+BPxttat1R8Ou8GuDntATvl1kGiENNx9xqFxp5OI8SbG06Trai
 fk80sMZVXCI1GVpWV4iBHN3dYBZvzCvkBnTd9vO7kZ2VLi/q0oHJC9UDyTiD3yHbHwbP
 iZCM7ZrPfybKTDeSjf1yIDrdG273/VFpjnQswo0LmO+3qu//py7U4Jomi/wWazGa0qca
 UniZR83cSOTj+l302efM3g3UtL2R6f7/m5/kVWYZaq645a8vzmvCPNMZq5GjxC7FN5Wu
 UL6y6EyaRccNwxjGdQXq8kNe/mNFrMdaazyQJyNWVjnbU2LkXFhlG/236myRLA2ospE9
 kUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fPr1nBHiTSgph/tTGH5kJPnXHbDmfAq4bys7S0VY+v0=;
 b=UJEpno1xEEuHkySHk3zXnB/ApiTUrrJEUz91pjZfCwbxaaVicnG5WGr7ODKsPQWYqC
 YwTVSRd6v//NkKn5mVCVTl8dI9UTQ1wH4PnsPMSOGcKUs117cMkUxj74E9ayrvrfVTx9
 gTg5ZbcrV7fQg442TPsYA12EWpvj4nXKeZeqdg3MtS8Sy1+FR7ymUG3Ajr/VxLBCIzgP
 UPtv6VBBdr2/QtkLHzdSa1wpAJXEDbmcw03I2yd9bH/ewf6Sw1lVCKXMEkJVwFc7OFtT
 6q4M/L9tScsTEaPf77QvMQknYxvIaR9+UE0GpTs5lx/GtHESsJcqIRbAgMS46mRg7tyi
 CxwQ==
X-Gm-Message-State: AOAM531n+OqzX9JgewAlmwjPygYIqIpLwUNft4SPiTeWtxplWDmet1XC
 za146gKLp88y179f7vdlUpI=
X-Google-Smtp-Source: ABdhPJwf73l4jLY2UjJyhmnaA/8ASiTX8YUzJY3tfkfrZJHHEdLXj8Qe9C34SXMZigHJaNJ/vXgxAg==
X-Received: by 2002:a17:902:ab85:b0:149:ca14:4a15 with SMTP id
 f5-20020a170902ab8500b00149ca144a15mr7738385plr.169.1641461384280; 
 Thu, 06 Jan 2022 01:29:44 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.151])
 by smtp.googlemail.com with ESMTPSA id rm6sm5712002pjb.35.2022.01.06.01.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 01:29:44 -0800 (PST)
From: Qinghua Jin <qhjin.dev@gmail.com>
To: 
Subject: [PATCH] ASoC: topology: Fix typo
Date: Thu,  6 Jan 2022 17:28:47 +0800
Message-Id: <20220106092847.357035-1-qhjin.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 Jan 2022 18:18:28 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Qinghua Jin <qhjin.dev@gmail.com>, Mark Brown <broonie@kernel.org>
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

change 'postion' to 'position'

Signed-off-by: Qinghua Jin <qhjin.dev@gmail.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f5b9e66ac3b8..2630df024dff 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -56,7 +56,7 @@ struct soc_tplg {
 	const struct firmware *fw;
 
 	/* runtime FW parsing */
-	const u8 *pos;		/* read postion */
+	const u8 *pos;		/* read position */
 	const u8 *hdr_pos;	/* header position */
 	unsigned int pass;	/* pass number */
 
-- 
2.30.2

