Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220856658C3
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 11:15:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39EF8B264;
	Wed, 11 Jan 2023 11:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39EF8B264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673432116;
	bh=S3vB4qLz0f89AAFjD77Y6ZJh/lrj2+7CubZ26Zos8ng=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H4RXWZyHfWZmUfu/4oEK/oQahSFwDpiOYhmiOKVnPm14FgZDpRokv0KkEYgm/yiVe
	 We83cekUBhZ0HXEr/j6pwUEf1C+tUURRq6M91y4kCDYdgUyF7owQ9wwywAByzIBBbG
	 PYafXv2yb9Yv7vDupCiQT4iOLeBR6s/tQO1aPVpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8402F8019B;
	Wed, 11 Jan 2023 11:14:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1B7EF803DC; Wed, 11 Jan 2023 11:14:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 22F1AF8030F
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 11:14:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F1AF8030F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCF7DFEC;
 Wed, 11 Jan 2023 02:14:52 -0800 (PST)
Received: from [10.162.42.70] (unknown [10.162.42.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D289A3F587;
 Wed, 11 Jan 2023 02:14:07 -0800 (PST)
Message-ID: <7c9eae15-fb84-bbcb-6e31-3199d9752ad8@arm.com>
Date: Wed, 11 Jan 2023 15:44:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20230105160346.29018-1-faiz.abbas@arm.com>
 <20230108163741.GA30997-robh@kernel.org>
 <f0ad7a4e-a8af-77d4-09e4-3717041677e7@arm.com>
 <cf65926c-d2c1-f1bc-6e27-f07611a5cce8@linaro.org>
From: Mohammad Faiz Abbas Rizvi <faiz.abbas@arm.com>
In-Reply-To: <cf65926c-d2c1-f1bc-6e27-f07611a5cce8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Deepak.Pandey@arm.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Krysztof,

On 1/10/2023 2:15 PM, Krzysztof Kozlowski wrote:
> On 10/01/2023 09:23, Mohammad Faiz Abbas Rizvi wrote:
>> Hi Rob,
> (...)
>
>> Thanks,
>>
>> Faiz
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> Please fix your mail setup. We cannot work in upstream/LKML with
> confidential emails. Since I was not a intended recipient (I don't know
> who is), then I should start removing your emails?

Apologies for this. This was my first email that went outside. I have configured my email to not append this notice anymore.

Thanks,

Faiz

