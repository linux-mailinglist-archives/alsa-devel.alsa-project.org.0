Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C969E55C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:00:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B495DDF6;
	Tue, 21 Feb 2023 17:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B495DDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998845;
	bh=dNDiJFMnzKrNtVN4zEBNc0Z72+aV30wuuQw/PpbtgVU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjxHlssxJ4GiHCEPoJp5U3132QG7sdCnYWOxSWkq6/Qirs5rRN+l8LNhxU1HqK60P
	 yyAR3ac2vtZBngl0hT4UnGdtcqm3CogTpaTyONASO4TKJGtXsEmBRJfTkDUyb/27ao
	 T8g67gMr6z9x14dBZK8tNGgOnmKum0KjR8wVt3Ks=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D99F80527;
	Tue, 21 Feb 2023 17:59:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0F85F80526; Tue, 21 Feb 2023 17:59:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA648F800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA648F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Mdzoj/BG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998734; x=1708534734;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dNDiJFMnzKrNtVN4zEBNc0Z72+aV30wuuQw/PpbtgVU=;
  b=Mdzoj/BGMqZVgLiENoQLnOYe/Je/V5nt6DbN71Mvt+9mTkN6ZuqKpMoY
   z9rBWWSqHKdOziopT9YKuMaVxEBSf5do/8aIicZnFjR9yNJfDzU5tYCK/
   kgJ5eqoAEt/4XH9qirs3hhDy3IZ4LK+fO+nAaswtGDWv3zzOYYw+Cp0xE
   mZHxgpi6/6FyetYKAIl4ulAyx1bH9ze1BF6mi3IjN4UJ2i43JECDrOeqj
   DyNLhAHPQQGd7lKP5Xg6BFm131o625zUczHWr9B9g9kuNlW19EGXAAG+L
   N3U6UPCeI3MVEoQ68Z7GHTYSAevV6WKR0+aWWBBTdPwfpYdnhVA55IOgq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884644"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884644"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569093"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569093"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:33 -0800
Message-ID: <b6f06e29-22cb-a996-5dfb-91544059051f@linux.intel.com>
Date: Tue, 21 Feb 2023 10:59:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 3/8] soundwire: amd: register SoundWire manager dai ops
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-4-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FACFD2AZFTYYFCNC6ODJFIKL43QNZ73S
X-Message-ID-Hash: FACFD2AZFTYYFCNC6ODJFIKL43QNZ73S
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 Mario.Limonciello@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FACFD2AZFTYYFCNC6ODJFIKL43QNZ73S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +static const struct snd_soc_dai_ops amd_sdw_dai_ops = {
> +	.hw_params = amd_sdw_hw_params,

don't you need a .prepare to deal with suspend-resume?

> +	.hw_free = amd_sdw_hw_free,
> +	.set_stream = amd_pcm_set_sdw_stream,
> +	.get_stream = amd_get_sdw_stream,
> +};
