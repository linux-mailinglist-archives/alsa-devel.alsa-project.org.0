Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81F2D2B59
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 13:47:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB5716F2;
	Tue,  8 Dec 2020 13:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB5716F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607431676;
	bh=gjPnq94l/gSK5Pl/EM9Q3J1/uisGxuGNCGrGCNktLeI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=maZerHGkz8hSYzwgDOrDeZZi+Z3NWUzcvpgv0q9Xp68hU2PZ1HhFgbb44lK0IVhiv
	 xamDnMb2Ttgqi9/C4f+HW7CPyPnslnra9jsiSG35J+cE0KX1CLdrxn5qdigGcBmf4x
	 VNrgIi7SLf6Vbb1IEi/xko5aZHE6sl+8O2X9fJz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C636FF8010A;
	Tue,  8 Dec 2020 13:46:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87628F8019D; Tue,  8 Dec 2020 13:46:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1026F8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 13:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1026F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V5B9dsmW"
Received: by mail-pl1-x62b.google.com with SMTP id bj5so6935279plb.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 04:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=TEgfqwXf1Uy8gA1ecgxYrhFbdWAA6R8SPQqsnMk3REM=;
 b=V5B9dsmWAPh5Ybq4ZVVUnWc7FcrhYgHHBctA6d8tBTyX7FigCbWRXKmqqpzgHW/A66
 BO/pjPO5KYTmgrhPPp7XOGbnqBeZI0uXtSYMUz0PE0BccpzMc/y6lYT3ZBabruTDEp63
 CbqucIXw2RoswAdkMAkTcQFBZXF+8PO+5Art1pjUS0j0iHoZlW1RsO8lVJYWxH+wGrQZ
 IPtxu5NcSHhALVY4mz0q+pI4XqfKetJqKYdH6SYzYguMijgAb5G8tnJhgwqi2EAeSul+
 RZtdUy+6+4Jia6mmKwO/e0Ym7q8MyLRHKJM+R2p12K21dV2AxjdduHAzVcwwetZlcjZj
 g6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TEgfqwXf1Uy8gA1ecgxYrhFbdWAA6R8SPQqsnMk3REM=;
 b=K80xuUbYodNSQV/gkjvyfEm+FZbbtyCRPGsacqiIK8F2cQeoDwAsk6c0ZpwSRVqX7o
 rzB1rDopTv6ezmY/731qnBQjcs8KZ9yN9wucSmdCj/qj5uovjZNxkexq7lE6UXCchtfJ
 WigVS1m/3D4gbVex7ER6qaDISN9xPumthW8FtApBNwJMVnhKYW8O2HNvz1DU4Ajxnfre
 PtfMAVf8gItSDedYyKZMTRTpTuG1DkQ1tgxGlLbRFqK+/5F+0s9gBmhKfiev84DgHqoq
 MeFuZZ75CCOOF9ubuXeqA/iSOjWo6xdo7HcfdnNM+mUBEpNYLg1acgOWG9prfiNaiPgk
 8aVA==
X-Gm-Message-State: AOAM53383ySCUbnP9vaO7UTSeTyVsJuoiW51ekAvmJUu+XI5fhdBTkIB
 N46kwFvR+l0G9hHfe0YWsFW6wFPy7Xg=
X-Google-Smtp-Source: ABdhPJw4dJDOrRcr8SOdQb4NAxRh5hYfoftJsYF7zAeHHLq0ucYuwNMhJoGLKnI2fFp19mAORfwDQg==
X-Received: by 2002:a17:902:b707:b029:da:a304:1952 with SMTP id
 d7-20020a170902b707b02900daa3041952mr21068459pls.6.1607431572902; 
 Tue, 08 Dec 2020 04:46:12 -0800 (PST)
Received: from [10.25.96.159] ([202.164.25.5])
 by smtp.gmail.com with ESMTPSA id e22sm17664503pfi.83.2020.12.08.04.46.10
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 04:46:11 -0800 (PST)
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
To: alsa-devel@alsa-project.org
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
 <20201207123131.GB5694@sirena.org.uk>
 <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
 <20201208121312.GB6686@sirena.org.uk>
From: Sameer Pujar <dev.spujar@gmail.com>
Message-ID: <55d1934e-d3f0-8765-341b-a853662b3f70@gmail.com>
Date: Tue, 8 Dec 2020 18:16:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208121312.GB6686@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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


>>> No, this was sent by a b4 bug - notice the "no commit info" there, they
>>> weren't applied.
>> Oh I see! I guess review would be still pending then.
> I don't seem to have them in my backlog so either there was feedback
> from someone else I was expecting to see addressed or some other issue.

I am pretty sure that it is not because of any outstanding comments, 
because I got none on v6 and previous v5 feedback was taken care. May be 
this is because of the doc dependency I listed in the cover letter?
