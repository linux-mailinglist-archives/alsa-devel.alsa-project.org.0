Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0C2C6F8E
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Nov 2020 14:27:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB1117AB;
	Sat, 28 Nov 2020 14:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB1117AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606570064;
	bh=wlRpR5k7tSed5+Y/LjhaD1wUPthFRlO6ecBs7oG5hHE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVWqujm+YsC+9UUr1HM+2hzHNNXtUpuXxw1co7WCEwoqbPuhSExk4juvTFGoNS/ob
	 oNZxkIvfEdRQHZjCd56zUCyEeUtMe9ALx2lsQPlS4g+ERZG7TFJRcWGO0oYqnWeWs4
	 VKqaUN9PfULir2gOzYw6IBrd2Wkspu8NyVhnbqGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B251CF80165;
	Sat, 28 Nov 2020 14:26:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 703BCF80166; Sat, 28 Nov 2020 14:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A6E5F800D0
 for <alsa-devel@alsa-project.org>; Sat, 28 Nov 2020 14:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A6E5F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qyXpF6Sp"
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A0B02466D;
 Sat, 28 Nov 2020 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606569957;
 bh=wlRpR5k7tSed5+Y/LjhaD1wUPthFRlO6ecBs7oG5hHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qyXpF6SpgPF8iY8EUePUJsiv1JNSdeUpCyxkFYYJaSNq+1jgC97oDUbtarg61kpV9
 pn9uaMgHeCKBgaBuW3oMi2acFODI2OPwuTtLsDYatF0Mfi2sIhHkyXvvI09HamRxO0
 85mMqV3o+xmJNp46PoYgcIwQ6zLmj61RUOz0I1pU=
Date: Sat, 28 Nov 2020 13:25:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 0/2] Make cb a required parameter of buffer-cb
Message-ID: <20201128132551.4006f293@archlinux>
In-Reply-To: <20201121161457.957-1-nuno.sa@analog.com>
References: <20201121161457.957-1-nuno.sa@analog.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-iio@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
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

On Sat, 21 Nov 2020 17:14:55 +0100
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> When going through the code of the buffer-cb interface and all it's
> users, I realized that the stm32_adfsdm driver is calling
> `iio_channel_get_all_cb()` with NULL for the cb. After going a bit
> trough the stm drivers, it looks like this is actually intentional.
> However, it is clear that we have a clear/direct route here for a NULL
> pointer dereference. This change makes cb a required parameter of the
> API.
>=20
> The first patch makes the necessary changes to the stm32_adfsdm driver
> so that it does not break.
>=20
> Nuno S=C3=A1 (1):
>   iio: buffer: Return error if no callback is given
>=20
> Olivier Moysan (1):
>   ASoC: stm32: dfsdm: add stm32_adfsdm_dummy_cb() callback
>=20
>  drivers/iio/buffer/industrialio-buffer-cb.c |  5 +++++
>  sound/soc/stm/stm32_adfsdm.c                | 12 +++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>=20

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to do their magic.

Thanks,

Jonathan
