Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B27F1874
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:20:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9F1DF2;
	Mon, 20 Nov 2023 17:19:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9F1DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497209;
	bh=3evRSi+y5gCcI5Svjj3wdM+4PXRFoxtF8EkG8RKEht4=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=G4qTlUznvoiKDXxq8TxbcUeZvRng6F697woGID1rm6+fxkLJvdVbMNxUd0C5XPKSw
	 D0HeEyyv9TdDAJCYi+9/X6rotaafACVf0+UDPu5Xw5LZJ5IM3UMHVzfrtxh6bVb8Ay
	 roWZrZXQGTTQQcSFJ2REVxhYP5dbw3DqdKqLOmNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B102DF805F4; Mon, 20 Nov 2023 17:16:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 025CDF805ED;
	Mon, 20 Nov 2023 17:16:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F3A0F80254; Sun, 19 Nov 2023 13:47:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 114AAF80166
	for <alsa-devel@alsa-project.org>; Sun, 19 Nov 2023 13:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 114AAF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NvXmyPut
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso9039665e9.3
        for <alsa-devel@alsa-project.org>;
 Sun, 19 Nov 2023 04:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700398071; x=1701002871;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EFpOPqdJgnwCDgF9uF+zAy0+ByLlwpVoQWF/buzEAqo=;
        b=NvXmyPutUohKUOun4b+sRept4JZseQOeIFMuDQC5iQ7UrOaOO7u0O8PNoIealMbCCy
         kZ1NR0IZzFSQu0xi2XJprYiVY31LFuT9F5axn8VDsJNqWArh39/KA3GMu6iPwvtj9/V+
         taI1oSTwhyeKMst6MI6SUfh1BFdRFj/uYy5r0X+aOkBW6q5FTOyiD5P13Q0POgQ/PI+t
         KxXnKtXJcJ7krkQgXfRB1Tpn4NQTCK6R1XRuNQ7206UO+38KC/fuPaJc0xq1sV3/onHY
         QtnqOQdrb8RrA/A55JckuQHdk2dvDqgIS5kWIx3BnqRx/faqpLQvOzj1zarVwdZnxxut
         v2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700398071; x=1701002871;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFpOPqdJgnwCDgF9uF+zAy0+ByLlwpVoQWF/buzEAqo=;
        b=iGRbpnU6ij6ZlYYVfRjieALM0WyE4zGna71x5vOEXUUGREwh8FYCZyh1qvcd1xg7d9
         aCmA9dcG/XVjowyMy83AvJLbEKCd89MoCLqMcz4/y8IUFMoqbWPh2WcS4ZB5cEz47/Ns
         KSQHiIimL3p6o/6R3+XqRxMDtmL7t4Lrm4wdybrfcYH5/GM1mpIJyzaP+A1e1C6/PT8U
         TfHRNkldnDlHCKgKWg9blEnK9PdsmVU3zYpNeb96SSfUdMJq8KZ9cw+ve+mBwJmJYQjA
         yWRkbX9bR57cS2Ahh9i8HbWZaXXmEmeX4jkDcVDCBcjmRGmB7ZqBwNhc7Zckit3jpeI1
         2G4Q==
X-Gm-Message-State: AOJu0YyHmfJj2AfoN+70XlFKiZkoWUtX5MVVeA2mATJJgNZzVS+3JAju
	RJs8Z8K2/Oj8NN0Ojrym1DMlGxdFg2cPXdcv8Ux0eFbMSaw=
X-Google-Smtp-Source: 
 AGHT+IHubpZpiIVxfDlgCi1skyG6BMxyR8r6bqOq4JYqVua+0EryPalmHKZOlbKi+BpXy0GQImhz0UrBEU+9uHIiPjQ=
X-Received: by 2002:a5d:5281:0:b0:331:41bf:c4a with SMTP id
 c1-20020a5d5281000000b0033141bf0c4amr2320405wrv.18.1700398070841; Sun, 19 Nov
 2023 04:47:50 -0800 (PST)
MIME-Version: 1.0
From: Bhavya Kapoor <bhavyarocks19@gmail.com>
Date: Sun, 19 Nov 2023 18:17:39 +0530
Message-ID: 
 <CAA_4i9=3JUGTFjXEqED9e=g7erFbhyrvGBH0XTRUDkMNzirwzg@mail.gmail.com>
Subject: Problem with headphone mic input
To: alsa-devel@alsa-project.org
X-MailFrom: bhavyarocks19@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3KQZJB2O2Z7XWQ3AWPNNGJLHJLOBRTYF
X-Message-ID-Hash: 3KQZJB2O2Z7XWQ3AWPNNGJLHJLOBRTYF
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:16:46 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KQZJB2O2Z7XWQ3AWPNNGJLHJLOBRTYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

QWZ0ZXIgYW4gdXBkYXRlICwgbXkga2VybmVsIHN0b3BwZWQgdGFraW5nIG1pYyBpbnB1dCBmcm9t
IGhlYWRwaG9uZXMgYnV0IGl0DQp3b3JrcyBpbiB3aW5kb3dzIG9uIHNhbWUgbGFwdG9wLiBJIHRy
aWVkIGV2ZXJ5dGhpbmcgYnV0IG5vdGhpbmcgc2VlbXMgdG8NCndvcmsuIEJlbG93IGlzIGFsc2Et
aW5mbyBvdXRwdXQNCg0KaHR0cHM6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPWU1MDRhNTAwNDA3
NGVmMWZhODJiZTQyNjY2ZjVhYTg4ZWQ5MTNhNWYNCg0KUmVnYXJkcw0K
