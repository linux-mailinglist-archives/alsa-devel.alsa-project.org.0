Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B3377F2D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 11:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B55E16AD;
	Mon, 10 May 2021 11:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B55E16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620638091;
	bh=PpB6yvlvfHEIk9oet0Fgnca6st+MYoEbeGudbBA0x6c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dcUls+08mfl295Euaq/pcYgIEu0tgAwbtWb8eqbC3GF7A1K2m60PpTbN4Qjnm8b/l
	 EnnB0525g9350ALB/4J+NdQsPicEAyfoLm5YkOB5SSmEohwY3nLtjrPdUf/n/2vwUN
	 rB/gwaqQnveJC6eb3cV09e3PBnvtBzugYzVVu8ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83E74F8026F;
	Mon, 10 May 2021 11:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D45BF8026B; Mon, 10 May 2021 11:13:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24BFBF800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 11:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24BFBF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FaCsxFSS"
Received: by mail-wr1-x434.google.com with SMTP id t18so15792347wry.1
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ca1hFTYQqONxjpjSelmNqH8WT2mDhiZTvqWqe+QIj8k=;
 b=FaCsxFSSWlHe8SXp9oxbF6c+80zFYppwPlY7t8w3mo2V+w1doErKIBYW+QSssWIEyd
 CwWskEtC07nDle7UKodp2GD0iVNqslRhrOm2A+GEfFIlaxnIcMJgUpRp6fj1lg2+6xNK
 HmgTn8Wtba/gnfvX4+vlSovoPWEuD8fhRZpQpbJeoRvZ3pPw0z4sWXkrQftni6ec5flX
 UgQd8svUZ41DWDXmG0uWDfnGzlBdwApG2+EQny+zfTfgVbPGcGaHlwUxP37KBJ7Z861H
 +DdIlKkSMFZ5IKRdyj44PIh4u/muCv7+rw2tCAchjlzUPIHvdNZFd9TU5MNatJ9GawPp
 j4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ca1hFTYQqONxjpjSelmNqH8WT2mDhiZTvqWqe+QIj8k=;
 b=FSRxvCCP7ViK2fDJjhVmggf1iyBXzMg/KFig3kuqQ0xtBPP9n1rDt82hqrVX90VWSz
 Hq8Yt4Bh1mUlbl9IVSc1XMMz/3VAH+ewDUtIjth+rQHw0LJKbNLt9VwsxRfKk5QPb88x
 4T1SjsnsMFhKqGb/qa50ylkOp7EHNrdheuGMf3iQ0rNNU3ek1aaxeYEygi4P55znDqF/
 ggI0Z9UkuNmHNXvm7HCZ8OUSrZi3H3JFn0qs3CNEuFkzgwPGS+jzLE1SrszjZt2RH1IE
 MiQBEFgI6I94fPbh36hD4bLnYq5An6GL3BqxvOMpRkd+NMEZF4DrNDMD3x+RgP1KR2kV
 CLYg==
X-Gm-Message-State: AOAM533HfVPRmyBfxYS1tKOq3hXCXOYo3FcIuoHrApi4/LFKznIW/Gnr
 k/e9PG5cE4RN6E67iWfhF2s5qA==
X-Google-Smtp-Source: ABdhPJyxE+YaeeKknh+YwcJKukDjSKCysy5C/GfuRTuc6XEZcKF/7fAeDY/j3+0C4f7ngDG0uk7b/Q==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr29112647wrq.59.1620637989398; 
 Mon, 10 May 2021 02:13:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id s5sm19040575wmh.37.2021.05.10.02.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 02:13:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 0/2] mfd: wcd934x: add mbhc interrupts
Date: Mon, 10 May 2021 10:12:37 +0100
Message-Id: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This patchset adds interrupts required to enable MBHC (Mulit Button
Headset Control) support for Jack and headset button detection
in WCD938x Codec.

Codec side patches are sent in a separate patch set.

Tested it on Lenovo Yoga C630.

--srini

Srinivas Kandagatla (2):
  mfd: wcd934x: add macro for adding new interrupts
  mfd: wcd934x: add additional interrupts required for MBHC support

 drivers/mfd/wcd934x.c | 50 +++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

-- 
2.21.0

