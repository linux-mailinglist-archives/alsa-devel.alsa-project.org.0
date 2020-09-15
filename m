Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B00269B5A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 03:43:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198E7168C;
	Tue, 15 Sep 2020 03:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198E7168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600134194;
	bh=7wbLw+2QaVa0blZR9W4jxKWDsRD7Yiqluh8ks6eHwb0=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ofToi36REO1JbvubbQyvIuRxpTYKX7ZnyODKb1LBwnHuTw4ojbs/k38r+LwWVVNk0
	 LAJozPltDVGk5KN0tbEQhU4Zv4XSjyCVjrlYlmQyZNYd37zAr7/hHCqB7dTLPMbHfC
	 EDjCJj9aVarlsytBE/qIacSXJ5imEb6qyjw75VhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09FF3F8025E;
	Tue, 15 Sep 2020 03:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6559F80212; Tue, 15 Sep 2020 03:41:30 +0200 (CEST)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39A76F80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 03:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A76F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Kq8lKLuY"
Received: by mail-wr1-x42e.google.com with SMTP id w5so1495010wrp.8
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 18:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=gZcUb3wY7rSgGBEWOPBR3fSf32+6cwmAqXyaXOY2pWc=;
 b=Kq8lKLuYVvLqboFmlROlsv9feFUvDw2cfWP872KqTMnFWgI6lEelRtin+xl53BsbEg
 wZd5Nd8oRY4gRMVRUXvMrSoZJd9HVUtqT4v4A8QOayQ+pDmiIIgPnro6iHWjyC0kiicr
 hNdl/9AnQYyQNLIcuAYhvIv3TSyDdM+8rGPNo4F0nQeajosOlhrLgpMnHA4mUg3++Gch
 ij/xCGB/YXJCKIgHarzORqvXotQpepMXLXYZWBzYZet+RKL45lhjP0rJencln9fGrXKY
 4HxRCgqH0aZ+MXfgy0XNBYmVHGlHl764w43TI7EuR1pgyEbkR1hKLaNptUHBdBdkgMC0
 MNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=gZcUb3wY7rSgGBEWOPBR3fSf32+6cwmAqXyaXOY2pWc=;
 b=mc5DFL/GjaJdNJ2GG943Uuil04MxlHi2QKuDQXEWTsuy2JWXP71Ucw4fxYG9aK2PFW
 F3esMJTGsGhbXc3Q8fYKbh5hYfcQjGVJpLSH8TyCljDmx+1T77SBFkJ6sBUYA/nsvbNJ
 Sph7sAv416fzSRISUIZ+/oTUJyP7LGeof7cmGNkcuOEVkIkKoxS65XUC5CLGhT3Q9p2X
 h3auuRq44cJibz13X8Zw7ZBec9NrYeuYCXsAuqLrBVipcRMdIQsQYeVd7xgSyJzeuOHR
 eYMOXY/VvxDAi3Yin6gIdFD+4YW0kvve1kIIOSD25TFZOoM3DErC7/jTrh74r2XtFZY9
 2IAw==
X-Gm-Message-State: AOAM5320yULe9kkwOYJ7UW5825tvs4AQEa4dW448Tb9IgP0F4ZA4duxf
 faDgdjVZLnLNxkYlCJ/QS4gBmOOBbuE=
X-Google-Smtp-Source: ABdhPJy4fAZqklM1YJwKx1hvlTnIPt0sLrS0bz/WRXngHZOLOmeoALOKtEvXUE6lg1wRa4TyWLoEEQ==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr20150175wrr.149.1600133486725; 
 Mon, 14 Sep 2020 18:31:26 -0700 (PDT)
Received: from ?IPv6:2a01:cb10:469:be00:2641:8cff:fe08:f9f3?
 ([2a01:cb10:469:be00:2641:8cff:fe08:f9f3])
 by smtp.gmail.com with ESMTPSA id e18sm27163840wra.36.2020.09.14.18.31.25
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Sep 2020 18:31:26 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Olivier SCHMITT <sc.olivier@gmail.com>
Subject: Possible bug for ubuntu 20.04 with CONFIG_SND_MAX_CARDS=256
Message-ID: <c9c7d62e-29eb-8dcc-063d-c8bc3651d7fd@gmail.com>
Date: Tue, 15 Sep 2020 03:31:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: fr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello dear all,

I have been compiling kernels for a long time with CONFIG_SND_MAX_CARDS 
= 256 and increasing the sample rate.
I switched to ubuntu 20.04 server lts.

Everything is working fine until I compile alsa-lib.

git clone git: //git.alsa-project.org/alsa-lib.git alsa-lib
./gitcompile --with-max-cards = 256

But after the make install, the plughw, dmix and dnsoop disappear.

Do you have an idea? I uploaded alsa-info on:

http://alsa-project.org/db/?f=8860b8bbb5abd5a84d3002717d68206db7da4a9c

Thanks in advance.
