Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094883748
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 18:48:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D9184C;
	Tue,  6 Aug 2019 18:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D9184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565110101;
	bh=MQtUY3BBugvm1fV3LvXAzeFOJEJfRoY9eIF3ui8Fb0A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHDyk/tZbldNP4GOHM4Mi8PXhsvj1L1kvaO3v+rt0lRkqRCqY7ABcHIGX7WG4QitE
	 fQEclbZnsXzFofXRysR2bMqpWWccpnMvdWy9+kqMWFLW5tAuGb8BRWIX5QSHeRSnEP
	 w3VQx+JwIBsTFl8lT6bIyLJkWCAq3chQzuGLuLBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E40F80290;
	Tue,  6 Aug 2019 18:46:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCF4DF80483; Tue,  6 Aug 2019 18:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F610F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 18:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F610F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 09:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="174228957"
Received: from bdufour-mobl.amr.corp.intel.com (HELO [10.251.132.235])
 ([10.251.132.235])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2019 09:46:28 -0700
To: Mark Brown <broonie@kernel.org>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87y3072iib.wl-kuninori.morimoto.gx@renesas.com>
 <f7a47bad-b680-cbd2-2341-7be081ac4b2c@linux.intel.com>
 <20190806162258.GD4527@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d80703b2-be84-608d-0048-1f24a1fe7ebd@linux.intel.com>
Date: Tue, 6 Aug 2019 11:46:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806162258.GD4527@sirena.org.uk>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH 02/28] ASoC: soc-core: set
 component->debugfs_root NULL
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



On 8/6/19 11:22 AM, Mark Brown wrote:
> On Tue, Aug 06, 2019 at 09:49:20AM -0500, Pierre-Louis Bossart wrote:
>>>    {
>>> +	if (!component->debugfs_root)
>>> +		return;
> 
>> that test is redundant, it's safe to call debugfs_remove_recursive() without
>> checking the argument (done internally).
> 
> It's not completely redundant...
> 
>>>    	debugfs_remove_recursive(component->debugfs_root);
>>> +	component->debugfs_root = NULL;
>>>    }
> 
> ...with this, the two in combination add protection against a double
> free.  Not 100% sure it's worth it but I queued the patch since I
> couldn't strongly convince myself it's a bad idea.

I was only referring to the first test, which will be duplicated. see below.
The second part is just fine.

/**
  * debugfs_remove_recursive - recursively removes a directory
  * @dentry: a pointer to a the dentry of the directory to be removed. 
If this
  *          parameter is NULL or an error value, nothing will be done.
  *
  * This function recursively removes a directory tree in debugfs that
  * was previously created with a call to another debugfs function
  * (like debugfs_create_file() or variants thereof.)
  *
  * This function is required to be called in order for the file to be
  * removed, no automatic cleanup of files will happen when a module is
  * removed, you are responsible here.
  */
void debugfs_remove_recursive(struct dentry *dentry)
{
	struct dentry *child, *parent;

	if (IS_ERR_OR_NULL(dentry))
		return;
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
