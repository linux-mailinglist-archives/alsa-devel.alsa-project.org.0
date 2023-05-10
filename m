Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E176FE096
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 16:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06101042;
	Wed, 10 May 2023 16:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06101042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683729673;
	bh=TjKlhOtDBWY6sVSqTa1AaoJ81i3ojA2DvjPkKpAO41c=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GZaj7UKhU1+17PG4nl96AJKhEWCuqtV/ofCzNgXawymNHcFd9e2Tv9Rub+OhakkXI
	 VituuFRT3JIfSsVOzBr52sL6pNeLkYC7iXiQalcbu2Kv26X4B8wNfkgwqiiaA4McMw
	 NJkBMmW/DO6gazfBQYJkpnU8O5w6kPuF6ZjOwjkQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F06D2F80310;
	Wed, 10 May 2023 16:40:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98404F8032D; Wed, 10 May 2023 16:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75917F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 16:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75917F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ERlwxIN0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1A44649B8;
	Wed, 10 May 2023 14:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90D3C43443;
	Wed, 10 May 2023 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683729604;
	bh=TjKlhOtDBWY6sVSqTa1AaoJ81i3ojA2DvjPkKpAO41c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERlwxIN00t6/qzz559l67HTA8LJkeDZi3xxEfyPEXUWbRGMqZgmznIPUkuBuntLPV
	 e1p0sE2gUk0AsrvC3MWLaSqRrcNHw/QU4woMV+onoaIIlC1fHets7J0j4baEa8AFmD
	 wDf6sV+YW/pTWpZQIPl3609uG38qONAq+gE7QKOQ=
Date: Wed, 10 May 2023 23:39:57 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Yixuan Jiang <yixuanjiang@google.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Fix and cleanup DPCM locking
Message-ID: <2023051045-ransack-lullaby-a127@gregkh>
References: <20230504092142.4190069-1-yixuanjiang@google.com>
 <2023050644-dwarf-shabby-d44d@gregkh>
 <CAGJzVQGxDHa83uV0w4Q35UaGpwNhLpKzcZ5y_qsfd4ELDi+OnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAGJzVQGxDHa83uV0w4Q35UaGpwNhLpKzcZ5y_qsfd4ELDi+OnA@mail.gmail.com>
Message-ID-Hash: 53E7C5Z3VGCKPVZIEGAKMSWUET2UJDA2
X-Message-ID-Hash: 53E7C5Z3VGCKPVZIEGAKMSWUET2UJDA2
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53E7C5Z3VGCKPVZIEGAKMSWUET2UJDA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 07:59:49PM +0800, Yixuan Jiang wrote:
> Greg KH <greg@kroah.com> 於 2023年5月6日 週六 下午1:56寫道：
> >
> > On Thu, May 04, 2023 at 05:21:42PM +0800, yixuanjiang wrote:
> > > From: Takashi Iwai <tiwai@suse.de>
> > >
> > > The existing locking for DPCM has several issues
> > > a) a confusing mix of card->mutex and card->pcm_mutex.
> > > b) a dpcm_lock spinlock added inconsistently and on paths that could
> > > be recursively taken. The use of irqsave/irqrestore was also overkill.
> > >
> > > The suggested model is:
> > >
> > > 1) The pcm_mutex is the top-most protection of BE links in the FE. The
> > > pcm_mutex is applied always on either the top PCM callbacks or the
> > > external call from DAPM, not taken in the internal functions.
> > >
> > > 2) the FE stream lock is taken in higher levels before invoking
> > > dpcm_be_dai_trigger()
> > >
> > > 3) when adding and deleting a BE, both the pcm_mutex and FE stream
> > > lock are taken.
> > >
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > [clarification of commit message by plbossart]
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > > Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > > Link: https://lore.kernel.org/r/20211207173745.15850-4-pierre-louis.bossart@linux.intel.com
> > > Cc: stable@vger.kernel.org # 5.15.x
> > > Signed-off-by: Mark Brown <broonie@kernel.org>
> > > ---
> >
> > What is the git commit id of this patch in Linus's tree?
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> For this patch I think it is [3/6] b7898396f4bbe160f546d0c5e9fa17cca9a7d153
> 
> >From https://lore.kernel.org/all/163953384515.1515253.13641477106348913835.b4-ty@kernel.org/
> Seems there are total 6 patches.
> 
> [1/6] ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure
>       commit: d8a9c6e1f6766a16cf02b4e99a629f3c5512c183
> [2/6] ASoC: soc-pcm: align BE 'atomicity' with that of the FE
>       commit: bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303
> [3/6] ASoC: soc-pcm: Fix and cleanup DPCM locking
>       commit: b7898396f4bbe160f546d0c5e9fa17cca9a7d153
> [4/6] ASoC: soc-pcm: serialize BE triggers
>       commit: b2ae80663008a7662febe7d13f14ea1b2eb0cd51
> [5/6] ASoC: soc-pcm: test refcount before triggering
>       commit: 848aedfdc6ba25ad5652797db9266007773e44dd
> [6/6] ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE
>       commit: 3aa1e96a2b95e2ece198f8dd01e96818971b84df
> 
> These 6 patches could directly cherry-pick to in 5.15 without conflict.

Then please submit them for stable inclusion after you have tested that
they all work properly.  But first, what bug is actually needed to be
fixed here?  What is not working that this patch series fixes?

thanks,

greg k-h
