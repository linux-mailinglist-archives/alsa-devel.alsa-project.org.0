Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB15B16C2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 10:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB44816D3;
	Thu,  8 Sep 2022 10:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB44816D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662625224;
	bh=h5l/nprtgFXGVaKbNTvnUxqyg7OY74VLzs+PUTp1Kuw=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fpI1R4zwujDKHg5nzFSJl7cIQTZip2mXIPCZfAcOrlwAhaJST8jx3Bgt/y1spZzvR
	 NqQAqXHjb1xe1+n3hY2k5Oy+XxCMI5uURDryBDLGm3yBkoIawYFHPcg5pWqRQ6+P+r
	 kapE7mrQ2Ut/yW/Xe+7HBWLeC9ffzHCG1Oai1/yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E4EF80538;
	Thu,  8 Sep 2022 10:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 474C7F800CB; Thu,  8 Sep 2022 07:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE343F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 07:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE343F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DhOgrxMj"
Received: by mail-pl1-x635.google.com with SMTP id c2so16741475plo.3
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=h5l/nprtgFXGVaKbNTvnUxqyg7OY74VLzs+PUTp1Kuw=;
 b=DhOgrxMji6dH9G+owweSXgJH3Mr0p5c56nTMqB6jUSw1kcwkEehEFBrxnUeruFgg6i
 HGcMsXvFPrZ3UbGjIGtaI673ui3b3WxdYotdtUrnEY5087uyIu1lGu9zI8hN7dqeU0Ko
 A7lq9kGbY0HrXWtCY5sTYUu/y3d5eq3DZeIcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=h5l/nprtgFXGVaKbNTvnUxqyg7OY74VLzs+PUTp1Kuw=;
 b=UBNrIaRH16QNZZ1yeiXYMApudei6VckokLe6bew9uUPq8dTtd3rotOBOuFozG3wDRf
 FNqerwsEjnVCZ7paKaR6J2ntzAJwIAJQn12/1Yc8fR9oSzw0am8D6xhtEkJl4bVN/tLI
 iJUV0/oWOnJGDTLItYyQ/eG43oT4Z1wy7AXUPbKcY4ctLEJBXawVQuxIpLuYEolAgkuL
 hw0trRKQLdGaqZImTa66baYmaF0+ricbweXU5vCne8zItKccscu2wlpdJq6uZcNUjrbJ
 sCxFX+MZj1v6fdxt422on0/95oNKOomgxigkAAPU5Amy+k1JJEWzMiXDrvE2LWXxdwQp
 UtIg==
X-Gm-Message-State: ACgBeo0btpfQKrzj1vcG6CZcqahGcic4mLxBz227W8BEgbW3bwf5qd1T
 YsRSicIVtUHfB7/AmzOhA0KlPRhO/mmbyEASH/g0sQ==
X-Google-Smtp-Source: AA6agR5q4Lf+dcmzxc8mer0FU6ETLZx47c/et/urn4hUYTR5e6HtQLYhZ4oZmtwClWmM62AlyhYr3+IInGqiF4WfYKY=
X-Received: by 2002:a17:90a:c782:b0:1f7:a6cf:2f41 with SMTP id
 gn2-20020a17090ac78200b001f7a6cf2f41mr2324742pjb.128.1662614772519; Wed, 07
 Sep 2022 22:26:12 -0700 (PDT)
MIME-Version: 1.0
From: YJ Lee <yunjunlee@chromium.org>
Date: Thu, 8 Sep 2022 13:26:02 +0800
Message-ID: <CAPm_npY3SkumWgy8EN65no2iQFj2KWG6pysUchEKHBBPZ9AHsA@mail.gmail.com>
Subject: About ALSA dummy module: support customized mixer volume leveling
To: tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 08 Sep 2022 10:18:26 +0200
Cc: alsa-devel@alsa-project.org, Ching Yun Chang <whalechang@google.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

Hello Takashi (and the alsa community),

This is YJ Lee from chromium.org.

I'm thinking about extending the ALSA dummy module to support
customized volume leveling. It will be very useful to test devices
with different volume granularity. Currently this module is using
hard-coded mixer volume leveling, from min=-50 to max=100.

See L716: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/sound/drivers/dummy.c?h=queue/5.19#n716

My plan (A) is to expose 2 more additional module parameters and
replace a few occurrences, from L742-750.

Another plan (B) is to leverage the current existing module
parameter:model, and make the dummy-module to be able to accept models
with customized volume leveling. New dummy models can be provided as
configuration files, and be used in the same way as how currently
existing dummy models (L146-213) are used. However, it's a bit
over-engineering from the original purpose.

What do you think about these plans? Any insight you (and the alsa
community) can provide will be greatly appreciated.

Best,
YJ
