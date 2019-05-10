Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DE1A4F8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 23:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCAF18B2;
	Fri, 10 May 2019 23:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCAF18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557525254;
	bh=UriSww1uANxv0yy/ug70z3lRM2cvp1x/SHHm9cJ5Nzo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MJAEkqN7kh2s61AtThhKIC9DwogFS6nHGTMFj+rDlf4YxH2ea+ITt74rJwqbTGIaA
	 OzHsLaOIo0UCcvNgQYOw1poJRqeaWVnfGPC3s00FjDm9NgTdt9j/8GZQ9HJ2uGvJ/Y
	 lVKbh9SqRu8MlW+CFM2SLC2EJEoH1wyrQ5RNpPTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5ACBF89705;
	Fri, 10 May 2019 23:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6672DF896FD; Fri, 10 May 2019 23:52:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C77EDF80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 23:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C77EDF80730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mWpc1+Vu"
Received: by mail-lf1-x12e.google.com with SMTP id j20so5163794lfh.2
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 14:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Sd4CbiumACYwjasnnNoyhibSDyGZ9mQbmQG/5xLjR7w=;
 b=mWpc1+VuwEn47xues+niJ2dPffblg1CZ75FZE2bvh1Q1nJ5gvn9XMzGlrGclvFYVyn
 PuvS/O2+WjCUK3JUMVaL13a1xlqDeBuULXQo8rnFIsuffLE6etELOfsv5Cvakx8FZh/N
 r1VKxu820N7+yVUCC5/A+5G4S+Gsk0ZvD7JtgkbkQ0vXh8EqM0S8J/SSQOedbWdI68x7
 7mujMNuW2QJHiWK55KWZns8kcsX5QjarjDk34CpokGpIOPHK83MzbfOzuV21ICF/kEDL
 9yjNyxf51KF/AY59ngujQBFGbA6pnuXdNtPCaUIiga+JG2c8iN2IJj9msfdXjqygQExW
 gNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Sd4CbiumACYwjasnnNoyhibSDyGZ9mQbmQG/5xLjR7w=;
 b=PCGNs1BdmHTmagxi9rUqRCtRukKYV5kWdv9dKO5+s9s8vtaj3G1+EDq9HKL6mgPH5r
 U81B9f+3ywNmvSrNhnve7hP6wxHzWDMQ+FthCoZphO2srpcnemxdvGtCTpZaRA7alXq/
 n+XhOKGQdfpiW76OS5wrVyoRKw0ecD5GV3lb6ESjYBcs9d5VCVzTQVm9DzMlESWgKdev
 eTldG1p8ehWPeMF0C6g9H+ktIBQKkHAsvL5B20Lz7QzHUViyCwZ7WWS5DUPF3gN/SKDk
 aYoC76ItZkw6NJyEcstabRD61b2Xb/Spdgk7Wp2Ts72zh+hMfZrgvTLoU1pqojKlruEG
 9cNw==
X-Gm-Message-State: APjAAAVxP8QGQdkYslVq6uf21MVlwVPauc1Ume1g9UDjwo6YJ79xDJZD
 ATaXg2N6HOVMaqJA8E9yedtkkZNa
X-Google-Smtp-Source: APXvYqwr+E5DNdSuNsLB10muZ8xnRwaocoK3yP4/v0rZKT5ekVjfPSCa7/awdjpLPHhBGZMqVhPTfg==
X-Received: by 2002:ac2:44b3:: with SMTP id c19mr7612687lfm.132.1557525143296; 
 Fri, 10 May 2019 14:52:23 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl.
 [31.178.116.31])
 by smtp.googlemail.com with ESMTPSA id y186sm1991324lfa.14.2019.05.10.14.52.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 14:52:22 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Message-ID: <abb4a724-b561-9579-e821-b56ff00051c5@gmail.com>
Date: Fri, 10 May 2019 23:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: pl-PL
Subject: [alsa-devel] Fix for Lenovo B50-70 inverted internal microphone bug
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

I prepared patch for this bug:
https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1524215

I tested this patch on Linux 5.1.0 and it fixes problem on my Lenovo 
B50-70 laptop.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
