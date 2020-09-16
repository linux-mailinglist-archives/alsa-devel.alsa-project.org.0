Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D187C26C06C
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 11:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64CDF1674;
	Wed, 16 Sep 2020 11:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64CDF1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600248266;
	bh=ST44XWI4JEq9jDCOsNTEzqbIQc3wrwZ3vQpyZ+GQc5I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YHjzk6kz9xxJx9kOjImBxiPH2cYm07mIJeflGLcLKq0C7dKrqc+B8ZwetRDtDxS4z
	 eq4OJtfGplBOLQKnY775cSFCv8etT2WzGnR4ENssTVN1IIDP5qtANHPVWcQ2Achff3
	 2Wsor4cm4J2SFk+C2W7u+3chnxd7hkZQBkxaAwF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62838F802BE;
	Wed, 16 Sep 2020 11:22:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5440F800E8; Wed, 16 Sep 2020 11:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9FB4F800F1
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 11:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9FB4F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zwpPinI/"
Received: by mail-wr1-x42d.google.com with SMTP id g4so6124076wrs.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcLuhNnrX/nQCZhthEE8aR8w/AwdzuMVVfrZbO3TD9g=;
 b=zwpPinI/Rr9H8iwdQqSgkeJmlIy6IG6vrUVdUIT8CJAniqdNZru9Waie7WlTmyyT1S
 Nug/KefJnhLLIoDZ2hqapgVx3xE9lSEoMX3AWOv7ZC+TyZc/6H5pvGPsGuXFv/C0KQT6
 ds804bTLAjuXkMty18ffemSkElCgDebaL6XPpqiNgr+YPSuMW14nwpACjiHu5buFb+u+
 l6cN2v5iIrJfjl077t+XwqGqbO7ZYbdr98esIhyh1G67UtA15RMhbXGjoCn4l7I70fEw
 aFY2KjAQOMlJfO0+6KcsfM5GFVks9TY+KQSRKTlAWzKIVHqtdLiSDZn/f/+E1KXdEZrE
 jygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcLuhNnrX/nQCZhthEE8aR8w/AwdzuMVVfrZbO3TD9g=;
 b=gu8v/UkXMP7LUzTnD475u6BurYxYhyGwS2tPDyC6BcHmZwwts9lDxbU19SevbK6IdI
 5YXKkjQXo+bArMNdkwxx+0ZGbuwFid9nVWWqbrrQGXN+hmYXnjtk1iKam6229b1sK+da
 tDhqrv5YPc68jlx2EHOz1+hyT96m84JJDwtd1EtA4miI9ngg8WSktAvFixTe/JIdsX2s
 9k7rzjyRzg22S4PgpbGPLD0FhK3kaoKkKiD7e0jJVCr0FbkjAkGlVwAh/1dkxjukunbG
 dUO+VCiFrAQY0oIj5SZzqodhOHVBG+Fhdp9p+VNAmNqIgfQru1b4WPN1x6OMeC3M4gxK
 1rrQ==
X-Gm-Message-State: AOAM532NTaiQMPpFzu24O+4hCDeRsfHq0uIhTZDK5LTDurD1+C96ZnH1
 H+LocS6r+dJcddyA4dzcLiPHKg==
X-Google-Smtp-Source: ABdhPJy5m+mdqlv4OG5JdIdq8YqyOLfF8S9OUft4LXq72Toaw/0mXAlfmewTtZX/SaRKGmW8bN6d1Q==
X-Received: by 2002:adf:e449:: with SMTP id t9mr26130245wrm.154.1600248108935; 
 Wed, 16 Sep 2020 02:21:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f6sm32181670wro.5.2020.09.16.02.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:21:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 0/3] soundwire: qcom: fix IP version v1.5.1 support
Date: Wed, 16 Sep 2020 10:21:22 +0100
Message-Id: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
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

Changes since v1:
 - rebased on top of REG_FILED patch or soundwire-next branch
 - udated qcom_swrm_data to use u32 instead of int as suggested by VKoul

Srinivas Kandagatla (3):
  soundwire: qcom: clear BIT FIELDs before value set.
  soundwire: qcom: add support to block packing mode
  soundwire: qcom: get max rows and cols info from compatible

 drivers/soundwire/qcom.c | 76 ++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 18 deletions(-)

-- 
2.21.0

