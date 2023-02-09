Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0E6908CB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:29:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3886DEC;
	Thu,  9 Feb 2023 13:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3886DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945766;
	bh=ZQgR+BF1HJTN4tg9ccE1rh78j7jNM35qYRBqWg+o6I4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LwYxpv12cr3TijYo+oryVDIYIhoePGhur0G+MNJGXneYsjEw3Jl+ggAhKNvjXwaCU
	 VSalws+48YpMfTykBkTwzVsQmzWGDrzUJgoA5MqKCWSaqSB8R7PmVo0znbE1fpa54O
	 E66fjB3xCuWMRYFvHloxXF0DoNumCLGKIDNpGVjY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8A9F80094;
	Thu,  9 Feb 2023 13:28:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB2DEF80527; Thu,  9 Feb 2023 13:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 430AAF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 430AAF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FhMGyC3f
Received: by mail-wr1-x430.google.com with SMTP id ba1so1594566wrb.5
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8QLwX69nf0DJLU5VOw1LrskXEQNPGRhtdKLVFDYpxA=;
        b=FhMGyC3fv8EZy7CQfcEbL8abhhHF2d6D1olU6YTGDONxW1BWVWDySOGT5JQTLl4VPO
         k4QFLpcktqnFDfWeV/0E8wBIjO8ikjxGgsS8kVsyNe6FaxyflzOwNEp314DmjKoaGLLA
         PJcBk50Aho76l7xBATmNxc2CpkvwtfX+TKgk3TbMqy77qwmX+drdurYauOJPRGheYxBe
         2pq9Cg+JnfoFo3s/UDepwhQQJXBSGemdAx80cILx7QJRvHJz7Fsy7gLYT0pg/h4BhSNv
         0YwTsH3m2vkonDW9debhik3uAHVRxPC6Iwe1+Fx/8a5yh7/51vgC8V6p3fEmJ5INGCav
         L/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8QLwX69nf0DJLU5VOw1LrskXEQNPGRhtdKLVFDYpxA=;
        b=JA71ohQFVO1DB8O+HB+R/NkMIjhEKgnZgrhTBRk41rfScI1eEI+Lv7KdH2VaBW+Ecs
         poUAXCxNKAPVRND0piQVPyfH+tCI56M5ZVitc7hkJBz0b09k1ZE2/q/AcWQvHHggbS4X
         fejb7458mM+IrEZzUyiCB4yaENC08F7whw4DAHA5rvTE/CozkUsYdBEX5SfLIZ2dUKCf
         NX975ozM5L5xunLhf17vsE80k2xRry0ZJadGMc4/aMjkIWmPTw4Yty3RR9b/btYBH7HV
         /4T9gf+h/odx+sPbpWHl0AuD7dmwjDEmqxQkKfWuFzSyxVwdqjpB7x3vqTLFCyPBUdCh
         fWJg==
X-Gm-Message-State: AO0yUKUggwAPwmCuRSCBMQtkqUYPncWKiF/Y7Yhna3Q36UkfeovHwPb2
	oNyPcij6U/zkg7qx/H6cUpJ7GfYnR42x2Wvw
X-Google-Smtp-Source: 
 AK7set9ciyAoHpPjrl4xwcz7REVoH5xOB9ZATOsfGQ2M5+H6rz0ekG5VioaTFIzMDxvyPnVihPgdvA==
X-Received: by 2002:a5d:4fc5:0:b0:2c3:e297:8e4d with SMTP id
 h5-20020a5d4fc5000000b002c3e2978e4dmr1613733wrw.6.1675945694989;
        Thu, 09 Feb 2023 04:28:14 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/8] ASoC: qcom: q6dsp and lpass codec stablity fixes
Date: Thu,  9 Feb 2023 12:27:58 +0000
Message-Id: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4BNMDJENXTRLY4NDS4EKP575M2PJGKWC
X-Message-ID-Hash: 4BNMDJENXTRLY4NDS4EKP575M2PJGKWC
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BNMDJENXTRLY4NDS4EKP575M2PJGKWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While testing X13s audio, we found multiple stablity issues this patchset
fixes these issues.
>From q6dsp side issues are around locking of position pointer and handle
multiple prepare cases along with pulse audio timerbased scheduling workaround.

>From LPASS codec side most of the staiblity issues were around runtime pm,
hitting various issues as the codec was firstly resetting the soundwire block
for every clk disable/enable which is taking the slaves out of sync and
resulting in re-enumerating. Second issue was around fsgen clk is not
brining up the codec out of suspend as it was not added after
runtime pm enabled. Final issue was with codec mclk rate which should
have been 192KHz same as npl instead of 96KHz. We were getting lucky as
wsa drivers are setting the same clk to 192KHz.

With this patches, x13s audio is pretty stable.

thanks,
Srini


Srinivas Kandagatla (8):
  ASoC: qcom: q6apm-lpass-dai: unprepare stream if its already prepared
  ASoC: qcom: q6apm-dai: fix race condition while updating the position
    pointer
  ASoC: qcom: q6apm-dai: Add SNDRV_PCM_INFO_BATCH flag
  ASoC: qcom: audioreach: fix ADSP ready check
  ASoC: codecs: lpass: register mclk after runtime pm
  ASoC: codecs: lpass: fix incorrect mclk rate
  ASoC: codecs: lpass: do not reset soundwire block on clk enable
  ASoC: codecs: lpass: remove not so useful verbose log

 sound/soc/codecs/lpass-rx-macro.c       | 31 ++++++++++--------
 sound/soc/codecs/lpass-tx-macro.c       | 25 ++++++++------
 sound/soc/codecs/lpass-va-macro.c       | 43 +++++++++++++------------
 sound/soc/codecs/lpass-wsa-macro.c      | 27 ++++++++--------
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 22 +++++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  5 +++
 sound/soc/qcom/qdsp6/q6apm.c            | 17 +++++-----
 7 files changed, 101 insertions(+), 69 deletions(-)

-- 
2.21.0

