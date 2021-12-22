Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2B247D394
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 15:21:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E221C1783;
	Wed, 22 Dec 2021 15:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E221C1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640182886;
	bh=DKWn9cfttcYvnpF3WW22bTe4YUUlN+AIwOlHrKwDGo8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KOjLtQjwDxeSTbmQUIkBCYbubgxRl3LwbEvfaxGj2onTKZplnKN/EJOKUjv3A3G9I
	 y5eICpKQB2FiXZ9l4XxHXFwsAGVXnZZWaFiQ/21f3B7qdeuzEm/Wk9u6+FDGEW32y6
	 7D3N3yhP1jOwKBQOP+cJpqI+RDgiFCGv8paVlXLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBEBF80105;
	Wed, 22 Dec 2021 15:19:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5E6F8020D; Wed, 22 Dec 2021 15:19:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31B2BF80107
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B2BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PptDHFwo"
Received: by mail-qt1-x82f.google.com with SMTP id 8so2020435qtx.5
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWJVoPrU62uuuz7n9/V3GlTG969KN0vv6pvLIa8XuJQ=;
 b=PptDHFwo3D7/SctsLtS8NYL/a8NwRe9tEkuFt/GslNgvfSWUtDlt+TQIpPcaHUC9fi
 +8Kbia4J3L5HLKzzZXVDNg5sdy1/u8lox7VZVSWb2+XuaaqstKS2cll375KUJjK6wzCV
 42fO6mzgJ9QwWLlYgELLGwskPj0NjkE/8qSp/WfK0iAK8PREtESBRhiOlDhF5EdHgkr+
 LNKaA5p9fch52CriyHZv4y3vu5H49RVCrZ5K+J+Iwyb7qt85AWy9aOPyXMUzRv6LjeRz
 rGPuxAFEGPTN+jaGinuhJcZcjNlcfv3Eyf0h86J2joMe6MV1t5TbdaE32h+ThLUEYL71
 0qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWJVoPrU62uuuz7n9/V3GlTG969KN0vv6pvLIa8XuJQ=;
 b=rL/OgZWM4Twup7JmWJc/7Z5dbHppaHtsqI42NPopXnddmfBeNhPWqoBro1WO8+4uRW
 VsedqBCfJ1XcLdrQhIM9GZKVy+GcfYVu+uPzkGWvaJpKq4l9EA5z9mFP5U/c2tt+QPuj
 hyvlpCKttKoki1C5EbxWC1GIaiBKtY7oKjW5284YtpM+OwP4dlIyPkjdddh/u18vxMlu
 khmqzSknT2np1pldpKADWSfk5ClzO52fQaT2LTQDzK0O+DfPCwHXSfJUnmKeAyUaGwfs
 2uv3RcE7P5NJW4Et4PrfwcWBuGAZ+AZb1aE/4ZZ0HpIwEz9bTXwJGRyS2bEgRLG6G9/T
 +uWQ==
X-Gm-Message-State: AOAM533lCnfKvg76B1JScehxu7RF19OyEa83G3bkzTR994eejV2qye/y
 tYYXY8KsSBxxSVflJfjeKhU=
X-Google-Smtp-Source: ABdhPJyteWmlWO5Q7SKOTpJhwTKZbvmEi+avJuqHYJNAfAAOyQTZ6LgaUvCeG0hOAOCpvSdUK+1vkg==
X-Received: by 2002:ac8:584a:: with SMTP id h10mr2195396qth.615.1640182772049; 
 Wed, 22 Dec 2021 06:19:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:4709:e1da:a7a:6d6e])
 by smtp.gmail.com with ESMTPSA id
 b9sm1803990qtb.53.2021.12.22.06.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 06:19:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH RESEND 1/2] ASoC: cs4265: Fix part number ID error message
Date: Wed, 22 Dec 2021 11:19:19 -0300
Message-Id: <20211222141920.1482451-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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

From: Fabio Estevam <festevam@denx.de>

The Chip ID - Register 01h contains the following description
as per the CS4265 datasheet:

"Bits 7 through 4 are the part number ID, which is 1101b (0Dh)"

The current error message is incorrect as it prints CS4265_CHIP_ID,
which is the register number, instead of printing the expected
part number ID value.

To make it clearer, also do a shift by 4, so that the error message
would become:

[    4.218083] cs4265 1-004f: CS4265 Part Number ID: 0x0 Expected: 0xd

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Sorry, I am resending because I was not subscribed in the alsa-list from
the other e-mail account.

 sound/soc/codecs/cs4265.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index cffd6111afac..b89002189a2b 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -611,8 +611,8 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 	if (devid != CS4265_CHIP_ID_VAL) {
 		ret = -ENODEV;
 		dev_err(&i2c_client->dev,
-			"CS4265 Device ID (%X). Expected %X\n",
-			devid, CS4265_CHIP_ID);
+			"CS4265 Part Number ID: 0x%x Expected: 0x%x\n",
+			devid >> 4, CS4265_CHIP_ID_VAL >> 4);
 		return ret;
 	}
 	dev_info(&i2c_client->dev,
-- 
2.25.1

