Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F067C75A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 10:31:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD24CE71;
	Thu, 26 Jan 2023 10:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD24CE71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674725474;
	bh=DJGJszFWJl+bVE21u1WXkVgzj0UZ58rcV8CrE7ROuRg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=vif/9LAjy7EveBe1U7pJQ91Ub3rLKcSLV3ca/ik5vw33lXnLQCsK44nUBKyHgBkzc
	 M0jWR7A3Js4FoOEcIda5ohgstGjiqxS93+PHucYgHjCtcjXgoIzj0Z448hwAK262ox
	 JBcImg0UzZN1WSMF6pSoOe8k+Wh8FcuwZqm3yNAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5346EF802DF;
	Thu, 26 Jan 2023 10:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8171F8027D; Thu, 26 Jan 2023 10:30:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31CA7F8016E
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 10:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CA7F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oH4g29yG
Received: by mail-wm1-x333.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so692635wms.4
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=53zqjk/QjV8XLHukhAeoEZ0VLwkWFteYs5gPHt0hVVw=;
 b=oH4g29yGQ+U/JBwaDC+0dNSxWoVo3WG20yxUOq7FOuEjlLXrWCiKgwFO83wI2hqFyr
 pjoN2q1GM+s0e9w98q3974f8amUfIOAYWiWd2EqdlgiSdbbsaDjr7MiZgW588iuqLSnz
 K9deXfDNJiSFfzsKu8X3hrQFSA+Jkf4viA01kK4Rn73z0OUOZU3XlEH9t4gpUBPUVnyw
 sA0b6ZkFzFnHN5opQEx12nQ+O/Om13YXz/GnuHLC1kYZ6QVougXw4vE2gt8ZMmL1j0kN
 tt5IjAMbxsS1DD+o38dizcg4qXIthhw1yhBtKfT+c3RNBedQFmMZ5DhrYCfdzjj7OapM
 1Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=53zqjk/QjV8XLHukhAeoEZ0VLwkWFteYs5gPHt0hVVw=;
 b=VT+iSfjiSh5C3Jl3XXEMzOhg8uC56gPsYGrqNzG/+20cnOPdbvOBU6v/ITXPlQsmSF
 O11dkSdikdHQO5URg/pYuhJnH2ZLvQ0Xe/4bV9tenSOoN5rE4V/S7eAEMYiA/Pe9w+39
 xCDVPHb7GER2A4KaxafiRVwU/icfzuPOaAUzFuZNIr90Fjf3K5FWCv+TORvoFb1q1mGU
 iNUEJqAghdWOVSdHmmwBeADftzFDXupncmW/V0ihnLz7B4ncbGK3qiHJI+ZGouuMC7Ie
 tXh+N76UPkALRfri4XsKGQCfVhtGaTVMyk/kjPt0pucuzDuuHota/mKxvNK2UVNTCUPj
 kfcA==
X-Gm-Message-State: AFqh2kqh6w0QNdR/fVO1HAfqRZJuREQo74q5QCftNalZ1fUlu0CGvM17
 eDlpEZNh9bEcoyospjSrIsQ=
X-Google-Smtp-Source: AMrXdXveP98wGLr+SaP1jr7q/JDiHAEPg0nzZ12jzVvn+eqhQXA/cBk5+1w7fnP/sZf93ONs0DOFNw==
X-Received: by 2002:a05:600c:35d0:b0:3db:c4c:9224 with SMTP id
 r16-20020a05600c35d000b003db0c4c9224mr33355186wmq.3.1674725406458; 
 Thu, 26 Jan 2023 01:30:06 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i21-20020a1c5415000000b003dc23574bf4sm957077wmb.7.2023.01.26.01.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 01:30:06 -0800 (PST)
Date: Thu, 26 Jan 2023 12:30:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] ALSA: pci: lx6464es: fix a debug loop
Message-ID: <Y9JIGt0HT8mLkUXF@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This loop accidentally reuses the "i" iterator for both the inside and
the outside loop.  The value of MAX_STREAM_BUFFER is 5.  I believe that
chip->rmh.stat_len is in the 2-12 range.  If the value of .stat_len is
4 or more then it will loop exactly one time, but if it's less then it
is a forever loop.

Fixes: 8e6320064c33 ("ALSA: lx_core: Remove useless #if 0 .. #endif")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/pci/lx6464es/lx_core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index d3f58a3d17fb..7c1b380a54c0 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -493,13 +493,11 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
 		dev_dbg(chip->card->dev,
 			"CMD_08_ASK_BUFFERS: needed %d, freed %d\n",
 			    *r_needed, *r_freed);
-		for (i = 0; i < MAX_STREAM_BUFFER; ++i) {
-			for (i = 0; i != chip->rmh.stat_len; ++i)
-				dev_dbg(chip->card->dev,
-					"  stat[%d]: %x, %x\n", i,
-					    chip->rmh.stat[i],
-					    chip->rmh.stat[i] & MASK_DATA_SIZE);
-		}
+		for (i = 0; i < chip->rmh.stat_len; ++i)
+			dev_dbg(chip->card->dev,
+				"  stat[%d]: %x, %x\n", i,
+				chip->rmh.stat[i],
+				chip->rmh.stat[i] & MASK_DATA_SIZE);
 	}
 
 	mutex_unlock(&chip->msg_lock);
-- 
2.35.1

