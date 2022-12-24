Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC86558E6
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 08:21:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9FB6A5B7;
	Sat, 24 Dec 2022 08:21:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9FB6A5B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671866510;
	bh=h5wzDr7gLfzy22xDxrNurDVV8JBTfjO+3cPkPv7quuQ=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=erwNTd0XbLjAMx1nWxn1oi0GrfkdxvItS4oQ4iRf0xHvjE4gKsOdf+tIrDFo9VF/z
	 DwxJZXfT1GScokHq/QxNTOyhIebMRHN1nfOWsj7T9tko9RwmKWbNWprPBW6oa4LjuS
	 92fXOqmMn/IezAcjMV3gMdFnI/rDz656BwkMcxQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D412F80245;
	Sat, 24 Dec 2022 08:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71CEFF8032B; Sat, 24 Dec 2022 08:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69204F80245
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 08:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69204F80245
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p8yps-0000x0-Oo; Sat, 24 Dec 2022 08:20:48 +0100
Message-ID: <f1770b7c-d287-a255-0298-2523ce3a9565@leemhuis.info>
Date: Sat, 24 Dec 2022 08:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [6.2][regression] after commit
 ffcb754584603adf7039d7972564fbf6febdc542 all sound devices disappeared (due
 BUG at mm/page_alloc.c:3592!) #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: alsa-devel@alsa-project.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
 <5dff36ee-bfe5-4596-b01d-0eaca1b552bd@leemhuis.info>
In-Reply-To: <5dff36ee-bfe5-4596-b01d-0eaca1b552bd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1671866450;
 edf446c9; 
X-HE-SMSGID: 1p8yps-0000x0-Oo
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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



On 22.12.22 13:17, Thorsten Leemhuis wrote:
> [Note: this mail contains only information for Linux kernel regression
> tracking. Mails like these contain '#forregzbot' in the subject to make
> then easy to spot and filter out. The author also tried to remove most
> or all individuals from the list of recipients to spare them the hassle.]
> 
> On 15.12.22 15:17, Mikhail Gavrilov wrote:
>> Hi,
>> The kernel 6.2 preparation cycle has begun and yesterday after the
>> kernel was updated on my Fedora Rawhide all audio devices disappeared.
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced ffcb754584603adf
> #regzbot title dma-mapping: audio devices disappeared
> #regzbot monitor:
> https://lore.kernel.org/all/20221220082009.569785-1-hch@lst.de/
> #regzbot fix: dma-mapping: reject GFP_COMP for noncohernt allocaions

The typo in the subject of the fix was fixed, hence this is needed:

#regzbot fix: 3622b86f49f8
