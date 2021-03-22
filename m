Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0661344638
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 14:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8840615F2;
	Mon, 22 Mar 2021 14:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8840615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616421147;
	bh=2f8XiVT200pXbKBDxtVVwami6L+1a4CjX/RcGCGLVWI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n25/vKbyPVFa6MQzLZcEMr2AiFXUCT01VFXh7OBqDJ/fOpjrB20n8jFkccq/mo4CN
	 X8gsYQNiM//P+fO412n5nTadL7XwfpZa6SIDmDzU0WKABioS1tYhRr7ucErQZPEWdv
	 AJ32tqn/XZVL1fvQUCjYB01ArylodD0PGyzIfWbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3D8F801D5;
	Mon, 22 Mar 2021 14:51:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A949CF80107; Mon, 22 Mar 2021 14:51:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51DC2F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 14:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51DC2F80107
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4F3wf75TNnz682gS;
 Mon, 22 Mar 2021 21:42:07 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 14:50:48 +0100
Received: from localhost (10.47.84.0) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Mar
 2021 13:50:47 +0000
Date: Mon, 22 Mar 2021 13:49:29 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: include/linux/unaligned/be_byteshift.h:46:19: error:
 redefinition of 'get_unaligned_be32'
Message-ID: <20210322134929.0000498b@Huawei.com>
In-Reply-To: <CACRpkda5ofCs=nkpZXVyekw2LoeYZUNrFTu1iGPt47ZSMa-6eg@mail.gmail.com>
References: <202103191536.9cD1TuQQ-lkp@intel.com>
 <CAHp75Vchoe2Z00ODh_AWos3Chfa1AoQMjZw7aD=5cGsTFtK7hQ@mail.gmail.com>
 <CACRpkda5ofCs=nkpZXVyekw2LoeYZUNrFTu1iGPt47ZSMa-6eg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.84.0]
X-ClientProxiedBy: lhreml711-chm.china.huawei.com (10.201.108.62) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 22 Mar 2021 14:33:46 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Mar 19, 2021 at 10:57 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Mar 19, 2021 at 9:05 AM kernel test robot <lkp@intel.com> wrote:  
> > >
> > > Hi Linus,
> > >
> > > FYI, the error/warning still remains.  
> (...)
> > >    In file included from include/linux/build_bug.h:5,
> > >                     from include/linux/bitfield.h:10,
> > >                     from drivers/iio/magnetometer/yamaha-yas530.c:22:  
> >
> > Isn't it fixed already somewhere?  
> 
> It is, I think Jonathan already applied the fix, it is just waiting to
> percolate up
> to Greg and then to Torvals:
> https://lore.kernel.org/linux-iio/20210221154511.75b3d8a6@archlinux/

I'm being slow.  Can apply it now as previous set of fixes have gone in.
I'll pick it up when I'm the right machine.

Jonathan

> 
> >> Kconfig warnings: (for reference only)
> >>    WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
> >>    Depends on SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && HAS_DMA
> >>    Selected by
> >>    - SND_ATMEL_SOC_SSC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC
> >>    - SND_ATMEL_SOC_SSC_PDC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && ATMEL_SSC  
> >
> > This one though is interesting.  
> 
> This looks like nothing to me :/
> As confused as ever about Kconfig.
> 
> Yours,
> Linus Walleij

