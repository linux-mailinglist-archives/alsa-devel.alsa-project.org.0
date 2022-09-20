Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E655BEDC2
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 21:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8862857;
	Tue, 20 Sep 2022 21:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8862857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663702138;
	bh=BPSk3xaKqA1O0i0vS+AuSZCTq9ok4SNEePVmebdaAnU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJ6uLmmCPIMmmZuQD3lN98XCR5tPbWS96+J5GlFDaySHiU6Wvd7XyMwz5hgLr7z5o
	 92sJAFklexkMEQY5SLJI3H6hpssdFwNvb8+/duDAY0MoNNkMGHydz3u/GRl5Gly4sG
	 UOv4bjm5GWDKoOosluaPr6nKg8AFKexuvcfMHF6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 376B6F80171;
	Tue, 20 Sep 2022 21:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E69C1F80155; Tue, 20 Sep 2022 21:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B09CF800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 21:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B09CF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gFCnW3xS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663702073; x=1695238073;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BPSk3xaKqA1O0i0vS+AuSZCTq9ok4SNEePVmebdaAnU=;
 b=gFCnW3xSiQ72Ya0pOnHpcKqZRQRijUTkzjeXjru9PG8GWa16S80KD+N7
 wRSoBhiXnLt8REv3JQfZevvrsOiKc7uqYGhMR+kbRwdQ87paUGIAf1C9I
 +NT/MkHBRO2ZGoC1cC2eQc4RVJnqKOTLD797UBIJMPjN6Rs88bGeym31F
 qUc3FYD0OstgJ8YnTtjf6rwuMOzhYFb+s1MLtfzl9G3tpSola/uMMKnYs
 0xmnV11q3KrWvQLQllSfEgwhEoDyiIGQN8yeP3H7i2Dhe96d4KSDwYMfV
 m7fVu0iNZ0uZfq4odYjPmLAs+mlgb7/u3FKi5q1SY6GG9id/ELqMKFWtv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="286866706"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="286866706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 12:27:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="794387565"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO [10.251.209.87])
 ([10.251.209.87])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 12:27:46 -0700
Message-ID: <2debeed4-c7fe-a078-949f-373abf73ca09@linux.intel.com>
Date: Tue, 20 Sep 2022 21:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: "no soundcard" for GeminiLake High Definition Audio (rev 06)
Content-Language: en-US
To: linasvepstas@gmail.com
References: <CAHrUA35O4Av+-+dbr69LrgHfXAWF1+d4xwJSF7k2Tx4YWrQ8kw@mail.gmail.com>
 <6a869047-4bb6-86a2-012b-1c5aed5a9d56@linux.intel.com>
 <CAHrUA36ibs+LJF1NrqNpzpAX-tD_BYjMWgVgCdyUaEyCOV=4xQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAHrUA36ibs+LJF1NrqNpzpAX-tD_BYjMWgVgCdyUaEyCOV=4xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 9/20/22 21:02, Linas Vepstas wrote:
> So ... good news and bad news.
> 
> On Mon, Sep 19, 2022 at 3:50 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> On 9/17/22 20:53, Linas Vepstas wrote:
>>> Kernel reports "no soundcard". Presumably, this is why I don't have
>>> sound. Let me dive right in with details:
>>
>>> FWIW, more about this hardware:
>>> -- It's a cheap laptop, from newegg, Ipason MaxBook P1X, 4-core Intel
>>> Celeron, 12GB RAM, great price.
>>
>> and no linux support. Yay.
>>
>> see https://github.com/thesofproject/linux/wiki/ES8336-support
> 
> Good news: The driver seems to be talking to the sound card.
> Bad news: No sound, except for a faint pop when muting, and when the
> driver closes the card. No error messages in dmesg.
> 
> So:
> -- I git cloned https://github.com/thesofproject/linux/ and git
> checkout es8336-v5.19
> -- make menuconfig to enable the es8336 modules, then make; make
> modules_install etc.
> -- copy the firmware into place as suggested by the wiki page
> -- enable dynamic debug as suggested by wiki pages
> -- reboot.
> 
> I see lots of debug messages in dmesg. None of them appear to be
> warnings or errors.
> But /usr/bin/speaker-test does not result in any sound. It does cause
> some dmesg messages
> to print when started, but none appear to be errors. Some more
> messages print when its stopped.
> /usr/bin/alsabat seems to think everything is OK.
> 
> The driver seems to be responsive, in that mixers and volume controls
> seem to actually talk
> to the driver, and "do things".
> 
> I'm stumped as to what to try next. Recommendations?
> 
> Should I be using github issues for this, instead of email? I'm
> thinking the answer is yes, I should.
> It's somehow easier to track issues via github.
> 
> alsoinfo at
>  http://alsa-project.org/db/?f=6f84cae386786c6ac8314c78cbaabde0abe33f3c

Yes, it's better to try and use GitHub to attach logs and results.

I am afraid you will need to find how GPIOs need to be tweaked with
sof_es8336 quirks to make sound work. There is a possibility that we
manage to reverse engineer what Windows uses with the _DSM method, but
it's only an idea at this point. It'll take a while to get Linux support
for all these platforms.

