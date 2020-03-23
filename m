Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7518F452
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:17:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465F51657;
	Mon, 23 Mar 2020 13:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465F51657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584965877;
	bh=jCOWRh42vHKRmuLejlk3NOJX2vnfeEJTZUiki6Qd37I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpnFZgeL+4JOpdIiANOWW/XEHRDAocWfyCSyvxcFnzPAC+EpMd1UFQ2E8pHyiRP+T
	 Pqld5+CoHRJOinTjkNscSMP05JXJlr+6Ccl6jheGnhBciPosMaAhNVNkhc/3jrfXDK
	 zVm51Se5XXEYA6gKoAme1G6VuajyZxhFkJvUjOSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE7DF8015A;
	Mon, 23 Mar 2020 13:16:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5548F800F6; Mon, 23 Mar 2020 13:16:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB425F800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB425F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oHBwIXyT"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B33B92078B;
 Mon, 23 Mar 2020 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584965765;
 bh=jCOWRh42vHKRmuLejlk3NOJX2vnfeEJTZUiki6Qd37I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHBwIXyT+XFi4LgqRYZP+1b1FgpZ6QuEpEq3rOBoebxb+yPg5AjdQZXLn3SNgH5U9
 4sXay+DVxIVNhgy44uw9EhRIx3MgBCLlScZHpwW22fKI6DgMOpLlQGkotJvJNO2ZQO
 tVTQvsd5xQcvW44VLPsdwtjNVuz9SaX9rG+SQOB4=
Date: Mon, 23 Mar 2020 17:46:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
Message-ID: <20200323121601.GJ72691@vkoul-mobl>
References: <20200306050115.GC4148@vkoul-mobl>
 <4fabb135-6fbb-106f-44fd-8155ea716c00@linux.intel.com>
 <20200311063645.GH4885@vkoul-mobl>
 <0fafb567-10e5-a1ea-4a6d-b3c53afb215e@linux.intel.com>
 <20200313115011.GD4885@vkoul-mobl>
 <4cb16467-87d0-ef99-e471-9eafa9e669d2@linux.intel.com>
 <20200314094904.GP4885@vkoul-mobl>
 <3c32830c-cd12-867f-a763-7c3e385cb1e9@linux.intel.com>
 <20200320153334.GJ4885@vkoul-mobl>
 <70d6e0cb-22a6-5ada-83a8-b605974bdd84@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70d6e0cb-22a6-5ada-83a8-b605974bdd84@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 20-03-20, 11:36, Pierre-Louis Bossart wrote:
> 
> 
> On 3/20/20 10:33 AM, Vinod Koul wrote:
> > On 16-03-20, 14:15, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > > > It's really down to your objection to the use of 'struct driver'... For ASoC
> > > > > support we only need the .name and .pm_ops, so there's really no possible
> > > > > path forward otherwise.
> > > > 
> > > > It means that we cannot have a solution which is Intel specific into
> > > > core. If you has a standalone controller you do not need this.
> > > 
> > > A 'struct driver' is not Intel-specific, sorry.
> > 
> > We are discussing 'struct sdw_master_driver'. Please be very specific in
> > you replies and do not use incorrect terminology which confuses people.
> > 
> > Sorry a 'struct sdw_master_driver' IMHO is. As I have said it is not
> > needed if you have standalone controller even in Intel case, and rest of
> > the world.
> 
> You're splitting hair without providing a solution.
> 
> Please see the series [PATCH 0/5] soundwire: add sdw_master_device support
> on Qualcomm platforms
> 
> This solution was tested on Qualcomm platforms, that doesn't require this
> sdw_master_driver to be used, so your objections are now invalid.

I have given you a solution which you dont like. I have asked you to
talk to your colleagues at Intel, I have not heard back. I cant do
anymore than this.

testing on QC boards doesnt make sense, the contention is
'sdw_master_driver' which doesnt get used. I have said earlier, will say
again, if you drop this piece I am ready to apply the rest of the
patches.

-- 
~Vinod
