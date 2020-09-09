Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EBA263166
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 18:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B141730;
	Wed,  9 Sep 2020 18:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B141730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599667921;
	bh=x2gCMFMMZDEb2NsfaTCBp0fqnN9snmLzDOYRUgWAwsY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ScXkI4/wtAzC9yAk3pNzAD5zeqdC4nye6BiiuGs8rUBm8wIq9KQbofUPZJEA2+cKf
	 JsbKb0rD5aCccp5y4iZgm5Sl+eCbSUHOy5Sg8Qh/GXBfGpo5s+OjSWTiQrNmZrBkjR
	 63C7BZb1bQFqDmIN3iD4tjsb+jb2xHV2jqgNrSPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D24F80274;
	Wed,  9 Sep 2020 18:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D14FFF80227; Wed,  9 Sep 2020 18:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B42DF8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 18:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B42DF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bsYiEwdD"
Received: by mail-wr1-x434.google.com with SMTP id t10so3600922wrv.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZqvVgirpM6FcpEhiJW0dwGOjpamDWw9ATf2Cobutv9Y=;
 b=bsYiEwdDCWH1+GY6Ya0Vfsj5+3/XLdf5eYSV9fRyVeH/V5maqQl5klvHrG/A2oQO8M
 MEIdycn++NwTJFZMuZ5fxMC99J9HRbk7O2kqaTZYhzq/1mxsGo36p9rXDw4o4epQn3er
 E+r+rqsuqwgidI0Zpcyn22P2aafSY+07e4xsFGNy0/N13L4+dkUrlw+s71xlTXTBxk9v
 GZC7R0e8wmysObKn9KNxYEBLsxPCY7y4FfvCblKXIv6Ju6KgAEBkhFxNoumHyhXULkZK
 /5wz5rSCP35sVq2Foz7t6K0zJlpcCXT6leCycutIyiyPqaZq2LjG1z6MziJI6RKE1y4P
 i+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZqvVgirpM6FcpEhiJW0dwGOjpamDWw9ATf2Cobutv9Y=;
 b=JrxG4nB0xr2jSJSxBKW85ZhCBZqE2eJFoBO/VW/495dRCdlKyXAs29oBC7kIt4sFtL
 HGuHehL9ln73/tk2YyXrLRE9ZsOgu+lH5X/3aD+aTuYfiFNrw9E5HuvpdQtSP02K20DR
 iDyK/5UiNBvns2Bavc5PVkFfEftTpVf+SmmCKcJnCkdMo1i8NjGB9B90XCvRtJIsV8+/
 bTxMDeF1xmnhbOsx6xJSTTzmarZUW50fdtfBUeOFYLSjXSc4wC9YatFdE4b8zhuuESTF
 M0o20XBbOTJX3qSBR10MAYvFWjDfRf5iJUxN4wj2zgfPbWvrPK7J4AULvWGu4ALhybXU
 sj0Q==
X-Gm-Message-State: AOAM530OyH6BH6tAghcj6tlCjI1MoIC2Xd3AeHV9W0nDEYTtX/RFOdsm
 MBMC9qC6YNA6wYqhbWrUQuUenw==
X-Google-Smtp-Source: ABdhPJzpMD92uBIiFbI1aAqFUlENX3HPsLiUOaHzzQvuLF521tmKbIz/BFC6EEhrwIgeeH7NHVKN8Q==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr4535198wrl.401.1599667761040; 
 Wed, 09 Sep 2020 09:09:21 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id k22sm4900824wrd.29.2020.09.09.09.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:09:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] soundwire: qcom: fix IP version v1.5.1 support
Date: Wed,  9 Sep 2020 17:09:10 +0100
Message-Id: <20200909160912.3656-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

While testing Qualcomm soundwire controller version 1.5.1, found two issue,
Firstly the frame shape information configured vs the bus parameters
are out of sync. secondly some ports on this ip version require
block packing mode support.

With this two patches on top of https://lkml.org/lkml/2020/9/5/220
("[PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire master")
patchset I was able to test 2 WSA speakers!
This patchset depends on this above patchset!

thanks,
srini

Srinivas Kandagatla (2):
  soundwire: qcom: add support to block packing mode
  soundwire: qcom: get max rows and cols info from compatible

 drivers/soundwire/qcom.c | 68 +++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 18 deletions(-)

-- 
2.21.0

