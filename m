Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868BF24DD
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:05:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42A6168A;
	Thu,  7 Nov 2019 03:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42A6168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092305;
	bh=PR70I48qW0kKPPK/IfGWgi2zcdxY0dpbj0Cx00rTfnk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osm0XRN9/21D5C1PUnct5D3W4/XXZxkmnthxSHnjttBkDoiF79jJs6P8XW81pzG8+
	 ZvJ5k/wpSKq2ECmRA4T9ZpW2WowuiVP8c9Bd0RnldV0NSuOx7rsscf1VTWplijss3w
	 grzjonZi0KNdbwTsI7W3Z0DFrYXwDxpozv1X02Yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF64AF8067C;
	Thu,  7 Nov 2019 02:58:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DBE2F8060F; Thu,  7 Nov 2019 02:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4E94F8060F
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E94F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="c9YwVE5U"
Received: by mail-pg1-x535.google.com with SMTP id l24so702570pgh.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0my/IgGCIKja1eCoOHnpWRTs4h8qjwUqcJfjvpD2/0=;
 b=c9YwVE5UfGmQP/3zJN7pxbFabhWrarc8iO5b9l0Pa+FiOLWlOrAC9q4cvez5xGezaA
 4y4gR/qj/Pg+DfEdsK7vhzDlX7Y74aDX9gApPb63JCgZMHhz4pb1vjxqtbIJirz68FXm
 caY18YYZ08K0u4IEQ7dPfvm0+4b8av1ZYJnn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0my/IgGCIKja1eCoOHnpWRTs4h8qjwUqcJfjvpD2/0=;
 b=TmfRjIsCK51Xp6DRXLd40JywE+peadlY2QRrMfq+5qRYAquY8uFdsZsMH96wnT47Kq
 KwHpmOZe7MnkuJsJZrnsYtQZ66ogtd+/KZLVS5k9g10kAlOyXMp890Lqs6wvMqAR9ijI
 NRhH7dRUcxeat3snx15qqRaGSpaSXh+mhO+LfEN3+QaFECRk2GiD7l8P+8c3W54areos
 W0+JIotM+h+QoYxqAUhsP/aSDptqZN/s1rcBd/ASFDXYPiVVaGsJf1QPGHtwG+a3zx6u
 KixJPuvVLbbCxBeM6vgjSw9E8RBNc74jWfrFL7dIjm+pQL4KOJLniAfMAPskd7Ng2SE5
 27XA==
X-Gm-Message-State: APjAAAWUjywEggw5VKaiHlQw+DgM2HYpaAbWIMvAvsH6+RFEr3cAEkbI
 u0pOqIzRlxluojun0CleOI9Uh7cyzP/y
X-Google-Smtp-Source: APXvYqzfPWVqzT2ZTpJFbDSMTvt+kXVQJBo5B/SqgG2d2195p/uRvUn/c6JxuYE9TPIebE8NveXCuQ==
X-Received: by 2002:aa7:814e:: with SMTP id d14mr637138pfn.39.1573091918444;
 Wed, 06 Nov 2019 17:58:38 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id z7sm371838pgk.10.2019.11.06.17.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:37 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:05 -0800
Message-Id: <20191107015808.26844-8-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 08/11] ucm: docs: Add CaptureChannelMap
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Explains to userspace how some channels may need to be rearranged. This
is useful for systems that may have DMIC pcms with dead channels that
will need remapping.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index 31f9e4be..9a10f390 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -305,6 +305,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *      - Remap channels using ALSA PCM channel mapping API notation
  *        E.g. "2 3 0 1 -1 -1 -1 -1 -1 -1 -1" means, FL takes channel 2,
  *        FR takes channel 3, RL takes channel 0, RL takes channel 1.
+ *   - CoupledMixers
+ *      - Mixer controls that should be changed together.
+ *        E.g. "Left Master,Right Master".
  *   - EDIDFile
  *      - Path to EDID file for HDMI devices
  *   - JackControl, JackDev, JackHWMute
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
