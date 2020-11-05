Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854E2A8369
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA2BA1607;
	Thu,  5 Nov 2020 17:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA2BA1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604593416;
	bh=kXLDNUI+CxKe9tjwC47pb/KDZMpFwU1CQMpkL95gTbU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqdRxuhurJBBrsWhBW9yO3II+wr3fv7Sm2oVHhG8izo8Cd8Hax9VPCF9fQRLVrI9T
	 ZNOOgrOHh4eEb0YFm4aoHktNwHG+rH2zi5dXh0bcufEpp/xj/dJgvMPw4g92I/oY8s
	 X+HCpDqp8K8xsDaowHMtzLkkXBREq76HcM5H5MOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA31F80150;
	Thu,  5 Nov 2020 17:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F5DF80171; Thu,  5 Nov 2020 17:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B12F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B12F800EC
IronPort-SDR: x/jcNy1kyy5/0S89845FerIj2PpaIFuZ2z02RqtliyZPVOfwTnob0PngLOiAYFDzFNSczRkqbQ
 OkBFfMLuoFGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="254117005"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="254117005"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:21:49 -0800
IronPort-SDR: hl4GtaSibPgUhGLw5GW27FY4FYOcw6yn18XocQQCoz5se2eglotbMRBQ9HPFtevTNCtD0lqu+z
 LIdp+DiJ71Zw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="539466778"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO [10.254.6.114])
 ([10.254.6.114])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:21:47 -0800
Subject: Re: [PATCH v3] ASoC: rt1015: add delay to fix pop noise from speaker
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20201105030804.31115-1-jack.yu@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fea8c842-f842-4186-0b53-2b92260553d7@linux.intel.com>
Date: Thu, 5 Nov 2020 08:31:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105030804.31115-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, tzungbi@google.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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



On 11/4/20 9:08 PM, jack.yu@realtek.com wrote:
> From: Jack Yu <jack.yu@realtek.com>
> 
> Add delay to fix pop noise from speaker.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

