Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C926914F10A
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 18:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426011678;
	Fri, 31 Jan 2020 18:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426011678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580490286;
	bh=736naYDReU4P2TozXWpVhYPqvpWhHbSs7sJvjgiRgxw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6yfhV+0jdtThIoGyBx4NrcE8+BkYW8pnCF7+KQh6w3+BUNnunXFnYIZlAOoouVHm
	 wY9HXE4GV57E5PajHsZJgAjnVWFkY7uEsujjK57Ya/eizRPeLLdIh5xNp2zn99fEYk
	 seDCjnykZTHo8wJg/Aw0C7AubCjNuzFkIp74GeF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3741BF80229;
	Fri, 31 Jan 2020 18:03:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F1E7F8021E; Fri, 31 Jan 2020 18:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B963DF80116
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 18:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B963DF80116
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 09:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,386,1574150400"; d="scan'208";a="224493578"
Received: from dsankar-mobl.amr.corp.intel.com (HELO [10.252.202.81])
 ([10.252.202.81])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2020 09:02:50 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200131123115.14247-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af43385c-9aa7-4faa-e889-0c2f01b65b5a@linux.intel.com>
Date: Fri, 31 Jan 2020 11:02:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131123115.14247-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v4 00/11] ASoC: SOF: Data probing
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


> Changes in v4:
> - No changes to ALSA core and hda patches
> 
> - 'probe' source added in patch "ASoC: SOF: Implement Probe IPC API" now
>    only compiled if SND_SOC_SOF_DEBUG_PROBES is enabled. Said kconfig
>    initial declaration has been moved to that patch too
> - 'extractor_stream_tag' field now decorated with _DEBUG_PROBES to
>    account for the change above
> - Debugfs probe handlers now check if extractor stream is running before
>    continuing. To achieve this, 'extractor_stream_tag' is both initialized
>    and set to SOF_PROBE_INVALID_NODE_ID on sof_probe_compr_free().
>    Suggestion provided by Pierre
> 
> - Reverted SND_SOC_SOF_HDA_LINK requirement-removal change for HDA probes.
>    Code requires SND_HDA_EXT_CORE in order to function on Intel platforms

Sorry Cezary, I am not ok with this revert and the dependency on 
HDA_LINK, see comment on Patch 9. We can talk on Monday on this to look 
at alternate solutions, no need for multiple emails.

Also the types used in Patch 6 need a bit more work.

The rest looks fine, thanks!
-Pierre

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
