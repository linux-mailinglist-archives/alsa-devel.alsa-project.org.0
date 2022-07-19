Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417057A267
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 16:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D533D16DF;
	Tue, 19 Jul 2022 16:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D533D16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658242272;
	bh=hHKtJ6+Dxw4RZU20X6JIbyKBSqc3/xUJvDskXuGrQIc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4wDL7Gy4CFM4NUXHjm+BJRFkYiIcJMsXu3EtYpHqFP7+VCEB3qTkPjaZ8iIVDuw1
	 WADe67M1W3gfKHzl/y9NhfNci5YkrvOKdGZCQ6TM4+QK3aDSKAvXe7XqFF1MF6KDzm
	 AjXVp07F9lESzf4DcOp18eJ2OcgwtFVTsR4O8fNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60556F80118;
	Tue, 19 Jul 2022 16:50:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6AE5F801EC; Tue, 19 Jul 2022 16:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE5CF80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 16:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE5CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hnyCYqyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658242207; x=1689778207;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hHKtJ6+Dxw4RZU20X6JIbyKBSqc3/xUJvDskXuGrQIc=;
 b=hnyCYqySHyC/UJPKVWRZdch7c+JPac8zQvGxo9g7Dom5I/YW7C83jMMo
 GyFPs8k9BidFNGcSwhrH5IL3Gf6xCP9ekqL4DOvAhcF8HOa27d2zJSpZl
 mqVsSjWuefSejaV8SIHRRq/MTfvR1IYALfJkdUHCbr4wyuWepecCLOUXd
 hiKnew0FlZ4UtAzjyCJLyjBofQLSTHRXKbeKS1VF7s5nTHvOKdne3+6FQ
 4Md1HqTMWo7ywLu+HQffjOUHJvw6eDqGTubK0U5BtpNm+B1ohXPRLQj/3
 msePnt2dhDvpuW3N1/FzuYnvXyc8dIkeIg6GJOzbBBOP2Hxq3xhdmRc+R w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="348202553"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="348202553"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:49:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="594852649"
Received: from kckollur-mobl1.amr.corp.intel.com (HELO [10.212.118.182])
 ([10.212.118.182])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:49:45 -0700
Message-ID: <95fc3b8f-7556-371d-2817-7e0d811de24a@linux.intel.com>
Date: Tue, 19 Jul 2022 09:49:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20220718072144.2699487-1-airlied@gmail.com>
 <YtWeUOJewho7p/vM@intel.com>
 <CAPM=9tyhOfOz1tn7uNsg_0EzvrBHcSoY+8bignNb2zfgZr6iRw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAPM=9tyhOfOz1tn7uNsg_0EzvrBHcSoY+8bignNb2zfgZr6iRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Network Development <netdev@vger.kernel.org>,
 "dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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



On 7/18/22 19:29, Dave Airlie wrote:
>>> +* Firmware should be versioned with at least a major/minor version. It
>>> +  is suggested that the firmware files in linux-firmware be named with
>>> +  some device specific name, and just the major version. The
>>> +  major/minor/patch versions should be stored in a header in the
>>> +  firmware file for the driver to detect any non-ABI fixes/issues. The
>>> +  firmware files in linux-firmware should be overwritten with the newest
>>> +  compatible major version. Newer major version firmware should remain
>>> +  compatible with all kernels that load that major number.
>>
>> would symbolic links be acceptable in the linux-firmware.git where
>> the <fmw>_<major>.bin is a sym link to <fwm>_<major>.<minor>.bin
>>
>> or having the <fwm>_<major>.bin really to be the overwritten every minor
>> update?
> 
> I don't think providing multiple minor versions of fw in
> linux-firmware is that interesting.
> Like if the major is the same, surely you always want the newer ones.
> As long as the
> ABI doesn't break. Otherwise we are just wasting disk space with fws
> nobody will be using.

It was my understanding that once a firmware file is in linux-firmware
it's there forever. There are tons of existing symlinks to point to the
latest version, but the previous versions are not removed/overwritten.

see random examples:
ls -lR /lib/firmware  | grep t4fw
ls -lR /lib/firmware  | grep fw_release


