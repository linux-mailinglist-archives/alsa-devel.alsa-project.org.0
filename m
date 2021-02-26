Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CC326514
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 17:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22FBA1678;
	Fri, 26 Feb 2021 16:59:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22FBA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614355205;
	bh=a7iE+SJzANLaONvH7puB2MWH2JvqTM1MeO5JrwWjvjs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KNlyzcByehNhXeMIn1aU9zBhddTxUda69jZr88W/Qc4OrHgA2khVcqejB0/Gu44df
	 pOlz6AcWSsjDM6XD9wwHUkYWDB++rUnB7lnq6JdHuEfH3y7e5Z4RI2IHHY/UthEE1L
	 MdgNx5HRpjHCQkwx73QuCBZHNhKie2xYF9e9XuTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98EBDF80249;
	Fri, 26 Feb 2021 16:58:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A362F8022D; Fri, 26 Feb 2021 16:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DD7CF80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD7CF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MHW2Pxfp"
Received: by mail-wm1-x329.google.com with SMTP id i7so1256099wmb.0
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLHTrfU3Zjihwx+6y3jZfrFCLGJ2eIivD/gyehbOpZA=;
 b=MHW2Pxfp0si6xuUqNuFIYgsocoIxmBuED6jXe9wqgnbCMS4vl6LPL444w4drS1y4b2
 IHfS4N3HT8EQepj+BpXwbYQ6O9a4TKWX81fK1eorQaDQlHwG5bAQYf3oRQphgWFeSFPv
 MNgvr5tZIFaZQ+oqaJTjEKPH1gQen1ma24KciGPel/TVYiUt2VklCYVxqlefJeQEt77a
 k45azYun1XN6UtBOSNUmaQn854vaBcVLelQ3XLCCg8BlRBPnqKYqc2OrU7ki4Pyi8307
 TlO1iA6sQXC/Dc6HvVOP/9Sg7IhCjksJ8yu6Lyi35hL5J2u1GbMazwyvYNQNFTZdQ7VY
 5A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLHTrfU3Zjihwx+6y3jZfrFCLGJ2eIivD/gyehbOpZA=;
 b=KL1RUVMK6Yh4zpH84IJR9hAX2G3XmMaRS7uCxqj0uO0uuSHpOABf3I5ajmDZy6FnY4
 S6BvkFSbmeNLZ6mdUtouzvIHRGq3ZoUnBY2qBxeB1sTMQhGktiO2zdhxo6pnhjlxVnU2
 RsAIMJ4HFmnd4eKkz1V0lrMyzF/oAZ3xn/vSJGcrGbFRgf/tA/YFemmV+TT/fWDt3HIn
 yhL54Xycw+7OIgrAVSNpqEvzjmxg4GRV3RY/ZI1vvrB3aCW9pOc6hpbBPsGwI8fG5SFs
 DVXqTuKF61tu4pFhL7WwceyfTk6SqKih3ATFLOKDdwSUa9eaTR5/t4fwGNypk58SWNrF
 +Tww==
X-Gm-Message-State: AOAM531w2SbcCN1W+4tpNy3nwIBwVqJbw3hW6q5Kp2y2eo4u4R1EaprX
 30tWg7wRe7DsYpFpSudY3/E1+Q==
X-Google-Smtp-Source: ABdhPJyIXlVF1XjGI6Rsho51LPb7veXYIn+o7cujO/Kp+tEpdXVoUByo3icsSsniwIsWRt2Ha4GEow==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr3538411wmf.165.1614355106619; 
 Fri, 26 Feb 2021 07:58:26 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v6sm14398945wrx.32.2021.02.26.07.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 07:58:26 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2 0/5] soundwire: qcom: various improvements
Date: Fri, 26 Feb 2021 15:58:09 +0000
Message-Id: <20210226155814.27536-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

Thanks for reviewing v1 of this patchset!

During testing SoundWire controller on SM8250 MTP, we found
few issues like all the interrupts are not handled,
all transport parameters are not read from device tree.

Other major issue was register read/writes which was interrupt based
was an overhead and puts lot of limitation on context it can be used from.

With previous approach number of interrupts generated
after enumeration are around 130:
$ cat /proc/interrupts  | grep soundwire
21: 130 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire
    
after this patch they are just 3 interrupts
$ cat /proc/interrupts  | grep soundwire
21: 3 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire

So this patchset add various improvements to the existing driver
to address above issues.

Tested it on SM8250 MTP with 2x WSA881x speakers, HeadPhones on
WCD938x via lpass-rx-macro and Analog MICs via lpass-tx-macro.
Also tested on DragonBoard DB845c with 2xWSA881x speakers.


Changes since v1:
	- changed bgp_count to blk_group_count as suggested by Pierre
	- used version raw value as suggested by VKoul
	- updated read fifo logic and interrupt handling to do while()
	- renamed some of the variable to make reading easy!
	- removed patch that parses version

Srinivas Kandagatla (5):
  soundwire: qcom: add support to missing transport params
  soundwire: qcom: set continue execution flag for ignored commands
  soundwire: qcom: start the clock during initialization
  soundwire: qcom: update register read/write routine
  soundwire: qcom: add support to new interrupts

 drivers/soundwire/qcom.c | 438 ++++++++++++++++++++++++++++++---------
 1 file changed, 335 insertions(+), 103 deletions(-)

-- 
2.21.0

