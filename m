Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A846A2ECC51
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:08:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D969167B;
	Thu,  7 Jan 2021 10:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D969167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010507;
	bh=Uxgo7ZvK40puurgf88Fdj0HUjmCkq9IrIFW4ogHiCVw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O99jRlhCWee3bKPzO/IjKqWl2qLfLM2j+I9uCAi3ftn3FJVrsmpPL/dqhtA9pkBWJ
	 5XrUjnvEJNo/Q9jvDjt2M2gpG0m6g1R9mRtoxiWRydFMXbKt+vKOn7ug4rTnShFyka
	 We2NIgDsFDn+cH27J9x2k6EZQDrf4MtzDQx7w/YI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C65EEF80268;
	Thu,  7 Jan 2021 10:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 098C4F80268; Thu,  7 Jan 2021 10:06:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDC74F800E9
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 10:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDC74F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="Ny4WfLB5"
Received: by mail-pl1-x62d.google.com with SMTP id b8so3182944plx.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DoPhwpxVpcCeNa7xRylUEVANyqRa0budKloP0YXXbk=;
 b=Ny4WfLB5f/tyTudlrLm+sC0kTXjRmuKvXnRfUVfCkRy7KJL72UFlIw+uLDqA+1ft+p
 0bidtRs3/bwRkD+5CECBcoZaG7JO9Zatu2mTUWFrysiOZfy2BZoGu0AkusnaP1rSQz3V
 uTB49MJhiKZ/HS6y3rYl/vJZmlNWJ/MwlD7bmBsUcjOqFhaBuBm9gRcHu592QoEG/sN1
 Pv+VO3UWGU0ePTSPmdQWOHX9bt2UeqSDw05g9NtQFPDx2jHyqw1DZGgcnISdL0RJlBIa
 0Lc+oZrMrW36cOtwKCG6qR7A89ErN3U6Y6vYQNBLRlzM24Cn1L5WTmeVHMjA8KxDZuNv
 auTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DoPhwpxVpcCeNa7xRylUEVANyqRa0budKloP0YXXbk=;
 b=ibIdiFpAHzRsYrZR3iGZRFS5lW+V6jLeyxmXI13B6kt5m45s/tlM0wBqHko9ujyyTk
 Wq8Vh3e3EgBOzhm9czehiBYFYIlJS4Gh9GDAw+OxtYAMFnu/m+u3+BgfLbD9B3ACQDZw
 U8L1niL6JizkZOVTsmCjn+vCPoCfxm9J6Yf1bZprblTQsGpo6ZhjpgpWfHK6sdgIkBuR
 tkUIJ8DdE/JrRWOdyVDcT/rwka/bDR1LnCKLU3wQ7u2HU3tT0s1iPwIM4ZA/0Z6K+d5v
 f/dgNt2cmuqmZN0qjs2OfhkI6zBJUm/rI9zO+OkzX3V2yNa0I4Aq7IXV5UEVZi2nQSZp
 yNXA==
X-Gm-Message-State: AOAM531PdVZrmullM2QJ9SY8MAtvDzB7XdZ5ILEWrUwJ8sfnwjBFlBey
 +A+oxhsgEE4aw8018IqKuMk4AQ==
X-Google-Smtp-Source: ABdhPJz8cAvssJCyCm+bYYDR9GUQ7MmaQlcbn+bpw/86jcMpufKrAup3HXnGKUy1j8gkLaveTjhJsg==
X-Received: by 2002:a17:902:59d0:b029:da:69a8:11a8 with SMTP id
 d16-20020a17090259d0b02900da69a811a8mr8185541plj.63.1610010399008; 
 Thu, 07 Jan 2021 01:06:39 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id b2sm5006394pfo.164.2021.01.07.01.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:06:38 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 0/4] ASoC: rt5645: Enable internal mic and headset on ECS EF20
Date: Thu,  7 Jan 2021 17:06:21 +0800
Message-Id: <20210107090625.107078-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
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

These patches are trying to fix the jack detection and internal
microphone problems on ECS EF20 series laptops which are empowered
by Intel Atom x5-Z8350 CPU (CherryTrail) with Realtek rt5645 audio
codec.

Chris Chiu (4):
  ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
  ASoC: rt5645: Add ACPI-defined GPIO for ECS EF20 series
  ASoC: rt5645: add inv_hp_det flag
  ASoC: rt5645: Enable internal microphone and JD on ECS EF20

 include/sound/rt5645.h    |  2 ++
 sound/soc/codecs/rt5645.c | 46 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.20.1

