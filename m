Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 270F4278F12
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB9E18DD;
	Fri, 25 Sep 2020 18:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB9E18DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601052659;
	bh=Px5nAcPpYDkZFWRvioh3B0jeHy/Ozcv7/J//GYsfXUk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g5C0zqdQEgRAlh/2MQ7Lj8CDOvTc78Xi3FKWwpWfDonuzA3FfQ32aOc0FcU97d5fa
	 E1K0IpaMH8Fzv0vMjVYGFwAWzqqQwcBbJZhgZbuldIQndkEW/2JGdc4JZ1VtkzpAwS
	 OnH5KygkU4RIAW/S/PIhIptLRQMm0aBpkMRKu8gA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D1F1F801EB;
	Fri, 25 Sep 2020 18:49:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50275F8021C; Fri, 25 Sep 2020 18:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0051BF80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0051BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wlDKkuOT"
Received: by mail-wm1-x344.google.com with SMTP id k18so4036207wmj.5
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KAVHadJMWaOUAME/cTANgTaibLVBRhnV+ozPkRyx2uI=;
 b=wlDKkuOTF9Ng5bzaN8zpq9oI6NbkUhCn4VjnowPslZgL3DnzYy/Ow7dhZJ2x6Uez//
 iaTGws471/l4w1oQCG8/M2pOpTJ3BRHIMYAvCD3pqrPsFSag2oWvetn4u9Lsi4tKfYY7
 6bjOcrA48Pw8KvhCS3yWrEKz9759QAT1ARw+r86265A5jr+phUXwGtPcU277iVc0W3+6
 xW09moaoce4DkiJrxNJOgu5MSIdgr6xGR3cJ40beJpHwZGb41swD30z+wobyMYgwCaK2
 OEJQ6bo4XSuOcuyFc1kqvN5u8qbw4HNJ5NE+7M6HqZIhln6CkrGpPfgN8HrjhG3u6ngh
 Ss4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KAVHadJMWaOUAME/cTANgTaibLVBRhnV+ozPkRyx2uI=;
 b=By8Q6DTlgSPIMFPeGG4lS+Nn3eZhWeSdDHMeoGi2MssHfHIwYQuAZuJBj+uj3oWJWU
 oHSi/EJ4SEa08G8QX0CAN6ZsucCMy2FjfZ6WBQC3dPMJVOzOFnH20Jh1jfzNF9weBf/W
 uuuzxCUzOjdzfbtAe4nBxAnjsAiVv1GWbGgTQN+rTACkhHfI0KlBGsgzuQq1uWjPjtei
 tNK7DUxrNT2oHnLclwAGfNTDJPjINvHowuWTh2izlOhmzPNxGHuxC/FEuhpzjHm4re/x
 Be96GVL1ayxwmzsqIEn4XOpOj9878pyidS8+SSiIOQqxdYI1NNAIBhZeZ43wSCMNpVtZ
 ECLw==
X-Gm-Message-State: AOAM532/fhfyukys2q+ydzBog+7f9Lt43oIpwu3O0P/2Xo4A+nnbv/If
 pfxAXaw/8OPwUl3or2rmJfNTAw==
X-Google-Smtp-Source: ABdhPJyF9JnvhthbbiF7ViftBxVVevHX8DkysJ5M8eqxXYmL++NqE7FmpiVX7Z6WGHYZD71ptZ7GIQ==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr4079590wmc.123.1601052545293; 
 Fri, 25 Sep 2020 09:49:05 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id a5sm3604247wrp.37.2020.09.25.09.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:49:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/2] regmap: add support to regmap_field_bulk_alloc/free
Date: Fri, 25 Sep 2020 17:48:54 +0100
Message-Id: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, lgirdwood@gmail.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, tiwai@suse.com,
 rohitkr@codeaurora.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

Usage of regmap_field_alloc becomes much overhead when number of fields
exceed more than 3. Most of driver seems to totally covered up with these
allocs/free making to very hard to read the code! On such driver is QCOM LPASS
driver has extensively converted to use regmap_fields.

This patchset add this new api and a user of it.

Using new bulk api to allocate fields makes it much more cleaner code to read!

Changes since v1:
	- Fix lot of spelling! No code changes!

Srinivas Kandagatla (2):
  regmap: add support to regmap_field_bulk_alloc/free apis
  ASoC: lpass-platform: use devm_regmap_field_bulk_alloc

 drivers/base/regmap/regmap.c    | 100 ++++++++++++++++++++++++++++++++
 include/linux/regmap.h          |  11 ++++
 sound/soc/qcom/lpass-platform.c |  31 +++-------
 3 files changed, 118 insertions(+), 24 deletions(-)

-- 
2.21.0

