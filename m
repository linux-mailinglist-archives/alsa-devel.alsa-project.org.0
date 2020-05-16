Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16E1D636F
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 20:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA681662;
	Sat, 16 May 2020 20:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA681662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589652516;
	bh=Q7z2HErbBslP4+6ShlCksHLgbDmDoCqP9OuQmF6bU58=;
	h=Subject:To:References:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XUvST/3A3mXFrtxQXN524MJZv3atnPzVdT1Gfo6AxfsJBoyViLAHulZTpKFmWesmS
	 5wNDwEEJJmClc31fM0tsyRJB+rC74LIwoL7JObqFOrXk4m+yg9rJuRn0l0T71bhe+Z
	 tztjCgrWzwUqBPLuDiIDWhkKWlR28QwzMua14vB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 330F0F80158;
	Sat, 16 May 2020 20:06:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2671BF80158; Sat, 16 May 2020 20:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB205F800E3
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 20:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB205F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="rx9FBAhg"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589652409; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: From: References: Cc: To: Subject:
 Sender; bh=PUhHaL8byAHsraSTMCjlU45f45jhPMUm8voesvF7xDo=;
 b=rx9FBAhgBHukgzNIJG6dQUSSFYt8xqGO779hca4Yz68UQVZ0to5ylA5P/A/wMKdMu1j7vu4j
 1cMNXOxHQl8PQSr9GGP9rIPH24Ff6OxiVEi9YrAQubKWgCF9fYeX7z3CwJzMah/ffXMI0UFm
 mzEwVzDt5r9/N7TIUQ7wFP1Ev68=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec02ba8.7f808f674618-smtp-out-n04;
 Sat, 16 May 2020 18:06:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF1E1C432C2; Sat, 16 May 2020 18:06:31 +0000 (UTC)
Received: from [10.86.13.83]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FF84C433D2;
 Sat, 16 May 2020 18:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FF84C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
Subject: Re: [PATCH v2 2/7] ASoC: qcom: Add common array to initialize soc
 based core clocks
To: Mark Brown <broonie@kernel.org>
References: =?UTF-8?Q?=3c=1c1586592171-31644-1-git-send-email-ajitp=40codeau?=
 =?UTF-8?Q?rora=2eorg=ef=bf=bd=3e_=3c1589474298-29437-1-git-send-email-ajitp?=
 =?UTF-8?Q?=40codeaurora=2eorg=3e_=3c1589474298-29437-4-git-send-email-ajitp?=
 =?UTF-8?Q?=40codeaurora=2eorg=3e_=3c20200514164532=2eGK5127=40sirena=2eorg?=
 =?UTF-8?Q?=2euk=3e?=
From: Ajit Pandey <ajitp@codeaurora.org>
Message-ID: <1d47fad3-54bc-1b95-8608-d5846e4b9c83@codeaurora.org>
Date: Sat, 16 May 2020 23:36:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org
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

On 5/14/2020 10:15 PM, Mark Brown wrote:
> On Thu, May 14, 2020 at 10:08:14PM +0530, Ajit Pandey wrote:
>> AHB-I/X bus clocks inside LPASS coreis not a mandatory clocks for
>> SC7180 soc lpass variants, hence make it an optional one.
> Do we need to improve the checks in the rest of the code so that if the
> clock is missing on a SoC where it is actually mandatory we don't end up
> trying to start without it?  Perhaps it's more trouble than it's worth
> though.
> Agreed.. adding a case check with soc id or name definately make sense 
> to avoid issue with soc where it's  a mandatory one, I'll also look if 
> this "ahbix-clk" can also be moved with other soc-based clocks array ? 
> and can be enabled in soc specific driver.
