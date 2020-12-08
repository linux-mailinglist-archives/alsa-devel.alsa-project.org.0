Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3192D2D87
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 15:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA46316F1;
	Tue,  8 Dec 2020 15:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA46316F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607439014;
	bh=LawgoE1t5mI3U6BeJLqFG8GSDtxU7tJGuIynK+qkiPg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mot5xVYef91BckO+uFaxWjAaKyT4XUBcWNoIHZC3/uGW+LRKbf4MKKA0Bb33O3QSN
	 SPlGQsb2qyKDxyy/6t2SV0v1+QTtFg0rF+fSNA2Np0z5fNAmJ+MVRFP6ggIW2vy5HX
	 6tkpg6YKdFEM+uzv5f/IEGqFek3bwH8jByRfJGAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148A1F800E1;
	Tue,  8 Dec 2020 15:48:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 974AFF8019D; Tue,  8 Dec 2020 15:48:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95989F8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 15:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95989F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="DsrT4YBl"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fcf923c0000>; Tue, 08 Dec 2020 06:48:28 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 14:48:24 +0000
Subject: Re: Re: Re: [PATCH v6 0/6] Tegra210 audio graph card
To: Mark Brown <broonie@kernel.org>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
 <20201207123131.GB5694@sirena.org.uk>
 <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
 <20201208121312.GB6686@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <a6ecb66e-db25-dcfa-4a70-d9b2fad75cd9@nvidia.com>
Date: Tue, 8 Dec 2020 20:18:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208121312.GB6686@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607438908; bh=dyvnc0MmI74AElyJHGT+49gBQdAAzpK9ZrjPVG7orQk=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=DsrT4YBllGyINM0Ec6xRs09oDm2LV9RIFeIKyWvSkr6J2K+KAe7yUXCmqCd/DWKUX
 BVd+59fyvUZOhxlrcr66ogVnuv/6Cn0dT8NYy9NH2q8V5DF8wCVzQd0z//znj5xrs1
 UAq/YiDQzxRAIJsetEndNVkDPVqaPFJriLXP8R9//2PIbmm4qEwwfEZyb+KqeSTrWf
 PsGFvNCebs/lB/NqeXwrWGu3jBBoE1eGPhHMTL85+VCJZJCZUXN5iFOwK/srsxVNlh
 ZKc4ipjo4L8JdgUyc8nlcZoH27U/07ccaWR8StxT1Uq47TlY1anlHcqPHOqespFlWu
 4RBNqXZgiMpXg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com
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

[Sorry I had to resend this reply. I accidentally replied from my 
personal email earlier and many people/DLs were missing on that]
