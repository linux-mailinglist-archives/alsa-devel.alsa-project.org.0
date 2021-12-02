Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2546662D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 16:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65CEB277B;
	Thu,  2 Dec 2021 16:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65CEB277B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638457661;
	bh=o96JU2xD49xNNk12p5HlnfetIUlSH3xA1CmZRVBso/c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MBvqiKq/jU4PfnZgAZhYrWAUMg9h9eG0dDkB1UJ36J19hNxp6jCmWuHpXALAnXc1O
	 4c+erVRITdVi/KqS9bNotZXUpwqUwXXyeFwNnLa+/cduavLzxaO0+wKEnLgWeZMMLR
	 MT76NJbUNWlsSCS2SbsarCTioHp2Uu55Zr+TII0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A10C4F800BE;
	Thu,  2 Dec 2021 16:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1F5FF802A0; Thu,  2 Dec 2021 16:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D6F1F800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 16:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D6F1F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H8qKlZU0"
Received: by mail-wm1-x336.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso3806657wmr.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 07:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZu97vvC5xaJ6DkIaEKN2wZkE8+yzRqEWP7R1TpBPwY=;
 b=H8qKlZU0j1h1jY14yXNWw9om5EsqMYESOWckAohDTVWfED2dYx4ihn9zGDd4iSckWr
 lhcfQCAYu4jlaefVEBPLf7q3rOVwOB4jeC9MOQ0Mo/7goNgNLqoDghOjF+2BlPhW2EmW
 6OK/gtUD+QmwOOAaWbQTUfbaCmhf0z5QBTqNqVobmHsG2qsPm81cavsdWJH6dLVLuElg
 sSBVeYwnUJmeE/4jkZf6t207HO4MAFr15pLJMCTlEtSy0rmXNbJGeRhTQg6KrKGYTZgy
 XtjAb0uJ9xzwiveI043OxwTHIQmidW2xmbNKYF4mCflaNSYkuuvpD2UsFQ5K0OSavnr/
 VaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZu97vvC5xaJ6DkIaEKN2wZkE8+yzRqEWP7R1TpBPwY=;
 b=P3BV2i903kI9NPY61ZCCr6N3gYOIgJ1AEeNRt6bdvR4bvltR39Hij5H+8T4NpayRZs
 uXKykqsoZWHpF4fOAZS4HSADwNg7dZitfpR+DwWl59BQm5s+7mRfsZejj3aX4yH7FuJf
 AOpJXGTPtGNA2E6u+MHLXx4Db9Li1/g6ZjXCussPoisQRcEN9UKiGiHlftd46tHawa6I
 P3DZ/R8VY6WC8z3J6F6mi5qwklfSx24wXxxqpuC7nDKNpOpkrc6uvyajslpInNrtnTov
 ZB6q3OKS7ZlY3NrWMc53mlVUs6AHzBhQwMjjMYqYiFOHv9raGKilfcE7Q8fojQ5azNE9
 hIbw==
X-Gm-Message-State: AOAM532WTFHFMscjFjAsGfP2GKclAgtAOFAEmTzYdGElw2Wg8KmyvlGP
 xhbBhKG79MN8TFGpYnBxvhSbA9mRNm3uMw==
X-Google-Smtp-Source: ABdhPJwYQVWLdmuErNSqb8xKa06ItjTaMrDUQawG+DgF1p/bRYoT06cGecYn8wc3SrBqku2dsSNZ8w==
X-Received: by 2002:a05:600c:2195:: with SMTP id
 e21mr7236908wme.187.1638457575304; 
 Thu, 02 Dec 2021 07:06:15 -0800 (PST)
Received: from localhost.localdomain (37.194.143.150.dyn.plus.net.
 [150.143.194.37])
 by smtp.gmail.com with ESMTPSA id r62sm2286786wmr.35.2021.12.02.07.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 07:06:14 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ctl: Fix copy of updated id with element read/write
Date: Thu,  2 Dec 2021 15:06:07 +0000
Message-Id: <20211202150607.543389-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Alan Young <consult.awy@gmail.com>
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

When control_compat.c:copy_ctl_value_to_user() is used, by
ctl_elem_read_user() & ctl_elem_write_user(), it must also copy back the
snd_ctl_elem_id value that may have been updated (filled in) by the call
to snd_ctl_elem_read/snd_ctl_elem_write().

This matches the functionality provided by snd_ctl_elem_read_user() and
snd_ctl_elem_write_user(), via snd_ctl_build_ioff().

Without this, and without making additional calls to snd_ctl_info()
which are unnecessary when using the non-compat calls, a userspace
application will not know the numid value for the element and
consequently will not be able to use the poll/read interface on the
control file to determine which elements have updates.

Signed-off-by: Alan Young <consult.awy@gmail.com>
---
 sound/core/control_compat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 470dabc60aa0..edff063e088d 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -264,6 +264,7 @@ static int copy_ctl_value_to_user(void __user *userdata,
 				  struct snd_ctl_elem_value *data,
 				  int type, int count)
 {
+	struct snd_ctl_elem_value32 __user *data32 = userdata;
 	int i, size;
 
 	if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
@@ -280,6 +281,8 @@ static int copy_ctl_value_to_user(void __user *userdata,
 		if (copy_to_user(valuep, data->value.bytes.data, size))
 			return -EFAULT;
 	}
+	if (copy_to_user(&data32->id, &data->id, sizeof(data32->id)))
+		return -EFAULT;
 	return 0;
 }
 
-- 
2.25.1


