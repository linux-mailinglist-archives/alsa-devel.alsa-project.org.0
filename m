Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327830CF38
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 23:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF091731;
	Tue,  2 Feb 2021 23:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF091731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612305805;
	bh=lSb1uwzTZJXs1RkgvVBa8Wju3zbDnYhWA5Y4hFLBaw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P64oqGrQux6OW95QoaJ1rZRScoaviMzSzYoESH96WmaK9pG0aqqt3wzGlepc0jgOQ
	 fu2CzsTM8LhP3JSgQRpSKwnU9PeLcKL9GiQWYtSGPcjGmqIRihMERHYrctlF6ABung
	 pyY9Q46ejdArnfdW6rO646Le2RuWjBgbrDYSM1Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02E74F800E1;
	Tue,  2 Feb 2021 23:41:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2367EF80171; Tue,  2 Feb 2021 23:41:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122CCF800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 23:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122CCF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="AuqYfzQs"
Received: by mail-yb1-xb35.google.com with SMTP id r2so4522051ybk.11
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 14:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lSb1uwzTZJXs1RkgvVBa8Wju3zbDnYhWA5Y4hFLBaw4=;
 b=AuqYfzQsbNX60/pt2IeFGN5BiTVwfZOPQ54n1IdyPa9OeC8wAGsglpKSvkd2nANl8R
 FPCzGEGuK4OOkZ/SHZwP1RwcGj4hprUBiZP3VIKKVRofpYO5/z2zYYzpZRrjJNZessvV
 mMOgvhBGXww0wkX7z8AJo0ie6b/iH8Dhvb2nO8U9kg6bIgDLVhFR8F9D+/MkdPt9gygu
 oXOHWb393K41g40fMHq0wtsadViN4bGUBwkp5B2yCanw1lM8sKXqtMJIsgVpqp7Y+I6H
 aGfDCr0Zysd71kBrLSpqdiKYQ2OAcIL/45vVI/NDZXfNwbXGygZvbWQZH/N1JU3iSaWH
 xmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lSb1uwzTZJXs1RkgvVBa8Wju3zbDnYhWA5Y4hFLBaw4=;
 b=adA6Xchp4sQSnmRKCi7gJF16WUFHdqtJDlCnKgrd+rxet35NY6nAq8gnb6c34wV/6f
 wKLlGLcV4jL/6ZnqDHSuoXzUIQ0OBpZKPCsdUo/NRa1cRkS8hUZP0pnXeP4lgl+W1OUV
 ygxV+Akh6r4BUIUF0IRl6ZE+XNputjexWfkp0uc+xDrgTM3vCDmKCMWjZgDccjwQ2wKF
 wmRzVRDjRnmKdCt/IBdiCjhcohQ2FVQcYYuL7FkH2DxfZ3GAeCG15fyveIJB720gWnNP
 7yCCY4ip4v5rZrQiXqR6fZpWatABdeUXkYvTsIhkfhZJitkOysawTVeY8f9mvNwNTUAH
 +YBA==
X-Gm-Message-State: AOAM531ye56VX2RdKWjt2QIFLZuG/P11M/CJJwaWOefsc9jrUoEKNkX8
 nXMPmx7IrPCNV51UJ8oHMQm2glVFu/92fOFKFfB1Tw==
X-Google-Smtp-Source: ABdhPJw61FX3Y7AvBBmYyxCog2lk3h8rO2i35a2DBEqIPCG9v/37HFgCPKZO0NF3BjO5/0n9g6+96OmkpdqQBIOXLXU=
X-Received: by 2002:a25:6190:: with SMTP id v138mr267315ybb.36.1612305700503; 
 Tue, 02 Feb 2021 14:41:40 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
 <9b19b22c-b096-2ba9-8323-5d3fd9a9ef49@ivitera.com>
 <CALd3UbQjJL194sJMy0nrjx6J7RZ3L44hm4OH4dffhpmSNNBaGA@mail.gmail.com>
 <4321a2f2-28e4-32a2-c590-90eeaec35682@ivitera.com>
In-Reply-To: <4321a2f2-28e4-32a2-c590-90eeaec35682@ivitera.com>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Tue, 2 Feb 2021 14:41:29 -0800
Message-ID: <CALd3UbQeRKU_cdkAfC_JN++qjfDoBtWQ8+T_4mgp0Z3L7C=2bg@mail.gmail.com>
Subject: Re: question about ALSA devices not showing up in buildroot build
To: Pavel Hofman <pavel.hofman@ivitera.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

Hi Pavel

> Sometimes strace has been of help to me, to see which file is being
> tried to open:
> strace aplay -L 2>&1 | grep 'open('

you can see the output before grepping here - https://pastebin.com/Nh3v6P4c

Thanks
Bert
