Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFBAFC76
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 14:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD5216FD;
	Wed, 11 Sep 2019 14:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD5216FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568204676;
	bh=1CGwy+wjfOWVEJbP8uBIO6N/5OXMWuW7SjIXlRYtSzE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iuv/lDkm4rcXdMSMNsyIQc6nupoQIBJy3xsCfnBMwz6fmGdsfiFnQdee/dFfRbi90
	 GVAb35Pa8IOyyDYkoHHKdm3i+XaWi3CCLXy6aCZw7hPISJHflqsuRcVBVJKTu8DjA6
	 8GIuhyAViJqdaDmBexCqkWEm7nR4TKZSCpl4aMFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA1CF801ED;
	Wed, 11 Sep 2019 14:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1401BF80323; Wed, 11 Sep 2019 14:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DEEFF801ED
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 14:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DEEFF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eoUlnbCV"
Received: by mail-wm1-x334.google.com with SMTP id g207so3222818wmg.5
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o729ZogsiJ+zpeB3VKN4NRBE+rUN5JJxUcKfqJge39I=;
 b=eoUlnbCVa2QR3Y+jqkJT0YCtRA1rdUvTyH8q2NzCO1J3GXjKqNcSkyeRw4oCfuWi94
 wEOAOjip7zpQOFyLDl3TId2By+fTHdKZkVjdSzmF/0m5E20YUqQALTxnc3TX+m/Ee5nC
 7mqPvDVLBcpAIJCmF3/CyAcsXo2NVHy5rP5U85Uk6B4a43sjckm/LKHTVOw6TO5uDMoo
 aaIssG2wG9Iu2HeWP9Dhd5BWZgVbQewC1JWSGs/iMkL+/h/np/z2aqu1QKYUxBi2Le2H
 j7lhrbyhJefOAzJ382i7CrfVdEE03/RvqFzCSE2M4VEpnoTB7emggT+2KEdt+dwrAfD4
 Z6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o729ZogsiJ+zpeB3VKN4NRBE+rUN5JJxUcKfqJge39I=;
 b=p2BF4O9hW/xCP6D7xOTEMO+TRhjJonEg8mWsgfLgW5fnZgn0aAJQ9PFd1QCtpVKw8z
 nMhoUO93x4dnr7GkCQ043DNNeAMWvrse7ehKfFbZlAptUm6TUg41Zi5CwMfHZyteorij
 2Pn8s4uKFyUAaJe8QD6d2xXlj/hMY1sgxBQwkjwmga9GhvZzJOFzZX76evo0Bvx+HdU2
 zenScc1LFYXDBW1Ed+0rjrOarEk3xWcwQXLL/nQTopyO93LmFtBa7XxnZ8zVgtCVMIya
 P1pESgmExlx6Wkab7Cl9mEjv8J5bsSpK8AlQS9O83U8oWw9QqyrbAKh7xV+Ba4KWgGTD
 EcVA==
X-Gm-Message-State: APjAAAXCh7H6L7A0nO6OP4zC6AIKOLpS78jg3oTsULfdGvQMTbeYQY+Q
 2zvAcCm7m9Gia+9MavuibILH85QCJQw=
X-Google-Smtp-Source: APXvYqwmeQFC+mIGqkpm06INjLF0VmCE5ct0x5FxYuGIja8+4+eefmafVDnlWexQJe45kzJF5WTkPQ==
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr4005972wmh.142.1568204564989; 
 Wed, 11 Sep 2019 05:22:44 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c74sm2546070wme.46.2019.09.11.05.22.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 05:22:44 -0700 (PDT)
To: Jaroslav Kysela <jkysela@redhat.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2ab0c568-445f-a368-185b-d6566c3c062a@linaro.org>
Date: Wed, 11 Sep 2019 13:22:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commits
 (Srinivas Kandagatla: 3 total)
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



On 08/09/2019 11:39, Jaroslav Kysela wrote:
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
> 
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).
> 
> Thank you for your time and co-operation.
> 

I have engaged Linaro management for approval on this.

Thanks for your patience!

--srini


> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
> 
> List of your commit(s):
> 
>    daafa451587b9e1d018f147885f38290a344a65a
>      ucm: Add ucm files for DB410c board.
>    c01dc3fa4899a9b9948629c103c0bc435d4f1574
>      conf/ucm: DB410c-HiFi: add CIC selection
>    7442c8b9be91ef576871eed5efce9499fcdeab4a
>      ucm: Add ucm files for DB820c board
> 
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
