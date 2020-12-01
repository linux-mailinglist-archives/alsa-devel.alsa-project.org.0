Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C532CA9C1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 18:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF1916B8;
	Tue,  1 Dec 2020 18:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF1916B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606844009;
	bh=5liVoAaQqw+LliQDqsWI0jJ3jxk1pluON5ZRkBM8Y1A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSVYZS9K6djUKFKwEE0xVRl1OV1/M+WPYqml0ewwFL8s3iMjk9fB+9KApO06ZrZ4I
	 orO2M3yUybQ3Lq6m6d1zv5JTry9ZnO/hGNMkqZBX5KyDZmPjBdHZiqVxfrP6kxBPax
	 PO6sUaAo7jW9yhb9N5dsf62GsKyd0W7faTB3NqBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C04F3F8016D;
	Tue,  1 Dec 2020 18:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACA1AF8016D; Tue,  1 Dec 2020 18:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from m42-5.mailgun.net (m42-5.mailgun.net [69.72.42.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D078F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 18:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D078F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="nF8r6jg8"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606843903; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=K1x8lx2ayye4/N0xNELnpa6CNM0J4yfcDBWhh1G+S30=;
 b=nF8r6jg8iT2rRi8LuMg5zBmyjO8RlsVg/aHmCJCsaqVkM9vnz3LlrcvTStq5Hvz9Whb8I9N2
 4WbCD/4KThZ4HvbZbqG25RKWrWiVxflr6U9+H4pza9q3IqwBB+0uhoCYf8CjqHTRpL5iaT5m
 abWZi3UVEthlPxZaDnOWe3Hl6e4=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fc67df3e8c9bf49adadeb43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 17:31:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E485AC43461; Tue,  1 Dec 2020 17:31:30 +0000 (UTC)
Received: from [172.20.10.2] (unknown [27.59.188.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 47E31C43460;
 Tue,  1 Dec 2020 17:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47E31C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK and
 LRCLK in LPAIF invalid state
To: Mark Brown <broonie@kernel.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
Date: Tue, 1 Dec 2020 23:01:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130124617.GC4756@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
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

Thanks Mark for your time!!!

On 11/30/2020 6:16 PM, Mark Brown wrote:
> On Sat, Nov 28, 2020 at 10:29:18AM +0530, Srinivasa Rao Mandadapu wrote:
>> This reverts part of commit b1824968221c
>> ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")
>>
>> To identify LPAIF invalid state after device suspend and resume,
>> made I2S and DMA control registers not volatile, which is not necessary.
>> Instead invalid reg state can be handled with regcache APIs.
>> The BCLK ref count is necessary to enable clock only it's in disable state.
> Part of this commit message says that the problem was making the registers
> non-volatile but both the change and the rest of the commit message say
> that the issue was that the registers were made volatile.  I'm also
> still unclear as to what the issue is either way - how does reading the
> state of the registers from the hardware instead of the cache affect
> things?

Initial problem was, during playback if device suspended, I2S and DMA 
control registers

are getting reset and unable to recover playback after resume.

As these registers were non volatile registers, driver is not getting 
actual register value

and unable to report error state to application. Due to this application

keeps on polling for HW current pointer state and not exited from PCM 
running state.

To handle this scenario I made registers volatile and if they are in 
reset state, reported error

to application(commit b1824968221c).

Later from review comments by Srinivas kandagatla, I got to know

about regcache sync APIs, which can be used  to sync cache after resume and

HW registers can be updated with  original values. With that playback 
can be continued.

So is the reason, I am reverting partial changes in the commit b1824968221c.


> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

