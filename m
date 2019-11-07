Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8334CF24D4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:02:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CBA91692;
	Thu,  7 Nov 2019 03:01:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CBA91692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092129;
	bh=235J15kYBk6CrxDRHik4FW3x46OSsPCD6X001Kwcf9U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YXMowwWHIXCcJVcKSU8nahvXF64VaDLAmlojTwH5m0vOXiF/Vwpo7eOT/Q1/WUY5U
	 JlUyv7G5W6AwbkeZq9YPxJcL1YQCia5vlpiZeZzqZ3QQwodWBgszNL5h0fUr34+No8
	 2SewDqn2QDvr0q+sAhC8n3ZlWfnvjdn7Q2JmpZbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 790EBF80634;
	Thu,  7 Nov 2019 02:58:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEC25F800F3; Thu,  7 Nov 2019 02:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A63EF800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A63EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EhTTmqRV"
Received: by mail-pf1-x441.google.com with SMTP id z4so1040669pfn.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ViaeVOjlrxVWMLZoiFjG6JN27LxosaApg0PY9qQyUPY=;
 b=EhTTmqRVw/lc4U0BBS9YT4Rjm9jsSECatgBBeekescpeMoBZmrYUQKrNH5FXdRFwli
 MWjG6bCGpet4VzyPBPvZ30LlUr8jAQsWLk6NEjXDfS8dzL0z0frIxoYsPbwrAuKGQe1P
 qG7ynR1Goz+GH22Kjzg/bKaQ6FwCxxIdBTFoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ViaeVOjlrxVWMLZoiFjG6JN27LxosaApg0PY9qQyUPY=;
 b=b8s+ApJQf7HXhh8rxS9eomWMcLzArHr/aBsF/PEegjFOznK/cXzXdjQEwfgTRuY3x8
 zjmzLMgTwUyVvwm2hlGsjBMrZe0i8dK9h2UA6m2197EgGmNEilkApU/fStcprqZ2UgLT
 2p5CDsdNf5r7CgqfOCPI+Ep8cRXZBVhtrm3BT5eGiJOHccnlDlPutHJHntlUb2qZKU0I
 HFnZ99DT4Us3X7pr2Pkms251XbvrhyTThH2/va0SEPlvDjYVT5pA0Ye2by+KVV2trdVQ
 uh/4mJEafCMNKdh4if0K91l58AxnC1a2DjExjmwxgp5LsdGYa/+Kpx3GJtdcgsjcpCPl
 Z3oA==
X-Gm-Message-State: APjAAAVjoh7rMhvCSOtWiQUITTEUmeKQBU+bKFd1raD9i1VL3oTB3Qaz
 hgzHDUBlQkWdEeu5asRRj7ABV0bx8Fy5
X-Google-Smtp-Source: APXvYqzxBHiE7zGztztecdSFJ6mR66DSlvZoDYubwdEyjq3jnG0Sj57Wq7b7YK3JGjOqe2zZhaqJXg==
X-Received: by 2002:a62:ce41:: with SMTP id y62mr673465pfg.34.1573091913523;
 Wed, 06 Nov 2019 17:58:33 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p16sm296429pfn.171.2019.11.06.17.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:33 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:01 -0800
Message-Id: <20191107015808.26844-4-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 04/11] ucm: docs: Add EDID File value
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

Add a sys path to the EDID file for the corresponding HDMI device so
userspace can use if needed

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index a79e5b91..28e92d17 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -301,6 +301,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *      - name of capture mixer
  *   - CaptureMixerID
  *      - mixer capture ID
+ *   - EDIDFile
+ *      - Path to EDID file for HDMI devices
  *   - JackControl, JackDev, JackHWMute
  *      - Jack information for a device. The jack status can be reported via
  *        a kcontrol and/or via an input device. **JackControl** is the
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
