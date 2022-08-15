Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D7F592AEF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 10:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2553E;
	Mon, 15 Aug 2022 10:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2553E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660551587;
	bh=0F0ny3POo01TN8PrWXSpbHLH0QJ4GeZOsaTCgDcIiKw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AamEaeNiAC6940OZkxCawmryyix0xx7Opt9aSZTGGSa0wy9pjF2zs71RGq0YhrHHx
	 rXQi8JI7itChenLErTCnt6MfDtA6Tu9HgMpXYr8u7NHwyARKOFOgsL5H1aUw4v1N2g
	 IJPqowPHKNV5A8UBXucTevEGeQ/wjOI0fJNiB5rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD9BF80271;
	Mon, 15 Aug 2022 10:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1B73F8025A; Mon, 15 Aug 2022 10:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DF51F80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 10:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DF51F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P28PiMv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660551524; x=1692087524;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0F0ny3POo01TN8PrWXSpbHLH0QJ4GeZOsaTCgDcIiKw=;
 b=P28PiMv62gEbIqNGLHSk0HCnyjgQjsWbXcjCkRVbMa8pfW7Lv3PHWFNr
 3Vn6xczv4DJ5ZmRAklgMPjyrmEqeyNUVug5A8uiFrA0hZXAOUJRp8Fcwe
 cjpk1uBHtmhz3s9WmuzCKsFbX0mSCaZed/l/I52kQKamKxFsSLHz4i+E4
 /NMsF7CGW8TWpUFv7khJmSqzItXSZxsK+ICIkdjQZCsETGHobiVuERjhC
 /IGAhAfZPMTfEtqQv7guvcnzeYnxtB1TZcHw5dzJnjbaGXiuIt/m72VxW
 0jvc2r1721gXwF58Kw7F32OwsH62sRc7gfUhpVuwTh9zkxLl/crfjRx5T A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="290669540"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="290669540"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:18:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="674766312"
Received: from szujuchn-mobl1.gar.corp.intel.com (HELO [10.252.50.152])
 ([10.252.50.152])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:18:34 -0700
Message-ID: <741edbf0-5835-eb89-bb6a-69d7e0d00e36@linux.intel.com>
Date: Mon, 15 Aug 2022 10:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Khalid Masum <khalid.masum.92@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
 <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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



On 8/15/22 06:28, Khalid Masum wrote:
> On 8/15/22 00:46, Andy Shevchenko wrote:
>> On Sun, Aug 14, 2022 at 11:31 AM Khalid Masum
>> <khalid.masum.92@gmail.com> wrote:
>>>
>>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>>> populated with properties from FW node props. Make this happen by
>>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>>> the flag to store the multi_link value from intel_link_startup. Use
>>> this flag to initialize bus->multi_link.
>>
>> ...
>>
>>>          /*
>>>           * Initialize multi_link flag
>>> -        * TODO: populate this flag by reading property from FW node
>>>           */
>>> -       bus->multi_link = false;
>>> +       bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>>> +               == FWNODE_FLAG_MULTI_LINKED;
>>
>> NAK (as far as I understood the context of the comment and the change
>> itself).
>>
>> These flags are for devlink, we do not mix FW properties with those
>> internal flags anyhow. The comment suggests that this should be az
>> property. Also commit message doesn't explain the relation to devlink.
>>
> That is a good information to know. Thanks.
> 
> I shall try to find out if I can somehow get multi_link's value from
> fwnode in any other way and look into devlink in the process.
> 
> If you have any suggestions regarding this TODO, please let me know.

The suggestion is to remove the TODO and leave the code as is: the
capabilities enabled for multi-link are required as part of the
programming sequences, even when a stream uses a single link we still
use the syncArm/syncGo sequences.

Please don't change this.
