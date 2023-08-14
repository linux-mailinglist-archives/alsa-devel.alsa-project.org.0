Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5360577BA87
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B776827;
	Mon, 14 Aug 2023 15:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B776827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692020811;
	bh=3GWUGU3sn/mG21fzGuyMqh51zJlW4hGxN9JOTvBoYEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S92zKJy0grLraI2q4dzuXIkHl7HujOrFqm6WUdpewNcrXdAAwaTjd9dLMeHEpEFin
	 5sVgYeF2cdWDOmoVMU52i1u2FLpQoXlh02I4gtY1lDE1+VxFz4Uf0HUknfMyscLzxj
	 AbsBIpgIV2Hfb6D2yr5W2u5p3KeZ6BcW2bNI7cVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0E98F80074; Mon, 14 Aug 2023 15:46:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE80F80254;
	Mon, 14 Aug 2023 15:46:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D04A8F8025F; Mon, 14 Aug 2023 15:45:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C4ACF80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 15:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4ACF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YqD2U0V2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B642E615B0;
	Mon, 14 Aug 2023 13:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918D8C433C8;
	Mon, 14 Aug 2023 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692020744;
	bh=3GWUGU3sn/mG21fzGuyMqh51zJlW4hGxN9JOTvBoYEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YqD2U0V2tuxKZqxWonJYrqzUtF4LVqwXLZtE4B/8QCGUXmjMdi5/Vy3RG8+ny68FW
	 9ZLD41a9bVbdV5626Qbkc/m8Uff5zw0x3RRPyGBxZkf5FqceOXnFOniggixG/FtXs6
	 GTb8FSPkQ/TjyNtQqcbkB8/Vs87Sb3YosijuXHfP248tR4OnTyh9h+Rw6iqoHSK2Cq
	 LVLf9nAXZ6pYHSUxJccABK8IUTTPy7LQ2PxZLrKJqjt8lQhVMxPWYnPt5631xOPHoH
	 vnppiFo25hGzBQ89EK/NfqwgiG7yy+nKN3EVUWjBwbz9h4gWtTs1H/GF89huUiwnVw
	 KHfaLNQ7ni+YQ==
Date: Mon, 14 Aug 2023 15:45:41 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: treewide: add feature-domains
 description
Message-ID: <ZNowBaT2nLj4jEm3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W69stkuq3CQIl/r9"
Content-Disposition: inline
In-Reply-To: <20230811100731.108145-3-gatien.chevallier@foss.st.com>
Message-ID-Hash: FIXF45JII4ISSUVJ2CP2ZKOCQ33YAN3C
X-Message-ID-Hash: FIXF45JII4ISSUVJ2CP2ZKOCQ33YAN3C
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIXF45JII4ISSUVJ2CP2ZKOCQ33YAN3C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--W69stkuq3CQIl/r9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 12:07:22PM +0200, Gatien Chevallier wrote:
> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
>=20
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C (once the rest is accepte=
d)


--W69stkuq3CQIl/r9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaMAUACgkQFA3kzBSg
KbaUdQ//dzd+zVw4+lLQfMm5N9CAHnO3jRuJqiYQmp/rDIgsZY8CClGeuNYuiFGQ
sJAlf9Vh2aH2qFbq7TJkPelVMPe97mgjxKZDJjrpGUe6CTcLGpK4P5dx0bQmxrDV
X9wg54/VUPmf92H5LDELCgEQBUpxE2M9kMMYXubSN+gyCYDo+RZFOw+aOfRcqKkT
jyWMjSPQsNYTIn/u+DiQidjJYYW3Y1NwiUufKoBCbTUDkmUkBsIAkqq5dYf1he96
cDBjQz4aQzw8q9mITHh1GI3MX5AGpxJc8XmUwD2PwcshkDb57FJkTElHQIhKJW2R
+BPM4dGmzfvtj6G7+/7/E0CWVymbxnEkOVK46qPYw00tD2C7Khm0kRLEbwEcenS3
SlXgrYoVcGf73cxfYrShbSvV32GuQZ9onZxIbgdFMjtiCO7E2WKqPUkNt1hDecEf
WoMbKLXvmxdcRjmmkRJRBGeUwKThDjHDvfYtURQ3+31TVkqxLDLoHE8gF78pL3yw
LW4HQwfekpHvSObQssYoMM2mJrM7yidifx+OCmWywsvmYM3MlJklqapPTI+IVwdm
CxMb+ZhS+C8HJfNS/5Q7AY4N4Qav0cG8Kdk2xTS2hBurkQ87PGjXdpkKPRIG6/wD
02vyuQVUcnLNDqAwXkEORXxqaidoTN/suDmNhiHszczHfBZ/X0o=
=VsN7
-----END PGP SIGNATURE-----

--W69stkuq3CQIl/r9--
