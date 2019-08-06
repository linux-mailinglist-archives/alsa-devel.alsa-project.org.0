Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C682DEF
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 10:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D8391660;
	Tue,  6 Aug 2019 10:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D8391660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565080926;
	bh=dFLgADVz7RGxQrZBZhmaLYG1aZH7dG7Qca6QC9Z2XTs=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ay/oeAHdWN/1fIHzxm6ySGf6XbzQkCdB+xVOmY9EFOye99+DZJFVeREN6cLI6XkyQ
	 yd0Eoxq0fjGsCFCGQx+zQXM17gmpp50Jm3QCBnGjmElDkbrf3SrXcz55bsVrpLEbmw
	 YsH3UDnPw/FZtWoqVtRwLId2l3i11m8xBPjs9dfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE777F800F4;
	Tue,  6 Aug 2019 10:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98A5F80483; Tue,  6 Aug 2019 10:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62C6DF800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 10:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C6DF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jOEpmmvL"
Received: by mail-wr1-x443.google.com with SMTP id r1so86966413wrl.7
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9S2OrSnHcz2XIEp00Z2uwFwV9br4hMO2npiHqZr1Nfw=;
 b=jOEpmmvLb75qXd97zx5Cpwu+JQZOlgeIKW4SNNbJF3coCYZE1V/p1dXPWS73sThUqZ
 VeAy6lZwGL/hUb+QCer9bmtcTgfQWXE6MhPlPtisdsXaetNa4elkTsmXZVMKPFYSJ/US
 QoYpPFEf86E5tub3jhvJjaALFndSMhWp77b9tIlQk6ZntVmr+a5VmfrHami8M+WywHUx
 hMa+0CSa2/0UvriLQMJlqa/h3myiOjwnVwq7ceyK1rLFtpof1AlaBktw1wBWGNHWFrOB
 c4+PU+9OTeFNseuUnn6BSKm8Car0EfW6z4TztjsgouJ4WFY+RUpTltNSIHv151obfufU
 SISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9S2OrSnHcz2XIEp00Z2uwFwV9br4hMO2npiHqZr1Nfw=;
 b=nSwojmtLB7uJBQaWXrUKTp1vSa+n0ny4gAXo9TmROqUIsvKjxQzgcbhGgPmSIe9bdf
 It+/MlMqfc6XVD3ATwGfk9uSeIZSAXpxF5FwahuXmf28TCCqSvUzTmXFU0u/2KWBGY3g
 VLUHUyJPqR9WV6zXqaebneZ7U78w/SBiCY1HBGVepQNhCwyhrWrzkZSuN7G14wtJ5zTR
 LMBJXTxOOZyaaBlT48f1v+PV/yN1puXwygZsmUUHcZnYdyKk5+UdLISfigSlvaDHXWvN
 CxhHAFaYZzeTLCRkXZ3aG6FltfiCawyLQ+wlTYoVz4pqidy2TG633sehQfFHyXnoA2MR
 91bg==
X-Gm-Message-State: APjAAAWsBr+GvVIhUsMT7sUcvrwmlXNiG4uMWFJuzg97HzJZKxBGnPiL
 31FjnisbB4BVxaoqvvxtr1dLHCHyw50=
X-Google-Smtp-Source: APXvYqyNrbhE5lyI0PBvvuPol+1GQZ+9ZGCblooDRlEw+9xbE0GazkhDHHR+PxhTNnZUQ4j5Qvyy5A==
X-Received: by 2002:adf:d081:: with SMTP id y1mr3463306wrh.34.1565080816226;
 Tue, 06 Aug 2019 01:40:16 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 32sm79637252wrh.76.2019.08.06.01.40.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 01:40:15 -0700 (PDT)
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20190804162201.5838-1-nishkadg.linux@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a2eb9347-1568-c6e2-d9b7-e45669e192c6@linaro.org>
Date: Tue, 6 Aug 2019 09:40:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190804162201.5838-1-nishkadg.linux@gmail.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH] slimbus: qcom-ngd-ctrl: Add of_node_put()
	before return
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



On 04/08/2019 17:22, Nishka Dasgupta wrote:
> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in two places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Applied Thanks,


--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
