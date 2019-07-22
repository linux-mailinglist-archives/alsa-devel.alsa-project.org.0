Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B4704E8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 18:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1D74181B;
	Mon, 22 Jul 2019 18:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1D74181B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563811465;
	bh=36JKB3td9vq4CbycDGuCBacTaZepCe3xwPj35StvIEM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFxO1L4RAQwovUs9Wzrf8PPZU4i5dF73EC/8iXWitl5Cqf2rfAXiUdlS+yBwTqr+h
	 1ZPeZk0zIgm9JR9+rSO+YgpJzmUQeClS4TMKDKUUEds3HlOOan89yl69JkBimoXYt7
	 oRO54WioAo+M/gxxRcojgQA5uFUzjClOGCA1wjCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AABC5F803D7;
	Mon, 22 Jul 2019 18:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D95B8F803D5; Mon, 22 Jul 2019 18:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 418E1F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 18:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 418E1F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 09:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="196796394"
Received: from rsundara-mobl.amr.corp.intel.com (HELO [10.254.181.185])
 ([10.254.181.185])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2019 09:02:30 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <58061248-786f-37f6-fc9f-cf18db242a75@linux.intel.com>
Date: Mon, 22 Jul 2019 11:02:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190720194532.23682-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: Intel: IPC framework updates
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 7/20/19 2:45 PM, Cezary Rojewski wrote:
> Existing IPC framework omits crucial part of the entire communication:
> reply header. Some IPCs cannot function at all without the access to
> said header. Update the sst-ipc with new sst_ipc_message structure to
> represent both request and reply allowing reply-processing handlers to
> save received responses.

I don't get the idea at all.

the DSP provides rx_data and a size. If there is a header at the start 
of the IPC data in some cases, why can't you cast and extract the header 
when it's needed for your SKL usages? Why does adding a header make the 
IPC work better?

I have the feeling this is blurring layers between receiving data and 
processing it in platform-specific ways, and I am nervous about touching 
Baytrail and Broadwell legacy, which are way past maintenance mode and 
should be deprecated really.

And last this patchset does not apply on top of Mark's tree?

> 
> Despite the range of changes required for model to be updated, no
> functional changes are made for core hanswell, baytrail and skylake
> message handlers. Reply-processing handlers now save received response
> header yet no usage is added by default.
> 
> To allow for future changes, righful kings of IPC kingdom need to be put
> back on the throne. This update addresses one of them: LARGE_CONFIG_GET.
> 
> Cezary Rojewski (5):
>    ASoC: Intel: Update request-reply IPC model
>    ASoC: Intel: Haswell: Align with updated request-reply model
>    ASoC: Intel: Baytrail: Align with updated request-reply model
>    ASoC: Intel: Skylake: Align with updated request-reply model
>    ASoC: Intel: Skylake: large_config_get overhaul
> 
>   sound/soc/intel/baytrail/sst-baytrail-ipc.c |  65 ++++----
>   sound/soc/intel/common/sst-ipc.c            |  68 ++++----
>   sound/soc/intel/common/sst-ipc.h            |  27 ++--
>   sound/soc/intel/haswell/sst-haswell-ipc.c   | 164 +++++++++++---------
>   sound/soc/intel/skylake/cnl-sst.c           |   6 +-
>   sound/soc/intel/skylake/skl-messages.c      |   3 +-
>   sound/soc/intel/skylake/skl-sst-ipc.c       | 152 ++++++++++--------
>   sound/soc/intel/skylake/skl-sst-ipc.h       |   3 +-
>   8 files changed, 259 insertions(+), 229 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
