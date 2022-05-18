Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02FE52BD92
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 16:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7475B14C;
	Wed, 18 May 2022 16:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7475B14C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652884784;
	bh=q20Z/BBS35WkC9iaGshSAyrghNxrcU17os220vjkvmI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+6VjIxCQ9QF440qaoPS7KZKKRq/a++5OjMXXSbbnOfB6kCHg2TdYXwTP2gWelDoY
	 tU0IjuMOAB9RNMjEWJ2sznRRR6splImIZn13j7SSXLxW7r4nZpCPGz9hQwnsufUU0f
	 n5u8CwsyJNoj6QX0pBZhmEcOrFcRqNGuY2kf5d7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C30F80159;
	Wed, 18 May 2022 16:38:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3D14F8023B; Wed, 18 May 2022 16:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A50F800F0
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 16:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A50F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="i693i5nG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652884719; x=1684420719;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q20Z/BBS35WkC9iaGshSAyrghNxrcU17os220vjkvmI=;
 b=i693i5nGFFUQCZEvQ5bczpTK/YKDYOXnhh3MmQhe/yruR8UmM8eJz50S
 p7/WFFwWstyIv30KHTwiM5ZJVENUEQzXHo3LAxKNllbTn4NRN1wYGn1IS
 v/VO/gmGs8RurIUrJEy7bGA3tFCztYpTrAnrN266gW0ZIQCIv0K0cR7wG
 XSxY1XMUYoHqL/+qGfFziRwLHV3FxJTzAd/owIWIaavkW3H6cDeYxv38g
 WiZBRbiHxdjxEPat3e5Iw7HFlq7SbFocKue3s1fIhOnt9A+nMuZVD84vv
 IjVwjimvq3hJlU/jWGSIVMyBt1wA5ESMgXnvyWty7MHBEKTHyiOik3jTO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270526439"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="270526439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 07:37:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="597832130"
Received: from jbai2-mobl1.amr.corp.intel.com (HELO [10.209.83.114])
 ([10.209.83.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 07:37:49 -0700
Message-ID: <728c697b-0df7-3d95-10cb-ce0111f0017b@linux.intel.com>
Date: Wed, 18 May 2022 08:32:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [v7] FROMLIST: ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Content-Language: en-US
To: Terry Chen <terry_chen@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20220518033200.1471841-1-terry_chen@wistron.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220518033200.1471841-1-terry_chen@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, casey.g.bowman@intel.com,
 yang.jie@linux.intel.com, tiwai@suse.com,
 mark_hsieh@wistron.corp-partner.google.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, seanpaul@chromium.org,
 cujomalainey@chromium.org, brent.lu@intel.com, vamshi.krishna.gopal@intel.com
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


> +	{
> +		.id = "10134242",
> +		.drv_name = "adl_mx98360a_cs4242",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98360a_amp,
> +		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
> +	},

To repeat myself, there is no precedent for using a topology file name
that refers to a codec from a different vendor used on a different
platform.

It may work but it's confusing and not maintainable. I don't want to
start a trend where confusion becomes the norm.

In previous contributions, platforms with Cirrus Logic chips used a
non-ambiguous filename, please follow this example:

	{
		.id = "CSC3541",
		.drv_name = "adl_cs35l41",
		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
	},

and use

.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",



