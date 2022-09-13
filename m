Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDDC5B761A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 18:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEE71767;
	Tue, 13 Sep 2022 18:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEE71767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663085313;
	bh=QaoiK9aHa52swA7QKWMCX1EdP80hRX2/nxRk/GpprBc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aP4Y+P60caap6zO5hNLrZkzsGzetT5KD4/NWyCm8xsvvs3Y8NtLrTKezWAwM4JR6M
	 eyIcuKf0ngSs9A4pYTHJC+NhgQ9/LM0jM5II2mJaH4ckZI5oSIUZV1NUjn8V0wjJcm
	 5gK0d7rXi9zRhtMHvxMa3P1RGk6J6sWtH91PBY5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CBE5F801EC;
	Tue, 13 Sep 2022 18:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A3B8F80224; Tue, 13 Sep 2022 18:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7CCF8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 18:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7CCF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BKwZdm4W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04589B80F01;
 Tue, 13 Sep 2022 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1361EC433C1;
 Tue, 13 Sep 2022 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663085247;
 bh=QaoiK9aHa52swA7QKWMCX1EdP80hRX2/nxRk/GpprBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BKwZdm4WAYhORxtrjVWX3jK8jtUkf3+s7w9BGbo6zkFAHRSf1QOrT6JChhhPLzZJw
 TAtv7ptoZDK38BBxg2FZvgu/H9mTVqH9We4eMUIMluzyz6xMHsidjGaz2fi0BtDEmW
 +8FfilwaepdjbJuexMxP4GoFtFRPq37IrVKcPxXGpbHRzUW166rUVe2mAAsMDRmYKl
 YSw5AbQ437TAr1DyWLmfCe+Ob0MnuS8eUx9BL4p9D/12MjQorRaKyXH8lyKs47k0Xk
 y+5wCEtnGUVHKb4rwas4IoiOAg9ph9cFXrG6oIsXzFGewkl6kjfxgUXv0vm8hjP+VA
 spKB4ZGPlS9SQ==
Date: Tue, 13 Sep 2022 17:07:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: Set i2s clock sharing from machine
 drivers
Message-ID: <YyCquxBE3q+kOZuH@sirena.org.uk>
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <166276355052.332114.1969052042106279493.b4-ty@kernel.org>
 <96cd0c78-a76d-e32c-8f05-32e127df3fb0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SU6+datVMQKdk1vm"
Content-Disposition: inline
In-Reply-To: <96cd0c78-a76d-e32c-8f05-32e127df3fb0@gmail.com>
X-Cookie: One FISHWICH coming up!!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Chunxu Li <chunxu.li@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Miaoqian Lin <linmq006@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 kernel@collabora.com, Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--SU6+datVMQKdk1vm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 13, 2022 at 05:56:00PM +0200, Matthias Brugger wrote:

> DTS should go through my branch. We can see if there are any merge conflicts
> in linux-next and fix them somehow or you drop the patch and I take it
> through my tree. As you like.

Sorry, dropped now.

--SU6+datVMQKdk1vm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMgqrsACgkQJNaLcl1U
h9D/Owf9Ed/45wBsYkHFdYgI94NFz7iEMKYxN0ldW1A09VLfXzSGfRbdW9ziBNRn
9772Ua4+Z+YUJMkSl6Y93O41N/Rpqlt91iSOnI12R8++h3rCpzjzhSM3slgULRCX
vVnAJ4W4X1ArVJLq9LAizAg4bXJqdYI8rQ2IppS1J29Kwym+/yUyZvcAsyVKIeX8
o8Py5HgC2ycUEyG46b49g7LqE5qosl179z9AtUix8LD3op2TSIfNcfxuOOM42Sbd
FHo6UbBHpMoHSIQgYRcCOcCPsiQczcdAFXThtwgJFFR5Cq0JEW5Nv1+R3DoDETdY
gSWLGLBgtmdWDlBojKg0J203ZVUFOw==
=jebS
-----END PGP SIGNATURE-----

--SU6+datVMQKdk1vm--
