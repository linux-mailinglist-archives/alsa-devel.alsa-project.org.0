Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5FF24D3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC13F1682;
	Thu,  7 Nov 2019 03:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC13F1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092115;
	bh=THH5oUkdhg15+w5nBpxMQyGEV1uYS4x9kjWPsmsVD7I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RF2L6m3F5KkJnjydoCDDidY0Ihnu5uzWjh30PFkHkp0Mr6o38JIuMXboGqJxCJ45L
	 MxLB8jpe0OIfr4J3NIhDNhfYlBLHV/ZKfrJDqjhFacC0q7tnWbBwyqDpksWC/ez1B5
	 mULPw3/KSM7Xg2rStyiKeQDuTT0W8Qo+Gk17KCM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEBC9F805FB;
	Thu,  7 Nov 2019 02:58:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F7DF803D0; Thu,  7 Nov 2019 02:58:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F3C8F803D0
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F3C8F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IM1GgH6k"
Received: by mail-pl1-x642.google.com with SMTP id ay6so365107plb.0
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaQxtl71k2I6uPx7Rd6v68//Q8Zy+svLWP033jSUF24=;
 b=IM1GgH6ksjE/4i3X5amWRjK6A0BGmvxYx4ZFBey69etuRG3SaKUtQNl4HRAj8dRZAl
 xPiaYczd80kZujjT1PXbsUSMjbmirzZ55h0zblUk5RIcuX3XFFurq9073T2QZk9hxbx0
 F2rSmCT/59uUXWkKmqP16U8mMz1Xs/o3lTT7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaQxtl71k2I6uPx7Rd6v68//Q8Zy+svLWP033jSUF24=;
 b=nP91WvS3plp/6Ky51wWYn1KOIF/2lVUMR/siVwqG92gK0JAQI99qtX9VevwFmglLpc
 co+dnwFkPCrvy9WdybpiBGJNvHx/3FlltL0PbCcmbOwtPf7jKhBibOhX+wc+t1ELpuZP
 h45E+1GCG67wEUs0D7Sxduz1dW3MdIzW4jrOe5vCCCSnY60GRXhmeE12DwIQQKj2RpI+
 mS2E2d68u7Jgg+p6J1kVEP7NJ1dVL2P8aoRVgztUQx7+o/5hmpyUcu7ZIec9azL7yj2R
 voLGhgEjWxGpYkEXNKgHoLlbmFIJlmeVJHAV0eLKnJ0tPsi7f6B7WDwHsjINmc6dmZlT
 Ql9g==
X-Gm-Message-State: APjAAAWtbhwXAxn8laHwxAjIIP3Z+nhccCKWzJdOxPEw8yi8FacrOecy
 ZUhodt0FGDBbAgi48d3vN0PBKuRFaPvb
X-Google-Smtp-Source: APXvYqwvgqu5XYx082JxZFBQUhM7eJuaIcc5rrTzBdLFrHP05tKZmhLi1hyCi/Wkni3sLzHU9FhrMw==
X-Received: by 2002:a17:902:bd8c:: with SMTP id
 q12mr903397pls.302.1573091912314; 
 Wed, 06 Nov 2019 17:58:32 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id q8sm233033pjp.10.2019.11.06.17.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:31 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:00 -0800
Message-Id: <20191107015808.26844-3-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 03/11] ucm: docs: add value JackSwitch
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

Identifies event code that will be sent by the device on an jack detect
event

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index 3208cc30..a79e5b91 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -322,6 +322,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *        configuration that doesn't belong to UCM configuration files.
  *   - JackName
  *      - Input name is the input device name for the jack
+ *   - JackSwitch
+ *      - The type of event code the jack will send, corresponds to
+ *        Switch Events in include/uapi/linux/input-event-codes.h in the kernel
  *   - JackType
  *      - Specifies whether the jack is accessed via hctl or gpio and therefore
  *        only carries the possible values of "gpio" or "hctl"
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
