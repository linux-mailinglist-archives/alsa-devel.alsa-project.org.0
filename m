Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AD187D8F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 10:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F77185F;
	Tue, 17 Mar 2020 10:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F77185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584439078;
	bh=VrRitmyc+Nv57pQuOhR/WpGFtlJGebhR43qGBp4yGNI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CA8EHkc+YjWK6V3ZL4sA6vk6mx7t+WyBHxJGAL988Zo3MVz09VSvy8QPBB4UUm5kM
	 bXbL/h0LIaLfMfFMTWibJCwuBbGzkyCH+SDNcsRCEJiyKL1u2cianfVI2PhAomv8hI
	 RZgYdl9xnUBZTC72sOJFzoPzFce4Aw9zyZ+AVQUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C82FAF80217;
	Tue, 17 Mar 2020 10:56:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DFEDF8022B; Tue, 17 Mar 2020 10:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E09BF80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 10:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E09BF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UNIfL1SC"
Received: by mail-wr1-x442.google.com with SMTP id y2so9273509wrn.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=42N7VCrThrSwnkSNBM3TwhqhSUki2RBAuZUgm+K5p+g=;
 b=UNIfL1SC+aOa6Zm0P+hVXUd1/ygNCoESBkxcifAH83Cbzn36AWtIPO2KiDy93M4lZo
 Q0xehMTfsZ8yXtzsSVIoOSaLaijVy9lVIJHA0+lkrJFMUw+apKWzrQLTH+8v3ZVSCiOv
 9gCIA1EeffTbUZqYHfGEe9yXV2EBFzvD95YghA3MZE8egtxsLJI7k24l5r34B4v+6R0c
 6esTUy0MQkG+pvF7HC2Z9CMzgrEb7EGU50flb5vTnAoSTdmCZpDw2sarWESSXHva2dNn
 IUCAlTZ49e8a/iXnO49+6aecaX2j1u3M3FtSQtB0y7IvaaQNLmeqDcj31N9TngXujwg8
 qVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=42N7VCrThrSwnkSNBM3TwhqhSUki2RBAuZUgm+K5p+g=;
 b=TYTWMr4Hy/yqQc5KqSJwxdfH2K8BrcP90RkGTIfQS/zze9Kl03cUA7aYbIEyV7ppok
 pmLR1CMCRkqhCXU+1qk9NGKKLD8KWjvIoj6GQ0AkffUw2eZVtK2w1U+A03IhPxUO28jv
 AGA4fSbqquqGlP+Tb/ZE3peMw+hhRbopyLF4ZxbWvpcz/9UBM26oZn86HetV/Q5Vi3JE
 Na7LAFgf5U+aFUbBv7rTmFhKJQ2M2D6MGiANvDa7xTFxKi5qN23PwPaS9vWpXPYhgJLr
 fyNJLvodwrnZPOR66zJUhUk0e2o2t8/QHqkuQ0vxJ8RC28TCbjjVcE2P+N/3ydjkbdkV
 RdgQ==
X-Gm-Message-State: ANhLgQ2jbZSJMDuJHiolnFTGcT5IjBsiVMAFOP3RSpaYSIRfr30W4Sy/
 JRqWNkEUtLQkgP+pU5Yeb+u6Kg==
X-Google-Smtp-Source: ADFU+vuEOv8DktK7HZpKYZKzfKWTTwJADXKyxrC6o1T4tNcFo4N7VZ+RX93SFmawI8izid9kdmDEqQ==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr4658525wrn.292.1584438970650; 
 Tue, 17 Mar 2020 02:56:10 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id a184sm3394970wmf.29.2020.03.17.02.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:56:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: sdm845: fix soundwire stream handling
Date: Tue, 17 Mar 2020 09:53:49 +0000
Message-Id: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Recent addition of SoundWire stream state-machine checks in linux-next
have shown an existing issue with handling soundwire streams in codec drivers.

In general soundwire stream prepare/enable/disable can be called from either
codec/machine/controller driver. However calling it in codec driver means
that if multiple instances(Left/Right speakers) of the same codec is
connected to the same stream then it will endup calling stream
prepare/enable/disable more than once. This will mess up the stream
state-machine checks in the soundwire core.

Moving this stream handling to machine driver would fix this issue
and also allow board/platform specfic power sequencing.


Srinivas Kandagatla (2):
  ASoC: qcom: sdm845: handle soundwire stream
  ASoC: codecs: wsa881x: remove soundwire stream handling

 sound/soc/codecs/wsa881x.c | 44 +-----------------------
 sound/soc/qcom/Kconfig     |  2 +-
 sound/soc/qcom/sdm845.c    | 69 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 44 deletions(-)

-- 
2.21.0

