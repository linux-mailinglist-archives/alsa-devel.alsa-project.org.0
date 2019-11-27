Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FD10AF09
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 12:53:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C0481712;
	Wed, 27 Nov 2019 12:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C0481712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574855590;
	bh=4ktepzhhSVIhjDOhQkv8tm748CwSHlWO1AU58kzNR48=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1ywqockARWcTucuaE6ciF7bmjcSeFafWaf/X9bpZG1C/lO+iN9ywisSuuRy//cqD
	 lAepeeiPZ5KCOO45IfPAAkxVKXi2K+1E6Guh6fzdHBpGEzxMLShytGqZXxrFlP5GNE
	 9tDdJx5eQKYmczE7NpNXmDVch58P8f1dTO+EpC8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01457F8016F;
	Wed, 27 Nov 2019 12:51:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B598CF8014D; Wed, 27 Nov 2019 12:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.ab3.no (mail.ab3.no [IPv6:2a01:7e00::f03c:91ff:fe70:361f])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 043C7F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 043C7F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ab3.no header.i=@ab3.no header.b="bf5mbSEk"; 
 dkim=pass (1024-bit key) header.d=ab3.no header.i=@ab3.no header.b="bf5mbSEk"; 
 dkim=pass (1024-bit key) header.d=ab3.no header.i=@ab3.no header.b="BjuQmDhZ"
X-Virus-Scanned: amavisd-new at ab3.no
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ab3.no 814252A3245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ab3.no; s=default;
 t=1574855480; bh=gdIqIw0L6MGNg8qnledozXHQvs84NN7g9Seglj8+aWQ=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=bf5mbSEktltaUj5x4+P4WOt88T9tZe7i3PDWPO77v4UzjetX7KkCorsU7dEUNo1P4
 IKcmQ5PrJeiOIzqImN0dE6n4lPYdhoRJ+05FkodgBN9I3iXdOc2AsmacH4k8CyE1zB
 0HajUQP9HbQiFVx9E7F5ayDrO+FEaqKT00YNXVhU=
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ab3.no 6888B2A3246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ab3.no; s=default;
 t=1574855480; bh=gdIqIw0L6MGNg8qnledozXHQvs84NN7g9Seglj8+aWQ=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=bf5mbSEktltaUj5x4+P4WOt88T9tZe7i3PDWPO77v4UzjetX7KkCorsU7dEUNo1P4
 IKcmQ5PrJeiOIzqImN0dE6n4lPYdhoRJ+05FkodgBN9I3iXdOc2AsmacH4k8CyE1zB
 0HajUQP9HbQiFVx9E7F5ayDrO+FEaqKT00YNXVhU=
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ab3.no 3134C2A3242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ab3.no; s=default;
 t=1574855479; bh=gdIqIw0L6MGNg8qnledozXHQvs84NN7g9Seglj8+aWQ=;
 h=To:References:Cc:From:Date:In-Reply-To:From;
 b=BjuQmDhZObA98nGM0yeHNfyiGrj+FCtcWTUs2jSB9z27apaqU6hUYLRdeOy4YCZXE
 ZDxcBDAu165/Zp4KdmeB+SdMTyO5Qk6qbh69ZgdMdPpcq2GSneC82Ucd/dvfqQ7kPZ
 YRFU+lmBFOhky918yZy3s5oEPZZZSct63DOWBB7Q=
To: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@google.com>
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
From: =?UTF-8?Q?Mads_L=c3=b8nsethagen?= <mads@ab3.no>
Message-ID: <c22f818f-a819-84a4-f903-80dbdfed35ca@ab3.no>
Date: Wed, 27 Nov 2019 12:51:17 +0100
MIME-Version: 1.0
In-Reply-To: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
Content-Language: nb-NO
Cc: Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
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

Hi!

Is this related to Android Wired Audio Headset Specification? Just 
wondering (I asked about it last month[1]).

Would be neat if it were possible to get headphone buttons working on 
Linux in general.

- Mads


On 25.11.2019 20:25, Curtis Malainey wrote:
> Hello ALSA Devs,
> 
> I am looking to get some feedback/ideas on a possible change to
> headset button mapping. Locally we are carrying patches that implement
> the mappings in the machine driver (which we understand you do not
> want upstream.) We are looking to see if we can add a new API
> (something like a sysfs path potentially) to have userspace pass in
> the mapping, if it chooses to, so the mapping can still be done in the
> kernel. That way we can carry just the config locally and remove some
> of the kernel patches we are carrying locally. Thanks.
> 
> Curtis
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
