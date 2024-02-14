Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA885B459
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3C510BE;
	Tue, 20 Feb 2024 09:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3C510BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416191;
	bh=krKW6FufyrqnEsJjvhkOclRGG5wwZHLlEbv96z5uKcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tVzbv3HcyFxsKzQeAUnm8B4gyOeSXF1U8u6LIy2xWELuLfMVx6LY4R2zgdDi0tOZy
	 Wk2TLAs0/iwfCrY4ZOc3uNdkdtDAHrON/WV60AA0VHEgfNOhjbE4fl4HfJF8p2pYrd
	 2nIZs6l52z1un5dpEaX768nhHufHSonWs5PAvDFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F08BF8060E; Tue, 20 Feb 2024 09:02:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE14F80610;
	Tue, 20 Feb 2024 09:02:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1DB1F80238; Wed, 14 Feb 2024 20:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 988A6F80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 20:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988A6F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=ExxGDG4H
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1db5212e2f6so1009995ad.1
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Feb 2024 11:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938882; x=1708543682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SW2EVXlkBr3rgXstlJZO0zqxkNTOtfGuPtYbWFp/giM=;
        b=gjTRI3+eZJmmXlVupnsH0wL+pvgGOE8sEqqWeV0m9sUWOCFLkZzskTPgiYgtkpmNUA
         TP3u2t4TQAecFc3N3W2KU86u6aRdyCzqB08Axr/nlCc03VvB8ewBAQfmO2Uk4QZ8qm57
         ynChvSmGyMt2DdUUm06uKsw0dyszOkgYwcYx2Qu39vVbYn0W+CRtGMZIdmbfQ4LQSlOe
         wKKz4My/zGL/f4QEofNwXGF0wLUuYUbZ8r2JQEABzdbdoQj1qkpSn8S97750e4kC7NiJ
         +hFa3A2sKGDz1Ont5FlB9nI69gFyrg/d0mOKfA5QzCYihIRzZtm5ioki2kOhAs5rmrER
         uDGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdTn7qKn8ZUMC8WZBgVQJLLNSQpST+lhYdZRIFRRRsvnVob91j4tu9j4tfYL0zKEB6KCOKt5n1AWvxorp1cW6Rua/HHu5fLmxqKKc=
X-Gm-Message-State: AOJu0YzJU6DvbRafleabdswxNEqz3oWc90C6gQ64wS6dEVcZUJTxWNkp
	Oj+2wGTZ3u4l1M96ovaoFEjkYrB7/+9Ef8EtdEaQsWJblKLsOo+2rqAgh7L7xXuDrg==
X-Google-Smtp-Source: 
 AGHT+IFfGbZuAKSoIipQ/AuSt4XRcAoPLUj2tmOBYt6LOxRikAJhgLvwB5Ih9ElCDzXfq8dY46oA7g==
X-Received: by 2002:a17:903:32c6:b0:1d9:adc9:2962 with SMTP id
 i6-20020a17090332c600b001d9adc92962mr4216641plr.20.1707938882014;
        Wed, 14 Feb 2024 11:28:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVNr2uJ9kjnrGCOQC9BNLwWgg0FTNhR81r3mhUOmcxEJOT46yMDQ2YE9PySMXH9JejYyLfBYad23Xt/qtP4pPO7VaCiW5o6cRBaLbImdxN8Ea1NBJL/n/vkMXS+JbXWFt4TGJQbxO8QSVNbOlI0qMyY8fs9rdBzMpEusKyCRENQa2meTvVnw65ziaJRTjSACAWZOqJbCLVARgAiekH+t3uAQ08tn0XAp8sd9nu7H5VACcHMwU9UDTqQnBR4BeAtg5VErA==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 kk11-20020a170903070b00b001d8a93fa5b1sm2269628plb.131.2024.02.14.11.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:28:01 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707938880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SW2EVXlkBr3rgXstlJZO0zqxkNTOtfGuPtYbWFp/giM=;
	b=ExxGDG4HkIj1oisfc/xBYlb83uf+EJVkHyY++SDgkc95zRxC5dMn62sB0ubUZ9MmGZ//Ve
	lIF/ReQzCklcu8k5GEkXFg8Et4Oyf8JMeuqB3qJDimH9K+Zjzb6y6TWjvbbln2aQLXkSjo
	9a82NqA3wef3FOOC/DioCZN13IuEG+DQcl1aHqC1Dmh7BSbeVJz39Nk8PBDTUEXX0elzk2
	BLpIxKjaxPDeaMxBSmX++g6iWbO5mf0bDTZYMrw76JUkqShALd/iWaiRQpGN2KqbN3moMP
	Z+jYdDVMOGEbXWEo/bmczCW9woQefjvDnjsUueUdWw9Z0HF0Br0IUu23wasUig==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Wed, 14 Feb 2024 16:28:29 -0300
