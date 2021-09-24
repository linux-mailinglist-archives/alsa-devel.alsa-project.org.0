Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3109417709
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 16:48:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6331654;
	Fri, 24 Sep 2021 16:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6331654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632494883;
	bh=hb1sjvhxJf9eqA7FOP5+dIH/SOu/0Qxzud9PYbxLhiA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmUim5KAvnSJYi5uYgWYkBb1Kk7/f1doOgKLlXb8/SGHBADjKc07m4Vv4VRsxPBfB
	 pBRUys0B3JD0BOnNgOq2GiXzQERA2tLK9fRiF37t/PGKosdyUv3JJBM1WLx2+5RpsC
	 YBzAflV7Jhs4vnZR04PoOtS6ufrjNHYUSsQBRl0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9442DF8025D;
	Fri, 24 Sep 2021 16:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B1B0F802A0; Fri, 24 Sep 2021 16:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AD06F800BC
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 16:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD06F800BC
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="222198115"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="222198115"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 07:46:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="551835095"
Received: from bordone-mobl1.amr.corp.intel.com (HELO [10.209.164.235])
 ([10.209.164.235])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 07:46:30 -0700
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
 <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
 <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
 <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c34d03ff-f349-724e-0dcf-7893f3622cd9@linux.intel.com>
Date: Fri, 24 Sep 2021 09:46:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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


>>>> +/* Module information */
>>>> +MODULE_DESCRIPTION("MT8195-MT6359-RT1011-RT5682 ALSA SoC machine
>>>> driver");
>>>> +MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
>>>> +MODULE_LICENSE("GPL v2");
>>>
>>> "GPL" is enough
>>>
>>
>> I see many projects use GPL v2 here, and all mediatek projects use
>> GPL
>> v2, too.
>> I'm not sure which one is better.
>> Do I need to modify this?

See
https://www.kernel.org/doc/html/latest/process/license-rules.html?highlight=module_license#id1

Loadable kernel modules also require a MODULE_LICENSE() tag. This tag is
neither a replacement for proper source code license information
(SPDX-License-Identifier) nor in any way relevant for expressing or
determining the exact license under which the source code of the module
is provided.

“GPL”

Module is licensed under GPL version 2. This does not express any
distinction between GPL-2.0-only or GPL-2.0-or-later. The exact license
information can only be determined via the license information in the
corresponding source files.

“GPL v2”

Same as “GPL”. It exists for historic reasons.

So "GPL v2" is not incorrect but for new contributions you might as well
use the recommended tag.
