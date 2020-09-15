Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F5269CA8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 05:43:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6EBD168C;
	Tue, 15 Sep 2020 05:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6EBD168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600141380;
	bh=tAPCK5PX1HACPjvornfOs5ONot/3ZVuNZ54RfCEYuVE=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XGBNfF3v0oq/F3S0yM/XiP4L8bRGvySKaVMTJBa9d7Dj4k9/LdvFpwCse0Fky4Tvq
	 pHqtyBaM4UUshZb6f6qglW4yfC3MDPDlXDyT7Wb3isL+izqHpgiSUDZSeQUbPlwruL
	 NoVRaZbOOx9PnzOdQ4vzArdtDPBcOHzjSR7ox34A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0C0BF80159;
	Tue, 15 Sep 2020 05:41:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A84DF80212; Tue, 15 Sep 2020 05:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 280ECF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 05:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280ECF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EPLnn+DQ"
Received: by mail-wr1-x42c.google.com with SMTP id e16so1718517wrm.2
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 20:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=b641USPeTYjEAt3bzuBXDxlF5HqIvB8KM0z7GHyWmUQ=;
 b=EPLnn+DQHggzg0Jghjrf52uwPGD6AHa+xGg0EqNst1UsBHoZuIURyEMQCqNXC2dPTF
 +bu72fsxMFwnbA3YNrmvpqpDABEI4I+Nvh3P+4thd0hf00J9Xe1vCCFdTltrHzjOtIqG
 E4CtUqhlmIUmgFkmGUtthKAicCautFBSftvsmisuEQI/ZzSPEV1LszxhJH7RtfQM0m6l
 oadcb75e02aLNwDVNu6vxjNDHNn6tU5eDKqXLHK2Qs0es6JEVeItkmLHbnOY2XD4rj3U
 mj3yDYfEZA8YY/2FyEw95Ldn35J1VR70TW90xVxYumzowCceIKcPZ3Hn7MP4+Iz+wdte
 /7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=b641USPeTYjEAt3bzuBXDxlF5HqIvB8KM0z7GHyWmUQ=;
 b=P9B1jEtTpmpJ/mZ6eZyA91Y/tJTHqUq92ZuS6fncCYisEvd2JFCRST6HIdGftU8CP9
 29m63DyKv2hrOFy/LnuHy2T4I1566miDhb8RxcZdwgHiDBH1yJkOH52QibqZ36+43ZXd
 JLds6mWVjBY12vM53VIPLpEp0BbI9V156OfSPBO1ePU6dHkc2RsuOiRIUbC1rGWquOqV
 5OV/NeqsU8OLeD9niER4Zf24cRwQGm2bjfsk3AghtQFpozwDeuBF8AiBvQ8xGJpsq4N+
 NqbOir87Yb4uBuJepqKyEvWA4/CP/5uGk//aTJQLeM1anPykA+ZD4Q4E/i471aDayfpu
 DlEA==
X-Gm-Message-State: AOAM532AhANK8K3DgD2s9o9CbOE8MlMQIGQKWGjDxfBFr4WD3qxk/U7V
 CYQA4fxR1kOcALViR8xxwsGABHaNjxv76tPdqW8eH9LzPQ==
X-Google-Smtp-Source: ABdhPJwMgI5LQWnLy4F7asHww0WR4dAB/jUwx71QtMCtQRztrnxqAldZaLHW5yp8kvbUdLBMbg1lB6Qrog8sor7s6rk=
X-Received: by 2002:a5d:684b:: with SMTP id o11mr19836015wrw.101.1600141268203; 
 Mon, 14 Sep 2020 20:41:08 -0700 (PDT)
MIME-Version: 1.0
From: Go Peppy <peppy.player@gmail.com>
Date: Mon, 14 Sep 2020 20:40:56 -0700
Message-ID: <CAANJKekdzYeO7vp9o30a4yiB0M8mqjpuf2ZOPem4d8Ma_V8bjA@mail.gmail.com>
Subject: pcm_meter.c issue at s16_update
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi,

It would be great to have a fix/patch from Pavel in the main codebase. I've
tested his fix and it worked fine.

Just to remind what the issue is - while switching from one web radio
station to another there is a high CPU usage for about 20 seconds. Because
of that high CPU consumption almost all other processes are blocked. The
fix from Pavel helps to avoid this situation.

Without the ALSA patch I need to make a custom ALSA build every time I
release my software. This is very annoying.

Thanks in advance!
