Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF13220E2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 21:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9031668;
	Mon, 22 Feb 2021 21:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9031668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614026498;
	bh=ghmGdZCW1rwRFidhZCC6CYoVYZU694/md2AvoE3pUak=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uLjSQN+y6QyV7Mbg0P/Qi9lAneCheJJDVxpH/z0FCgA0cynCK+T3KWQepqW7fNn1N
	 OUDZG+i6A2NmHtsxTJzGo1io00Fg7QT4zKRuZLH1/IJ6u3G+IavCInA1LmbU9yXMcH
	 J4L19Y9hHtwlr/hlFD3bRTGUtkqrnOjx58gxNhmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3916F80082;
	Mon, 22 Feb 2021 21:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA7CEF8016C; Mon, 22 Feb 2021 21:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE78F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 21:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE78F800CE
IronPort-SDR: tmh3UFR1M9eqwzuzFd8XitcEdo2uNdz80ro5m2SMSKJkoCl6nv0CVE0nTsWF2LiVIP+HIXxFzn
 8P5YK7bNFXgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163799922"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="163799922"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 12:39:55 -0800
IronPort-SDR: 7RrYhDI6iQ6R8mYw9lW/5bEKPpCe26gvCzDezll27AuQkBhJM6W6NlE1JFHjmC5xrTXUaiZYOd
 39xrjH2ikjsA==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="403205156"
Received: from aaslanpx-mobl.amr.corp.intel.com (HELO [10.209.48.58])
 ([10.209.48.58])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 12:39:55 -0800
Subject: Re: (subset) [PATCH 0/6] ASoC: samsung: remove cppcheck warnings
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <161401004266.2538.5738460015320431431.b4-ty@kernel.org>
 <CAJKOXPe6LZuuL0ntPAEwudEtMcGreBLMHzBFg5jw_3=DpG8KVA@mail.gmail.com>
 <20210222201929.GF6127@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bde347e4-bbe3-889a-e0b8-8e2db827802a@linux.intel.com>
Date: Mon, 22 Feb 2021 14:39:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222201929.GF6127@sirena.org.uk>
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



On 2/22/21 2:19 PM, Mark Brown wrote:
> On Mon, Feb 22, 2021 at 06:31:15PM +0100, Krzysztof Kozlowski wrote:
> 
>> Hmmm, I had comments about this one so it should not have been
>> applied. The check if (ret || !args.np) is still not good (or
>> confusing) because args is an uninitialized stack value.
> 
> Ah, I saw the "this is actually a fix CC stable" bit, the bit saying
> there were issues was hidden - it looked like you'd just not deleted
> context.

If you give me about an hour, I can resend a v2 series that includes 
Krzysztof's tags and provides the correct fix for this patch5.
