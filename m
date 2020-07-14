Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25B21FAA7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 20:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6623166E;
	Tue, 14 Jul 2020 20:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6623166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594752878;
	bh=NQFU2DvA6aEwWPa1CQSfaaDSpA/Q3iCnzhcUxCVuft4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llTdiL+zyiwbS5H7zTo/vO4Zc0Kf8OE8iFSwseonlP2zkl54GdvKUL75jkPNVHERl
	 9CoMHelQ92qcX8bKC1Kxd5YJUWxNyKZtebZZ4enDwKC6KfgrCo3qTRNFIkumLrpN06
	 grrvNKI2RFNRpAtzCl86C7l+UeluSTyuIfZo1hEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F33B4F80113;
	Tue, 14 Jul 2020 20:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDC4EF8019B; Tue, 14 Jul 2020 20:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 974B4F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 20:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974B4F8014E
IronPort-SDR: YLrZRH3ypzHGg0n0e9Y4xVcQsbUPArHXTG9M7HBPvAEHwuPE77mCSTHQUDMdPFAV+EL9ohU+zS
 M3EpqQ+t+AsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="233864163"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="233864163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 11:52:31 -0700
IronPort-SDR: 5XYBwlx7BLG8RYABelYmySVh0I3KiAU9UI0qNmFubXzkxHyyZphWn/8LNKwMTyXCgweX+rXXCC
 TQp+1iCfvAIg==
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="459795109"
Received: from pchen16-mobl.amr.corp.intel.com (HELO [10.254.77.61])
 ([10.254.77.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 11:52:31 -0700
Subject: Re: [PATCH 01/10] ALSA: Replace the word "slave" in vmaster API
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200714172631.25371-1-tiwai@suse.de>
 <20200714172631.25371-2-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eda4df2e-d7b0-9e7e-e873-e3d8d3088174@linux.intel.com>
Date: Tue, 14 Jul 2020 13:52:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714172631.25371-2-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 7/14/20 12:26 PM, Takashi Iwai wrote:
> Follow the recent inclusive terminology guidelines and replace the
> word "slave" in vmaster API.  I chose the word "replica" at this time
> since it seems fitting for the purpose.

Thanks Takashi for starting this.

For the HDaudio Volume widgets, the spec says they may have different 
step size but use the same number of steps, so they are not copy-exact 
versions in the usual 'replica' sense but rather follow or track the 
master configuration.

The internal guidance I see at Intel is to use 'replica' mainly in a 
database/configuration management context.

If the idea is that the 'replicas' use the same configuration as the 
'master', that'd be fine indeed but we may want to add a clarifying 
comment that the end-result may be different for each 'replica'?

[...]

>   /*
> - * link slave - this contains a slave control element
> + * link replica - this contains a replica control element
>    *
>    * It fakes the control callbacsk with additional attenuation by the

unrelated typo here that maybe we can fix while we are at it?

> - * master control.  A slave may have either one or two channels.
> + * master control.  A replica may have either one or two channels.
>    */

