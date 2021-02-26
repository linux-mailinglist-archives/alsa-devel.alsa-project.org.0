Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA132660B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A024D1686;
	Fri, 26 Feb 2021 18:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A024D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614359144;
	bh=d/KOVbtpz1zj9TgwpLAQZHjLturt2dxDT0Qddg9Pe3g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bXxEAxGPJdJ7mwXc8UV3U07RU0K/nBDp7QIIcmhBKIgx6Z7/V/XOnA2npz3c8lR1j
	 W8Yn5ZWwtcQ30ggo7RRNYDUV3mGCUkSEzftQqhnPuS1DAVEKkX+/AfstE8nludJX4y
	 hBDuaH/+b3FHOZ7+QiNZuGcDjBoHAMwCFKzKxTNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDDCDF8022D;
	Fri, 26 Feb 2021 18:04:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99800F8016C; Fri, 26 Feb 2021 18:04:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14867F8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:04:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14867F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VpXjEBe+"
Received: by mail-wm1-x333.google.com with SMTP id i9so7667216wml.0
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 09:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TRZDtCEEl5QmOqRGg5rQkT6Rg7IhztzVKYboB6BmINE=;
 b=VpXjEBe+fdimsjtrUM0doB6FVRuUq/Q6gobJOuBjGIyg+Kn8c+vAsaVPwa4lJ/n7Gb
 WUEgMvi43OuXQ3xvZlBLxaKTEl39rkRLdC9UYqHuT2rJXZUIota8LUQG/Gw27Wbz9GCU
 A6QcKShuQZUoRTC4BOBhqr3mf51P91KXjKWpG9S7XfJUYQzLBBGqI+hBm68DGI5azX6p
 ElCj9d8+L7ONsM9E351yhwiBLxV2odKIikY7KH7INotYDGjO3KpXCTvzBzdY7MCfK82w
 KPCMYjtA8ZBVjVuCGpiNdU+LKvxZTTAoTQPamGFiwSk/6gcWcCGCjf3q8XUfvRJacXwq
 fUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TRZDtCEEl5QmOqRGg5rQkT6Rg7IhztzVKYboB6BmINE=;
 b=onB6HG/yiauDW1gsnhDOD3LTP/yMuQVzpOmsW7Z90Sj09f1IOodkKR+/8LBf8MPlyH
 UJPhl8f6b52cDYJn05up4UVc3EbqSFA6zFvFnc1Qyc/mGNgR/ZmEaP437fAx9xVbK3Wt
 I/Fx9cHNc5tZbbUF+DCw0xk08fa+s5qG3sbmcSgX2Ao6ECEEx4Vh6+BdV6tOjpUjh5co
 YMDUZZk6EJlhXdbeRKdVfHJhyjyVs1XxArdeYOeQLE/EYKonyjTo1NsDiThfcxQ5SUHS
 MTvDZuMpQq1tI8MHWsJMzOGsvDZ0GxDbIw2j95I6P3+8AE32aFUivgKUHfWWJw0mjBTz
 uPzw==
X-Gm-Message-State: AOAM532ePCOibmlOvo4EOC6o2VRRHpXqTtNTwmSQBA2dQ9Wte3RaT3OK
 LTdHopmZaTih6jc/nzECtdEiGw==
X-Google-Smtp-Source: ABdhPJwf+JAykD/Kci0p96UuSQmVwaV173yV3TX4IWs/BM/sf1T4n3mVbjAjb6wiNrPAjx5wcYF/vA==
X-Received: by 2002:a7b:c18b:: with SMTP id y11mr3771975wmi.132.1614359048281; 
 Fri, 26 Feb 2021 09:04:08 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id w13sm15962972wre.2.2021.02.26.09.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:04:07 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 0/3] soundwire: qcom: add Clock Stop and Auto Enumeration
 support
Date: Fri, 26 Feb 2021 17:02:47 +0000
Message-Id: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
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

Qualcomm Soundwire controller have IP built-in feature to enumerate
SoundWire slave devices aka Auto Enumeration.
This patchset adds support to this feature along with Clock stop
feature using runtime PM.

Tested it on DB845c, RB5 and SM8250-MTP.

thanks,
srini

Srinivas Kandagatla (3):
  soundwire: export sdw_compare_devid() and sdw_extract_slave_id()
  soundwire: qcom: add auto enumeration support
  soundwire: qcom: add clock stop via runtime pm support

 drivers/soundwire/bus.c       |   4 +-
 drivers/soundwire/qcom.c      | 187 +++++++++++++++++++++++++++++++---
 include/linux/soundwire/sdw.h |   2 +
 3 files changed, 179 insertions(+), 14 deletions(-)

-- 
2.21.0

