Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EAE59BF96
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 14:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF78D850;
	Mon, 22 Aug 2022 14:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF78D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661171955;
	bh=wS7eBcU6IrGgczgQRn/ar+Ts2JGTgJKTlU4UR4ZP25U=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnN2E44fqYDv766/Ov9Khhc1buRjS88EFnQHj57xNFXaVlIj6vT7W1vnhMWukVuus
	 ptsU2C4p0pBoDh3TunI0UDmA/cCb2PKdOzB/AW8SeP1qlhRCaPzeGwbTxIbaoGqxUC
	 fpuJoLVxcBwM6TPvKX5wTjM2vs3xyCBsCJHlc42c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32DD2F8026D;
	Mon, 22 Aug 2022 14:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3C5BF8026A; Mon, 22 Aug 2022 14:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3606F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 14:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3606F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="bzkKcz9a"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661171890; bh=wS7eBcU6IrGgczgQRn/ar+Ts2JGTgJKTlU4UR4ZP25U=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=bzkKcz9aP0I6aeaU5C1aSTqv5/6IwA5HePKFdPxuaNr0X09HB12RFYLdDjGvKHbLI
 Im5zOhghXB6T4gVQMpk+IpcIBkcOQTaJdnbfoKRWr+Gn6nCWvq1N3gcxnRiAzVOJtG
 zVmVJXE0fP6qDFTxoOVix9nG9fk7IOsRP9q5DzsE=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YwN2Pd4Ez08yDFno@sirena.org.uk>
Date: Mon, 22 Aug 2022 14:38:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
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


> On 22. 8. 2022, at 14:27, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Aug 22, 2022 at 11:52:42AM +0200, Martin Povi=C5=A1er wrote:
>=20
>> Provide a DOT summary of the DAPM graph in a newly added 'graph.dot'
>> file in debugfs, placed in the card's DAPM directory.
>=20
> There was a tool floating about in the past (last copy I knew about =
was
> on Wolfson's git but they took that down) - can we not just continue =
to
> do that?

I don=E2=80=99t know the tool or where would I find it. I think it=E2=80=99=
s neat
simply having a =E2=80=98graph.dot=E2=80=99 at hand, especially since it =
requires
little code. (Although sure there=E2=80=99s the danger of it growing.)

Martin

