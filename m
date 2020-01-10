Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6713664A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 05:44:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6E417AD;
	Fri, 10 Jan 2020 05:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6E417AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578631456;
	bh=zdscDpnJvOySGhQBddd+A/GKv2ReCO1SvnqIdJBt6hE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uiCJFsgqiX4+JsbZHZu4l1+Hz3BsnM5Z1XEzw5y6F0actiJR0t26dmXmwTdjSe5Q0
	 l2FlwcF/nD2mL3ROPZXiyzNTPNULtqavUAARlRwuOZlSsju8MdDSKUA0x22s7OauR+
	 9m/IAFPF6XEKDR9w/aRtyJ+PYINSGESn+4Hio7tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24680F8010B;
	Fri, 10 Jan 2020 05:42:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB594F8011C; Fri, 10 Jan 2020 05:42:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B7CEF800E4
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 05:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B7CEF800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 20:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,415,1571727600"; d="scan'208";a="224085721"
Received: from cgrageda-mobl.amr.corp.intel.com (HELO [10.254.8.138])
 ([10.254.8.138])
 by orsmga003.jf.intel.com with ESMTP; 09 Jan 2020 20:42:23 -0800
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20200110014606.17333-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <708f809f-f2f5-d24b-9484-2b815d3d8f41@linux.intel.com>
Date: Thu, 9 Jan 2020 22:42:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110014606.17333-1-shumingf@realtek.com>
Content-Language: en-US
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt1308-sdw: add rt1308 SdW
 amplifier driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/9/20 7:46 PM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This is the initial amplifier driver for rt1308-sdw.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

this driver has also been tested extensively by Intel using Realtek 
3-in-1 eval boards connected to CML/ICL/TGL reference platforms, as well 
as form-factor devices, so

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
