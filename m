Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CEE2617E8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 233E316AE;
	Tue,  8 Sep 2020 19:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 233E316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599587127;
	bh=9eKCnSiGU1Et4Lz5X3lyHQ0MYloqybuZZtvMbeMe6lE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQNEmLTex0mYl1rme4dLNN5QZmv+wraBsxotJLLtRFxsm3V7PpSh9a5JV8h+6TQFi
	 BriDf6LwEkfGf19xhJRWa74QZXGE5q/GrqrJ5SCv2o5AwRFfMHFyaPXkvxVCqWADi8
	 ox7NhDoPtTMzUi9Unu2V0fIgYgVNRfbi70pNUtdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7563F8028E;
	Tue,  8 Sep 2020 19:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2140F8028E; Tue,  8 Sep 2020 19:43:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49E25F801F2
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E25F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="kmzOCxZb"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="IKoDqG62"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599586973;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=9eKCnSiGU1Et4Lz5X3lyHQ0MYloqybuZZtvMbeMe6lE=;
 b=kmzOCxZbKHxt24apUw0/e2AX9Fv1+iAN1fZ9bs0gKyf9sU/764Q4DShcvd2MPj0H
 KpT9326G8SpBhp95zg/3UV1CpC7Lqqg/wqFihB/FsxZA21xSUWWRFMNePOVx0JIuzix
 R/m1DzasaI9bL0vd9x6xAQeIWORa26nqbaPenHJ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599586973;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=9eKCnSiGU1Et4Lz5X3lyHQ0MYloqybuZZtvMbeMe6lE=;
 b=IKoDqG62o7gefNs0z42WuRy+EEHoU8X6mrNY3hIGczNXqxiob/6sbO0JMS1PML31
 ZpMYwr8kMG/bn7kJsMWlwFtN7kvg7odVSwwjdYCzeKYxEhgMn0+EOSZ2K8ngfRZqz/t
 cpFH/mxpK9GS/n/gkWMuwR+T7EIc15WcGLNrCmkQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F5BAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
 <0101017458d94c82-96bbcff0-018e-4f5d-8273-7869c3599d32-000000@us-west-2.amazonses.com>
 <b18ed556-09f5-1d2a-b8fc-56a52429addc@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <010101746ed0353e-60b185b7-3fb0-4d6d-a669-fe6a97082251-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2020 17:42:53 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <b18ed556-09f5-1d2a-b8fc-56a52429addc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.08-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks for your reply Srinivas!!!

On 9/4/2020 4:54 PM, Srinivas Kandagatla wrote:
>
>
> On 04/09/2020 12:21, Srinivasa Rao Mandadapu wrote:
>>>
>>> Before going into detail review, I see real issue in the overall 
>>> approach here to add new interface to exiting lpass!!
>>>
>>> Intention of struct lpass_variant is to address differences between 
>>> SoCs or different lpass versions. But you should not duplicate this 
>>> and use it for addressing differences between each lpass interfaces!
>>> All the dai related register offsets should still go in to this 
>>> structure and driver should be able to know which dai its talking to 
>>> based on snd_soc_dai_driver id and select correct register offset.
>>>
>> Do You suggest to use separate structure like struct 
>> lpass_hdmi_interface in lpass_data?
>
> No, you should just put every thing lpass_variant as you did but no 
> "id" thing in that.
Okay. will change accordingly.
>
> --srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

