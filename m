Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBCD1D637A
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 20:16:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C28F1662;
	Sat, 16 May 2020 20:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C28F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589652987;
	bh=eaBb0tvFdGUN0HDnvVOBc9VcDBN6Hdp1PCcG71na2mU=;
	h=Subject:To:References:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eUDE1aSo6qFoWM8Qv1kHYa1wA3MG7GPwvQDT0kBSbX+0mboeIVC/tBUyxOW0aBcfT
	 MLeT0EOlOijBh4zqWnVEwxSvR8Edl8Z6ZRCDLBH6X0rx6FRRhtehCCpXJv0M6KerV6
	 lkLZ7iFH2eEl2+NSrsKgi8q5vvDzIvztfJqTcK6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80781F800DD;
	Sat, 16 May 2020 20:14:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B863F80158; Sat, 16 May 2020 20:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3211F800E3
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 20:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3211F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="wFadF8/B"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589652880; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: From: References: Cc: To: Subject:
 Sender; bh=vHhfQLbmGkqdEq+nyD31PZJUA6mXrkeSkvttzWXp73g=;
 b=wFadF8/Bd4a3AYkVpsmOO0yLzn/fo0V9mI9PqkieVCYbqf+GPeufyYi+lyI4MFejO7iJsfAE
 1JQqBD6FuXESoDkFgxH5wcD59rCqIEqfEFuePLmJHer06+iPnBsMUStALUKCKO2/wxhaU5W+
 nzTrXajdYImZ8ZCRLVzts9tuMgQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec02d8d.7f3ee3d7ea78-smtp-out-n03;
 Sat, 16 May 2020 18:14:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9D23CC432C2; Sat, 16 May 2020 18:14:37 +0000 (UTC)
Received: from [10.86.13.83]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5641BC433D2;
 Sat, 16 May 2020 18:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5641BC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
Subject: Re: [PATCH v2 5/7] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
To: Mark Brown <broonie@kernel.org>
References: =?UTF-8?Q?=3c=1c1586592171-31644-1-git-send-email-ajitp=40codeau?=
 =?UTF-8?Q?rora=2eorg=ef=bf=bd=3e_=3c1589474298-29437-1-git-send-email-ajitp?=
 =?UTF-8?Q?=40codeaurora=2eorg=3e_=3c1589474298-29437-6-git-send-email-ajitp?=
 =?UTF-8?Q?=40codeaurora=2eorg=3e_=3c20200514164828=2eGL5127=40sirena=2eorg?=
 =?UTF-8?Q?=2euk=3e?=
From: Ajit Pandey <ajitp@codeaurora.org>
Message-ID: <9b02abcd-23a0-8edb-674a-44358a516015@codeaurora.org>
Date: Sat, 16 May 2020 23:44:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/14/2020 10:18 PM, Mark Brown wrote:
> On Thu, May 14, 2020 at 10:08:16PM +0530, Ajit Pandey wrote:
>
>> +#define MI2S_PRIMARY	0
>> +#define MI2S_SECONDARY	1
>> +
>> +#define LPASS_MCLK0	0
> These look like they could use namespacing.  Is primary/secondary
> perhaps something that could be a boolean property?

Primary/secondary is a dai id and can be from 0-4 (SC7180 soc driver 
support only 0-1 at present). Such id is mainly used in dtsi and machine 
driver to do dai id based configuration for a soc hence we placed them 
in dt headers file for now.
