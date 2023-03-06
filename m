Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19C6AC98A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2165B1134;
	Mon,  6 Mar 2023 18:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2165B1134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678122838;
	bh=+tAyT3UdCX36GB3CTDFNB7mti8+xcEFZDOP01rqyk9g=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WaVjpan0ignbTziC/Z3eMBODB8P1jX5Rx6ckRkoaD4KpmqpHiz0oxwHQAe75ir6KJ
	 6u+TE3D4+WxplLtXw2BVJScCFZF3cqBn7RImeNhKWZvbr6LO/MKMwSBYkrTjHXncTR
	 v/U4lQDTqd1S9hsmQZCy6K3luXI8gLg/WiirNXeQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 714E6F80236;
	Mon,  6 Mar 2023 18:13:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63CDBF8042F; Mon,  6 Mar 2023 18:13:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EACEF800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 18:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EACEF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T+38ATFZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678122778; x=1709658778;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+tAyT3UdCX36GB3CTDFNB7mti8+xcEFZDOP01rqyk9g=;
  b=T+38ATFZpfCRUQKMSDufTQVk43vyUamY8w93L//+D9Izm37MTKRUPegT
   4Z3bjP50VDICYhl2FBCq7XyFK26DsXWLCeE0zioCmFQVs0ciQ5gwE0xrO
   a4MfA0E8qTuYqb2Ix0/pmfYHI2nbtfl5PvvoFq424pTYwHemYlAbf3Ryn
   VeyEDfnn8nesgNNeBBtrMD5wRputWVGnXgpMZQpnzdf16UCkh7AuBSePL
   4jGg+g31GRQ4c4Ao68a6lLuYc6xUKxIFfBddiVV5/q1tf5b6kkgqXYYIO
   71cXOKkg7MtXvAqyfP9Tr9Ca8YSm8q5BeirsypBWrg/ySzqOQtMSGdmV9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316012883"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400";
   d="scan'208";a="316012883"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786309787"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400";
   d="scan'208";a="786309787"
Received: from malintan-mobl.amr.corp.intel.com (HELO [10.212.70.29])
 ([10.212.70.29])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:11:53 -0800
Message-ID: <6d7e2834-f90c-6175-6b69-3779b819eb0b@linux.intel.com>
Date: Mon, 6 Mar 2023 10:18:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: soundwire: user space test utilities
Content-Language: en-US
To: Muni Sekhar <munisekharrms@gmail.com>
References: 
 <CAHhAz+iuAYpxkpVGWp1g6u_j+wyB+vsFR8FGz1i_8G5TQhOVZw@mail.gmail.com>
 <9a68a02a-d724-8475-e6a0-082b20e93956@linux.intel.com>
 <CAHhAz+j88YwjBa2y2G8Hj20BksbeShf5TiuP3zqr6o5MBzvk_Q@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAHhAz+j88YwjBa2y2G8Hj20BksbeShf5TiuP3zqr6o5MBzvk_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CALBSXHNEKOJ2UVU2KOCJZ2GQB6R2N3W
X-Message-ID-Hash: CALBSXHNEKOJ2UVU2KOCJZ2GQB6R2N3W
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vkoul@kernel.org, sanyog.r.kale@intel.com,
 alsa-devel <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CALBSXHNEKOJ2UVU2KOCJZ2GQB6R2N3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/6/23 01:39, Muni Sekhar wrote:
> On Tue, May 31, 2022 at 8:44 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>> I am looking for any existing user space test utilities to test
>>> SOUNDWIRE SUBSYSTEM in Linux kernel. Can someone please point me to
>>> this.
>>
>> There are no specific userspace utilities to test the bus itself, you
>> can use existing alsa-lib/alsa-utils applications to play/capture audio
>> and check for events, i.e. aplay, arecord, speaker-test, amixer,
>> alsamixer, evtest
> alsa-lib/alsa-utils applications can be used for transmitting audio data.
> How to transmit non-audio data over the Soundwire interface?

There's no good answer to such a vague question. "non-audio data" can be
transmitted over the control channel or the "BRA" mode, if supported.
That's how drivers provide firmware or configuration blobs, but that's
internal to the kernel. There's no dedicated/standard interface to send
"non-audio data" from userpace to a specific device. It's not SoundWire
specific btw, you'd have the same answer for HDaudio.


