Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB5286FA8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 09:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0172016B3;
	Thu,  8 Oct 2020 09:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0172016B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602142800;
	bh=7k08qwQfpMwLrbStV7qsIbcIjDaV+hjvgw+XZD6Qe5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMfACzP+ZrXpyZ5RpgmdfZ5sHROy/QvzO8I8QMgz1BQsiEWYkbvmc9zkCCHrk+pQC
	 V200gE1CPMhGHpzzpwRoja7OMs0SaZwh2+hgJGC+9BaJOOn4fauRBgEezIu17KQosH
	 pvWJ9c2OjH2pwqo2gxk9JKyugfcU6nTqyQmZ0eIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87CA1F80090;
	Thu,  8 Oct 2020 09:38:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDE39F80164; Thu,  8 Oct 2020 09:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E50F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 09:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E50F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="hO3HikQG"
Received: by mail-ed1-x544.google.com with SMTP id g4so4843398edk.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Oct 2020 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7k08qwQfpMwLrbStV7qsIbcIjDaV+hjvgw+XZD6Qe5c=;
 b=hO3HikQGtQ2Glry45pwdFfYKBL3G/BFeYiZ4ZrFTX1i26VTBTwDrvp7Z7eeSOCWfUN
 RLFGiHATP63YeXTRMVeAq/Wdj1owvOmlpmZDzqimdcNvNofGf+f/bAKMGhe7PZJUMq5z
 CG9VlV8pMYis1juIxkqxfapI+2ipJX2+X1TNs6JsE5qZnb47VeZOtIdNDWJc2gajT3Jo
 iqAUN6TaPJ1PLwBudZmOOU1WqrMOaKADTs7ZIXTR58wE6fknEI4bZIfXVEBls70ROb1k
 OYI/izeoLMIh6L5LoFwnzU9RXrG7xs1CIJwkbnunL5HH2qvZ5bMTb2s4JmNPVlXKBrII
 IztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7k08qwQfpMwLrbStV7qsIbcIjDaV+hjvgw+XZD6Qe5c=;
 b=Ft1g+Na3cdxddH8yIK4L3545E5UZkhV6oULaBuvTt+Zm6OE9IGdxZ0BbuyXjS6F2et
 A/AIcD36FCjK7vAs+/4nnEuLcjiJt0yU69Pe1qvlCMz2Fz/BcGsI4l4ZL1kBZ858SAmX
 MAGRVBVTRE/XL5UQFqdVznEJMZLVpAqRTS67NGmgj30kaR53oNrmc8ky0ryNzSaqgBJz
 BOfzLeS2ZlQL0xJXXbCB6AIWeIQHddMH8zu5dYzMn97ENUGbwgurpKHCxxhlBnr1OwIL
 +0T7SOPvvqj7M77aPheyTJFFzfWJ0OzCrzOlgGRYoM0cWoCj7x6Hvc52pk9gPLlDsJ/8
 URMA==
X-Gm-Message-State: AOAM5322biWpsWLMyRrwa1QLF80G2rpogHfylogcbjpFa4T1iZmHHCRI
 sgWD80GbBK16Lb6WDbhCOKovZA3E860H4XbeNELnWg==
X-Google-Smtp-Source: ABdhPJwo4QUttfuSvz/gaCdR7TaB0KqZkh/iGI19y/GuT1erD6lrNXGl7aYlQ9066o9yHo6Bp3GCOo2Ucv40oJu/kYc=
X-Received: by 2002:a05:6402:31b3:: with SMTP id
 dj19mr7828444edb.210.1602142691429; 
 Thu, 08 Oct 2020 00:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
 <DM6PR11MB2841C531FC27DB41E078C52BDD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201007192610.GD3964015@unreal>
 <BY5PR12MB43221A308CE750FACEB0A806DC0A0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <DM6PR11MB28415A8E53B5FFC276D5A2C4DD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201008052137.GA13580@unreal>
 <CAPcyv4gz=mMTfLO4mAa34MEEXgg77o1AWrT6aguLYODAWxbQDQ@mail.gmail.com>
 <20201008070032.GG13580@unreal>
In-Reply-To: <20201008070032.GG13580@unreal>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 8 Oct 2020 00:38:00 -0700
Message-ID: <CAPcyv4jUbNaR6zoHdSNf1Rsq7MUp2RvdUtDGrmi5Be6hK_oybg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Parav Pandit <parav@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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

On Thu, Oct 8, 2020 at 12:01 AM Leon Romanovsky <leon@kernel.org> wrote:
[..]
> All stated above is my opinion, it can be different from yours.

Yes, but we need to converge to move this forward. Jason was involved
in the current organization for registration, Greg was angling for
this to be core functionality. I have use cases outside of RDMA and
netdev. Parav was ok with the current organization. The SOF folks
already have a proposed incorporation of it. The argument I am hearing
is that "this registration api seems hard for driver writers" when we
have several driver writers who have already taken a look and can make
it work. If you want to follow on with a simpler wrappers for your use
case, great, but I do not yet see anyone concurring with your opinion
that the current organization is irretrievably broken or too obscure
to use.
