Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EE14C9D6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 12:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99805167A;
	Wed, 29 Jan 2020 12:39:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99805167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580298033;
	bh=MjL6NRHBTcjcRSemZiPhKaFNybd4U3D3B3JPAysYIT0=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qnh+nkEdBZlbbHRc+owP3o+rZELW5Y/wZhSHREVmRv6NCfACvlZJvuPtZfMz8rAtO
	 Dbj2B5hjzGHzqRCIW3qAabSb5hCTAH9TQeBk+9L1xjBdJFccSrmuBRkmwVY20mwZGR
	 QQm4iosHs4LIVXDs+izr2gnGSCtyM4Rn9P5vn8ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B10FBF80082;
	Wed, 29 Jan 2020 12:38:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B2AF8021E; Wed, 29 Jan 2020 12:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C978CF80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 12:38:47 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D70BDA003F;
 Wed, 29 Jan 2020 12:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D70BDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1580297926; bh=mZZ+8Dg0Tv8AKuGR4JAK9xBSsa9BhD8yUAbb+1ugQmI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=F8v3etRijNuJyO7CupKX1Cd4RsO+FpzpZvhoIWgEZWs5VcHnXnqn45rXhW6lmoNF2
 idmiN3AOOoiKORSgLnxeY+oTUQwhk2JZd3rVdAhIvP5shnBHhXJ6ouNBMV54TRYs1f
 Tu375aK2+7wDurP96VRkUf65RPhiLdZn5+ITKhyM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 29 Jan 2020 12:38:44 +0100 (CET)
To: Pedro Costa <p.simoes.costa@gmail.com>, alsa-devel@alsa-project.org
References: <719056d4-aa45-8186-697c-76c1e89492ce@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c749eb6a-4be7-5a90-c8d1-ec51307c1996@perex.cz>
Date: Wed, 29 Jan 2020 12:38:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <719056d4-aa45-8186-697c-76c1e89492ce@gmail.com>
Content-Language: en-US
Subject: Re: [alsa-devel] issue with alsa lib (ucm vs ucm2 folders?)
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

Dne 28. 01. 20 v 12:49 Pedro Costa napsal(a):
> Dear all,
> 
> My apologies in advance for a very non-technical feedback from a non-expert.
> 
> I was unable to get sound output after updating alsa-lib on my Manjaro
> Linux system. I managed to get it working after downgrading it to
> version 1.1.9.2. It seems that I faced the same problem as reported here:
> 
> https://bbs.archlinux.org/viewtopic.php?id=251113
> 
> You may already be aware of the issue, but just in case I would like be
> sure that you are!

Thanks. I am working on this. Use the older ucm configuration in the meantime. 
It should work.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
