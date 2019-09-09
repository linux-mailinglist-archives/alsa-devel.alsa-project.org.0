Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4251ADCBA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 18:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D2CE1664;
	Mon,  9 Sep 2019 18:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D2CE1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568045288;
	bh=rPDc3LvHkm+ckqq1gzlFDYPz4gcwv8IXvFv8N3qO7J4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOAYelsl9WnZ5L+onfg2SFuEEYi6wg2thcYTr/yrdY9A3rLcohBBRBn4JRYzYr8xN
	 YZRvo3m8pL1TH0RXtP5HWMvrfjjux4rTYL6/HNJJ0HSnJRJuD0d328c3bKQFncFu+c
	 I95sENj6S0txbEEFp5NwPbqCKwwbx88w1k8U/KNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78FF2F800C9;
	Mon,  9 Sep 2019 18:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D212FF80323; Mon,  9 Sep 2019 18:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3994F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 18:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3994F800C9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 09:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,486,1559545200"; d="scan'208";a="384024175"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2019 09:06:15 -0700
Received: from wkhong-mobl2.amr.corp.intel.com (unknown [10.255.34.248])
 by linux.intel.com (Postfix) with ESMTP id DF19B580522;
 Mon,  9 Sep 2019 09:06:14 -0700 (PDT)
To: Jaroslav Kysela <jkysela@redhat.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0fc38013-2b56-ee32-90b3-0bf191ed3b66@linux.intel.com>
Date: Mon, 9 Sep 2019 11:06:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commits
 (Pierre-Louis Bossart: 2 total)
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

On 9/8/19 5:40 AM, Jaroslav Kysela wrote:
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
> 
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).
> 
> Thank you for your time and co-operation.

Agreed, thanks Jaroslav.

> 
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
> 
> List of your commit(s):
> 
>    f7c38c29d1be8bab9dd4f406aea3b0e9151c1c06
>      conf/ucm: chtrt5645: Cleanup and playback fixes
>    4c0d983d7b4402e7275455ac43f39049b45037ea
>      conf/ucm: chtrt5645: Microphone recording fixes
> 
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
