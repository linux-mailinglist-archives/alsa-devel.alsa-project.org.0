Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745B47495A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EEE201C;
	Tue, 14 Dec 2021 18:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EEE201C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639502843;
	bh=gnWi9FXAw3cKs5qB77oWfNiqZqrcJ80mjqUwJsgeTDw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfYMj9EzCqQJFRJnXi/W6HgydDQnN3W/Q7SAdUqudEuJEu99Ffzx0wYv7q43aF6Gn
	 iY3HyPO+PtJTqxWos794Pmxq/T0BLKJIqSIUMSQcgpPRJz/DtAvjQvk8M+4aBisGQd
	 yJwOeVe/H+xNjoXnN/vCbqwkCcW9/Lnr0zgXQjUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E78F800FE;
	Tue, 14 Dec 2021 18:26:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21FE0F80246; Tue, 14 Dec 2021 18:26:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DCC9F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DCC9F800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238842266"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="238842266"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:25:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="604415299"
Received: from rtwoods-mobl.amr.corp.intel.com (HELO [10.213.169.152])
 ([10.213.169.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:25:58 -0800
Subject: Re: linux-next: Tree for Dec 13 (SND_AMD_ACP_CONFIG)
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20211214030215.3181149-1-broonie@kernel.org>
 <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
 <CAEnQRZB9E4uBDuUidiJ+QJnQhGZp43jig4q93Pkw3pSr=K48YQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <11ed7f0f-ad5a-cae1-035c-23e5d3736818@linux.intel.com>
Date: Tue, 14 Dec 2021 11:25:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAEnQRZB9E4uBDuUidiJ+QJnQhGZp43jig4q93Pkw3pSr=K48YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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



On 12/14/21 11:21 AM, Daniel Baluta wrote:
> Hi Randy,
> 
> This should be fixed by https://github.com/thesofproject/linux/pull/3284

no, this was precisely the change that exposed a new problem.

https://github.com/thesofproject/linux/pull/3335 contains the suggested
fix posted earlier. We should know tomorrow if the 0day bot finds any
other issues.

> 
> Let me quickly send this to alsa-devel.
> 
> 
> On Tue, Dec 14, 2021 at 12:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 12/13/21 19:02, broonie@kernel.org wrote:
>>> Hi all,
>>>
>>> Non-merge commits (relative to Linus' tree): 5960
>>>  6555 files changed, 277265 insertions(+), 120864 deletions(-)
>>>
>>> ----------------------------------------------------------------------------
>>>
>>
>> on i386 or x86_64:
>>
>> when # CONFIG_ACPI is not set,
>> so SND_SOC_ACPI is not set:
>>
>> WARNING: unmet direct dependencies detected for SND_AMD_ACP_CONFIG
>>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_ACPI [=n]
>>   Selected by [y]:
>>   - SND_SOC_AMD_ACP_COMMON [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && X86 [=y] && PCI [=y]
>>
>>
>> Full randconfig file is attached
>>
>> --
>> ~Randy
