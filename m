Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDA18FECD
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F35171654;
	Mon, 23 Mar 2020 21:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F35171654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584995009;
	bh=5NXLyslrQorB5rT4vyzOJhdeLmnmWKMN3vboe/6aIx4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dh9OO/WTe/+dS1kjHXFanQ/9Zugkgrt1XNpJwIUxpvcweOJDLyzHqnzApLYRXh5Wa
	 MASUyVyqCCcljAhb+9cHbMC77mbx/tedMHrKYdS/9R9ORKGLPngodiVfXJQVjUjcm9
	 P7bZvWIlfCS+wotXW52DWEOtoqO8oouTaFKB0aLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AD5F8015A;
	Mon, 23 Mar 2020 21:21:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19E5F80158; Mon, 23 Mar 2020 21:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87AE2F800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 21:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87AE2F800B9
IronPort-SDR: CtlN2UWzabEX6n2t7EEul2tSBqdsHRnU17UrAkAKPEQy4lgwUS9/TgUTybx8BvaQjfYzm+iJz3
 mHSjx0IH9CZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 13:21:38 -0700
IronPort-SDR: Udc++hUnAwN/r6sgkNcJppax17KlyTXwZqNG4uusVzupOREQHF63V/9JV/5ObDg1zvFjNTj5EB
 2BgbQx+BfKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; d="scan'208";a="419631290"
Received: from rkaramse-mobl4.amr.corp.intel.com (HELO [10.255.36.75])
 ([10.255.36.75])
 by orsmga005.jf.intel.com with ESMTP; 23 Mar 2020 13:21:37 -0700
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
To: Mark Brown <broonie@kernel.org>
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200323194142.GH4948@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ded5126d-17c0-2a14-2aea-f5cf2045ae92@linux.intel.com>
Date: Mon, 23 Mar 2020 15:21:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323194142.GH4948@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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



On 3/23/20 2:41 PM, Mark Brown wrote:
> On Mon, Mar 23, 2020 at 02:36:23PM -0500, Pierre-Louis Bossart wrote:
>> Add attribute and show the components string. This is useful to see
>> what is provided to userspace and e.g. used by UCM to understand the
>> card configuration:
>>
>> root@plb:~# more /sys/class/sound/card0/components
>> HDA:8086280b,80860101,00100000 cfg-spk:2 hs:rt711 spk:rt1308 mic:rt715
> 
> Sysfs is supposed to be one value per file so this should be a directory
> with a file for each component I guess.

that's fair, but the 'value' is already a string here. There's no syntax 
or grammar that would define what the contents of the string would be, 
so it'd be difficult to define any sort of ABI. Are you saying sysfs 
can't be used here?
