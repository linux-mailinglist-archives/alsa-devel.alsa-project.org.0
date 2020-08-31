Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4D2577FC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 13:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBFE17D0;
	Mon, 31 Aug 2020 13:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBFE17D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598872416;
	bh=fBGJvC2aBSDjFG1/+MF71DPuuXNsagr3jaiZu0yZ1Bs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMPZr0Bq5sUkwjo9PFEf7cG2ZwgJq8P8GreR7/vEPqxJxH6eg5fHJgP5wJALS5daE
	 e/anlJlfS3U4MpdeDHqoAW++xTttLRwbI6C0tgcnQJZtwVH/Gz16V1MtN6YBzgI6v7
	 CjDxKgBHG2Fr+MKODT1s2aKgZ3IFsRJ/IqRpcqBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7822DF8024A;
	Mon, 31 Aug 2020 13:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56724F80212; Mon, 31 Aug 2020 13:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30727F80058
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 13:11:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 35F0BA0042;
 Mon, 31 Aug 2020 13:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 35F0BA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1598872305; bh=lffvufPWFvi3HqauHbY0Q5bY+CaIQlGJvAMGN0WkHnE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=A/NIxm4HifQn2xVfr0miVdN12wFhbPWDL5l2q4Z8medeyacmd2ePVaO/xORlrJwtA
 uklhSQtc+ljax1GcAQ/sM5gEiGHS3gj+83/waywqxVs2D4xDqLWQcatv0Pu4lyGnvS
 /aze09YSv6KAAkVREc+iCNdDGLUxi6eJTntZlKm4=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 31 Aug 2020 13:11:39 +0200 (CEST)
Subject: Re: [PATCH v4 00/10] topology: decode: Various fixes
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7f62aba5-1a74-ce3e-9c0c-796e56f1cea0@perex.cz>
Date: Mon, 31 Aug 2020 13:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

Dne 31. 08. 20 v 11:08 Piotr Maziarz napsal(a):
> This series fixes various problems with topology decoding mechanism.
> Some of the problems were critical like improper memory management or
> infinite loops that were causing undefined behaviour or program crashes,
> while other resulted in losing some data during conversion.
> 
> Bugs found while testing with Intel SST topologies.

Thank you for this work. I applied all patches to the alsa-lib repository. I
dislike the last one - dynamic allocation for each printf(), but I applied it
until we found a better solution.

We may use the dynamic allocation only when the printf is bigger than the 1024
bytes threshold (and keep the small buffer on stack otherwise) or create 'dst'
structure which will carry the output buffer point and the temporary buffer
pointer which will be freed when the output is finished.

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
