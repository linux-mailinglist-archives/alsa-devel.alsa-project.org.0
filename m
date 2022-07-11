Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DD57073A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 17:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BDA7886;
	Mon, 11 Jul 2022 17:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BDA7886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657553905;
	bh=ONEW7Q1Bxq9BGBlTir4WXCjSBO3Udt9JligkBzUDx8g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sJKwXUTTqjS8UG8JKGYYfkV6aulnZnLjw0a6NWl01tECj4SoHSJCPC6G5r9jiJXeW
	 exC2eUFEG7U8pHAdx9sOQeFkMbU9DcAWlalUgfXIVjcgrAY9D1doTAhWi29F+7SsVe
	 9YPZXMokxTvZy1NMZSbT4z4fpaVy+9ODxrYWGg1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75342F80256;
	Mon, 11 Jul 2022 17:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62DCBF80163; Mon, 11 Jul 2022 17:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC6C5F800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC6C5F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DrYWJxNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657553840; x=1689089840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ONEW7Q1Bxq9BGBlTir4WXCjSBO3Udt9JligkBzUDx8g=;
 b=DrYWJxNO7yZCzKb1GJM7az1f43fKkFYTvTbEf/G9N83Fe+cr5BrBgrZs
 gX3dexYXl/kcHhG5kn92oAQKYdDctXG5O/rHouoQzcyqUOFjJMBplP5Kp
 PlA41HucqaWjH0EyR7HGpunp7JDvzkzBAhbu6v5e0i+d+p9xnNtB26SYQ
 UohWnhirBogYeqnBlH2ZGmKIuabREnpcYeW++MQ9CwfzQdJlg7dUGBgn/
 Re10sAKq7YZq3NFJ9nvv4DzETkUz3Lb9FS5UUzBhLTPqPwNrijPZ/phJ+
 2WTJWB8hOMyxWpXy4QOZEG+vZ0yUWlNi/Qp3/EOizwK5AeuPGKIvcYT3a Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285821520"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="285821520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 08:37:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="921827284"
Received: from jbeecha-mobl.amr.corp.intel.com (HELO [10.209.161.159])
 ([10.209.161.159])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 08:37:12 -0700
Message-ID: <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
Date: Mon, 11 Jul 2022 09:33:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Content-Language: en-US
To: Alex Natalsson <harmoniesworlds@gmail.com>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
 <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
 <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
 <CADs9LoOJu-NYxPhDL+N+xBtocPNw2y0nRHbSaO-NmGO284GPfA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CADs9LoOJu-NYxPhDL+N+xBtocPNw2y0nRHbSaO-NmGO284GPfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 7/9/22 06:19, Alex Natalsson wrote:
>>> +       if (!fe_substream) {
>>> +               dev_err(fe->dev, "%s: fe_substream not initialized\n",
>>> __func__);
>>> +               return -EINVAL;
>>> +       }
>>> +       if (!be_substream) {
>>> +               dev_err(be->dev, "%s: be_substream not initialized\n",
>>> __func__);
>>> +               return -EINVAL;
>>> +       }
>>> +
> 
> Will be this in upstream or needing bugzilla reporting message?
I created a patch based on this, see
https://github.com/thesofproject/linux/pull/3735

I am not sure however if this is the 'right' fix. There was a comment
from Peter Ujfalusi that a BE substream may be initialized later, but if
that's the case then the atomicity check that was introduced is done in
the wrong location.

Takashi, we could use your guidance here.
Thanks
-Pierre
