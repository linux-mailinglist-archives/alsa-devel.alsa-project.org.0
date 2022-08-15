Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED0592B31
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 11:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9335C846;
	Mon, 15 Aug 2022 11:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9335C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660555424;
	bh=VjIVnzK1o5kGhUG6dIwR7mEetZrAv1lP00NjZ70Dq6M=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o8nksKPaC6MkmYXFF6D+0rCzXJnUyLwf/u3f3pm/+I413eEGk3v7YdNWE3FKrxbBW
	 IGbC+yEUswwFqZEwSrKvKiwdenZye8tjZC2IphZKlGSnQhbzE5aXXHIJDgpC1i3l8r
	 Oj28bH0EvAzVogWx8sANk1svDU8Xpq/8X10im1kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E71F80095;
	Mon, 15 Aug 2022 11:22:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47314F8025A; Mon, 15 Aug 2022 11:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE3B9F80095
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 11:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE3B9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ViKn1ZyE"
Received: by mail-wr1-x432.google.com with SMTP id bv3so8395914wrb.5
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc;
 bh=qzcAcm6++5DvbL9ZgETq61fGGJoH3IeKrWjR9cNRVd0=;
 b=ViKn1ZyE2Z7QY99jwh66gZ8eloKi5hAKRHxR0rK0KalHGEkpoRj+ILJeo5OmDGCtwc
 k+1aMDD3y3gnioyb15vKDvR49WEikqljm04lQ33RK2g3vp9fTeGNIWOIa7E9lk4GLdNH
 9QS+rvaQkDj0n7l6BCg170Otny59jfiaK5Thl/+xRun5d2KmajcCpDgnE6Az7ciReALW
 slQ2/p06YWO0ldJmDfBot2cOvBzhcJsNbM0cwUC/h7hwgMSxncHa4H/+mv9N6X3eT7qQ
 n0/ChLh9Q/4TCs2D4v0V5xAdUQO6I4vzHsDqDpZf1Wntxgyc+D4x08HjHCN0F5ZIu51/
 6yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=qzcAcm6++5DvbL9ZgETq61fGGJoH3IeKrWjR9cNRVd0=;
 b=zrsLUPwevL5xzCdMG2sj53WPiJlpGz+avc42xov1mwCQGVDBOhww0oO8oCx2+OrVBb
 OZ49j2cgScivzPH8BE41dTqCss2J220+ZQ6zjEHrO3OBjIeeSjeReuQYgyOApLwb+o6T
 LdRJB6DK2TnZDYSgp6jfHke8yN4K8Id5JA5v8nRMTxKj+P1pk5SQHyK0oCmwq1U2tS2i
 3im6qBBA6rVOwnkDyfZOyWoaOEq6vQLmkA0Cb2mTaLpcOyoPs/FWdPqrAzrWKJG4INR3
 0akBmeJueR/4vvoJobmyBPz1PVTtWeqSnN1HLgatjtGEehTnaDa4af7q9J1sW969wsmp
 v0vQ==
X-Gm-Message-State: ACgBeo3TCoWWsYXJHXUrgL2q2Zskhfl5RF6QpYhFYvOAf0SZog4KgdaM
 KdSgB0E1QHPYPjnqX1+DucgKdQ==
X-Google-Smtp-Source: AA6agR493IrXmZ/qXguVLTFC0hbVZ36f6jt2WpZZmnV5dtaVod82+9tcxLIgQYTd+wNnC1TtDp5gIw==
X-Received: by 2002:a5d:5a96:0:b0:223:8131:e4f2 with SMTP id
 bp22-20020a5d5a96000000b002238131e4f2mr8221829wrb.345.1660555358805; 
 Mon, 15 Aug 2022 02:22:38 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 f13-20020a05600c154d00b003a54fffa809sm9704195wmg.17.2022.08.15.02.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 02:22:38 -0700 (PDT)
Message-ID: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
Date: Mon, 15 Aug 2022 10:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: ASoC: snd_soc_info_volsw and platfrom_max
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>
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

Hi Mark,

After patch  30ac49841386 (ASoC: ops: Don't modify the driver's 
plaform_max when reading state) all the controls that are using signed 
TLV range like below
/* -84dB min - 40dB max */

SOC_SINGLE_S8_TLV("RX0 Digital Volume", WCD934X_CDC_RX0_RX_VOL_CTL, 
                    -84, 40, digital_gain),

reports max value as 40 instead of 124.

before this patch the controls max value was calculated considering the 
min value, but with this patch this calculation has changed resulting in 
low volume on most of the codecs that are using SOC_SINGLE_S8_TLV.

snd_soc_put_volsw does the right thing by considering mc->min, but 
info_volsw does it differently.

Below change fixes the issue for me, but I am bit confused with the 
first line of this function that calculates max value as max = mc->max - 
mc->min and then limits it to platform_max.

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index bd88de056358..49fb34609202 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -196,7 +196,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,

  	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
  	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = max;
+	uinfo->value.integer.max = max  - mc->min;

  	return 0;
  }


Or should we fix the macro to set platform_max to be max - min.

thanks,
Srini


