Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5A2A8979
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 23:02:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585681686;
	Thu,  5 Nov 2020 23:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585681686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604613759;
	bh=kkrL6/jK3eJFpTLVXsZRPhI+a3UIbjZsmKJ9Y1LYQJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IRTijE/k/306ShC4MADU3ksCZPPkDLpCfXMCwwpTxSgXDmQivHVdWPnD6nTMOg52U
	 ip8V6LU2Ac32aGNgwKr5NnF16tuwu9pnlAPB45Qv7bs/SBNId9qVRviGtg/zJB4kMp
	 K64BnTvL2Lv6dBxnfcglm2zN6c+cO1xzJj/GFxac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 275F0F80245;
	Thu,  5 Nov 2020 23:01:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68790F80171; Thu,  5 Nov 2020 23:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C27FDF800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 23:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C27FDF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="l1zyt1jY"
Received: by mail-ej1-x643.google.com with SMTP id cw8so4854633ejb.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kkrL6/jK3eJFpTLVXsZRPhI+a3UIbjZsmKJ9Y1LYQJ0=;
 b=l1zyt1jYkTklLUA4dKaMEI57G5m3V/WrJO9UWEROVOt1ialjv5+aPaK+2azNEcKZm0
 vrcxfUIr6eZ8Kun/So75Mc20VmON8d5xdIS2rpzD+CsMBd2VqqhnemRqlDOnL66sjr1P
 Ecc5lreu6+8+82eLvbrs02WwGF4FFHLHcePgPZ8d4QfyEF9+q7bmSY/+90lZC5kIEp4O
 5u8S7sFHPozXs0wKAV3gQx9l3oe6/V92olWejfApaKFk3N1zIixtWQeU33iTAoGmromx
 XUW+nJIH2V3f6sE6BWIFVXi1z/N5WJiO7KgF5iUw/PsjqHrTRre+btTWTFt0ilKSzUBm
 fn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kkrL6/jK3eJFpTLVXsZRPhI+a3UIbjZsmKJ9Y1LYQJ0=;
 b=fEKgfcBuJlI2AG4E3JkTx19t9Qr1VE33K/AmwnxsMoQCVtkliv/pWhFc704wrij3wu
 yKcvk+9QePRgwiNbM9awCH9a/1GE9MsbNR509/W3gYpc9D36y+DMK97XCKtG6fe14y9A
 WpGFGGZFnd0mmkYVbZ6/0c6rerxSMaEwBS4NEYrwiqX1pyIWRWslp2IHWEkCY7oS0v6W
 EMNUgSMeQvtJ5MEQjcSRZJWSQHvzfbmnASEIzlscGZrEtDboV9Pbt86NNeJc1Se3jfri
 IXuUSd85JnsyrLpuVPSmLz+kD+KENKoh5fbBJYckbH6h4zVBcm26UUh6dELdQjf3WgeA
 byaA==
X-Gm-Message-State: AOAM532NSdQEUR5ShU4LLY6dy80SsAdgD/LH8XQMA/dXtBI0LXZJcAb8
 BciibbVL9f6wDvi/Jt/f3NZhxox9QdJz82SO7+dv5A==
X-Google-Smtp-Source: ABdhPJythImg+6Su9fzxeATyfrRJDwfwiTfRoJbZhE2LPNRyXKMolHFGhd5ZFcfi1TtxdV0OdBNkOfUeah9GASwsFOs=
X-Received: by 2002:a17:906:ad8e:: with SMTP id
 la14mr4221902ejb.264.1604613654118; 
 Thu, 05 Nov 2020 14:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 5 Nov 2020 14:00:00 -0800
Message-ID: <CAPcyv4hjCmaCEUhgchkJO7WaGQeTz8gtS2YgMtBAvoGBksvvSg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
To: "Ertman, David M" <david.m.ertman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Parav Pandit <parav@mellanox.com>, Takashi Iwai <tiwai@suse.de>,
 Netdev <netdev@vger.kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, "Saleem, Shiraz" <shiraz.saleem@intel.com>,
 David Miller <davem@davemloft.net>,
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

On Thu, Nov 5, 2020 at 11:28 AM Ertman, David M
<david.m.ertman@intel.com> wrote:
[..]
> > > Each auxiliary_device represents a part of its parent
> > > +functionality. The generic behavior can be extended and specialized as
> > needed
> > > +by encapsulating an auxiliary_device within other domain-specific
> > structures and
> > > +the use of .ops callbacks. Devices on the auxiliary bus do not share any
> > > +structures and the use of a communication channel with the parent is
> > > +domain-specific.
> >
> > Should there be any guidance here on when to use ops and when to just
> > export functions from parent driver to child. EXPORT_SYMBOL_NS() seems
> > a perfect fit for publishing shared routines between parent and child.
> >
>
> I would leave this up the driver writers to determine what is best for them.

I think there is a pathological case that can be avoided with a
statement like the following:

"Note that ops are intended as a way to augment instance behavior
within a class of auxiliary devices, it is not the mechanism for
exporting common infrastructure from the parent. Consider
EXPORT_SYMBOL_NS() to convey infrastructure from the parent module to
the auxiliary module(s)."

As for your other dispositions of the feedback, looks good to me.
