Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D8158E9
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147FB18C6;
	Tue,  7 May 2019 07:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147FB18C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206709;
	bh=eCBmUZBCaSFI22rNyXZ/1B9Nn0RrcUXdvasHD3S/ooQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQBQWyyAHnXA5ILkMfz4SOjT6+T240JX54eav0lsU5cvb0dcW9zFdchzsS2pvID3P
	 JHKRWsAaNtiCQEOhqrweDKcz5GHeM5WdRdxEoqxh5tImxfBeWAOiULeqFMUiw9cn71
	 O3L0H005zWPUQ6fjjK7L8csTuZMWgMXqbJuEdC10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6201F89736;
	Tue,  7 May 2019 07:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E82FF896F0; Tue,  7 May 2019 00:57:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1894DF80C07
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 00:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1894DF80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QoDVimnn"
Received: by mail-lj1-x241.google.com with SMTP id s7so7120125ljh.1
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/WaaNfj9uQg4GryTK10qiR1OxO5joqp6K8QA9QYZtME=;
 b=QoDVimnn8QHOXdN2QkfK6VzCJDeVnIwLrzgqElZtLPiU7cL/oyYMZH6s1M7qoUb4Iy
 XHdUlx6prmQytEtQ5Kvf4vij9oDEs2PgrVda4PhTWlz8tgsm71D73/5Tr3ccowET08Rh
 jYwwKrBm6uJTfoA8FFhN0LXX5shsZ5w7bAcSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WaaNfj9uQg4GryTK10qiR1OxO5joqp6K8QA9QYZtME=;
 b=t+6wqLx6iZ9f8BYkKAyv815SY3v/rbncnuMXWsfPsH9FRLim9iaGXsojNlR9xG+GM2
 qoyv0pjuhMrEtH9wcGzwgFLdu+Chie6zYETEtqm438YQ/cGSASeAowmnZAtHQ7QdWnGQ
 VCKEzt0hDIQ3v4lutkbKjzmKT64LK/MDRRdoyKRedhhMdY9XlskuGrUCwdXLg4p4EYRp
 5q2Bkwx8SFANCzibjXdhxvMGg4gnxh2I84r2sG7zPTvyVospur2moQWnlQSFQVhg2xrA
 mOhP0+9pP/cZt6aRMo/XRv2GvpTBlFwbC9gSgEdbZ0qX7aH1dnA96RqBIhzVXX9eaJ3l
 ppsw==
X-Gm-Message-State: APjAAAXM8EwSlYL6pnksXCKAaaNYq2QJGvBgi4g4VlGlGjFBhEjEdQ2s
 z6BJIzDNDDJrVZ0mcPpwnzaMqfDzqWM=
X-Google-Smtp-Source: APXvYqyRecHYe4WZdWzVEMTMEs5NsKWJy5ubXAVOSYEIjwHPIiZNuwYkz5GgWT48BB3XvNXX4LPzWA==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr677676ljj.59.1557183416823;
 Mon, 06 May 2019 15:56:56 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id d10sm1851164ljc.81.2019.05.06.15.56.55
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 15:56:56 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id v18so8143636lfi.1
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 15:56:55 -0700 (PDT)
X-Received: by 2002:a19:1dc3:: with SMTP id
 d186mr13761297lfd.101.1557183415092; 
 Mon, 06 May 2019 15:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190506225321.74100-1-evgreen@chromium.org>
In-Reply-To: <20190506225321.74100-1-evgreen@chromium.org>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 6 May 2019 15:56:18 -0700
X-Gmail-Original-Message-ID: <CAE=gft6HNYqm7Jvh4hwgCLEaRVZ+95AJdYEncRKsq_ZmBidiqg@mail.gmail.com>
Message-ID: <CAE=gft6HNYqm7Jvh4hwgCLEaRVZ+95AJdYEncRKsq_ZmBidiqg@mail.gmail.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:44 +0200
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jenny TC <jenny.tc@intel.com>
Subject: Re: [alsa-devel] [PATCH v1 0/2] ASoC: Intel: Add Cometlake PCI IDs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, May 6, 2019 at 3:53 PM Evan Green <evgreen@chromium.org> wrote:
>
>
> This small series adds PCI IDs for Cometlake platforms, for a
> dazzling audio experience.
>
>
> Evan Green (2):
>   ASoC: SOF: Add Comet Lake PCI ID
>   ASoC: Intel: Skylake: Add Cometlake PCI IDs
>
>  sound/soc/intel/Kconfig                |  9 +++++++++
>  sound/soc/intel/skylake/skl-messages.c |  8 ++++++++
>  sound/soc/intel/skylake/skl.c          |  5 +++++
>  sound/soc/sof/intel/Kconfig            | 16 ++++++++++++++++
>  sound/soc/sof/sof-pci-dev.c            |  4 ++++
>  5 files changed, 42 insertions(+)
>
> --
> 2.20.1
>

I should have mentioned that I based this off of linux-next next-20190506.
-Evan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
