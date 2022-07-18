Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D724578764
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 18:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D3816E4;
	Mon, 18 Jul 2022 18:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D3816E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658161796;
	bh=81h78lRxAbY04YdAi0WI91i/CTRrDQrPa5eeqafwMyo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9wdYgNeGiznaQDSD0ab75mLwywJ6sDauAnOv7BAtsQr5aTo3tiJrww66g3oFYzAf
	 DWIuRI2E6hWaZzr41H1UVl1u3gew7CdtQDYsVG4cgFjX4jZ7R9wC4T1kKfS2sHSv/X
	 zq4rE4OvhPYr+iIy9WB5vLepvcJVVmBrPzhBNM90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F114F8050F;
	Mon, 18 Jul 2022 18:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9846EF80508; Mon, 18 Jul 2022 18:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A97AFF80125
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 18:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A97AFF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e0wVoGVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658161729; x=1689697729;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=81h78lRxAbY04YdAi0WI91i/CTRrDQrPa5eeqafwMyo=;
 b=e0wVoGVVAZb6lrIQpc2vFrtmvAeWXQoVJmoaztW7JsiCyECdEenwhEBB
 qpdscoDit7+9j9RNt6RwaF15eWO8fHXkc+7BiaB397fKhy7crwLQPo9v/
 N+a1D+VU254VQ3+krIadBx7cmQG5aMvwGplyUtx1MXI5WF2gNyKdZgeao
 zPl7iMDdpxTQQz9yxn4cRGTv6izmbXmtwc8JZjVhXGU+TZmlp8yLVNIGQ
 fkOuRrR6hcjs8Aanv/nOGVeoSIMFHA+gx6PH3IBAuTO+FjIbSpfFm2bXB
 DzUL/wxcWdhbjd5PAXw6DTFhpOoFSOYdkX8h2JHCdF0y4WNwHUiJcmk5/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285021095"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="285021095"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:28:45 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="773795191"
Received: from astephax-mobl.amr.corp.intel.com (HELO [10.209.134.250])
 ([10.209.134.250])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:28:44 -0700
Message-ID: <eacfa436-fb01-9f0f-8bc0-6d857653bed8@linux.intel.com>
Date: Mon, 18 Jul 2022 11:28:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: linux-next: Tree for Jul 15 (sof-client-ipc-flood-test.c)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220715225251.2e7f7ada@canb.auug.org.au>
 <d9e2d97c-12a5-5846-a9dc-4c7c0c10988e@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d9e2d97c-12a5-5846-a9dc-4c7c0c10988e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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



On 7/15/22 17:49, Randy Dunlap wrote:
> 
> 
> On 7/15/22 05:52, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20220714:
>>
> 
> on x86_64:
> 
> ld: vmlinux.o: in function `sof_ipc_flood_probe':
> sof-client-ipc-flood-test.c:(.text+0xb961d4): undefined reference to `sof_client_get_debugfs_root'
> ld: vmlinux.o: in function `sof_ipc_flood_dfs_open':
> sof-client-ipc-flood-test.c:(.text+0xb963ed): undefined reference to `sof_client_get_fw_state'
> ld: vmlinux.o: in function `sof_ipc_flood_dfs_write':
> sof-client-ipc-flood-test.c:(.text+0xb9689a): undefined reference to `sof_client_ipc_tx_message'
> 
> 
> Full randconfig file is attached.

Thanks Randy, I reproduced the issue, it was also reported by the Intel
bot. I added all the configs here:

https://github.com/thesofproject/linux/issues/3768

The issue is that the sof-client helpers are compiled with the same
setting as the SOF core, but the clients can be compiled as built-in,
that cannot possibly work.

It's peak vacation season so it'll take a couple of weeks to be
fixed/reviewed, but we'll fix this.
-Pierre
