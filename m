Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D848220FD2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED771669;
	Wed, 15 Jul 2020 16:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED771669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594824572;
	bh=WcRP0p14n6EJqekhvLOZItKfAJO0M8iIY9Z6ixOns3Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHw5rBq/jRWTArCNU9ZwW5bUbrvMfVzR3aVXSEpdfqrbc1z2c/kjG2fG9Mg4ekvou
	 X3Q6YU3oKcjq2c47S/ge3b48woUTVteXCKVJnqbVuIBrj7SFdHD/fYp8MxaeoQGGvD
	 zwTLesZHG0v5k47n4bwvrNcnu3PYPzbZZUIpSO9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5963F8021D;
	Wed, 15 Jul 2020 16:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDAE7F8021D; Wed, 15 Jul 2020 16:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 544AEF8014E
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 544AEF8014E
IronPort-SDR: LGSiFMsGl1IY1dNjjKIGqQTWw5M5Ze44GE0lBJixtn2DOOn5NFdBBN8AKTx/tR+uC7IGd0yCFf
 JLdbcT62FgZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="213920686"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="213920686"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:47:38 -0700
IronPort-SDR: kBe+BWE34KrVLnJvMaNC2FHbXHi3WlNJPs3QDDrJ/apvIBknO0/ayTYQSakAQQ/LJS1YZdBccQ
 8ldWyix046iw==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="460114344"
Received: from sjeong-mobl.amr.corp.intel.com (HELO [10.255.231.101])
 ([10.255.231.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:47:38 -0700
Subject: Re: [PATCH v3 00/10] topology: decode: Various fixes
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5832886d-3d6d-7513-0df5-0127e18a2f0e@linux.intel.com>
Date: Wed, 15 Jul 2020 09:47:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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



On 7/14/20 6:25 AM, Piotr Maziarz wrote:
> This series fixes various problems with topology decoding mechanism.
> Some of the problems were critical like improper memory management or
> infinite loops that were causing undefined behaviour or program crashes,
> while other resulted in losing some data during conversion.
> 
> Bugs found while testing with Intel SST topologies.

I am far from the expert on topology but the patches look fine to me, so 
adding my tag so that others may chime in:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Changelog:
> v2:
>    -Divide into more patches, critical fixes are in separate patches now
>    -More specific descriptions
>    -Fix a typo UML to UCM
>    -Add error reporting in topology: decode: fix channel map memory
>     allocation
>    -Remove goto again in topology: Make buffer for saving dynamic size
>     for better readability
> 
> v3:
>    -No functional changes
>    -Changed UCM to more descriptive standard ALSA configuration files
>    -removed Gerrit's Change-Id
>    -Added missing signed-offs
> 
> Piotr Maziarz (10):
>    topology: decode: Fix channel map memory allocation
>    topology: decode: Fix infinite loop in decoding enum control
>    topology: decode: Remove decoding  values for enum control
>    topology: decode: Add enum control texts as separate element
>    topology: decode: Fix printing texts section
>    topology: decode: Change declaration of enum decoding function
>    topology: decode: Fix decoding PCM formats and rates
>    topology: decode: Print sig_bits field in PCM capabilities section
>    topology: decode: Add DAI name printing
>    topology: Make buffer for saving dynamic size
> 
>   src/topology/ctl.c        | 51 ++++++++++++++++++++++-------------------------
>   src/topology/dapm.c       |  3 +--
>   src/topology/pcm.c        | 11 +++++++---
>   src/topology/save.c       | 34 ++++++++++++++++++++++++++-----
>   src/topology/text.c       |  2 +-
>   src/topology/tplg_local.h |  2 +-
>   6 files changed, 64 insertions(+), 39 deletions(-)
> 
