Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0224D04E4
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:06:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C7721684;
	Mon,  7 Mar 2022 18:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C7721684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646672804;
	bh=Xe5kdG1omeXVHUJt8R44QlSAHfTFD+Wi9NzOBvhbYZU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGinYe6+wW6guY8Y/gh9o0JdaskQXAvBbekAb31UagzFHlRZ4mSAFYMYux3193Q54
	 4Kj+VPk78a5uL5L/Wky08w9NuSxFmmi4sLpGJySelw+Dh8AkE5/PuNi8GGkDnNdNFT
	 vqAcjFy18GJfBSctsFRDc6VnJtvglY4bb7fmEvho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F188F80159;
	Mon,  7 Mar 2022 18:05:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AEE6F8013F; Mon,  7 Mar 2022 18:05:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5B4FF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B4FF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UZHqBwkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646672733; x=1678208733;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xe5kdG1omeXVHUJt8R44QlSAHfTFD+Wi9NzOBvhbYZU=;
 b=UZHqBwkn+KpocdBxChX/QwuDSgaUGxWOawPBCAFN+PN2zUASPA+HL8sJ
 Oo6G1P5xpLrAo3UPX+6JTfkMCy3Wi4hH9A2LMzLdB2QnM2F6/aF9n7cnr
 14xRyC7mkKa7dcvBEHEYJV+c71055YMR0eLgetuWqv6oMQ30/8JY8JzV3
 hjMnb2Ed/v91OeIQ+e3fNehJzlleJGQmvFw8LBjDRiazMdOPv5xoVp42o
 +qdZFXa0lZTWtmeP/vGdyfTv0Iqz0o7p3HQdRPSrr4MHE5+F6fKVt1lGc
 9bPS9QmZrVAnQ3VWgjoDPpOqtBJL1v9jq9kB700JjpIKWC0TE35prdZbD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317677195"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="317677195"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:05:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="595569630"
Received: from zhaojohn-mobl1.amr.corp.intel.com ([10.254.24.100])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:05:25 -0800
Message-ID: <a281e2885720f83cb95615dd4d6a04ba55ab1521.camel@linux.intel.com>
Subject: Re: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Mon, 07 Mar 2022 09:05:25 -0800
In-Reply-To: <818cb84e-44c2-ab4f-03b5-5b72b598c6e6@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-8-cezary.rojewski@intel.com>
 <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
 <e463df51-a0a5-b863-0cd6-80b1d60dc09b@intel.com>
 <886dacf8fdffb08af26cea6e754d09d4ed7811ea.camel@linux.intel.com>
 <818cb84e-44c2-ab4f-03b5-5b72b598c6e6@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Mon, 2022-03-07 at 17:58 +0100, Cezary Rojewski wrote:
> > I'm not following this, Czarek. If there are rules defined by the
> > FW,
> > the driver has to follow it isnt it? What I am asking is how and
> > where
> > do you enforce this in the AVS driver?
> 
> 
> 
> 
> How the stream looks is defined by the topology. Code that
> translates 
> 
> such patterns into runtime being is not part of this patchset. It's
> part 
> 
> of avs_path and its collaterals instead.
Alright, I'll wait for the next patchset for the explanation.

> 
> 
> 
> > > > How come you dont have a loop here? What if the rec'd data size
> > > > if
> > > > larger than the max size of IP payload?
> > > That's not how LARGE_CONFIG_GET message works. There is no
> > > looping
> > > involved or expected by the firmware and so we don't have it
> > > here.
> > So, are you saying that when retrieving data from the FW, the size
> > of
> > the retrieved data can never exceed max IPC payload size?
> 
> 
> 
> 
> Precisely.
This is fundmentally flawed isnt it? If set_large_config() sets a
config that can exceed max IPC size, get_large_config() has to be able
to support it.

Thanks,
Ranjani

