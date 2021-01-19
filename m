Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF82FB484
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 09:49:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C2B186A;
	Tue, 19 Jan 2021 09:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C2B186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611046171;
	bh=Lj+Z+mxDfZB0RuveYEYbsIsX0NUClAg4/r5CGXbi4b4=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=di0SYXpBcrYZBami8K22OhRkX3lMIdgzdV5/F2gmMi/z6hSXarkBiuNIB5hCl3kRA
	 7QpqAIxjlFDANhnoAzQQBIcrzDT2DDXaOLZGQSbJ5btlVYhBFeTql9VYIDcZXOelfD
	 0LXiLByedrEwBKLy74pzDs073n7TK8kXhtcMOSbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF66F80255;
	Tue, 19 Jan 2021 09:47:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD1CF80257; Tue, 19 Jan 2021 09:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE14F80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE14F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bRytbEod"
Received: by mail-wr1-x434.google.com with SMTP id a9so15402119wrt.5
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 00:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ZD/8V+qKI9Qc+OXbrKiuj7HYjfxF3fqGQd5JxDVshzI=;
 b=bRytbEodGV6bzu7oKTMUdKi2IIOTX4butuvTNeJoTubg4xQRbGmyw8jzHDmxWeSpuR
 UNPjvW9t6CUuUKSw8HiRqY+RyZYdgi+zAv57ieJuDOsl7qvbef8G0PLTz1W8qcF3d9ZQ
 J+Kx4pUV012IrWTxCY/kn2scXAahQO2mWCUtr/GKPKlnlDi5U2ocvaShYsiSlvFZUA/6
 CTtGJl0d/8bfgQsvB3F1GjJPYm698Kst8IN0huY5UjDHM8FYjqRpozTxYCzsv1N6tmdo
 qCqst474S5hFdNxDjBQ57h7WATwind0zb75eQ8SL2w/O6sKktTd3RbSUndbpWfAnN04V
 e47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ZD/8V+qKI9Qc+OXbrKiuj7HYjfxF3fqGQd5JxDVshzI=;
 b=OVf6OJ1kRFwEKGskHWsaR7EeaUcNlWZKtqj0vXv5PfPCz7oqOWmrsKTkCJuqXplDDF
 Q3Nyipm1SyqURYpnlFMGBIVkLmMUQ4Jlw8DT0LqUftjmmMcqtRTsQ4Qv2lWxn9Kim2Pm
 d/jJpkPR7/lFfT0UlFpqb5qo+Fd0YDxIZik59e/Y29A6Kwx+ZCmCe2bKQ2vuijg6ni42
 P2cW/NlDqwTX8llb68/MRDhzFi3Sk9TGqeKA8n7nND5QmNHg3MZm7uKgoXIr5O32LHsV
 YfcAV5xyzY4tpuQ5VczlvEgT6QhflMNkOzWlheBHJSuCiwIYw8vO4ixzPMJiToxqeFGH
 lEXg==
X-Gm-Message-State: AOAM533KAKfoTVlotY8gvCWurjt5uX+ebnN1SZ8n05agcGn2H12hFsfo
 M/xc0LNoDoI5r3mz6rJcquRTOE5B8Jijgg==
X-Google-Smtp-Source: ABdhPJyGrH0dnnWDmY5oR1AxtzWGoqZcySFtJZuDtjn7x8vNjqz0EZh7crIhRrJUJLagF7d0w5AJLw==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr3159738wrq.47.1611046066459; 
 Tue, 19 Jan 2021 00:47:46 -0800 (PST)
Received: from u89958f1b516b5e.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id o9sm2116862wrw.81.2021.01.19.00.47.45
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 00:47:45 -0800 (PST)
To: alsa-devel@alsa-project.org
From: Andrea Fagiani <andfagiani@gmail.com>
Subject: [PATCH] ALSA: usb-audio: use Corsair Virtuoso mapping for Corsair
 Virtuoso SE.
Message-ID: <40bbdf55-f854-e2ee-87b4-183e6451352c@gmail.com>
Date: Tue, 19 Jan 2021 08:47:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

The Corsair Virtuoso SE RGB Wireless is a USB headset with a mic and a
sidetone feature. Assign the Corsair Virtuoso name map to the SE product
ids as well, in order to label its mixer appropriately and allow
userspace to pick the correct volume controls.

Signed-off-by: Andrea Fagiani <andfagiani@gmail.com>
---
  sound/usb/mixer_maps.c | 10 ++++++++++
  1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index a7212f16660e..646deb6244b1 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -536,6 +536,16 @@ static const struct usbmix_ctl_map 
usbmix_ctl_maps[] = {
  		.id = USB_ID(0x05a7, 0x1020),
  		.map = bose_companion5_map,
  	},
+	{
+		/* Corsair Virtuoso SE (wired mode) */
+		.id = USB_ID(0x1b1c, 0x0a3d),
+		.map = corsair_virtuoso_map,
+	},
+	{
+		/* Corsair Virtuoso SE (wireless mode) */
+		.id = USB_ID(0x1b1c, 0x0a3e),
+		.map = corsair_virtuoso_map,
+	},
  	{
  		/* Corsair Virtuoso (wired mode) */
  		.id = USB_ID(0x1b1c, 0x0a41),
-- 
2.25.1

