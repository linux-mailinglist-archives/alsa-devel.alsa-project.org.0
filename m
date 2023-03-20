Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 090FA6C1B9B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490731E0;
	Mon, 20 Mar 2023 17:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490731E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679329810;
	bh=kjNE+xZqCrD8iMoVdwZ7yuZZfBEJymUt10XwIxYh2IY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ShPK6taE6OJr1+iyqtzWnTnou7KQ5t/YAOYcYxMsL3Dc7im2D6qqm7Xw2+yBKMCyO
	 QMEBUywAUaPQP8hdpYDGM3BqngImxgbJuyPwj1UhF3Y8ay8u8wzu6XUGcDmghT43iA
	 MJ/7rDWsL/fCVc8wawRnjbvy7O5QmyoVbvuotsW8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A3B2F80254;
	Mon, 20 Mar 2023 17:29:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CED58F8027B; Mon, 20 Mar 2023 17:29:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37D7DF80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D7DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vv4sNgoQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2074B80EF8;
	Mon, 20 Mar 2023 16:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758DDC433A0;
	Mon, 20 Mar 2023 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679329744;
	bh=kjNE+xZqCrD8iMoVdwZ7yuZZfBEJymUt10XwIxYh2IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vv4sNgoQPQYZIt80kDvbscTGV8EyAOBLnvQJNKOVjOIWof8MSUsP1pcxCF0mz9ilD
	 QdNVhF/zy/ob6sZsf7Np9llMREtIsDd3VQEp4F26Of52jZ44R5ryPsOTBtdIMQ1AE3
	 8dugyBf2AOcS1qqBnqPzyb8hdBKvxChJ65hR7ns4FF8TnD9anxfVvrRrE8LbXM1ve5
	 QeLODxSRqLl/EnwXRwUB96JZfcfb4trlUcc8RSaE5/6lvDa6NAaYzoT08VoT55/Onn
	 37iXDFAs1+YyXU9uqijre8jtsuOUDS2/Zhf52EXBvYN8x3ECX6pphoxUdsqZ4YacrU
	 +51lo3tKKklTA==
Date: Mon, 20 Mar 2023 16:28:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <3f544569-553c-40c5-9d9a-31dfc48d06a4@sirena.org.uk>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <167904851367.26.16449705310108549543@mailman-core.alsa-project.org>
 <20230320155812.GA1755078-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SSpxkFyPmL3iEqN+"
Content-Disposition: inline
In-Reply-To: <20230320155812.GA1755078-robh@kernel.org>
X-Cookie: Keep away from fire or flame.
Message-ID-Hash: L2H7AMT75RWBO53IN4XAJF3L24JHJ3XH
X-Message-ID-Hash: L2H7AMT75RWBO53IN4XAJF3L24JHJ3XH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2H7AMT75RWBO53IN4XAJF3L24JHJ3XH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SSpxkFyPmL3iEqN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 10:58:12AM -0500, Rob Herring wrote:
> On Fri, Mar 17, 2023 at 12:21:41PM +0200, Cristian Ciocaltea via Alsa-dev=
el wrote:

> >  dma-names order constraint
> > Message-ID: <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
> > User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
> >  Thunderbird/102.7.2

> There is something strange going on with your mails as there are 2=20
> copies in the archives with the 2nd one getting the header twice. It's=20
> coming from the alsa-devel list.

This is probably caused by alsa-devel, it'll be mailman rewriting bits
of the message.  There's stuff coming up with other people's mails too.

--SSpxkFyPmL3iEqN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYiccACgkQJNaLcl1U
h9AWWgf+NrPa0MYP5i63yT+84rj5CMEVq9erNCfVLLi4aX7Rk2t3p7OHm6nPT5iH
nEuh1CIOa+avBw3wouVQt6nokWi+mq6QbmYustWX7hPq0Gz2FRTJyXl78DNWj8Ys
fZ4osjdXbr7f0Sa5lZVvImuVpGh7z03Fg9XbLkMXt7FDacubv1DY6RwJdphesoG7
C99xjwHv55veTyp/QbwCuyctpKWo1Dn4HvkL8XU//892rRaHt6enBBju6DWo8GTF
tr89XuM3flXYbOGumon2KSlsbzAXV7QKwnK9RCPsLaXuvO36PRBMippV/VmwnJCh
dYBmTNrePnumx6r2BbCzk0Gx8LMfdw==
=+3s7
-----END PGP SIGNATURE-----

--SSpxkFyPmL3iEqN+--
