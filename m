Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F54684B1E1
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:02:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96879FAA;
	Tue,  6 Feb 2024 11:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96879FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213773;
	bh=MVhzqPNU9K+50YZmA4s78oKRhdwUt7nUippPurl6YL4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LxKNLm3EJr6QpzB1nTkdtJcPWtqedHA/dV3AHxwHld9VlN0gHOIlc2xCbKRX5djCB
	 v4VbqMDt40jtEKDtHCY3QWQj+nT1paEmzyoiLOfZWyn7WeTD3OA8mtyMrgEHEsnTSt
	 2NOkVtp4bMaLSVCJqT9e0vOliQOU4almPmhMMASU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0462F80672; Tue,  6 Feb 2024 11:01:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C98AF804E7;
	Tue,  6 Feb 2024 11:01:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35B05F801EB; Mon,  5 Feb 2024 13:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADD4EF80153
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 13:44:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD4EF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MTW7Kami
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so594166966b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Feb 2024 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137074; x=1707741874;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4Vl82m2zEorDZ7pWMk9i0Xlp64g/8z9zNmyXXlM3Ww=;
        b=MTW7KamirMajkwLN+UbrWv/AKexqYdxARxAmdg0uj34h02GxSt0nSOWjmypMo/pyf2
         Cc03wU45+23lxVmNnoXQOHqBsDdfH+aftD486ioD8ja3ZDExL22ado9aDku6MNrvmRTb
         82wpNuHEqu4uZujNaDvWeIV0uM4688nNKFzG3HMn+yukVDvY0vlidVSUvhGvK2oUJoDf
         glhirJ/v3mBq3irgoqDOh6JdzqYsHHf/0mRvXHY5Jf5BYHuCnxf6+6Vg4j4YFKELDh/M
         Bk+Cl6Q628UwqkPHdO4zalODkwVneRzZK4LH42z2G4R+H74kGCW/EOJVuHZlArkoGRhL
         IYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137074; x=1707741874;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4Vl82m2zEorDZ7pWMk9i0Xlp64g/8z9zNmyXXlM3Ww=;
        b=DjArj7hBDEZSHcAd/58/9sWx5SBpZioAD5RLV07pH80awlpDbtkbuZFrnRUk034VQV
         tycYi3+vpK+a034Y52apXiRBGx5rbw/8Ju6BsdVsT28yzXgVjNvbQfMMvjCco2vwiEJw
         fXU1EbNdAWUxn/a8pa+pr78UrhHF/YsEyqo6EZZZMsh1SlojZdcDN1PxC+6xszVoEDMm
         JtIwFlMGEnJ+4XzvC3CUeWNaioykOXHWVNVYlsiLBHbHfAExq+ZsvvKAF2GZPCYhSb2G
         klWKsNgiEKXQInv/K2pVChgqCcVroegCo36ZewAV4bO/7UK2eFRrAR/qym+oFMRm2Ymt
         80Xw==
X-Gm-Message-State: AOJu0YxB6ogYnP3y15fyFNzBTTPZ69gcyDJJwmEKtQtHUJpCEf0UFu6B
	yWAuSJaqCd5p6hIFE69UzmP8TBUsZnAQ331bOJ0WrFT0uuq7sNNoxcGLX/9Q+D0=
X-Google-Smtp-Source: 
 AGHT+IFcCBosTBE78GusQ6RADTjnIHb6MB9A+FrK1+MA3FZHOcbc8Iblcq/I7+Slr1+SiFtgUSoo3g==
X-Received: by 2002:a17:906:7853:b0:a31:4e96:f40a with SMTP id
 p19-20020a170906785300b00a314e96f40amr7218077ejm.26.1707137074271;
        Mon, 05 Feb 2024 04:44:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW4WiNmIJTwOQBdIusFKWvbUqNu81vffJtRd1DoC8f/9LiqEWIS+V1mSm6nQfEhW2qzARfp0/POzL6npsKHd4796GaGtgSCgHsBz0U9VlZ+EXQIo/iGEct5EQS4b/XYC3ioesFeptDuF6egOuCSjybk/ot9TKooH4FYvAnK1K5nFyTCNePDxDUQlTi4OkRPT9IUM6z9teerFQfOWaZ6fVMa6NJN7RDxeS5/J6mEW8oQHi9myZFSZjVF1/XrmkCdjuNUYFhngJlFP9pLH30RQgQpM//LR7gFDCmsY2O0NuXClfBWn53ENpktlgzxg4hFCOrHzb1cSQgX0jCHn6f2FhdaMt9h9sQMr8Pql2NoAf77yWtbPNmgUU5PVO5VpEPJKXSwJuOB91nHnHgNzhVYJyP/nrS/dkPlJmOUh72rKCfPFtdJ
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 th7-20020a1709078e0700b00a3742b09617sm3102294ejc.182.2024.02.05.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:44:33 -0800 (PST)
Date: Mon, 5 Feb 2024 15:44:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l56: fix reversed if statement in
 cs35l56_dspwait_asp1tx_put()
Message-ID: <0c254c07-d1c0-4a5c-a22b-7e135cab032c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TJB4LPUQ4LQUZHYBLYMRDAGB6VTSHMU3
X-Message-ID-Hash: TJB4LPUQ4LQUZHYBLYMRDAGB6VTSHMU3
X-Mailman-Approved-At: Tue, 06 Feb 2024 10:00:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJB4LPUQ4LQUZHYBLYMRDAGB6VTSHMU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It looks like the "!" character was added accidentally.  The
regmap_update_bits_check() function is normally going to succeed.  This
means the rest of the function is unreachable and we don't handle the
situation where "changed" is true correctly.

Fixes: 07f7d6e7a124 ("ASoC: cs35l56: Fix for initializing ASP1 mixer registers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
>From static analysis and review, not tested.
---
 sound/soc/codecs/cs35l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index c23e29da4cfb..ebed5ab1245b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -115,7 +115,7 @@ static int cs35l56_dspwait_asp1tx_put(struct snd_kcontrol *kcontrol,
 
 	ret = regmap_update_bits_check(cs35l56->base.regmap, addr,
 				       CS35L56_ASP_TXn_SRC_MASK, val, &changed);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	if (changed)
-- 
2.43.0

