Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488A302A75
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 19:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69AC17D8;
	Mon, 25 Jan 2021 19:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69AC17D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611600022;
	bh=LT5dNfsAGK05Cx2jR5glR8xY9qRpTzeAZ6wbFXJtb24=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miUajdfHPOtzKMIRtWKZO54DtiGWsk3lwcT9SuBdx3saW0Uw+XufkAlX7F+Q/aCsK
	 +jZ5rS57vo5qJdlBtbRW2fRRL1M6Ks8rGCUmRWGWAmnyoVbdKJWxJNoD+dZE1bvDfA
	 CmltQnyBhRAZTK96nWMG41R0/Iog9v7N3RpujAHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1DCF8025F;
	Mon, 25 Jan 2021 19:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FF1F80259; Mon, 25 Jan 2021 19:38:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D39BF8012D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 19:38:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D39BF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V4PO+ChC"
Received: by mail-ed1-x536.google.com with SMTP id dj23so16687211edb.13
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dcK6x8/xylIn/6sMBxgIE4nEmQQwcKCRnSaqPeAZV6Y=;
 b=V4PO+ChCop+DUjlE39lf8SRRV092WMf5qzSQX2R7UgeoDE99NBpw0iADEHhIiUBbUR
 hsCq+ctGsKS0ghVcjjo8yJyz8HiHpeFAgE3BAJpZjR6R+YcqHz18srvEpdqxa35T8i7B
 2hJb7pB1/oE0G0jb040zF0fQNXeWMDZnlABdNxCnnjeo4eKtDAUoIUaR4lKGHAwIMEkB
 CbEMeXSSHg+D+1IDtDhr7hek9khDF9OdJ2mKDYstNjRZQ6W1b3BP4VoUig4Mkrcb5b5m
 +fTvt5gfO3L60n6f1rkFYqm/9fNUob6lm1i+vXjM9gw46PNfWG6/O70jqBqQdKLdl1q3
 IT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=dcK6x8/xylIn/6sMBxgIE4nEmQQwcKCRnSaqPeAZV6Y=;
 b=L1LyAPywDMMGTqfL2cRtoJl7HXDSJki1Egjb24GSDobrjkifz/wSispTYqmyLj+x7N
 RNzFPSfT9i57SAGo3BscyrGL27Uf4NjzZ8yNpvotrggKhd36AJE+ZBAb4FrZJAB744pN
 YpKFeOcAoPMAzA31UmGQzrWzrpBg+02hpUfv+OVTSvxTo5DPZSoe9wgrYjxJNU8uzlWa
 LoHs+fVCc49nZ0Ho0731Nrp4+yM4EvWfioDZAYBAEeEZ6XLtOuiadUoRBCS/rKJRk6uu
 1QnaNFPvYR9MiQl/3AgwzR9mJ/hgCIr9paxjKhcEPGY8+rAY9d+4jUHKzSwKVH+gnmF1
 JhgQ==
X-Gm-Message-State: AOAM533mIWHF5ehf6oAmvHLHSAGK0EujuRf/JV0bPybFJtv7hFyzqHg1
 nLQoDyupV5Yp+HJV1hKNtbY=
X-Google-Smtp-Source: ABdhPJyG2PmQiYa0+nA52Lnq12fuh+2M0Mq2EMEuMQf63aO4B1XMZLZUSurnBCqiE1ID8ieWa479/A==
X-Received: by 2002:aa7:cd07:: with SMTP id b7mr1594290edw.29.1611599925261;
 Mon, 25 Jan 2021 10:38:45 -0800 (PST)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id ko23sm8850110ejc.35.2021.01.25.10.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:38:44 -0800 (PST)
Date: Mon, 25 Jan 2021 19:38:43 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
Message-ID: <YA8QM98xrHyefa7g@eldamar.lan>
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@gmail.com>,
 Kubo Hiroshi <hkubo@jiubao.jp>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

As an additional datapoint if this can help:

On Wed, Jan 20, 2021 at 04:28:23PM -0600, Pierre-Louis Bossart wrote:
> 
> 
> 
> > > Linux 5.10 fails to boot on my IceLake laptop, where 5.9 worked fine.
> > > I'm not sure whether it's a bug in ACPI or Soundwire subsystem, so I'm
> > > sending this to both
> > > lists. The W taint flag is because of an unrelated nouveau failure (It
> > > was busted on 5.9, and is
> > > still on 5.10). Full kernel log down below.
> > > It's from a distro kernel, but I can build my own kernel with patches if needed.
> > 
> > Please try to add a check for handle against NULL to
> > snd_intel_dsp_check_soundwire() after
> > 
> > handle = ACPI_HANDLE(&pci->dev);
> > 
> > and see if this makes any difference.
> > 
> > This should check handle against NULL anyway, even if it didn't crash later on.
> 
> Is there a way you can share the DSDT?
> 
> The only thing we do in that sdw_intel_acpi_scan() function is check for an
> _ADR and read two _DSD properties. I think it's been 2 years since we wrote
> it and never had an issue, never say never I guess...
> 
> If you want to bypass this problem for the time being, you can add a kernel
> option in /etc/modprobe.d/alsa-base.conf
> 
> options snd-intel-dspcfg dsp_driver=1
> 
> that will force the use of the HDaudio legacy driver and bypass the driver
> autodetection.

A user in Debian,  Kubo Hiroshi reported what seems to be the same
issue in https://bugs.debian.org/981003 .

Regards,
Salvatore
