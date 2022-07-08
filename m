Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A33F56BB90
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 16:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0BD3E8;
	Fri,  8 Jul 2022 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0BD3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657289761;
	bh=mZw4zJhnWLu6q25nq6HwCIlugQZ35aroc8hQi8XIXbM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIcZ+/KbrAmlPRu622GlcUQ+ahSpfpB8wOYFzikFSD/mtSeCrd6Bnu+ugjZaTpb7c
	 DxzfJ1krTxKfYt/YRPL4tly+UratrWZtQdCZwX7P/aZPtiMhxt9VmJk3Y+k7Kww6B3
	 +z1LC4re6uj+LgqErIc3tLHXVWc5vMw4lVsbR3hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC09F80084;
	Fri,  8 Jul 2022 16:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 597FDF80167; Fri,  8 Jul 2022 16:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8EB4F80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 16:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EB4F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bpKtKxb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657289693; x=1688825693;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mZw4zJhnWLu6q25nq6HwCIlugQZ35aroc8hQi8XIXbM=;
 b=bpKtKxb3bcMiAxw7vYpHe5oE+zmqBb26byme3JLM9Rm9zSgHFaQ8e1yL
 jqEWZ5MVipDEZ+u6GZl0v/o+Jj4uuamUCEA1G/3ZzVY9PeprOyqHCyhkU
 0LFqxXPPVPQWhUqWqhZjc8mxXBJ3Kpj/+tJkHoaD4yrmk9VKhO25YUWPL
 Wu8fcPB0veOJ5PbUJeNoZGlMadIVfj4APPEm89HJz8tOrZDcq/SkTnl9M
 7Cpmsb/P1gQg2ftNMXzR4NX1v9Tfk0fZTabCHzR0dG7cJHwJOchJAoTZb
 x+11HpsA8EFUr5Ltg/aGc5ErGFapTCOMiwpx33sZUuIqTXmoEyEPg4Su0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="267320114"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="267320114"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:14:48 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="626714088"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO [10.212.87.49])
 ([10.212.87.49])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:14:47 -0700
Message-ID: <4fd78c53-2294-0f19-1551-39bafe87d94c@linux.intel.com>
Date: Fri, 8 Jul 2022 09:11:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v8 0/2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220708110030.658468-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220708110030.658468-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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



On 7/8/22 06:00, Brent Lu wrote:
> 1. Add BT offload fetch to cs42l42 machine driver
> 2. Support cs42l42+max98360a on ADL platform
> 
> V8 Changes:
> - split the V7 patch into two patches; one for BT offload feature, the other for new board config
> - change topology name to sof-adl-max98360a-cs42l42.tplg
> - remove useless variable 'ret' in create_bt_offload_dai_links
> 
> Brent Lu (2):
>   ASoC: Intel: sof_cs42l42: support BT offload audio
>   ASoC: Intel: sof_cs42l42: add adl_mx98360a_cs4242 board config

LGTM, thanks Brent

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
