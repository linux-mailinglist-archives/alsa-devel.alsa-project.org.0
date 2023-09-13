Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F062F7A0C2E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 20:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE58DF0;
	Thu, 14 Sep 2023 20:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE58DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694714732;
	bh=h8Q8yGby4IIHCpFoT1m9DtZaxwEiR5sSZyoZBnPMujE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tXvVdIz+EyswYrxebrYrqpboz5e/Bqk0Ix08P0qbkflALmbBMft0kR1uRWAb5z79Q
	 JIW8c4DP+rurvzc60PJYa6nknyfsgBijb6ehXd287n9sKi8HdCA4vTaYje7EtSWeWG
	 qB0JVf4dLi9WGZu1zlzwY9xcKVnvEmq+uIwD30WY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40EF0F8058C; Thu, 14 Sep 2023 20:03:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95672F8057F;
	Thu, 14 Sep 2023 20:03:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11EB1F80425; Wed, 13 Sep 2023 10:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E202EF80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E202EF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lQSQuDBt
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso68777105e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593107; x=1695197907;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rL0QYm+4DpNU20BBRJmcQSCbvNXdp8splkqH77lfanI=;
        b=lQSQuDBt9LQr+nIqNtp67PE/AuqeV2spkZECAHU1kz53qBsZqwzdWLtLQEfDJqKJnY
         dBYkyrl11ClJAU15UxS7xXtrvt2ShPuwQFtl58j6b8ODBvdIizrYz0PGv6Ygdu249rzB
         BORgLg6BXD37F4opNBTkXr3WNG7VvhBLQd7T9/O30Vhni/V/nySIRx5YLOQsyz3In3/x
         ZmZOxO8HylFBN7yx6KbIOkDySzvu8zdMYAxm+FW2wt4py45q59snwFtJPFh9nD9pBUtx
         PUy8T+aBrTnfYMPoNPXv75BX4DEB54AFa1GVuAWnWwADX3czaUzjP447bzATjzs0sn3L
         0xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593107; x=1695197907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL0QYm+4DpNU20BBRJmcQSCbvNXdp8splkqH77lfanI=;
        b=G/yZaSMAzDNMfhaFTCV+o0a5YVHUk5kmQwX6AO3IUnJhYdSWUDGpUU08XcN31TePXZ
         xHlkuDGFkqtVpX6ZfSuwXCrH+6/r9Qc73PfJ2IXsssmGujV9ddTQ1AF4NVJ91FTnUdy5
         Srgv2Jr28RGXYkWbBT2Amxx51QtAWCRdd0B4GM0M51zF3LmWGy1r1sayCQgLdOUcalYh
         3X2Opznbq5LERAHFAVdjNBtkbogri0gKhHfVYJZBEgmKwTY804BxxVjbqE1Db7l3RDan
         zBnt+wVkxZwpYzFrjH9Ho4kkvC6IeTTWfLtnR0vECXUJ5DZ80D7BCw/z0K87S7sgjh0p
         kZqQ==
X-Gm-Message-State: AOJu0Yy78HHBPURlmefIBynQ6dADZzCWiissT4RSkX+lYsOlFSGvxt1s
	SBCPOwZgYG+kcvOMtELx44FKlw==
X-Google-Smtp-Source: 
 AGHT+IGFO0CwSx+Hl2v9TdNBISeq9HBmh94Hh3tAzgvAXxD6wKVhKIFaJvI+u/oy1HGcv/6YLqtxUg==
X-Received: by 2002:a05:600c:108b:b0:3fe:207c:1aea with SMTP id
 e11-20020a05600c108b00b003fe207c1aeamr1314950wmd.23.1694593106762;
        Wed, 13 Sep 2023 01:18:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a7bcd12000000b00402f7e473b7sm1285889wmj.15.2023.09.13.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:18:26 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:18:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Weidong Wang <wangweidong.a@awinic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nick Li <liweilei@awinic.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Ben Yi <yijiangtao@awinic.com>, Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88395: Fix some error codes
Message-ID: <81476e78-05c2-4656-b754-f314c7ccdb81@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FADZDB6ARJIJB5FKK3VHUTZUDNJSALLB
X-Message-ID-Hash: FADZDB6ARJIJB5FKK3VHUTZUDNJSALLB
X-Mailman-Approved-At: Thu, 14 Sep 2023 18:03:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FADZDB6ARJIJB5FKK3VHUTZUDNJSALLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These error paths should return -EINVAL instead of success.

Fixes: 7f4ec77802aa ("ASoC: codecs: Add code for bin parsing compatible with aw88261")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 8ee1baa03269..87dd0ccade4c 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -452,11 +452,13 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 	if ((aw_bin->all_bin_parse_num != 1) ||
 		(aw_bin->header_info[0].bin_data_type != DATA_TYPE_REGISTER)) {
 		dev_err(aw_dev->dev, "bin num or type error");
+		ret = -EINVAL;
 		goto parse_bin_failed;
 	}
 
 	if (aw_bin->header_info[0].valid_data_len % 4) {
 		dev_err(aw_dev->dev, "bin data len get error!");
+		ret = -EINVAL;
 		goto parse_bin_failed;
 	}
 
-- 
2.39.2

