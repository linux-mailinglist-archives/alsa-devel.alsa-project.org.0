Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801E4B2907
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 16:25:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27CB11940;
	Fri, 11 Feb 2022 16:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27CB11940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644593103;
	bh=CrPq5YS+lxN16TxZOXpw0gfG9SvjUFsH6sQxn1HVE3c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1fXYZ7ciBoC4eo/AhB9AGPdbKMbPn2noE6D7n3ueH9GifqU8FaoNMa5ushTFWb24
	 0QtfTH093m+IejhcN4AXXLq8vsp5SVOllx/MTacq8pUiSQVY06ZJQZl32hS5L1iA0P
	 HnGUQn86+Ov2rp+4DXd1Bof42N/hVXHnbKgA4zGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 908B8F8013D;
	Fri, 11 Feb 2022 16:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A84F80139; Fri, 11 Feb 2022 16:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1656EF80054
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 16:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1656EF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SC86aybW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644593034; x=1676129034;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CrPq5YS+lxN16TxZOXpw0gfG9SvjUFsH6sQxn1HVE3c=;
 b=SC86aybWXG+MiHxUci9Y8NG/e+8MFAfvOtTntOl9kAttcXoat96aXKEC
 k8zVXwDVkAIG2pNcyysu07pMb7mzV1TRcOu45tdoquWRv1dr2JXwD1NVs
 6yA4thFS/oQrEfRL8qWQV9e9aFYtJR0ZZUlGDAQJFd/LOllLw+3bAlomr
 /3xcK1lkCTMYKtc4DpnTqxEgB4FUaV1uNB8t2AArpT4wsWd2y5FZoJYdI
 wwjpVvy80BVWusGyRsl0VfZgoQRIpepKWOKAC9zolrDCt3cOksGciJtVU
 ofiQzOIqFnGItCaUjc7P1j+38hOQc70t+NOgdqC1hUjGFfFp38f9NwvO6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="274306850"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="274306850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:23:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="526988681"
Received: from nsnead-mobl.amr.corp.intel.com (HELO [10.209.133.241])
 ([10.209.133.241])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:23:47 -0800
Message-ID: <9d90f640-041c-b29b-6161-c35c78d9250a@linux.intel.com>
Date: Fri, 11 Feb 2022 09:23:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
 <23f36ba1-277c-6998-f569-2861887720dd@intel.com>
 <4d90d851-753e-3e6d-b51a-eefb2159a48c@linux.intel.com>
 <1dab33cb-c20e-1134-cdf2-e03209018318@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1dab33cb-c20e-1134-cdf2-e03209018318@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 cujomalainey@chromium.org, lma@semihalf.com
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


> Again, we are not trying to force-expose stuff which does not work. In
> majority of the cases, non-HDMI codecs we're dealing with notify about
> just single analog endpoint. For now, it's 100% of the cases, but I'm
> aware of fact that RVPs and a dozen of Dell/Lenovo/Acer laptops do not
> equal to entire market.

We are in agreement, but since we don't have any ability to test those
alt/digital parts my take is 'don't even bother about them'.

> Remember that you can always use topology to "gate" userspace from
> streaming through endpoints which we do not work. And right now, we are
> working with topologies supporting single endpoint for non-HDMI devices.

May I ask how you 'gate' parts of a topology? Or did you mean that you
use different topologies?

> 
> So, this is a clear upgrade when compared to Analog/Alt
> Analog/Digitalh-hardcoded configuration used currently. That's on top of
> aligning with hda legacy behavior.

Agree, but it still leaves the door open to exposing those paths which
may or may not work - no one has ever tested them. It's better IMHO to
only allow for the analog path. If we can detect the presence of this
path, great.
