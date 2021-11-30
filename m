Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B37463AB2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 16:54:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734262292;
	Tue, 30 Nov 2021 16:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734262292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638287687;
	bh=4BYbS6lQsqUz2uu63Jy2ok0U2+qP+aw+rFsNaLUBRGY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/b/OUZmWxhSMipmMdgPsfsybEg/zGAD3DxfpFRS4+pyT3DdJjIs4pv/bjYi25DCw
	 rZ6ewiY/Fhwn7EhgR20ppC3pnK2ueEeyirPDX81DScuYsWlZKeUQVlYnLa25qa1VQb
	 OGnhKMhR5G3T7901lJUIAcxbsH/gNIAFYMXjaYiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D4D9F8028D;
	Tue, 30 Nov 2021 16:53:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7209CF80290; Tue, 30 Nov 2021 16:53:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0711F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 16:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0711F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236186087"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="236186087"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 07:53:15 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="601551502"
Received: from vschult-mobl1.amr.corp.intel.com (HELO [10.212.122.173])
 ([10.212.122.173])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 07:53:14 -0800
Subject: Re: Dual simulatenous output on single card not recognized
To: Eldred HABERT <stuff@eldred.fr>, alsa-devel@alsa-project.org
References: <8b18294d-d082-2be4-18ba-39b4ec4b9e91@eldred.fr>
 <cdafcbb1-9eeb-6337-ee2b-d6a168996153@linux.intel.com>
 <a006b912-71e1-548a-22ef-8f315e3be281@eldred.fr>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8dc22d20-9d16-6114-03d1-da22f72ac81c@linux.intel.com>
Date: Tue, 30 Nov 2021 08:40:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a006b912-71e1-548a-22ef-8f315e3be281@eldred.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 11/30/21 1:44 AM, Eldred HABERT wrote:
> 
> On 29/11/2021 19:18, Pierre-Louis Bossart wrote:
>> You may want to run 'alsa-info' and provide a link to the uploaded
>> results. It's hard to comment without any information on 'hardware
>> configurations like mine'.
>> Thanks.
> Sorry, I thought the output of `aplay -l` would be enough. The results
> are here;
> http://alsa-project.org/db/?f=bc64421df5181d1ba3bdf157c40d06dd52a7224b

ok, so you have a CNL-H chipset and no digital mics, so the legacy
HDaudio driver is used (not SOF w/ the DSP enabled).

There's nothing at the driver level that would prevent the use of
independent outputs, such as built-in speakers and HDMI concurrently.
You can verify this assertion by opening different terminals and trying

speaker-test -Dhw:0,0 -c2 -r48000

speaker-test -Dhw:0,3 -c2 -r48000 (use 0,7 8 9 10 as needed, depending
on which device is tagged as connected to a valid HDMI output in the
mixer 'Jack' status)

I am not sure though how the Gnome settings would let you do this. This
seems like a user-space problem to me?

