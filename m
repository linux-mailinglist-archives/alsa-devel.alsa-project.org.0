Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B2B1BF82B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 14:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A201688;
	Thu, 30 Apr 2020 14:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A201688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588249440;
	bh=rNoo6l6fQ/DyMt+aHN7Zfr9LxknaXzRvnbiujCHSfIk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yt3L8MeUDcfWy1g6gAnisuABAWYtu2KOKXegPeHcaHY2vG1sixPWxKlHHu1qgrEvv
	 WKwV08oOJngSlTJZFZnh+xIYZYDqfvFLJdqTVIzus0wqZIdPiwtgKp1ha2LXMiZlVp
	 nS1IMolTBtVSCH1INozRA06IGAcarXBqjM8os/uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB2FF80123;
	Thu, 30 Apr 2020 14:22:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 805F2F801DB; Thu, 30 Apr 2020 14:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22BD2F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 14:22:08 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 37E9EA004B;
 Thu, 30 Apr 2020 14:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 37E9EA004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1588249328; bh=TKedc6NcRINKXohc1MPBKlW6F/9YSuY86R731USNWwA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=2zcTUsYgGTI/6jfoPIJlpY/jaTYVcqZuB4H8A5y6RI8y4Kja1qDwk8bnNeaHyYb3o
 uU0AOTI6mwhVhtEAEbVHWtMkc19airW6kxDmn/3gIbMSepbSOeb5VhS4Xi0LMWEqx0
 3GTn6q7e3u3FTIX3Iw6dm/L19qsdnIvSpC+9374A=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 30 Apr 2020 14:22:06 +0200 (CEST)
Subject: Re: [ALSA-LIB PATCH] topology: Use bool parser to parse boolean value
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20200417164747.673-1-amadeuszx.slawinski@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <5ea63f7b-6740-7193-d504-90bf9f4786cb@perex.cz>
Date: Thu, 30 Apr 2020 14:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417164747.673-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Dne 17. 04. 20 v 18:47 Amadeusz Sławiński napsal(a):
> It should be safe to change this as correct values with int would be 0
> or 1 and bool parser handles them correctly.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Applied thanks.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
