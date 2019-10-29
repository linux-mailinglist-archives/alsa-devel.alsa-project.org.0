Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50995E856C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 11:22:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FD5220D;
	Tue, 29 Oct 2019 11:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FD5220D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572344521;
	bh=9OIUdEWD6mMilT4fQrKbAB5JJTtIcb9nq/kOr3Ux2YQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dn//5JV8S930A0uJd/mmK+XDC9MLnCwQfvJNXCppXqMKRX8ktFgy1392A1A3nYrfi
	 dfIXP4IeiZFAkPszSDQt/zmB6BkMIfUYwrUaLgPttT2KEmJRKR0rxwpeDMBz+T+Uzm
	 sWhEtqktxCVQrFZzEZRkmzlzOg9rl4eh+PyqmvVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABFBF80392;
	Tue, 29 Oct 2019 11:20:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D555F80392; Tue, 29 Oct 2019 11:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E11FF8015A
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 11:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E11FF8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 03:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="205428791"
Received: from apboie-mobl2.amr.corp.intel.com (HELO [10.252.8.198])
 ([10.252.8.198])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 03:20:08 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
 <20191025224122.7718-2-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <27049897-ae9d-49b3-20be-f35429ccb03c@intel.com>
Date: Tue, 29 Oct 2019 11:20:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025224122.7718-2-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/26] ASoC: SOF: add a field to store the
 current D0 substate of DSP
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

On 2019-10-26 00:40, Pierre-Louis Bossart wrote:
> +/* DSP D0ix sub-state */
> +enum sof_d0_substate {
> +	SOF_DSP_D0I0 = 0,	/* DSP default D0 substate */
> +	SOF_DSP_D0I3,		/* DSP D0i3(low power) substate*/
> +};

Name of the type states: "d0 substate" while description "D0ix 
sub-state". Why was not this named D0ix from the get-go? Goes into the 
same the same naming bucket as S0ix.

On the further note, adding D0ix patch within "enable S0ix support for 
Intel platforms" is misleading. S-states != D-states. D0ix is especially 
orthogonal. It is these to further reduce power consumption when system 
and device are in S0 and D0 respectively and idle time between IPC 
communication is long enough for DSP to be power gated.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
