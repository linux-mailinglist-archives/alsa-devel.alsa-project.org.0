Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00BD2747B3
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 19:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35424172F;
	Tue, 22 Sep 2020 19:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35424172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600796919;
	bh=oenH9vdrSeEwpGAAQSosUc2ancjCFiFt+bS7Q3FodvE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qH4glFnE3SpYeK3sd56rh1yEu+Gi+DT6ng0Ugd/qkC8RuttHampGazhZn2zlUzbvG
	 E43+ixqynlL33f2LTRRzsY1gI1L77MpApw+6smOrrGsJUMAM2PAnW3//FhIUu/fc3f
	 P4pDb8tRuXSj7PqVupVKdeXZhZBkQGeJPlPdGWnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61041F80232;
	Tue, 22 Sep 2020 19:46:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7222AF80232; Tue, 22 Sep 2020 19:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE19F800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 19:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE19F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WzHe7Ivk"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41889235FD;
 Tue, 22 Sep 2020 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600796808;
 bh=oenH9vdrSeEwpGAAQSosUc2ancjCFiFt+bS7Q3FodvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WzHe7IvkaPznnNvUEzD3HwVFa5e3MVZPSx77gO0aZ7obkzaUe+1w5lnx9cjPynG49
 S4IcH0FK0xhrWB4p729EYloa8Vtdxk0cBD/6um7Dk3R9Tt+j56tb1o176lW6K32VR1
 PpShnQ1Ju8htQOEUxZl8dNJGKjSJbShLV1eRTv3s=
Date: Tue, 22 Sep 2020 13:46:47 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.8 03/20] ASoC: wm8994: Skip setting of the
 WM8994_MICBIAS register for WM1811
Message-ID: <20200922174647.GP2431@sasha-vm>
References: <20200921144027.2135390-1-sashal@kernel.org>
 <20200921144027.2135390-3-sashal@kernel.org>
 <20200921150701.GA12231@sirena.org.uk>
 <20200922142515.GN2431@sasha-vm>
 <20200922144221.GW4792@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200922144221.GW4792@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
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

On Tue, Sep 22, 2020 at 03:42:21PM +0100, Mark Brown wrote:
>On Tue, Sep 22, 2020 at 10:25:15AM -0400, Sasha Levin wrote:
>> On Mon, Sep 21, 2020 at 04:07:01PM +0100, Mark Brown wrote:
>
>> > This is pretty much a cosmetic change - previously we were silently not
>> > reading the register, this just removes the attempt to read it since we
>> > added an error message in the core.
>
>> Right, the only reason I took it is that error message - I find that
>> bogus error messages have almost the same (bad) impact as real kernel
>> bugs.
>
>The point is that the error message isn't present in stable kernels so
>there is no impact on any user visible behaviour.

Ah, I see. I'll drop it. Thanks!

-- 
Thanks,
Sasha
