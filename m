Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35182A8810
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 21:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C085167D;
	Thu,  5 Nov 2020 21:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C085167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604608005;
	bh=30J0yyrxhj1c79k0uKAluOEChqSflhm+VkGb/o0MoEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XT7gVyHVAzjvoOHtrACd4rzDLStZdpN3H7e8MxINmu0kpgX8tF2frOmX3eKzoTtWZ
	 Zb6sy2wvWrR+E/oj7rdmClfgCA8BGZNdiKFqPIyuX4JA71lAuTYOwa89xx/bEgz1fC
	 NTYC/g8OigtTGnNuLbwayz9pTsxDl5ueuW34pftU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7046F800EC;
	Thu,  5 Nov 2020 21:25:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C9FAF80171; Thu,  5 Nov 2020 21:25:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 838CEF80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 21:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 838CEF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="nrTaXxU+"
Received: by mail-ej1-x644.google.com with SMTP id i19so4511206ejx.9
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 12:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTjGrprXf/p+7VyJhV9oMQ+mFbRhaf2fd3YnoA+5GTw=;
 b=nrTaXxU+KLiCkwx2prOFqV6fVNRvkt5LEXE3aJxYrnO2FaLmSlKykM2nD1VEHY+PCQ
 QZGQ264x0qIXVF81JCYUR+VVO7S8yrUTIZzsIQP1XjKW7ZnbKrcSIDGcekNi0/QN+Wi1
 umCtdtcvNp7N7oKFBY7ovM8/6KuFP19oZZtIMdtEHAe9gkMfdf0zXP/XG7XkmqyqyEET
 yiPVGpmDHkMUkkcO4CfP7ptPpIEZSxzVMeJfkVuZN3qdNRIA2J+44ZmjcynfBkYklljK
 z/bGMUhRsrYu1+Lh5B90G9zhw5bF2ZMr3Oms5WH5RZF9Ntp3/4NthuRrpgwbmj7n8Ufd
 f4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTjGrprXf/p+7VyJhV9oMQ+mFbRhaf2fd3YnoA+5GTw=;
 b=dymmpHcdZ3rKeO6PZou5cYmxAI6IpTxJRieg4RU5x72yYchcGc3pb1sZnBUHh/u060
 8Ro0Gt9hRJfEEHtC9TbdyVcITbsR7JyetbWCtcwJWKMqQICbtJA7MKPZqtKWTAM2PxxI
 hpHTbnXEYRdLlEajc2TZYAgee1P5bZzLRA9mWAGPdBcpoM+lXbmO/HrQewoqkyrT7L5V
 bhHgottm8VvlYVamcH/kj/2BedLwZrTlqqlZ3bqrI0L5cyY03Wy8oyCFeQtvFk9/SHnt
 Vs/Ms+kn5b+d8jExidwz4lDUr5w36LPpV5TqWoOFlrIW91DWa0AcObnQvfy1gMXAuWtW
 P6kw==
X-Gm-Message-State: AOAM530mypyo94E27JXZ/eA79oRqAieirgAQH4kBJ/6nBQ6ZI2mlMdDF
 y+ikV2sHVRAjMg16XZADDBWuEz1w672Nyp34+I05W+7I++rXqw==
X-Google-Smtp-Source: ABdhPJzI9LfCzCLX7f+iSxdraoDOaNdVltw0kDFCO6PfxopQK7HxBYytXTWKPFOHrLUr2ii9D/9tKushc/1x+YBdX90=
X-Received: by 2002:a17:906:4306:: with SMTP id
 j6mr4207795ejm.523.1604607902859; 
 Thu, 05 Nov 2020 12:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <20201105094719.GQ5429@unreal>
 <CAPcyv4hmBhkFjSA2Q_p=Ss40CLFs86N7FugJOpq=sZ-NigoSRw@mail.gmail.com>
 <20201105202214.GA1339091@kroah.com>
In-Reply-To: <20201105202214.GA1339091@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 5 Nov 2020 12:24:51 -0800
Message-ID: <CAPcyv4j0Xih_wd5R8KYmWv6ty-WKxVbV54HZqr81+UqSm96LzQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Parav Pandit <parav@mellanox.com>,
 Takashi Iwai <tiwai@suse.de>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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

On Thu, Nov 5, 2020 at 12:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 05, 2020 at 09:12:51AM -0800, Dan Williams wrote:
> > > >
> > > > Per above SPDX is v2 only, so...
> > >
> > > Isn't it default for the Linux kernel?
> >
> > SPDX eliminated the need to guess a default, and MODULE_LICENSE("GPL")
> > implies the "or later" language. The only default assumption is that
> > the license is GPL v2 compatible, those possibilities are myriad, but
> > v2-only is the first preference.
>
> No, MODULE_LICENSE("GPL") does not imply "or later" at all.  Please see
> include/linux/module.h, it means "GPL version 2".
>

Oh, I did, and stopped before getting to:

  "only/or later" distinction is completely irrelevant and does neither
 *replace the proper license identifiers in the corresponding source file

...sorry for the noise.
