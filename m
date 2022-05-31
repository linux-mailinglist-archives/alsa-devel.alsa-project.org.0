Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80195393BD
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 17:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B951203A;
	Tue, 31 May 2022 17:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B951203A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654010189;
	bh=vmfw3gFQgEb/0Ni54wJyQYVaNjPec/+lIBNmSv8mczc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYmHfejYIltN4KvBC4pi3m9rVbqTwOPufo3It6ucALPhIKopg8h+FlEL2fpYWsjEA
	 +opvLBa5dHaUtn9p8YkrjG8UbDBj+PSCBJO2AFcXly9gRZzl+ItGfRzr7qGcznB0UE
	 O/peeRLVD36n/9ANCL3jyfXnm+V9/ZsvIRP9C7/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED19AF80520;
	Tue, 31 May 2022 17:15:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CDC7F80520; Tue, 31 May 2022 17:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D26B1F8051D
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 17:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D26B1F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HP/EMmJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654010096; x=1685546096;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vmfw3gFQgEb/0Ni54wJyQYVaNjPec/+lIBNmSv8mczc=;
 b=HP/EMmJRtKLGPK6AQT3dbFM9ts80fXpc0rQ2vtZXpZJ7TqjTyqCA6B26
 rH2smq9R7HtC4sHmXk4QhLlgXgVRMPTASE0zNm9RfpOSMyZ3uz0Et7M/x
 b/M7OnQqlTFTSiUZRwOZpi1vwPS9nkwsFZ+jOTBY7aDyMRP6AaMpNTSh2
 bmT1jmTep6pqLz/Jwqk4opfZLP+jMtWKBgMqOT+nKLsFrtETeQZT8xs7e
 IA1uSY4cvfFv7qWAWieEN/VPo9z+S85P1lIG+1YQxIK79q+JtuVTmX3P9
 XbkYgGH76+8+8zG4JIhad13KH/0IK/IruhnjhCmx9spxZsYlPk4PAHEgt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275369502"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="275369502"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 08:11:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="720349485"
Received: from kmoorti-mobl.amr.corp.intel.com (HELO [10.212.153.18])
 ([10.212.153.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 08:11:11 -0700
Message-ID: <9a68a02a-d724-8475-e6a0-082b20e93956@linux.intel.com>
Date: Tue, 31 May 2022 09:43:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: soundwire: user space test utilities
Content-Language: en-US
To: Muni Sekhar <munisekharrms@gmail.com>, vkoul@kernel.org,
 sanyog.r.kale@intel.com
References: <CAHhAz+iuAYpxkpVGWp1g6u_j+wyB+vsFR8FGz1i_8G5TQhOVZw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAHhAz+iuAYpxkpVGWp1g6u_j+wyB+vsFR8FGz1i_8G5TQhOVZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


> I am looking for any existing user space test utilities to test
> SOUNDWIRE SUBSYSTEM in Linux kernel. Can someone please point me to
> this.

There are no specific userspace utilities to test the bus itself, you
can use existing alsa-lib/alsa-utils applications to play/capture audio
and check for events, i.e. aplay, arecord, speaker-test, amixer,
alsamixer, evtest

The Intel manager driver provides a set of debugfs features to e.g.
inject a parity error, bad command or test for signal integrity with the
PRBS data generation, but that's low-level for hardware integration
purposes.

