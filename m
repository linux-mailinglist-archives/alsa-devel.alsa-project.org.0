Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81674184F37
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 20:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3561866;
	Fri, 13 Mar 2020 20:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3561866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584127285;
	bh=u/YdNrWdkp2l2Y+ZcshY5dnTxoc3Q36CBOYuokFz5v8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eonI566rd63Y7KRqMioMtXp3xIE9ungGurEuompTUxO4OFAokNmGmW9n4CEai0fvC
	 YEVTRxC48ez3raC+q159xQB1rQs5m632fggs0nhTNzJGZ1S33E+pQYqMB+zPT1EMOU
	 mEUWoxd/mn77L4Sq51a0judXKm+o0BiJvZcMPWx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E79DFF8013E;
	Fri, 13 Mar 2020 20:19:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 846B8F801EB; Fri, 13 Mar 2020 20:19:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99E45F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 20:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99E45F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u+Kw50Oj"
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B963020746
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584127172;
 bh=u/YdNrWdkp2l2Y+ZcshY5dnTxoc3Q36CBOYuokFz5v8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u+Kw50OjBbzrHYAElZpjew80DqhAXUFN1hhXU4vU2wOdVt9P/NVjtrQZvvT9p5Zxb
 veAw/oyz4V2n1HuuwuSFUsJ4mdNMKpwRfyRlEkUiBzo9sw5efnqpHqcGt/dxu3cF9o
 siomM+1AaZ7PYOoyNUKJrPfQx7TrpedbDUAn+hUw=
Received: by mail-qt1-f175.google.com with SMTP id d22so8566330qtn.0
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 12:19:32 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0nQyYKxwnK8wafqzwP02mQ4FuaPgTfbJG7RoErqZC7VaUb4kde
 kPUfVukwtv6DCXPE4XpuDoVRpULkJ9sTV2dGhg==
X-Google-Smtp-Source: ADFU+vtzFniWDb7ap1vMQkeG/nhau8hPIsmJMnWM+RrFZ7uXGaIVa3RBdSZj2jLCJWmfgdvozj/TJtkIM+Qo4xGK3lk=
X-Received: by 2002:ac8:554a:: with SMTP id o10mr14380809qtr.224.1584127171827; 
 Fri, 13 Mar 2020 12:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200313180543.20497-1-robh@kernel.org>
 <20200313185555.GM5528@sirena.org.uk>
In-Reply-To: <20200313185555.GM5528@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Mar 2020 14:19:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pihBa4NCYQJrVnNiRgJzx_Q7f5zDTExud0y0tPXwWNw@mail.gmail.com>
Message-ID: <CAL_Jsq+pihBa4NCYQJrVnNiRgJzx_Q7f5zDTExud0y0tPXwWNw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: google,cros-ec-codec: Fix dtc
 warnings in example
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Mar 13, 2020 at 1:55 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Mar 13, 2020 at 01:05:43PM -0500, Rob Herring wrote:
> > Extra dtc warnings (roughly what W=1 enables) are now enabled by default
> > when building the binding examples. These were fixed treewide in
> > 5.6-rc5, but the newly added google,cros-ec-codec schema adds some new
> > warnings:
>
> v1 got applied, could you send an incremental diff please?

Indeed, missed that. While I wish Gmail could just learn to thread
emails properly, it would help Gmail users a lot if you kept the
$subject on your applied emails.

I'll just worry about the node name again when and if we start checking that...

Rob
