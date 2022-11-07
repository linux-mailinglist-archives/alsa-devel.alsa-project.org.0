Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A6861EFA3
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 10:53:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FCEF82E;
	Mon,  7 Nov 2022 10:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FCEF82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667814817;
	bh=IZ2hA+QzqHMxmdUCX2CDNivFpViGLnhcjuNlzpl1VgE=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rma0lVbhfhxgr5spD1gUAkNFDtrIj9LbO0eZePJiUq9zZMKSrIAopv3yHRURAg4U4
	 wXD+yh3VnXiDuzsao0v27C8/2qOK0SdWKAAwblMsyZUqPuNKyJ6HrpatbbFEsqQvWd
	 3gGKguYyaAgZNMV3UwUjhnX+/+pd7QcXioKXvDkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1344F800AE;
	Mon,  7 Nov 2022 10:52:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F175F8025A; Mon,  7 Nov 2022 10:52:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45A5F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 10:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45A5F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="Gzdw9P+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667814754; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NizqJD8Q016qLqC4Ks9C9UDul8yMaAw6Z3zOtKOWClE=;
 b=Gzdw9P+3UW7itQ/BwCwX4xeIRqQcDWBZHmZag2uZrSuaL+UHXqZPCupe6cIVRQsno4JoFB
 r//slxRQEfrkwFMol9aaskeYzFWa9L2iSBKs2u0BaU3o+kmwvX9x1R286KHIdHP5DXDgO6
 w1nx9bGrSKSTm3umNGthAZoYlywOcss=
Date: Mon, 07 Nov 2022 09:52:24 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: dapm: Don't use prefix for regulator name
To: Mark Brown <broonie@kernel.org>
Message-Id: <C32ZKR.QZWY19EUAOMQ3@crapouillou.net>
In-Reply-To: <166680764848.867857.6473365992161385316.b4-ty@kernel.org>
References: <20221025150149.113129-1-paul@crapouillou.net>
 <166680764848.867857.6473365992161385316.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

Le mer. 26 oct. 2022 =E0 19:07:28 +0100, Mark Brown <broonie@kernel.org>=20
a =E9crit :
> On Tue, 25 Oct 2022 16:01:49 +0100, Paul Cercueil wrote:
>>  When a component has a prefix, and uses a=20
>> SND_SOC_DAPM_REGULATOR_SUPPLY,
>>  the name of the regulator should not use the prefix, otherwise it=20
>> won't
>>  be properly matched in the DT/ACPI.
>>=20
>>=20
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=20
> for-next

Small reminder that this is a fix for a bug introduced in -rc1, so it=20
should be queued for the next RC.

Cheers,
-Paul

> Thanks!
>=20
> [1/1] ASoC: dapm: Don't use prefix for regulator name
>       commit: 1683d3282f240336a2b4b6b541d435facfe8bbb6
>=20
> All being well this means that it will be integrated into the=20
> linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>=20
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems=20
> and
> send followup patches addressing any issues that are reported if=20
> needed.
>=20
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>=20
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>=20
> Thanks,
> Mark


