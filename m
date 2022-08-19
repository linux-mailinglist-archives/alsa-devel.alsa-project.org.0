Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5959A10F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 18:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733BF169E;
	Fri, 19 Aug 2022 18:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733BF169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660926878;
	bh=bQZQq2XUpwTz/Ci79LTQdLSzxEJl6LF6FbmIac9K/xQ=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCoHOG35jYESrqpvAHkq/+d2m8P/ilKOan9FqN36+8m6+k9yeMmUadty2IdBc5EHR
	 K8UEvWiEO96FTsd4Y3+tkf2UPf/1VUZSlC7lME6KQ979K+V67VwnaAhadJyKASGXTz
	 Yq0YaBGq8y89G5xJoLPCHzYsQeBX9kefsVl690xE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0D3F80217;
	Fri, 19 Aug 2022 18:33:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87605F801F7; Fri, 19 Aug 2022 18:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6A99F800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 18:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A99F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Dh8NRpYn"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660926806; bh=bQZQq2XUpwTz/Ci79LTQdLSzxEJl6LF6FbmIac9K/xQ=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Dh8NRpYnhlvGTSrl8kI3IsPfml+KB/TY78XOWW1b2g5BowbvU6uqduUJnINx0wAr2
 Z69FiYCjttKjPJiqTnNRK6lrKCbI7bbhVAMh4nrGCYnzFa1yTUWvYOV5cEmIOgiV9q
 4khlj+V+s8LHC7G2Aze7L3vab0H2aYBkcynTZJiU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] ASoC: ops: Don't modify the driver's plaform_max when
 reading state
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <4507B606-8424-4820-A8CE-F79BEDE5181D@cutebit.org>
Date: Fri, 19 Aug 2022 18:33:26 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB8051E0-BF39-405D-8F98-46EBD7271023@cutebit.org>
References: <20220603112508.3856519-1-broonie@kernel.org>
 <4507B606-8424-4820-A8CE-F79BEDE5181D@cutebit.org>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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



> On 19. 8. 2022, at 18:17, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>=20
>>=20
>> On 3. 6. 2022, at 13:25, Mark Brown <broonie@kernel.org> wrote:


>> This means that platform_max is no longer treated as a direct =
register
>> value for controls were min is non-zero. The put() callbacks already
>> validate on this basis, and there do not appear to be any in tree =
users
>> that would be affected.
>=20
> At least =E2=80=98put_volsw' seem to validate on the other conflicting =
interpretation
> of platform_max [as was introduced in commit 9bdd10d57a88 (=E2=80=9CASoC=
: ops:
> Shift tested values in snd_soc_put_volsw() by +min=E2=80=9D)].
>=20
> Also, the soc.h definitions of SOC_SINGLE_*/SOC_DOUBLE_* set =
platform_max
> to the register maximum, again interpreting platform_max the other =
way.

Another instance: snd_soc_limit_volume in checking the supplied platform
maximum against mc->max

