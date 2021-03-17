Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2BE33F3EB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 16:18:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42C921679;
	Wed, 17 Mar 2021 16:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42C921679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615994306;
	bh=12YaRXnqB6RC63JOe1fjjED3cJquUn1EkFAy/mBLinc=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZChqu0DkLtf1oNGjg3Lk6Hy41lu9SwnfHLpCcxfYyQGCZPUulc/SFVooHF0ICJwZG
	 xI7XPeIxL1ELQ2zFaBkUy4Pd0Nd4GuB4fk6ZUnwfxLyMJhNc0E4hg4Rzud/b2a5mXV
	 guVgiyp8m7iFDe8YPDinolz/ehSeQ4wCBZAR31a4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C352F80124;
	Wed, 17 Mar 2021 16:16:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24DBAF8021C; Wed, 17 Mar 2021 16:16:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F5B3F801F7
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 16:16:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F5B3F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="trGxnBBS"
Received: by mail-wr1-x431.google.com with SMTP id x13so2217666wrs.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=WNZRMgHoEHeLLLfXzUUhlQ0EtlAIY77BCmJUsOFsL+k=;
 b=trGxnBBScxC7R3N1SH6V61CkmmS+hRpZVRiSXx8ZA2DizKd4fUWlMRuX8kHIcrhBGR
 ybB/82UWOIDBTLPM2TiukyAR5QZfbBousSZK695NvoHfuhFvic9qq7jKMShiuxDhwT7p
 fCaMWWX69G9dp6yYZWRAyGbLI6VDdJlJkCof4HE6ekhGQcM1BOTibJUiGVbS7o//FOZx
 ilSIE3KgCy4WQNiL9YwgaA5pm+IZs7SCcJr9rg4R2oEOZn9/qXgYTnWoUtIFcvp5rodo
 oubFB3WhD3lsakh2PzNdgp8BR0wguaD1yh8YZS+ror5BZAYedlytglUBHHyJpzscKo+D
 06IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=WNZRMgHoEHeLLLfXzUUhlQ0EtlAIY77BCmJUsOFsL+k=;
 b=Y3cWgOPaC3HtWldBNju36QZPXZJJSZK9PwZehg+i6aGIHsCXcLR/v/JSM+Og5pTX6v
 7kMIyJFytgAI4O1ssfJpYakZ1LO3Iqubalk8hjkdOdShwX+w95duIYBwJm7yk46m+yT4
 Q8PlP52pxGLK0CDHE0iz99gL44CdlybPdioosgcVbYEUyvFYSW2RL9CStR4Y94MGuSnF
 06sLONHamqeabaQENG3lSd5nBukAiGgacCAlxod8rKhQ2j0GuM2PQJTGH8pbIUojkfmz
 IcoIe0zeYVGYtWYnUB5trWFsIwyCJoAcBKO2QdzvsZghTT/mr0RKQNbc34TsLMer7QG4
 /3Lg==
X-Gm-Message-State: AOAM530aEJcHmkPdipkLAnDO2E507eabt0qSYBSBfwNtlu7N0KO09+tW
 agGTkYbjW8/fBsWOZL2kp4+UtaZOatBsfw==
X-Google-Smtp-Source: ABdhPJzWW7WcD2q27+UeGV/sUdGFIagwUM13mlBTg5EiuLpgoiVS4FBv2xkscNw5S9XCDDm//Jzkyw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr4834482wrq.136.1615994204396; 
 Wed, 17 Mar 2021 08:16:44 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n6sm30259095wrw.63.2021.03.17.08.16.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 08:16:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: ASoC topology loading vs card bind
To: pierre-louis.bossart@linux.intel.com, broonie@kernel.org
Message-ID: <09c77d7e-3def-0643-b838-94d748529333@linaro.org>
Date: Wed, 17 Mar 2021 15:16:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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

Hi All,

Am trying to load a FrontEnd/pcm dai definition from ASoC topology 
however I hit a catch 22 situation here. Topology is loaded as part of 
component probe() but component probe is only called as part of 
sound-card bind().

Any pointers on how is this supposed to work?


Thanks,
srini

