Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E9422BD5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A7B215E2;
	Tue,  5 Oct 2021 17:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A7B215E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633446465;
	bh=JKOjCGY893z/0pQ41HgosIfukEbjgM6S8Ecj7Kz1ZNk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2H9LRe1Xh+pWk4pWXMZmqsAdAXFuwP2GsGQqcW4i/lyhQoXsF45im7gcOcaVBVLy
	 rF7PExsrM0Q2W0vvoejdzth6KrmOeaJJdPRCj0gTKVjaPrQfHwdXJGPWQtKPqKUaj7
	 g5WR8d1beoSMB8Vx/wO/0sl19aoMT1FXg+yMg1zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D27BF80259;
	Tue,  5 Oct 2021 17:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF036F8027D; Tue,  5 Oct 2021 17:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B11F8020D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B11F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="249027162"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="249027162"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 08:04:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="523803649"
Received: from emccutch-mobl.amr.corp.intel.com (HELO [10.212.34.81])
 ([10.212.34.81])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 08:03:59 -0700
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
 <a2b6a9c7-2191-4bc9-b03b-3b22b495a4be@linux.intel.com>
 <2c18ff0c-cd24-356c-0104-086837ed7ff0@codeaurora.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d485af5f-4dfb-df08-9a22-901b7534ca3b@linux.intel.com>
Date: Tue, 5 Oct 2021 10:03:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2c18ff0c-cd24-356c-0104-086837ed7ff0@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



>>> +        ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev,
>>> swrm_hctl_reg, 0x4);
>> if (!ctrl->swrm_hctl_reg)
>>      return -ENODEV;
>>
>> ?
> I think here error check is not required, as this change is required
> only for soundwire version 1.6 and above.

My comment had nothing to do with versions, it's just that ioremap can
fail and in general it's wise to test for errors...
