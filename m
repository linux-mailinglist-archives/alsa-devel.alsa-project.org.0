Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05C5AD6CF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D716950;
	Mon,  5 Sep 2022 17:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D716950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662392778;
	bh=OGZDmLVgowGNvf3N0utT2jFDXHIHMkUSK+YXRdATo/g=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTmE3j1bxRAL9tT3pYJoMA904KoKXehoDQ7aVEH9mCkgQmxzxiTzprhs6bROoej+/
	 1985NUSEf53A2LuhH13ZrbkPcIGw0xwwahRMMyzWT2wlP7PmXOSHjZEznqvNWCwCQP
	 a1+iBLD9V1RXIxHApZzqzfL3uHREWfbUbyNaU0Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCAF1F8032D;
	Mon,  5 Sep 2022 17:45:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9073F80238; Mon,  5 Sep 2022 17:45:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6722F800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 17:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6722F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="WqxmVGsk"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662392710; bh=q9fEBH3gcopu3CzK9ZpmTk1BGZLQ/rDml3lYdRY2lSE=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=WqxmVGsk9LDpi1helFou5dOiZiiuSbq7JfhJvMKulTsjUg7R3uATz8Y4qb86/fsuX
 VzH2cIsYo2GQtMResuDSGsH6+CrZKNgIQvlAsR/YrJh86+BKLFX0l56JyoUpk9pkeA
 GRsK3dT4uNF+R6juj5bH4vQKG+gaKxvuz5R08LSI=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 0/2] Untested TAS2562 power setting fixes
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <166239232739.736206.17258746656389143736.b4-ty@kernel.org>
Date: Mon, 5 Sep 2022 17:45:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <C600ACEB-C64F-4501-94E4-17B4FD0A8918@cutebit.org>
References: <20220825142226.80929-1-povik+lin@cutebit.org>
 <166239232739.736206.17258746656389143736.b4-ty@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, asyrus@ti.com,
 linux-kernel@vger.kernel.org, navada@ti.com, raphael-xu@ti.com,
 shenghao-ding@ti.com, Stephen Kitt <steve@sk2.org>
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


> On 5. 9. 2022, at 17:38, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Thu, 25 Aug 2022 16:22:24 +0200, Martin Povi=C5=A1er wrote:
>> The tas2562 driver does the same thing with the setting of PWR_CTRL
>> field as the tas2764/tas2770 drivers were doing.
>> Link: =
https://lore.kernel.org/alsa-devel/20220808141246.5749-1-povik+lin@cutebit=
.org/T/#t
>> Link: =
https://lore.kernel.org/alsa-devel/20220825140241.53963-1-povik+lin@cutebi=
t.org/T/#t
>>=20
>> These are blindly written patches without testing since I don't have
>> the hardware. (I even tried TI's formal sample request program but
>> was refused there. CCing @ti.com addresses I found on other series
>> recently submitted.)
>>=20
>> [...]
>=20
> Applied to
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git =
for-next
>=20
> Thanks!

Texas Instruments is shipping me samples of the affected
codecs, so I should be able to test the changes on hardware soon.

Should I find regressions, I will report back.

Martin

