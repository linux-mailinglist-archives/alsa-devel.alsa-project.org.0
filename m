Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B064F8FE5
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353B318D8;
	Fri,  8 Apr 2022 09:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353B318D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404331;
	bh=8bnjGEDelTBxd1LfjgnPav4OKAAKFM7f8SWiLOrVPqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rqSyZtScCud9J6uaWuFG7If5OSkcXD7awcMefXCa6q8mt7rfC8QYFyps3aIBTirJo
	 7yvGgL9H6UMl/Ht0KmDw7W2UTlCl3XCvQMqQfTYrbkx/my3TH+MuD07TdkC5dSA73+
	 442KhS7p7p8kVh9C5IiirQPmW9fLuQY5O42pApL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4925EF80553;
	Fri,  8 Apr 2022 09:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA91F80161; Wed,  6 Apr 2022 13:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEAC7F800D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 13:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEAC7F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ck3vGGzD"
Received: by mail-pf1-x433.google.com with SMTP id x16so2171998pfa.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qyk8xTMjH/DJBXZpWSm5gtyrwHKcY5V7aOEPyHINN9g=;
 b=ck3vGGzD0sLUD0SfXv3dreaZ1Ek4bWn8ZNESDidGGpY3eEz6RL5o4wfc4LUNWWmi58
 GmfiX58B6ouw4Mb3vM83PjEpxT67WlJ3LYvpRCodMHsLS1kIYRZjz5k+R1HDVSykewob
 svjCgJF8KLM+YrBmaLHWjjfWspx0wBVyqdyyR+AA2ybE9TfZ3YakwfqNlThu2F4WuXSD
 EvKmFfHCFxrBHbnL+pgxNcBlbtLTdwTiPVo6eeFJmbGJnGNpY4qQIGUvS7kDwobXQr+Q
 bYM8ZW7ji5dpc6lpM04+0tKJZqtPcoO6vtNIXGvWhYuCf6BFY3Mk0V8UAAQU7G/1DWfl
 jIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qyk8xTMjH/DJBXZpWSm5gtyrwHKcY5V7aOEPyHINN9g=;
 b=HLfUoURXhhdKtT/oRDXPd80x6Eh4rjn5AGuecEupk71OYkSltgZ3L1NBP3Kecyp9Aw
 dNK+07KPx4PZzPJMgxS/do5O3lHgy7yciBsYPuYd0TQFIHNYfkgczaLgKjh+/+Qo5t2x
 GSxYfsYXKOzVX1d9RYxd4ZS2JulFpNloJi3mRTowTgXLJkAj3oqJ4bZOB0zBP7GD7L3y
 Q7D3FCBrEjse8flcNki5tHdGKPGmsiEtbipE5GUGSpqUghVIQu8nOM8U8bxeO5fZ0Q4h
 id0syNQibjit22j3jZXssDPgdyM9gJp/lnOAoaRXL7vyOctAdGZkVUvGcQAvAzcCpcBq
 sDmw==
X-Gm-Message-State: AOAM532hACpKaD+Cdw7Jxx3zjdN2S/8HfIY55ZaysOyTFdumklbUknq2
 arn4DCDbO08ROUiHpJe132Xx+UaZsfL8TveIEw==
X-Google-Smtp-Source: ABdhPJykyT9QZJZh5h36/jePZDuYOCk2rqWs/F/99ioWJhe8a3s1By+H10Z5SxwZHrOCLmPCHB72bj6AE04Kg/qpQYA=
X-Received: by 2002:a63:ce45:0:b0:399:1124:fbfe with SMTP id
 r5-20020a63ce45000000b003991124fbfemr6795871pgi.542.1649244315566; Wed, 06
 Apr 2022 04:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220405121038.4094051-1-zheyuma97@gmail.com>
 <20220406100121.GV38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220406100121.GV38351@ediswmail.ad.cirrus.com>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Wed, 6 Apr 2022 19:25:04 +0800
Message-ID: <CAMhUBj=RMT_jOkzsET2jx3Opihz6P+sNczZrNK+efkWr0SN2LQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8731: Disable the regulator when probing fails
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Hi Charles,

On Wed, Apr 6, 2022 at 6:01 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Tue, Apr 05, 2022 at 08:10:38PM +0800, Zheyu Ma wrote:
> > When the driver fails during probing, the driver should disable the
> > regulator, not just handle it in wm8731_hw_init().
> >
> > The following log reveals it:
> >
> > [   17.812483] WARNING: CPU: 1 PID: 364 at drivers/regulator/core.c:2257 _regulator_put+0x3ec/0x4e0
> > [   17.815958] RIP: 0010:_regulator_put+0x3ec/0x4e0
> > [   17.824467] Call Trace:
> > [   17.824774]  <TASK>
> > [   17.825040]  regulator_bulk_free+0x82/0xe0
> > [   17.825514]  devres_release_group+0x319/0x3d0
> > [   17.825882]  i2c_device_probe+0x766/0x940
> > [   17.829198]  i2c_register_driver+0xb5/0x130
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > ---
>
> Mark just merged a big chain overhauling a lot of this driver, at
> the very least this patch is going to require a rebase on top of
> that lot.

Thanks for your reminder, this bug has been fixed in the latest code.

Regards,
Zheyu Ma
