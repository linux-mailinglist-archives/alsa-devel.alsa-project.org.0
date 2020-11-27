Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96122C6B6D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 19:13:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281AF1875;
	Fri, 27 Nov 2020 19:12:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281AF1875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606500782;
	bh=lxMmkBrQ/pj1wTb4GBHUmFAh1BPBO8OFizmvdnRofVU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlXv7Qe3QStaJOqU8BBJr7eX/xlgllLQduh/QsTbwP+AM/twQm3wSQP5bZHxfVr9F
	 /lhW1rojbt0lv5RTZkcEgzi7440y51eNct8cLjnvrywlJFz3QWUnj5xhjEcNxg+L3y
	 vBuZPCo3F/P20cMB1ozeLA9iwAuYyjJMUKV0hy2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98481F80218;
	Fri, 27 Nov 2020 19:11:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF20F8019D; Fri, 27 Nov 2020 19:11:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95ED2F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 19:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95ED2F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="MN/vpT8X"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606500683; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TRj2b3zaWIGpxbrpXmMlLZehi8nG8Ts5IWw/ya6tEM4=;
 b=MN/vpT8XIKKW0n/1md3JSwiQEDqHYEm0Iw7h9KxynmA0r42VFg/eL9FBQcsR6Z72D/dgYEnn
 K/cOH6QgQE3MzrKmfY/yP7vZg2xa8aq06Nc2LXML7Q0fPCaA7MsGJUjmnkVVllMxiylDGHax
 Vsq17C0sIL2t1zgoUM+wfNbSpeQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fc141367e9d874dfc9bde9e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 18:11:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D8E47C433ED; Fri, 27 Nov 2020 18:11:01 +0000 (UTC)
Received: from [172.20.10.2] (unknown [27.59.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 90E95C433C6;
 Fri, 27 Nov 2020 18:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 90E95C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] Asoc: qcom: Fix for problem in resume with CRAS
To: Mark Brown <broonie@kernel.org>
References: <1606450323-21641-1-git-send-email-srivasam@codeaurora.org>
 <20201127123856.GA4845@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <a3efee22-622f-438b-a10e-7896fbcd8c0f@codeaurora.org>
Date: Fri, 27 Nov 2020 23:40:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127123856.GA4845@sirena.org.uk>
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

Thanks Mark  for your time!!!

On 11/27/2020 6:08 PM, Mark Brown wrote:
> On Fri, Nov 27, 2020 at 09:42:03AM +0530, Srinivasa Rao Mandadapu wrote:
>> To support playback continuation after resume problem in chrome
>> audio server:
>> Prepare device in  platform trigger callback.
>> Make I2s and DMA control registers as non volatile.
> What is the actual issue this is fixing?
Please ignore this patch. Posted new version of patch( [PATCH v3] ASoC: 
qcom: Fix playback recover problem in suspend resume) instead of this.
>
> As I have previously said please submit patches using subject lines
> reflecting the style for the subsystem, this makes it easier for people
> to identify relevant patches.  Look at what existing commits in the area
> you're changing are doing and make sure your subject lines visually
> resemble what they're doing.  There's no need to resubmit to fix this
> alone.

Previously I could not understand what is the mistake in subject line. 
Now I understood

the mistake and will take care of it next time.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

