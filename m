Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C4585475
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 19:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2178E1636;
	Fri, 29 Jul 2022 19:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2178E1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659115605;
	bh=vj9Gd3F0ZFA+lxnvVFnGuGBsXg4J6Y0l+pUnAC5iJsg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4wgxDxUIUXVlaczoF8/7A1F7NcJR9n/DLM4Rpe6+u7pt0XlV04zL5xag1fE1Z54A
	 FHPwVSAEy7PigbdQhboJEixPcWvVv+V2tSS46JEeaCqp50CaWJXrlSRppvL+QXAZrn
	 A/otzlmPsUlavXT+ZtUuDVjwMpDMSPixgKnw8t3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92267F80430;
	Fri, 29 Jul 2022 19:25:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4DBCF8049C; Fri, 29 Jul 2022 19:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,NO_DNS_FOR_FROM,PRX_BODY_21,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 029D5F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 19:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029D5F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ig8gS6dx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659115543; x=1690651543;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vj9Gd3F0ZFA+lxnvVFnGuGBsXg4J6Y0l+pUnAC5iJsg=;
 b=ig8gS6dxEWunignipwLlmHNh9kCyChXG1oYkmLHKlmjtjH6or4HsPtCV
 5pWrbXberk9Ct0xEcZwMA1/+4hBlYV0P8xVk8F0vPRgbLm8GnLc964Fqt
 hA0FQ2Sai+mmuwZ9XNzv5y9nFnu+cDnOxqgDaVsffYOAU8v8oE03BV2Dt
 WSQGoFyQlPtNDN9NY1lSQ5K7l4GSWJgzPqjPemrwovl7S9SB3lnV/wGhb
 0So+cyN4C5Ohqef/4CE17slP2Mt9+XbAg3YFw7qv3jhZU+a1H3nEdIl2B
 PQs6aCTt4ol8aYnepXKzjOCCebbmLr9nJVs47LGiNApZtnODYqC1eEwsc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="268580557"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="268580557"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 10:25:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="605026163"
Received: from kaholo-mobl.amr.corp.intel.com (HELO [10.212.97.86])
 ([10.212.97.86])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 10:25:35 -0700
Message-ID: <ac5a7524-4f9a-dc10-cd5e-b2dd5a478d75@linux.intel.com>
Date: Fri, 29 Jul 2022 12:25:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
 <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
 <YuP0Ffs3G7ZBR0AC@kroah.com>
 <cfacb124-a9ff-0a93-8f92-93d164b15966@linux.intel.com>
 <YuP2pjhyKTTfpXQq@kroah.com>
 <5caffe2a-f5a6-e312-a564-5fe29c4e2323@linux.intel.com>
 <YuQMYRYFo9gTk1yL@kroah.com>
 <701aa1ba-9b25-51eb-8bd7-2389b501d79c@linux.intel.com>
 <YuQVrLEqPMu1V0zJ@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YuQVrLEqPMu1V0zJ@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 7/29/22 12:15, Greg Kroah-Hartman wrote:
> On Fri, Jul 29, 2022 at 11:46:32AM -0500, Pierre-Louis Bossart wrote:
>>
>>>>>>> That should be fine, tools should just be looking for the attributes,
>>>>>>> not the existance of a directory, right?
>>>>>>
>>>>>> The idea what that we would only expose ports that actually exist.
>>>>>> That's helpful information anyone with a basic knowledge of the
>>>>>> SoundWire specification would understand.
>>>>>
>>>>> Is "dp0" a port?  If so, why isn't it a real device?
>>>>
>>>> The SoundWire spec defines the concept of 'data port'. The valid ranges
>>>> are 1..14, but in all existing devices the number of data ports is way
>>>> smaller, typically 2 to 4. Data ports (DPn) are source or sink, and
>>>> there's no firm rule that data ports needs to be contiguous.
>>>>
>>>> DP0 is a 'special case' where the data transport is used for control
>>>> information, e.g. programming large set of registers or firmware
>>>> download. DP0 is completely optional in hardware, and not handled in
>>>> Linux for now.
>>>>
>>>> DP0 and DPn expose low-level transport registers, which define how the
>>>> contents of a FIFO will be written or read from the bus. Think of it as
>>>> a generalization of the concept of TDM slots, where instead of having a
>>>> fixed slot per frame the slot position/repetition/runlength can be
>>>> programmed.
>>>>
>>>> The data ports could be as simple as 1-bit PDM, or support 8ch PCM
>>>> 24-bits. That's the sort of information reported in attributes.
>>>
>>> Why not make them a real device like we do for USB endpoints?
>>
>> I don't see what adding another layer of hierarchy would bring. In their
>> simplest configuration, there are 6 registers 8-bit exposed. And the
>> port registers, when present, are accessed with a plain vanilla offset.
> 
> Who uses these registers?

The bus layer. When a 'stream' is created, the 'bit allocation' will
define who owns which bitSlots in the frame and the registers will be
programmed. The bit allocation may be dynamic or fixed depending on the
host.

>>> What uses these sysfs files today that would be confused about an empty
>>> directory?
>>
>> That's a good question. I am not aware of any tools making use of those
>> attributes. To a large degree, they are helpful only for debug and
>> support, all these read-only attributes could be moved to debugfs. That
>> could be a way to simplify everyone's life....
> 
> That would be much nicer, put it all in a single debugfs file and it
> would be so simple.
> 
> What attributes could we do that for?

All of them really - except maybe the device number which could be used
to figure what the device is when looking at power status and other
'standard' sysfs attributes. sdw:3:025d:0714:01 is not really
user-friendly, device_number 1 is.
