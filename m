Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3556146B65D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 09:48:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D2B23FC;
	Tue,  7 Dec 2021 09:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D2B23FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638866936;
	bh=u7FfWp/47sRTNYJqed/Qp5fY9fAuTHnXjRSVoBREBk8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uG/cJYWm7nK0m+4a2sByNt3cthignhmxSw0X88q2OYN9XozkSSUzO8KbwTiiXXBSH
	 v8S0w/E+cS25HXsiRbQrWfZ3PteGvfNRn6sgYbH89Y5qaUuVAauU7nv7v78lHhDJLk
	 m7YxZp7N0U0YDNQ0m2kyCKSxqtiAGoqLcaVYJiUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43675F8032B;
	Tue,  7 Dec 2021 09:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41726F8028D; Tue,  7 Dec 2021 09:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1F72F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 09:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1F72F80217
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 30C1A1C0012;
 Tue,  7 Dec 2021 08:47:34 +0000 (UTC)
Date: Tue, 7 Dec 2021 09:47:32 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-core: add the driver component name to the
 component struc
Message-ID: <20211207094732.3be5befb@kmaincent-XPS-13-7390>
In-Reply-To: <Ya5lplIoyhKsqFmZ@sirena.org.uk>
References: <20211206095920.40552-1-kory.maincent@bootlin.com>
 <Ya5lplIoyhKsqFmZ@sirena.org.uk>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
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

Hello Mark,

On Mon, 6 Dec 2021 19:33:58 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Dec 06, 2021 at 10:59:20AM +0100, Kory Maincent wrote:
>=20
> > If a non i2c driver register two components the function will return the
> > same "device_name" for both components. This could cause unexpected iss=
ue,
> > in my case it is a debugfs error which tries to create two directory wi=
th
> > the same component name. =20
>=20
> Why is one device registering multiple components in the first place?

Because the sound components are more and more complex. Why they shouldn't?

It seems to be already the case:
sound/soc/codecs/cros_ec_codec.c
sound/soc/fsl/fsl_easrc.c
sound/soc/mediatek/mt*/mt*-afe-pcm.c
sound/soc/sunxi/sun4i-codec.c
sound/soc/soc-utils.c

Regards,

K=C3=B6ry
