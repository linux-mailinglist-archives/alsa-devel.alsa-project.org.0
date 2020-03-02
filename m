Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1D175F50
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 17:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51511694;
	Mon,  2 Mar 2020 17:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51511694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583165695;
	bh=YE7Ie0/eRxJGSVX6GTGUIKusvzqxdB2TGGpBhjxMkSw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hweHBfF5+Uy+ylOi0wyU63KobywhD5eSlk1nO1Qq+/JG7F6ApwBVvJ96CXcU1/bik
	 Tkw9NAeX1W8102pXXfKdgE6GPPK7WLElBPbEHfROUeSMHUJodz8ziBwodrNr4Qtcqh
	 Q2cFfRY23kJzR6C5KwdFFTICME7I+6IPpZjd6m7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D834BF801EC;
	Mon,  2 Mar 2020 17:13:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35F06F801ED; Mon,  2 Mar 2020 17:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8A5DF80130
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 17:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8A5DF80130
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 08:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="262818513"
Received: from mchandr7-mobl.amr.corp.intel.com (HELO [10.251.146.106])
 ([10.251.146.106])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2020 08:13:03 -0800
Subject: Re: [PATCH 0/9] ASoC: Intel: machine driver updates for 5.7
To: Mark Brown <broonie@kernel.org>
References: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
 <20200302131138.GD4166@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <131b84c8-7750-1fdd-5e6f-e26915fa9a46@linux.intel.com>
Date: Mon, 2 Mar 2020 08:52:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302131138.GD4166@sirena.org.uk>
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



On 3/2/20 7:11 AM, Mark Brown wrote:
> On Fri, Feb 28, 2020 at 05:11:55PM -0600, Pierre-Louis Bossart wrote:
> 
>> base-commit: 6941b0b5f919e9839e8c25efaeb53854efee14e5
> 
> Since for-next gets rebuilt all the time it's not ideal to base things
> off, for-5.x branches are better.  If you need dependencies it's fine
> though.

No dependencies expected, it's just to help buildbots understand what 
tree to use, and for-5.x is just fine indeed. Thanks for the feedback.
