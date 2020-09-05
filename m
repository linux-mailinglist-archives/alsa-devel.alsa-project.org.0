Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A944E25EE61
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 16:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2141182E;
	Sun,  6 Sep 2020 16:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2141182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599404275;
	bh=Djz7zedIEqrat6LZ7Spm0YM1wUVnvhD9650PuqnoIiI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y2gUoqo5dcEKuDpWOgRNEaS+FdZXhS30i4d+EV194bcxaxgyDcp682PqbcyID4m9t
	 0jLL1YP1CHV1mHiT4SsMvUoiCX+DbIPmg6Zkxxn4S7Szobm5KAzY1Qcs9UMNH/WtoS
	 G9+1SabocSsCoTq8EaqFJf02mK2kTBw3CLH/ZX4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18BC8F800B4;
	Sun,  6 Sep 2020 16:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC4BDF8021D; Sat,  5 Sep 2020 19:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 973E7F800F0
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 19:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 973E7F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="srHQREj2"
Received: by mail-qk1-x742.google.com with SMTP id u3so9398859qkd.9
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQro0KvCecashCGNg/PcVjIspfzorn2YBuMdQvvHTl8=;
 b=srHQREj2hm0W+uI7LdTFJ9F0DKd0AlV6pwGNbUXc3rUIVL9GDEUrBmquCnRQyChgwF
 3MRZZ3A/sFDT28zANbCD5IT2BxHZKj0ZQjq7Xyy/mW+Zw/PITa0mTGo0oP8Xe0G/t5Qk
 Ne+RK35wEDCSnndnUkKNJM+zFe/FO7ucF6x/C5OgzSlolGLvvi4Gg4Bec3eO6jnG/Hn1
 ZzL2Xxmmm/0ghLM4wRRYA1pD1Xu+GkfX27BtMSNhMbu7zPamJYehmYXIYfFuXcVOyC9w
 Jim1mFqNRzrHwdbb5V4KYdm7gTEeF8SeQE86PCJupPPjIGmssG+2rg6Oliwa9O1cnEEm
 pwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQro0KvCecashCGNg/PcVjIspfzorn2YBuMdQvvHTl8=;
 b=jpyWbfjcaVXwq24Viz4dSt66U/Z0rqKXkIZ+cUCgwLwDMilQhYX6PDMBUfdCFgBSUU
 RQv8+9vJhZfZ+5xV1cnr4824Jy2St6wyuiOWJ/9Is8gQ+3rFEGMmDFUJD1oSIYhz1L4s
 moYRPQe2JP8VN3z6fSj8TB4YM/pRW96MjAVqvVpl45goG8V9fuGRXXTZAsH59Eqz+bgE
 JZqO2ThLjsdYfc+7PqXDk+kUEFoCuELJGsZVlNEidEiZSHmfdkax2QnrMJiHpvcJy9IO
 8r1XV3HMKsIXP7uYUABOwle6fWwxMU5Yc4/23UDGPmH6AhIfeTO19/luJtuIcqtqxT5V
 t5zw==
X-Gm-Message-State: AOAM530v8AFr3KphZSyfUH7/yT+asxi/LAsNLnIDuO6urH8aizLCvmhR
 jUGNuIliGNft8JmAKPqiuxAJ+A==
X-Google-Smtp-Source: ABdhPJz+AoKdk7U3xzEnEhwLVI+mA45wdHjbSYoaWKhRvxjshzsYjE8/yNT4RO4odN3yDb0/RtiSwQ==
X-Received: by 2002:a05:620a:1381:: with SMTP id
 k1mr13315111qki.140.1599327604804; 
 Sat, 05 Sep 2020 10:40:04 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:40:04 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire master
Date: Sat,  5 Sep 2020 13:39:01 -0400
Message-Id: <20200905173905.16541-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Sep 2020 16:56:12 +0200
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

This adds initial support for soundwire device on sm8250.

Tested with the "wsa" sdw device, which is simpler than the others.

v2 addresses some feedback, but I kept this series as simple as possible.
In particular, I didn't implement CMD_NACKED from FIFO_STATUS, because
the downstream driver doesn't define this bit, so I can't implement it.
Soundwire works without it and It shouldn't be difficult to implement later.

Jonathan Marek (4):
  soundwire: qcom: fix abh/ahb typo
  soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
  soundwire: qcom: add support for mmio soundwire master devices
  soundwire: qcom: add v1.5.1 compatible

 .../bindings/soundwire/qcom,sdw.txt           |  1 +
 drivers/soundwire/Kconfig                     |  2 +-
 drivers/soundwire/qcom.c                      | 38 +++++++++++++++++--
 3 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.26.1

