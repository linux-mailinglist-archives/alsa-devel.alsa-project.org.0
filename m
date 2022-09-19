Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B795BC4BB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 10:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C712615E5;
	Mon, 19 Sep 2022 10:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C712615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663577504;
	bh=JRoj95ho0T4wLdf19SkxLigD87bfbLJi96G1FQfG/Xk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s14hgEMz8nIJUijlj3u1dd47/CrSIOs25qBJJV2Quwjt7bM6l7fdqx3GWXqzNWljV
	 RHCAKRY8jX5rBuPQuuAWswRVBs1wxkn/5N5iZIlR5/mkAcJzTVWq+57Q58KRqHmV9+
	 3fBQJdMju6Cha4ri05+u0/wxGZ0PiQUXsT0RGFxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311F0F8032B;
	Mon, 19 Sep 2022 10:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 234E1F8023A; Mon, 19 Sep 2022 10:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC937F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 10:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC937F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j5z/07ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663577444; x=1695113444;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JRoj95ho0T4wLdf19SkxLigD87bfbLJi96G1FQfG/Xk=;
 b=j5z/07kyKo3jsgPWT6IJXsed3xl8skBokfIVUGazgrJCbDJh2Oy5USqA
 I0tSLOUMXgAPQcZMpDjvFAfbzZws/4xWdb+TKEMKlVM1MySSRLqXQTrq1
 msvfKj/7NcNnj4b7zkj5MG0gMPj3PzpENR5ACGnc6SxH/bBDpQfSH2S5u
 N+zHz/7P5uuCq0XygklGEzG/LZBWGhfesIU59m51Ht7+9xXoDPJgxbTMZ
 xQE/tQoXg7VBPYKBEZf/8C69czjYrb+N/kNIvOex52ETN80umpl81wM3h
 6sJnz/iH+ESOjYjQ6IgWbSOpGwATPm68KtU2ugfLcpCyWCps0+cfN9r1Y Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="385634552"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="385634552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 01:50:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680760900"
Received: from ilick-mobl1.ger.corp.intel.com (HELO [10.252.59.91])
 ([10.252.59.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 01:50:38 -0700
Message-ID: <6a869047-4bb6-86a2-012b-1c5aed5a9d56@linux.intel.com>
Date: Mon, 19 Sep 2022 10:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: "no soundcard" for GeminiLake High Definition Audio (rev 06)
Content-Language: en-US
To: linasvepstas@gmail.com, alsa-devel@alsa-project.org
References: <CAHrUA35O4Av+-+dbr69LrgHfXAWF1+d4xwJSF7k2Tx4YWrQ8kw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAHrUA35O4Av+-+dbr69LrgHfXAWF1+d4xwJSF7k2Tx4YWrQ8kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 9/17/22 20:53, Linas Vepstas wrote:
> Kernel reports "no soundcard". Presumably, this is why I don't have
> sound. Let me dive right in with details:

> FWIW, more about this hardware:
> -- It's a cheap laptop, from newegg, Ipason MaxBook P1X, 4-core Intel
> Celeron, 12GB RAM, great price.

and no linux support. Yay.

see https://github.com/thesofproject/linux/wiki/ES8336-support
