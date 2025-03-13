Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFCA6158A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Mar 2025 16:58:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B2EA603D3;
	Fri, 14 Mar 2025 16:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B2EA603D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741967925;
	bh=icfLkLqGKWW26hnb1AU463ZnXjWAaQN9Q84QjqE5RNI=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KJR1HUUYKc92ZX8E0sIiisFBfOjVejsAFjxOTPH73jA9Pv8WfNF5QCHrV6Kb50FB1
	 P+eDdlKrdad95OQPBrqAC9n75/gylVE2iV3Avu4Amb/HNesB2nIkpGzTwaSSAQzo2G
	 AtVZRKmNs1bCPrGJSHxamOtle83Oo5ANRSnOoCHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C867CF80601; Fri, 14 Mar 2025 16:57:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94C71F805FE;
	Fri, 14 Mar 2025 16:57:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42048F8026D; Thu, 13 Mar 2025 23:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70B7CF8014B
	for <alsa-devel@alsa-project.org>; Thu, 13 Mar 2025 23:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B7CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HDd+WtsX
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3fbc00143d6so976975b6e.3
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Mar 2025 15:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741906234; x=1742511034;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsN7kJmROxLePPJbjero8U9prIqPw6PZhY9eXdga8OM=;
        b=HDd+WtsX0K/YYVOgIQzCb4Pk3CWuaOtugHm3rEc+gFEdJqfvaaYAW6i/oZxFdpDBcK
         8HkkI6DnIpQj+sRZMvGtww0xx6CcV7560rt8165c0ipogNyysmvyUUpXWyq4QKBjnsWQ
         0dMoR/I6D92YPLQnxDp68jMMmrW2VNgDRgD7tXAq0s2L0XNv1rpurdezn4wSrUtaOHnL
         RVgxLUuSAf+mgtUe4H9DQw9HI+3dHxT9M++CgkQ04yuzZMm/pMQASPi593SJAYxBHubB
         cJvtZ3HNbh3XLkuUnFjLTg239XjjkQmZhe+VVGvCTxsfLPiWdHhUs2S3jm9VlZdM5ft/
         wNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741906234; x=1742511034;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FsN7kJmROxLePPJbjero8U9prIqPw6PZhY9eXdga8OM=;
        b=h7xtL9Rid22H0hk4CC0x8dIbEChjqa1JqRCbnYY3SeXlbAsT/wOktJar0FW+B0Ei5/
         UOGeQWN9rYNp3lZZN9drgWJN3R+tcoiod3TzBOI4zZJQR7wKsG2MusJa4Jukxiy8vEmI
         MW71WvOXZs8sHrYnrZ8v/N4CjN08eNCCjSwpXY4QmjyipWbGXpzb2PGfJutu+S6yra8P
         uaXbnSkz6yVlmYwyOtiFe72yF1dyaDShk4Xuze+sFlcDJ+eImWfZ2+pkClmUIFrtj08i
         FCB6nDvns8gBqEqKrbVLxQJDuwlpAQ008DJSo41oTdL/U0UQnxqwRd86VyPyhdmSSivl
         epqw==
X-Gm-Message-State: AOJu0YxzZ8HJC+o5OdIQRkoEiPevXGzlthr1BT8jRUOuVXeM9gu9TO9O
	/U7yBr362gUrh288vpWtC91aKZkrz2aTdHkn0cRx7fdVcr8dfMCY3Ko6Mg==
X-Gm-Gg: ASbGncsIts2Vk1mIObXnahXmJovG954YWzjD5ZN1xcLaMiGwDVEh7n8mrh3UEJAl2cN
	Y/HylxKoZcDcvpb5E5NrSR9WsOVYGLgsYceN7Zf0c4Me1OW3G1dz6Jcpu91alQCuhi7mtF+0caP
	LkENfy5h387SbG/BiKW1298ctTBZSRUkXXQmfyElAVSMLsTvVAN7md2adRDBLBFN7HFrJZMR7OT
	2BV9VYPy4sfmngwvlnhfxlpLVqp5kSEf4lyzp6wiA87UjwYMtgdDJM8v4+GTygFB5/xrnKvgpPK
	/U0eDKqg4NQ4mVP8BKS4szo+Vt7shHMgEudWLOH3hyp5L/8IvSvWqkV29ZFAg/+eCQ8kqN7xiC2
	D9ylK8MTW49feAJgwtdk=
X-Google-Smtp-Source: 
 AGHT+IE3aLiLasEGBZIA/lBt2KkC13hIuXwR3MNaapB5nLeYidS0LxbqKNvBNuE0B06sRx18PQfThQ==
X-Received: by 2002:a05:6808:3447:b0:3f6:abec:2b9a with SMTP id
 5614622812f47-3fdeea286d2mr86026b6e.10.1741906234267;
        Thu, 13 Mar 2025 15:50:34 -0700 (PDT)
Received: from [192.168.2.101] (syn-071-010-188-141.res.spectrum.com.
 [71.10.188.141])
        by smtp.gmail.com with ESMTPSA id
 5614622812f47-3fcd403b6b2sm427930b6e.6.2025.03.13.15.50.31
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 15:50:32 -0700 (PDT)
Message-ID: <f40ffd7f-c8c9-469d-8550-f7ae58e5e603@gmail.com>
Date: Thu, 13 Mar 2025 17:50:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Nick <nicksebaysales@gmail.com>
Subject: FFADO Save / Load for M-Audio
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: nicksebaysales@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JTT65XME6MGYY3DQIET6U7YJH5MXFMTQ
X-Message-ID-Hash: JTT65XME6MGYY3DQIET6U7YJH5MXFMTQ
X-Mailman-Approved-At: Fri, 14 Mar 2025 15:57:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTT65XME6MGYY3DQIET6U7YJH5MXFMTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello there,

Is Save / Load implemented for FFADO - Mixer at this time? This is 
pertaining to M-Audio ProFire (610 and 2626).

thank you!

Nick

