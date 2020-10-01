Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AD27FD85
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 12:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B34101817;
	Thu,  1 Oct 2020 12:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B34101817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601548678;
	bh=ewFY7O6DbqdErsFVkxZ7UW2BHGUEWRBqZ/rbJc1c+qg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dm80IogDWZCBQmpC4Jc2TFZUVNu3gurEaeNW2pi1PFwC8Hn5EaPVdpi7JNGBnn0OZ
	 UPEl1sPZkpB7Q91CIPiSeUQXIKhlvd7RRAZCIM6C5OWq90N3ABg65Zd/JH2/ePVkN6
	 ngVuIduZodeb7U8HHLsh8Na2431+NeovrlY0Kr00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF776F800AB;
	Thu,  1 Oct 2020 12:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C80BF801F5; Thu,  1 Oct 2020 12:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33204F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 12:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33204F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LdxUUxgG"
Received: from localhost (unknown [122.167.37.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C181B20796;
 Thu,  1 Oct 2020 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601548562;
 bh=ewFY7O6DbqdErsFVkxZ7UW2BHGUEWRBqZ/rbJc1c+qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LdxUUxgGEYOvXW8zS8/4hUkJbMZBie2fIPUa5mEmHIxrLivocor+tdwIzp8qJeZVE
 Ihkow5DhEfH1IlJHwUEaKIYoAyFWGAYuetD2GEGxdA29RJOFYJaaSylVi5iBJHMwxa
 bTaKJh208W6rVXlWX1xf9FoXYfapbJK1+GyRP6V8=
Date: Thu, 1 Oct 2020 16:05:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
Message-ID: <20201001103558.GV2968@vkoul-mobl>
References: <CGME20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3@epcas2p4.samsung.com>
 <000c01d69585$228db6b0$67a92410$@samsung.com>
 <7ba714ce-8b33-1b64-7503-6b155bf43909@perex.cz>
 <eaa35431-01f4-f858-0673-cc3b4ddf1c5a@linux.intel.com>
 <000f01d69603$10573fb0$3105bf10$@samsung.com>
 <s5ho8lpkqdv.wl-tiwai@suse.de>
 <e0c15222-6604-6c59-0d29-575337f7b58b@perex.cz>
 <s5h7dsbip4i.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h7dsbip4i.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 kimty@samsung.com, tiwai@suse.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 s47.kang@samsung.com, hmseo@samsung.com, Gyeongtaek Lee <gt82.lee@samsung.com>,
 pilsun.jang@samsung.com, tkjung@samsung.com
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

On 30-09-20, 11:35, Takashi Iwai wrote:
> On Tue, 29 Sep 2020 19:27:17 +0200,
> Jaroslav Kysela wrote:
> > BTW: Offtopic - Why compress code returns EPERM if the state is not correct?
> > It's not about the permissions. The EBADFD is much better code in this case.

That would be me ;-)

> Indeed that sounds inconsistent, but I'm afraid it too late to change?
> Suppose some code already depending on the error code.  Who knows...

The probability of that seems lesser ;D ... There are no public upstream
users who would care about this. Only public use is QC dragon board and
we use tinyplay, which does not care.

Downstream Android HAL would care but chances of them looking at this
error code are less (i will check with Qualcomm HAL to see)...

Should we try fixing it?

-- 
~Vinod
