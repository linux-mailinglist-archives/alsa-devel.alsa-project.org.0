Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE6F3D7877
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 16:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEBFE1F15;
	Tue, 27 Jul 2021 16:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEBFE1F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627396065;
	bh=9jK8oHCQGaxPPjY82pbkwlekSWMg6PJmG6vxmwaoATI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBBQA2xCgr3gxdNoySG972NUEu23D65ZxUSrBxnw7I6YXSIKI0eKupMNe9Xa87vbS
	 A+A22XJqQKLoCD8etPnbJQXqClqc98Fwh5fqOBJDEF+kpybu1dMLmdSiCLtrNKJ3Ta
	 NMX5weSD6gW70S/9W1YqktMzzJpYh9iW5542qktA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C52CF804AF;
	Tue, 27 Jul 2021 16:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2852F80212; Tue, 27 Jul 2021 16:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C86FF80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 16:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C86FF80212
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192731860"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="192731860"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 07:25:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="417429056"
Received: from pmdeshpa-mobl1.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 07:25:44 -0700
Subject: Re: [PATCH 1/5] ASoC: soc-pcm: cleanup cppcheck warning at
 soc_pcm_apply_msb()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87v94wzf37.wl-kuninori.morimoto.gx@renesas.com>
 <87tukgzf2p.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <19dad670-090e-fd48-352b-e71635e66292@linux.intel.com>
Date: Tue, 27 Jul 2021 08:33:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87tukgzf2p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 7/26/21 9:05 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch cleanups below cppcheck warning.
> 
> sound/soc/soc-pcm.c:446:29: style: The scope of the variable 'pcm_codec' can be reduced. [variableScope]
>  struct snd_soc_pcm_stream *pcm_codec, *pcm_cpu;
>                             ^
> sound/soc/soc-pcm.c:446:41: style: The scope of the variable 'pcm_cpu' can be reduced. [variableScope]
>  struct snd_soc_pcm_stream *pcm_codec, *pcm_cpu;
>                                         ^

I personally ignore those warnings, there are hundreds of them and it'd
be a relatively marginal improvement in code quality.

my scripts use the following options to focus on more important issues
first.

--suppress=variableScope --suppress=shiftTooManyBitsSigned
--suppress=arithOperationsOnVoidPointer --suppress=bitwiseOnBoolean

