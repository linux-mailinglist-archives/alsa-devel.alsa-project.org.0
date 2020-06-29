Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256620D06F
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 19:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B643D1655;
	Mon, 29 Jun 2020 19:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B643D1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593452212;
	bh=45RIfEZMWZC//Hm4ceQnsjkCLVL8hqLfuyt31sfCZYc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ulJ0pesbkXKFZDja63KPFd3hTR3dSLybK5Ql8O8JAV3WZUk+S1V2PxohW/awqjrI/
	 vaLJQYNnnUrmM/IIhqnjh3nvntG5j5qJw6rCx/YigYmUJKIZOJ5gasEVTxsuv4FYDq
	 jmHNJLO1eDt3blS56f+cuPY1W8FM3OY3fO39G5nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B93F802A8;
	Mon, 29 Jun 2020 19:34:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DEC2F8022B; Mon, 29 Jun 2020 19:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27E35F8020C
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 19:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E35F8020C
IronPort-SDR: YPaOJer0I3jj6jF8BcUbNJ831XUsO/xSqWpoGaLDjnY12LHgNCXIhMVOYp0Qz8lV4P7lZ/FoiX
 AcqBPJtlEsjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="147561802"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="147561802"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:34:02 -0700
IronPort-SDR: EVrjNdNw3IE1lpT0vAYsW9gkxnOwR3X9jbciFPOmmvsZ0rGM8++wVIMbWvMen0BpJarEJpT3BL
 2a6AHWUG6e/g==
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="318665445"
Received: from mmmille1-t460s.amr.corp.intel.com (HELO [10.255.230.126])
 ([10.255.230.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:34:01 -0700
Subject: Re: ASoC: rt5670/cht_bsw_rt5672: Some bugfixes and cleanups
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2dda2d0a-2aa5-d9a5-d214-6ab0259de43c@linux.intel.com>
Date: Mon, 29 Jun 2020 10:14:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200628155231.71089-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 6/28/20 10:52 AM, Hans de Goede wrote:
> Hi All,
> 
> This series is mainly the result of me working on fixing the extra
> set of speakers in the Lenovo Miix 2 10 kbd dock not working with
> Linux (patches 1 and 3) while working on this I noticed some other
> bugs (patches 2 and 4) and I also ended up doing some generic
> cleanups (patches 5 and 6). For patches 1-3 or 1-4 it would be
> nice it they can go to a future 5.8-rc# 5-6 are mostly -next
> material.

I added a minor comment on patch 1 but is a good set of changes, thanks 
Hans!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

