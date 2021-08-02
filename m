Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1AF3DDB2D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D330C167D;
	Mon,  2 Aug 2021 16:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D330C167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627915062;
	bh=GNhJ0TESZX5tVwo7Nfrgmx0p+BEyAXzayroPEP+v1tw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXA8IHDZ6XnCEzf4LF7phWB/OMNp8pHe5Z3ckOBSFVfTSkTyRsDP8cv6GDeyKenUn
	 hvuvfkOoCWHkQ0dFZQIM006yg553TTOFZAdAQeEUXWYbTWLzZn+EGGlxL0xTmAm/y+
	 8lMuPjwIhu+wSq5wCP1d8la6DCi/UKRRmDXHsMBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43EBFF800BF;
	Mon,  2 Aug 2021 16:36:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C9F6F8025F; Mon,  2 Aug 2021 16:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBB44F8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBB44F8014D
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="213499919"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="213499919"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 07:35:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="436683193"
Received: from skshirsa-mobl1.amr.corp.intel.com (HELO [10.209.189.56])
 ([10.209.189.56])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 07:35:27 -0700
Subject: Re: [PATCH 4/6] ASoC: Intel: bytcr_rt5640: Add support for a second
 headphones output
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210801210431.161775-1-hdegoede@redhat.com>
 <20210801210431.161775-5-hdegoede@redhat.com>
 <101f39fb-03e3-5512-a9fc-2c569fcb98fc@linux.intel.com>
 <a373f102-fe2a-3f64-4023-497a072fc0d5@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ae8cbdab-bc35-3245-ea52-45404451d1e8@linux.intel.com>
Date: Mon, 2 Aug 2021 09:35:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a373f102-fe2a-3f64-4023-497a072fc0d5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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



> I've also figured out how jack-detect works, since the codec's GPIO1 is used for the external-hp-amp enable, the jack-detect signals are directly connected to the Bay Trail SoC's GPIOs:
> 
>   -gpioget 'INT33FC:02' 14 && gpioget 'INT33FC:00' 0 && gpioget 'INT33FC:00' 3
>    Nothing inserted: 1 1 0
>    Headset  in dock: 0 1 0
>    Headphon in dock: 0 1 1
>    Headset  in tabl: 1 0 0
>    Headphon in tabl: 1 0 0
>    Conclusion:
>    GPO2 pin 14: !jack in dock
>    GPO0 pin  0: !jack in tablet
>    GPO0 pin  3: 1 when jack in dock with no mic

I am a bit confused about the logic. Could you have a case with 1 1 1
(separate headphones in tablet and dock jacks)?

> 
> And I believe that the mic on the tablet jack can be detected using the normal micBIAS over current detection which is normally also used.
> 
> This will require some special jack-detect handling inside the machine driver for this model. I plan to also add support for this when I have some time to work on this.
> """
> 
> So ATM this requires an explicit user-choice, but I plan to add support for
> jack-detect on both jacks when I've some more time to work on this.

Thanks!
