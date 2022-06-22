Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04470554F0B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:23:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B591B11;
	Wed, 22 Jun 2022 17:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B591B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911389;
	bh=gDQEEOMHJwv/vwhMSl0koqV0mmLsKIRqsa1GAsw7Xvo=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuiORc/Mp37Exu0U+AwnoDVcnjjW4lx3h8nK9EnVYRYQg+s5tvv3tiS84lSdUGiCY
	 6nK3YItxPxHaExpuWkOWM97z4Qi790UtunXcKxrvRJWEjQ1iFThv4kF4+5WwYrFiax
	 kphSsltQG0kfrKkkBDP9MaYQjh0tZs+/l/WzYNWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DA5BF8032D;
	Wed, 22 Jun 2022 17:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE10EF802D2; Wed, 22 Jun 2022 17:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29B65F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 17:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29B65F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="sY7XJ271"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1655911320; bh=gDQEEOMHJwv/vwhMSl0koqV0mmLsKIRqsa1GAsw7Xvo=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=sY7XJ2718q7skD7mpkx259iGqJHkgHnyoFFrivVimXIP7sxb7/CX37kY8hxMKqgOp
 IdQ8Wde0JrLNpQzhjY+zEVx306yUH5B4PWfFMOyANYHG9k5R4vcAVqJ62DS476XdjL
 WVX+Bgv496QBxSEfxWfpRxp0gwCreFn3eacMrBFU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 1/2] ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <87zgi5p7k1.wl-kuninori.morimoto.gx@renesas.com>
Date: Wed, 22 Jun 2022 17:21:57 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <E911EF2B-5297-4893-BDA1-EEB8ECFC3B45@cutebit.org>
References: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
 <87zgi5p7k1.wl-kuninori.morimoto.gx@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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


> On 22. 6. 2022, at 7:54, Kuninori Morimoto =
<kuninori.morimoto.gx@renesas.com> wrote:
>=20
>=20
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> commit 900dedd7e47cc3f ("ASoC: Introduce =
snd_soc_of_get_dai_link_cpus")
> adds new snd_soc_of_get_dai_link_cpus(), but it is using
> "codec" everywhere. It is very strange, and is issue when error case.
> It should call cpu instead of codec in error case.
> This patch tidyup it.
>=20
> Fixes: 900dedd7e47cc3f ("ASoC: Introduce =
snd_soc_of_get_dai_link_cpus")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

