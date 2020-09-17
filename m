Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD23A26DAF9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 14:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEAF1672;
	Thu, 17 Sep 2020 14:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEAF1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600344215;
	bh=dT16Nc6giqkmNVMOxWZrPC/NhooDJfyapkvhk1DdhmM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GTaTpHBlwXrgl9nJX2mUSS3DYgJbkFYBkJLUq1S7XN+ElKd2pfFSGXg0FxehQPjfZ
	 rPCOwD08fd/PM49QLCicFR5O6hNZpTEPPXDHFjpssQf3LcXH+ViGN3u4NVgBUWl+dF
	 mo0ufo0GQGA+J6WFfzAinPvwCt0G+7krsaXKxJDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D76CF80276;
	Thu, 17 Sep 2020 14:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F2DF80212; Thu, 17 Sep 2020 14:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3BDFF8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 14:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BDFF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WdckR2sn"
Received: by mail-wm1-x32f.google.com with SMTP id e17so1709195wme.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oqsiLJm8rZryhs+SsCl8JpeQLd5wde3AeDM1WscX2vc=;
 b=WdckR2snfW99iGY4aSs2s4CIrenfAmRy8DqptjREBVZwVf498KixuWhpXgu6P0ju/b
 NqTHV1yoexwpVm4xa/qagJ+QkNUNKzMwmJdVe9tAQZlmsyoqlu2yLjWuX7ovzH/6fGZe
 ImsRAt4+1HjYsbsEqI56HS6nHFQwEYrU/E/09apd1XoLNfcU6xjRW/JrQzjbOJKhZESL
 PejE5e31EvzJelsNKsI4UC2RJGuP0KMwkY6zzrAp5fV+iRaZSQaj34xiyVuZiwfm/nKj
 mmwmpRmeFO88ZTL+VNjbFCr4Z7wj2x5RhIskzrR9XM0ZjuR+AOXx4HjkjJ/VEZhe6nvk
 k3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oqsiLJm8rZryhs+SsCl8JpeQLd5wde3AeDM1WscX2vc=;
 b=LSTgMITMBMkd/JJLyIFdlcsnGUohuoCnjXm11rRe/VvF2YZFTRcZZw2f2+/ZV+r1oF
 t1aISUMwwXmQZDTKow6lCAYRp0KzP5CkAl9l7n27dpDnKsMXmsqLFIfXxgxK5ggNG8rO
 SZjRXn2XccnQeizGtVDCwo1XK/dfZA3o/Rup0f0QURqbaePjYZuJaA6pVAlTe9WfO5dC
 Re/8TNnnEwnoahEjsbRo7kMPugbmZExBx6BimzgzeUeuEVLFferqfElTB9RHa/Q9pZr6
 5AAmOwGVnZpM/6NnoI7L3/dQsgtBh3jJIkM3zVSAEwgHoL6iBthhDjxk/1tnyyzLsNwm
 by+w==
X-Gm-Message-State: AOAM533u64nhvAGHO9G0/G8GB7GwMD+bvvYZM9S+EzZr1c1imX5yOrUc
 yhLc+Qyiae0D785IsmxINAYwJg==
X-Google-Smtp-Source: ABdhPJxEuV9ibb7bGIMvu83QGUqmmb1vrX7gGy8FAmpg7WRyQort0z4eK5M+oFuFcHxxz5FZkKmCew==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr9592444wmb.101.1600344102349; 
 Thu, 17 Sep 2020 05:01:42 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q18sm37584860wre.78.2020.09.17.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 05:01:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v4 0/3] soundwire: qcom: fix IP version v1.5.1 support
Date: Thu, 17 Sep 2020 13:01:35 +0100
Message-Id: <20200917120138.11313-1-srinivas.kandagatla@linaro.org>
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

With this patchset I was able to test 2 WSA speakers!

Also I found a regression due to move to REG_FIELD, which patch 1 fixes it!

thanks,
srini


Change since v3:
- use u32p_replace_bits instead of u32_replace_bits

Srinivas Kandagatla (3):
  soundwire: qcom: clear BIT FIELDs before value set.
  soundwire: qcom: add support to block packing mode
  soundwire: qcom: get max rows and cols info from compatible

 drivers/soundwire/qcom.c | 70 +++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 19 deletions(-)

-- 
2.21.0

