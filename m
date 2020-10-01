Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC127FFC6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27BAE1891;
	Thu,  1 Oct 2020 15:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27BAE1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601557871;
	bh=FuTcyzN69KQMKYEsIBhcZpgp6OtwEYBmbAsEgSU4O4A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jM5TTaQv2eKj1plFAIGK5bKvj6Nkd+di4FNLVadn1uNV+heYhpYwnlmTLDU4s5sb3
	 jPQFOpqClPrKD4dyphi2M4O2+dc6z9eXhevMu2TWbCccLwpiRWtLs3YComDnjsW05e
	 awVs8avQjuoQb9yP8dmxro/+lNjVpUgsEN63+OAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B83F801F5;
	Thu,  1 Oct 2020 15:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61AC0F801F5; Thu,  1 Oct 2020 15:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44278F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44278F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FlVwr4YX"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72CD8207FB;
 Thu,  1 Oct 2020 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601557747;
 bh=FuTcyzN69KQMKYEsIBhcZpgp6OtwEYBmbAsEgSU4O4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FlVwr4YXaUjGDI/byB4LQN3LpBItOp6LGCPyeddE+e8p1Jw35498WFuSk+YDjyWNU
 YeZG9gj10e+1xcZygD9Tvj3fbi03DzbdZ5YyVBkOHfHaSuYIkzKf+3cntoFQNzmlhR
 9fbdRVJ1WQY5vlzrj86iR5Prctf7L0NyAKp3eG1w=
Date: Thu, 1 Oct 2020 15:09:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Message-ID: <20201001130907.GD2378679@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-4-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-4-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com
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

On Wed, Sep 30, 2020 at 03:50:48PM -0700, Dave Ertman wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> Create an SOF client driver for IPC flood test. This
> driver is used to set up the debugfs entries and the
> read/write ops for initiating the IPC flood test that
> would be used to measure the min/max/avg response times
> for sending IPCs to the DSP.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>

Am I reading this series correct in that this is the only "user" of the
new ancilicary bus/driver code?

If so, why is it even needed?  These are just debugfs files for testing,
why does that need to be in a separate device?  What is being "shared"
here that needs multiple struct devices to handle?

confused,

greg k-h
