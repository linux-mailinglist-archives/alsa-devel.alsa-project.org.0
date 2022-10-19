Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A960450E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B649915;
	Wed, 19 Oct 2022 14:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B649915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182050;
	bh=kBxZdWNs2sQymXonGH3sE7btzwkr8+fiHmpcjO+m6eE=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gGmVPngwqeGKpMOWHF5WZxTjyyWIIKzMp0+qAznI5w4BJ55mciMA4pFqSd0RUdu5w
	 wtbzxiWxBYpw3QEJG8faEHKviYIUbv8Vrafhy7aznsDNw5olrguSma8d6uGpYTzk85
	 3JUns8Cd3E3Qpe5RlQ3dQZpoJl34hO9kjpuhsJN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E7B3F80087;
	Wed, 19 Oct 2022 14:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BAF1F804E0; Wed, 19 Oct 2022 14:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D89E4F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D89E4F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="iSe7IM2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1666181989; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnl1tagyFChrkzlGz6HjWuYebtyn/vrMK3LiUP9HffM=;
 b=iSe7IM2kvt4wU0f/R1sx7KtG14p7PsX14jZsac6EH/Hm+ePU37GS0i+lH/JrG+lxZcPuqW
 DmjdFaUEzZT22AlfMpZZDgt0XxJXby/AMqyBZwfJBXH6gJ8v4auQOU3Q+rZ5kVj5SLqXCk
 ALodkzAUcpiRyD1Vdr6oLNqZYjrO1Pw=
Date: Wed, 19 Oct 2022 13:19:40 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
To: Mark Brown <broonie@kernel.org>
Message-Id: <S820KR.GPNPWZ8QG3PG3@crapouillou.net>
In-Reply-To: <Y0/pSVbueZYXBsmA@sirena.org.uk>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
 <Y0/pSVbueZYXBsmA@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Colin Ian King <colin.i.king@gmail.com>
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

Hi Mark,

Le mer., oct. 19 2022 at 13:10:49 +0100, Mark Brown=20
<broonie@kernel.org> a =E9crit :
> On Wed, Oct 19, 2022 at 08:16:39AM +0100, Colin Ian King wrote:
>>  There are two spelling mistakes in codec routing description. Fix=20
>> it.
>=20
> Bit disappionting that people didn't notice the errors during boot
> there...

Well that's on you. You merged the patchset before anybody could review.

-Paul


