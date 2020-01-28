Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D114C9D0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 12:35:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6159167E;
	Wed, 29 Jan 2020 12:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6159167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580297742;
	bh=vocIdaghoEOea0ejPWNairoF8kdBZ1rXykIPu9M/HQA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tEm635ggjoEa98/+/I6WWlNj3MH83pHBpP3FA1B5el1XbfEnb1hBxMAU4/+MQjqgQ
	 W/U2BzJWhUWl2j/5u7eMItbvP35Y1R3zF10TrlUJnu+93UII8Zvnp1wUOdLTc4325O
	 Hts0wHyU09Jh9m4EQJg8DlXhaTqv2VUiGxyRY2j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 167ECF80252;
	Wed, 29 Jan 2020 12:33:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D6EF8014B; Tue, 28 Jan 2020 12:51:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFDCEF800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 12:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFDCEF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gWfQ/Q+5"
Received: by mail-wm1-x32d.google.com with SMTP id a9so2194725wmj.3
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 03:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=/Nop3yhdKygAvT9F93tUxq5UTFs8tG2vCvT0L8EqIf8=;
 b=gWfQ/Q+5/xsxtYL+lFyqO27FBSkQB+UyYaTo6EJUP6iQGWdmdSUSVYHIMY0YwRq5R/
 wP2qqTXD1p5OHAP8G9wTKU5mEK5mMKMVWdgwarONykpwKbXVFuwJg9CHn958qBcf4umk
 G5ROdIonPCXbhU8CAabuh4tWP72dpGBBD7N28TSX7sKgjrP709gnUy7wfCQFlMbTpcEu
 vGHg/67V6zK/zejmLaMLh9wAiM0bByM/owva7Wge5IdwVAQ8JvHVFhAt85U3Ee84sN8F
 ohFx+YkCMrlZWYCqvYX1lAH/JmKDYeodRX/FjWbeGnqY+t8WxgWjvw7dO+Ou41YFEnEo
 UoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=/Nop3yhdKygAvT9F93tUxq5UTFs8tG2vCvT0L8EqIf8=;
 b=BAcdCMn0SiRh70X4yBFnJZcUjnd8A8vAKseSIVXev8mp0I+CvNdIiFHvdpmfQ1qXbH
 RdFD9pARHvOyua6xjOSEbBhUzrtEaXrpORwQbdPuu/0JrJ3Sj+6ubOQqhqWy4MF5qYR9
 ZL7K2pf5//eHEY26duzRRaclEtcg29Tpem1YkblRUVXKcgXt9s001ibm18cu58hvdKsg
 kRjGR5M0ILyIDVzZDVu+XjhBlkeOa6gp/C9EaETjQh3fWCT6hGjCkRp/yn3WaxK31syD
 YOkDxTWUwxEhgy4aWQuEVd0KqjU5Nq2qq+NQiznMjcea/YVIQSzLuVM0HFFm8YbyIdry
 LKUw==
X-Gm-Message-State: APjAAAX95nLbkJmooKwKyNUI5IGdWF8jIgOoEc8EBIs/swrxXB2xBSai
 xmcy687jZ8nC5s06EwKNZWF9lGKvscI=
X-Google-Smtp-Source: APXvYqxTabut6u/lqGM30sgYEuvZ0DBxt5MmbpN3ieTH4Rn+qEFB4woq59CC1avcSFft8LSn0KfrpA==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr4607071wmj.177.1580212292418; 
 Tue, 28 Jan 2020 03:51:32 -0800 (PST)
Received: from [130.208.171.199] (vr2-pc38.rhi.hi.is. [130.208.171.199])
 by smtp.gmail.com with ESMTPSA id y12sm2621905wmj.6.2020.01.28.03.51.31
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 03:51:31 -0800 (PST)
To: alsa-devel@alsa-project.org
From: Pedro Costa <p.simoes.costa@gmail.com>
Message-ID: <719056d4-aa45-8186-697c-76c1e89492ce@gmail.com>
Date: Tue, 28 Jan 2020 11:49:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 29 Jan 2020 12:33:36 +0100
Subject: [alsa-devel] issue with alsa lib (ucm vs ucm2 folders?)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear all,

My apologies in advance for a very non-technical feedback from a non-expert.

I was unable to get sound output after updating alsa-lib on my Manjaro 
Linux system. I managed to get it working after downgrading it to 
version 1.1.9.2. It seems that I faced the same problem as reported here:

https://bbs.archlinux.org/viewtopic.php?id=251113

You may already be aware of the issue, but just in case I would like be 
sure that you are!

Best regards,

Pedro Costa

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
