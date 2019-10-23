Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A37EE198A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 14:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98EE84C;
	Wed, 23 Oct 2019 14:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98EE84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571832258;
	bh=WsB5yjc563dHnQ9NaFqlEfMm1S4WlbXvy5Qzi6AFKbs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zr2W+cz9CVo/AQdphjaWKuSb5CWpWYtFbKPcKHM2MecBoV258jrMJG8txSCBt75l3
	 4j+TwPIq3r7YMfdWob/rgvGBPp65SBOpZvnaBCS83ivrv5d8V7+tLBi/evkuBvD351
	 tk05aPSDtNcukzev709mabUKy/ecv3DNtYqKo30k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D46F80393;
	Wed, 23 Oct 2019 14:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2105F80368; Wed, 23 Oct 2019 14:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DFA3F802DF
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 14:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DFA3F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CCgJ5cz3"
Received: by mail-wr1-x443.google.com with SMTP id l10so21370647wrb.2
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30tJodiBlFlqrdUgqt8VJ1gRlSuA5Ts2Gd1sRfzuhro=;
 b=CCgJ5cz3aGjXJ062xtGkOluRzpQO8y5PZhK9U4RqOsimV/h4mWaIeKYu3nyMUp+k2L
 dn4TxqpSHqCRcE5TOVdeyByiuVte+pAVIHlAJuemHSrX6MxiRfnu5jjXyoTxMH5d+N5X
 BNc7hbchEUuKVoAP4W056wvNCWGSM3uyMpskXaot78uy7Lc4V+G7nkHJl9Y5OFN9TY4e
 lhsgFvT4c6SJotzEbAZ+2GC1vNsmamlAM1GBkhK4bwTYmloQomXeAnBpMdx5hjUIB3Mn
 hAFQ49/xmVhM5VJKEVNXzd8++AstZTXjjX9AG6e+xsPwrb9ll47c3sBP3cYzggZs9k6Z
 2ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30tJodiBlFlqrdUgqt8VJ1gRlSuA5Ts2Gd1sRfzuhro=;
 b=iRMJkFNg7v7MN/oWyrhUcgqSX/2+MlRo8a6UIwM+KfoPtHUKlXYZ8CzldhytvdwZcO
 8yQRTiQz1+KJkaYnh7oUvMRtbmsyCN6GzcjjPlvp2YHX1HhrHw2Eg24d0nTVdS+0tZf1
 V07vC6fPNHuXM5dG8LKlk+yFw9ju6n2MG4/N4VuDPEL5VeYDMSIk6kbCsrnCwXBhGA0e
 DCGlpQbYMoDgBdB4LaYEspN+2sJeKDqezgSn7dE2LCVlefwCXckOAUGE1lwJtp/xoOFu
 UAbbDNykXl89GNRYVXU2v5LAbkYaLd17b1fNF4jFSeEXdvHTXcXr1u7uqhuJZiFnhAYL
 WMAA==
X-Gm-Message-State: APjAAAUAQeCynZiDQm5LKHU5/ci2y0ORHT8fCWtjkMMhF4AoeZniARFw
 nIias6UEHrM2EqZW0iAATz5g9w==
X-Google-Smtp-Source: APXvYqzPsMP2QG6vJW6K+4h5AmhA93qLL58ElFcc8XXaJGlsHRV0O5jlls3TB+sjTbRNmr2PkUP6Yg==
X-Received: by 2002:adf:e30a:: with SMTP id b10mr7740711wrj.44.1571832148114; 
 Wed, 23 Oct 2019 05:02:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id b196sm15247148wmd.24.2019.10.23.05.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:02:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.com
Date: Wed, 23 Oct 2019 13:01:14 +0100
Message-Id: <20191023120114.17445-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, Preetam Singh Ranawat <apranawat@codeaurora.org>,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH] ALSA: pcm: fix blocking while loop in
	snd_pcm_update_hw_ptr0()
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

From: Preetam Singh Ranawat <apranawat@codeaurora.org>

When period interrupts are disabled, while loop in snd_pcm_update_hw_ptr0()
results in the machine locking up if runtime->hw_ptr_buffer_jiffies is 0.

Validate runtime->hw_ptr_buffer_jiffies value before while loop to avoid
delta check.

Signed-off-by: Preetam Singh Ranawat <apranawat@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

This issue was noticed in Android setup from fastcapture path.

 sound/core/pcm_lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d80041ea4e01..f407f6895f8a 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -341,7 +341,8 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		 * the elapsed time to detect xruns.
 		 */
 		jdelta = curr_jiffies - runtime->hw_ptr_jiffies;
-		if (jdelta < runtime->hw_ptr_buffer_jiffies / 2)
+		if ((jdelta < runtime->hw_ptr_buffer_jiffies / 2) ||
+		    !runtime->hw_ptr_buffer_jiffies)
 			goto no_delta_check;
 		hdelta = jdelta - delta * HZ / runtime->rate;
 		xrun_threshold = runtime->hw_ptr_buffer_jiffies / 2 + 1;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
