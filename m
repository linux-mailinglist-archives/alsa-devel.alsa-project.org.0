Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651A30C580
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 17:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E3A1703;
	Tue,  2 Feb 2021 17:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E3A1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612283180;
	bh=lxASZWMgZnpkAJCzgt9ZNixhNDP2St8/5DUFh0LYTR4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=trRymfgAQx6RyR36LSXXk+NVq3lNCUWLz5n5ZT5abm73/e02f8r55H43dLP4pnyze
	 teXRbu+pXuutKQnulYWDlGgX+URZ1Smqr5UgCu+TihIBoDT2n+Od+ZqWEBn5GSzrKc
	 sNU09bne44VS2yiz89a88yLN0sj0zcjRPEBZY8xQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF788F80109;
	Tue,  2 Feb 2021 17:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D307F80171; Tue,  2 Feb 2021 17:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FF42F8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 17:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF42F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OLaOgypb"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60197cc40008>; Tue, 02 Feb 2021 08:24:36 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb
 2021 16:24:33 +0000
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To: Dmitry Osipenko <digetx@gmail.com>, Ion Agorria <AG0RRIA@yahoo.com>,
 Thierry Reding <thierry.reding@gmail.com>, Stephen Warren
 <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
 <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Svyatoslav Ryhel
 <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
 <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
Date: Tue, 2 Feb 2021 16:24:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612283076; bh=CEvP7Tc+GVpLUt9/g/q0cu5A7O0MJxg4tJPKJVFK2TQ=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=OLaOgypbOgXoCBypRvB4lzmBlljAml6HE+jwwCRJX3TpY3GR038XVJWyZrS0ATVF5
 SkXKFACbfjJw1DeMcyOjyEi2wK8K48xdoZcCu5wZqINh9SVuZJyk0VZC/M7oHGaPpH
 2kYNT4GjZD+dSOQqkOyYtHFFK4MFE0KuiwrJYN78TQqB7EEDhoxiSzho56n3wg/ldP
 c6bSbihD/jQxTDQOVmya28qE0323C5va6znTIpCA5TDljVwqRKCRjed2QqPex1XgH8
 aPKF/xhBdIal6CcqwRXndKmr+7nHf9FJami2Su/w7oCbn6xv5CGoPL7e7AbMHTWzgv
 4Tt0L3l4OGhbw==
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


On 02/02/2021 15:25, Dmitry Osipenko wrote:
> 02.02.2021 16:22, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> So this is very similar to tegra_rt5677, is it not possible to support
>> both codecs with the same machine driver?
>=20
> These codecs require individual configurations and those
> "../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
> quick glance.

Right but not all of that is needed. What is actually needed from the
header files?

> The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
> driver should be a better base anyways.

Sounds like a good time to update it :-)

> Overall it shouldn't worth time and effort trying to squeeze these
> drivers into a single one, IMO.

Not sure I agree when these drivers appear to be 90% the same.

Jon

--=20
nvpublic
