Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA7A5F6F0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 13:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21CE16A8;
	Thu,  4 Jul 2019 13:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21CE16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562238071;
	bh=9YTCoNUTUqW6qtwU/mJX4iVLZkCeF/9QeckgXAAsf78=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFMgPmpzkJeBzNZmQXHOR8hKj6Cl/2TFCOraTrdqIwgH8mDX6MCnIxKudOLXNAbhk
	 3B0jpi8zUmfDxw/IID/1NHIUUHU+ByDYEX/EEQkLO+vrn4zUC4has45HbKNTYEWlnq
	 ebqIBB2nW7A/x6pshgHvrjBwjAg9UhfLk5hK6mVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B02FF800E7;
	Thu,  4 Jul 2019 12:59:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78231F80111; Thu,  4 Jul 2019 12:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35067F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 12:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35067F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 03:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,450,1557212400"; d="scan'208";a="187548785"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2019 03:59:16 -0700
Date: Thu, 4 Jul 2019 14:00:31 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <3788800e-7050-d68a-bec6-5b443fd0d563@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1907041344240.4409@eliteleevi>
References: <20190703151023.30313-1-yang.jie@linux.intel.com>
 <alpine.DEB.2.21.1907041254100.4409@eliteleevi>
 <3788800e-7050-d68a-bec6-5b443fd0d563@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for position
 update ipc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Thu, 4 Jul 2019, Keyon Jie wrote:

> Well, to me it is flavor choice, Ranjani suggested to illustrate the use 
> case where the FW will use this host_period_bytes, and I agreed this 
> will help people to understand why we need this change.

hmm, ok. So maybe add "Allows FW to use 'host_period_bytes' field
for its original purpose" to my proposed wording..?

>> This is not helpful -- we know this _is_ a minor ABI change
>> and needs to be aligned with FW.
> It is minor change, but the FW change is still required, otherwise, we 
> will get extra position update IPCs which may confuse the driver, please 
[...]
> https://github.com/thesofproject/sof/pull/1592

Ack, but we know this already so best to put the accurate 
description in the commit message. The "might require FW change"
is a bit scary statement in a patch touching ABI structs. ;)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
