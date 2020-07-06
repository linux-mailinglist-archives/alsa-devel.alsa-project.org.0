Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E321566C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 13:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A662D1674;
	Mon,  6 Jul 2020 13:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A662D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594035101;
	bh=P+QHjmqJ/wu4dx3O3T/VEjcuS5rxOecmj4+68SWWCcQ=;
	h=Subject:To:References:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Z+HEH8fX28qw/8IEVxk4sLxf3ghD2/S4xmnM4xnknCS9/4d18TguUegg6GpDeatCC
	 NMR0pcALfzmJGAXypwJtbucsBR8bsmIOs2qfPyc770pUuHSpgcCFpKVthTAra4Tm9y
	 CDh8A87gv7QPu4NnUkiIuInafTiOMiN9/e6ANqBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B64F80150;
	Mon,  6 Jul 2020 13:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 059B2F8015A; Mon,  6 Jul 2020 13:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2CC5F8011F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 13:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CC5F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="H4EH98DL"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594034990; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: From: References: Cc: To: Subject:
 Sender; bh=B4x/MNKnw7dNqtrqeARr2ZbfiWYvHwIO7a3zTHiX2RQ=;
 b=H4EH98DL+GHc4hPZehrYbX+ML77ClbmaiW10FZDiDLUA7BXF/5c7ddOAru2z6ymMcpiQdw2l
 vb/l226gmdgVrKGN1+tv90J41O2M9kDD0tShxqrCRg/lk2wfSfL803pfP62xXJvLrwUktEaa
 Tj3J8KBSkPKFXz+CK/zo9gQMWTw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f030b2a117610c7ff13166b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Jul 2020 11:29:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0126AC433CA; Mon,  6 Jul 2020 11:29:46 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 536EBC433C8;
 Mon,  6 Jul 2020 11:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 536EBC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v2 1/7] Documentation: device-tree: sound: Update
 lpass-cpu driver binding
To: Ajit Pandey <ajitp@codeaurora.org>, Mark Brown <broonie@kernel.org>
References: 
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <f44e2526-3497-7900-0db6-39b6b5af2d9b@codeaurora.org>
Date: Mon, 6 Jul 2020 16:59:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
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


On 5/16/2020 11:07 PM, Ajit Pandey wrote:
> On 5/14/2020 10:14 PM, Mark Brown wrote:
>> On Thu, May 14, 2020 at 10:08:12PM +0530, Ajit Pandey wrote:
>>> Done the required cleanups to update lpass-cpu binding with newer
>>> yaml formats.
>> Please do YAML conversions as the last thing in any patch series, there
>> is quite a big backlog of reviews of YAML conversions so they can slow
>> down the code development.  It's good to do them, just try to make sure
>> other patches don't depend on them.
>>
>> Please submit patches using subject lines reflecting the style for the
>> subsystem, this makes it easier for people to identify relevant patches.
>> Look at what existing commits in the area you're changing are doing and
>> make sure your subject lines visually resemble what they're doing.
>> There's no need to resubmit to fix this alone.
>
> Ok.. we'll do the yaml conversion as a separate patch chain so that it 
> won't block
>
> merging of this feature in ASoC core.

@Mark, I was planning to post v3 patchset series for this and keep yaml 
change as

last patch in the series as suggested. However, we have one update in 
the driver to

support another compatible string. If we keep Documentation change at 
the last, the

driver change will have checkpatch errors. Can you please suggest if 
should make

first Documentation change in text file itself before driver change and 
finally have a

patch to convert it to yaml at the end?


Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