Subject: [PATCH 2/2] ALSA: seq: make snd_seq_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-bus_cleanup-alsa-v1-2-8fedbb4afa94@marliere.net>
References: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
In-Reply-To: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
To: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=krKW6FufyrqnEsJjvhkOclRGG5wwZHLlEbv96z5uKcQ=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlzRRhl5Veu7uhBrVI+1uU+rR4q9IbJhifdb9TU
 N+d17t0QdmJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZc0UYQAKCRDJC4p8Y4ZY
 pua5EACuVYFKzDW/TNKVRiEKvBIwgkmSnbmvzLYBd//6zcN/EAmhfhvISk2n9yBPuubxPSZaaxn
 RqRssHLBSRa1iXhKOvZXLcO6w4JAvMSpsQItJWa1JjBhBbiCyGvFqjzT1nMR7UIJ9ygrJxm5sin
 BpR/KI9reM1gxTPJwDCt3TubQKaaH8CkcX9uMDP2bchSDnQ5209TEhdocOZ3NReMxnm2ry5Szce
 0x63cr2s6aAKiETtlrjTDMYIIcjFmH7ZSArvFGGcjxijIDBfb2sj3yxF9e2xKBL9RyDBY5xS3rW
 B7JHq6CngM/y0FV8xzlF7Dt7SoW5eEZKVFQBdMwRwQFfjA+5hc1eVSHXCyKVYM02dKvYUtKw1Z9
 xf2JfFQicxO2BJlDyGq0XUj3yNxEo0TXIeWjCKsDLOWD/cLS6LsSlZuUkwPFbyZrxQmfuTrwAWu
 44agkqrnN0TkX8NggIw2mYTOULjDWAFuRups2m4TfBhd+G/Rf3KqRoJzKfqb8XETovkNlHCt/GP
 nouPP+s1xHBga6enpHkwe1geOAkFmtvCPkLM7ZEnGSLRiE/neQExxHJJ9+ZRK4fclXGpADPv2b/
 +LFqX9LvwU2qa5tcINF5yMW6AEOFCheXlE/15rHjKff8s5MkkAz4ZI8mMsDDFoRTTNPuz18gIn9
 IyMwkxY0ce06jZQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 22Y5W2HQNZMCKINVZQHOA4WT6H4V27TZ
X-Message-ID-Hash: 22Y5W2HQNZMCKINVZQHOA4WT6H4V27TZ
X-Mailman-Approved-At: Tue, 20 Feb 2024 07:59:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22Y5W2HQNZMCKINVZQHOA4WT6H4V27TZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the snd_seq_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 sound/core/seq_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 7f3fd8eb016f..654d620d0199 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -49,7 +49,7 @@ static int snd_seq_bus_match(struct device *dev, struct device_driver *drv)
 		sdrv->argsize == sdev->argsize;
 }
 
-static struct bus_type snd_seq_bus_type = {
+static const struct bus_type snd_seq_bus_type = {
 	.name = "snd_seq",
 	.match = snd_seq_bus_match,
 };

-- 
2.43.0

