Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D3696F87
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 22:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFF0847;
	Tue, 14 Feb 2023 22:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFF0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676410032;
	bh=hSX2Tgc6oAfWUXYYtLCPZp7+VDxvI+TUXbWFtIES6zM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZiPHauPxj9mfG79bzAnuWf+0kCz6jjW1Ym5AvxhNxoxJZ2QIKfLeWT9E/gByoYinH
	 TarPbxWnK/Pq2bjMwolRG0nLqixzPF+ghab2IkarWRfB6oqCng+Lph5b0qXa6TY6EU
	 vfFugIPl+TMro7ev9GwxjMVRDkcexHePzVTlxOlM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3368EF800E4;
	Tue, 14 Feb 2023 22:26:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 864FFF801C0; Tue, 14 Feb 2023 22:26:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CB80F800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 22:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB80F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qV6SMHcZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C1A1618D1;
	Tue, 14 Feb 2023 21:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2360C4339E;
	Tue, 14 Feb 2023 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676409970;
	bh=hSX2Tgc6oAfWUXYYtLCPZp7+VDxvI+TUXbWFtIES6zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV6SMHcZtnxTTa6QqmyBbQ3ANvvAhnVOXyOlGY7Z5GOevT3CdpCQPCLKCU5K1/MFm
	 HLI3WGS+cIJhWgKHaW3wB+MRcRRIeZX4DvUbjpqK2eZ0ZnfXF1hgZdGrkb9DUWRkMH
	 MrOHsckBzns+ucbjPlbirYyEL4m3S6+Cq1ZAfV8FDu/Y4gygsM93JzYvmmVcbHxisL
	 t1WOeEspo8SL3f3wLxch4HA1RHXngmmm5YnVCNu/M3WEAKQw9/Y0ZYmATb6vhvNU99
	 upLXhqHAjvQjxjDZXmXjIQNrWLDWhRYBN2MfSzgII3uwtWJm3udXq3vtBGhBGGhUee
	 JZyyuDt6ZP34g==
Date: Tue, 14 Feb 2023 21:26:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/3] ASoC: soc-generic-dmaengine-pcm: add option to start
 DMA after DAI
Message-ID: <Y+v8bbr4cNSOA1SF@sirena.org.uk>
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-2-claudiu.beznea@microchip.com>
 <b065e2bb-1f11-067a-b085-45d47626927e@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R54liaYzL9gFIZzm"
Content-Disposition: inline
In-Reply-To: <b065e2bb-1f11-067a-b085-45d47626927e@metafoo.de>
X-Cookie: Serving suggestion.
Message-ID-Hash: SRHRUJID4LAVUPL2XEBCJOWBSK2YZF2S
X-Message-ID-Hash: SRHRUJID4LAVUPL2XEBCJOWBSK2YZF2S
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Claudiu Beznea <claudiu.beznea@microchip.com>, lgirdwood@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRHRUJID4LAVUPL2XEBCJOWBSK2YZF2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--R54liaYzL9gFIZzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 14, 2023 at 10:14:28AM -0800, Lars-Peter Clausen wrote:
> On 2/14/23 08:14, Claudiu Beznea wrote:

> > @@ -450,6 +450,8 @@ int snd_dmaengine_pcm_register(struct device *dev,
> >   	else
> >   		driver = &dmaengine_pcm_component;
> > +	driver->start_dma_last = config->start_dma_last;

> This will break if you have multiple sound cards in the system.
> dmaengine_pcm_component must stay const.

Right, if we need to modify it we either need to select which of
multiple const structs to register or to take a copy and modify
that.  I've not looked at the actual changes yet.

--R54liaYzL9gFIZzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPr/GwACgkQJNaLcl1U
h9DDgQgAhYXy5TF+7Mg2IjWNd041kJVc1YKqear/ET167ZstAJ9vPrvD2rhlh0R/
U+aSgJDd4qoFQ4WHBIW2U2xGAbHgjiXbiCfyxdCRChBtS+gKfKEOjxyKxNHh5ImM
1WJyZfgnvXg7Sb8wRTSaALBuDok7YreQAsTkqOSkYIxzH+LTcRYu0XXEaykGCY+E
kpqZUbeNlOhpzu0ljyWHl6zqkDY98+hVpn8kIaMbjTTx979/lR82pDe1CcyyaFXO
M9p3TdQNJnf49mHrQf77Zyk4/Jf4268r/9xjtT5OtMYGEY0xdiPrMZuX6KgDE+l9
2QEnZ6cey67U3HBu12P48htN0LhEmg==
=ALoi
-----END PGP SIGNATURE-----

--R54liaYzL9gFIZzm--
