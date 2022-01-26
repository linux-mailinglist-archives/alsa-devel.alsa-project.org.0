Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E880E49D1A1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 19:23:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7215B1942;
	Wed, 26 Jan 2022 19:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7215B1942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643221383;
	bh=GLjeU0Z7naq5fn8LoT28ZL6e01bqtfnLZaEmI+trlP0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XwA32pf3BAVe8+NUHq7WrhRSmBoAyqVN+fkrHnqnSKxKe8P39LBt3aoEbTeAvkCt2
	 T274ZT+T3Kc28MAXDR4bMTBUZJjZxe1c3O35ZitzRhilRlltnlrXxe+6ezaM71i69Y
	 8aqaDW3Bj/SidrJXl1v0YzyBJDB7D5QPl/8vQBU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E63F800C8;
	Wed, 26 Jan 2022 19:21:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49011F8049C; Wed, 26 Jan 2022 19:21:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_155,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4424F800E4
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 19:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4424F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="eNTednxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643221312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=41Yq0Jiu/p4386qMAQJe5Ihi0AXyzAek0DT2V3OPlfI=;
 b=eNTednxqs7V6IEd9kO/5tmJACtd798wnU8viSRBUYtNKO7M+4glnAIgB9La1ZsPpEXRzPq
 ajcbLuG5h4gst7+ezssGnixQ9qsgKUmsngdzjlbs25ieLO+sMZS7TOd0+9xFu1hxQ8nqvS
 fPHZXBLT2bDBu0xc30ANS5IBWwRR55I=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-auIqVQuwPm2nrC6UgFtqgA-1; Wed, 26 Jan 2022 13:21:51 -0500
X-MC-Unique: auIqVQuwPm2nrC6UgFtqgA-1
Received: by mail-oi1-f198.google.com with SMTP id
 h126-20020aca3a84000000b002cbffe43d9eso342820oia.0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 10:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=41Yq0Jiu/p4386qMAQJe5Ihi0AXyzAek0DT2V3OPlfI=;
 b=HOOWpPJSGOq0p/uyeesdwWD4Km2Pj6kHkjR7L2DmL+Av/Wey7ZBMVCcxHYQVJzQg/X
 0R8qSepl19Bss5I+yGt/vTGqMnC7RwcpAg+6yCm6zEgT0+O8shwBVZyFagLV0d8pRm0D
 TeKGs6SO/SGcd+Ji0e1LjbPYyaOVTUJKCwJrO2QirXzFDM0eCNpmMLfDY0mWMTgKsRTc
 HL5wwfU9SiPw5hJ1a/u01t99w/86/vHLF5G9TbzRVo1vT+U5qKlu4pXgT9c6TVWBEXWU
 auZMLEwXBk6lnULXE5ofPMWQ/cp+GYK1NLXWpemydTmswhyNZIfdWXRjPD56/xx7zF8B
 tqzQ==
X-Gm-Message-State: AOAM533LvybY+q2nXu/b86NMg3Ko/J7v0LgehdYhZB2ufjLSgQNElpp8
 EBUy0um3YZslDBWGvgnVLNC0ptDUYsZBxghYn1DC8re0wCdKPhheCY12UsxTvsVbqT6LSCY+Tpb
 /0o5+p5ZP9x3wlJZlJuzGQG0=
X-Received: by 2002:a05:6808:2107:: with SMTP id
 r7mr4948700oiw.18.1643221310165; 
 Wed, 26 Jan 2022 10:21:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEM82EpXlXd4VOeoPb1JwrJ3tw7RGrD/fSFwmY+6hFf0R10tOQz6ajGuRba8/BQVR+U0tLxQ==
X-Received: by 2002:a05:6808:2107:: with SMTP id
 r7mr4948668oiw.18.1643221309819; 
 Wed, 26 Jan 2022 10:21:49 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id h1sm3748002otl.37.2022.01.26.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 10:21:49 -0800 (PST)
From: trix@redhat.com
To: perex@perex.cz, tiwai@suse.com, nathan@kernel.org, ndesaulniers@google.com,
 kai.heng.feng@canonical.com, jiapeng.chong@linux.alibaba.com,
 giun7a@gmail.com, colin.king@intel.com
Subject: [PATCH] ALSA: usb-audio: initialize variables that could ignore errors
Date: Wed, 26 Jan 2022 10:21:42 -0800
Message-Id: <20220126182142.1184819-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

clang static analysis reports this representative issue
mixer.c:1548:35: warning: Assigned value is garbage or undefined
        ucontrol->value.integer.value[0] = val;
                                         ^ ~~~

The filter_error() macro allows errors to be ignored.
If errors can be ignored, initialize variables
so garbage will not be used.

Fixes: 48cc42973509 ("ALSA: usb-audio: Filter error from connector kctl ops, too")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/usb/mixer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e8f3f8d622ec5..630766ba259fd 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1527,6 +1527,10 @@ static int get_connector_value(struct usb_mixer_elem_info *cval,
 		usb_audio_err(chip,
 			"cannot get connectors status: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			UAC_GET_CUR, validx, idx, cval->val_type);
+
+		if (val)
+			*val = 0;
+
 		return filter_error(cval, ret);
 	}
 
-- 
2.26.3

