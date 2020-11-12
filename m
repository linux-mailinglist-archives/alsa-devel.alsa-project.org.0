Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5262B0AF8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 18:11:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099921846;
	Thu, 12 Nov 2020 18:10:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099921846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605201063;
	bh=pS5ZJBBeCEo2Td2c6s077dCHQD2rDt78cox0BM17+ZE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnvGjWzmYrOkcKcyAHT2oOg+PJDBrF+en3CDQSXAKJ0QgEnSgy9gLVP43+SNPChCu
	 GVhaC8d60IQzMD4Uimg+L+fs/r5zvxRPaaqav1Tp4PRU2yUMgXi47tVZn4p/WNJw/0
	 8vVvtTUNiIi7IoBr05/okNCV0NlQjYajQSyZ6tRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F29F80059;
	Thu, 12 Nov 2020 18:09:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6D6F80059; Thu, 12 Nov 2020 18:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAE36F80059
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 18:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE36F80059
IronPort-SDR: zz2H5B5N4rzwY6Fox3yu1KZjoO89K4qn/euKK7RqDWAgHR6RoZdkJ5FIMr5gQABgJWofK/T12g
 R38ncXWX7/jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="157362560"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="157362560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 09:09:16 -0800
IronPort-SDR: oR+/K/eS+h/Vdkmq53R2yN6lCW3Gimr8B0CZk5waUExHqJqjyTqCmUc/IEToVnPzCQGbFCChBV
 G8U2h1HKWMzQ==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="323703418"
Received: from ngilda-mobl1.amr.corp.intel.com (HELO [10.212.196.157])
 ([10.212.196.157])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 09:09:15 -0800
Subject: Re: [PATCH v2 0/4] ASoC: SOF: Kconfig corrections
To: Mark Brown <broonie@kernel.org>
References: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
 <20201112164639.GC4742@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <982c23c2-5d61-33cf-062f-13e875337485@linux.intel.com>
Date: Thu, 12 Nov 2020 11:09:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112164639.GC4742@sirena.org.uk>
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



On 11/12/20 10:46 AM, Mark Brown wrote:
> On Thu, Nov 12, 2020 at 10:44:21AM -0600, Pierre-Louis Bossart wrote:
> 
>> v2: rebase to remove git am issue (worked with --3way before)
> 
> That only works if I have the blobs you were patching against in my git
> object store, if they're out of tree chances are my git repository will
> never have seen them.

Indeed, I just tried and you're right it doesn't work in a separate 
tree. I had no idea the --3way option relied on context/setup other than 
the patches being applied.
