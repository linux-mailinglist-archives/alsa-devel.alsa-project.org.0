Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFAB968CD9
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2024 19:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47A78857;
	Mon,  2 Sep 2024 19:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47A78857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725298358;
	bh=HXcq0ct0LJKRhxG8kNmpnl2gWM6fMSfMQuwc1JsyMUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1lT2Pifexyc8jEZFRd/vDfCkWLqCZ08sqe5qq9SAKqOf+G1XfsODqCJxxKniFLNI
	 iDCCmL/OjnZclx6qUevDhBBf0SLlFzdE+l5oEy4H4jtK8nmnHXfxd65PdLxLeMLTAX
	 6ocLehhUqCEs0Ak2N0p4Wwi7P5YalzwJEMHNLy/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7592AF805B4; Mon,  2 Sep 2024 19:32:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAACAF805B0;
	Mon,  2 Sep 2024 19:32:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67E80F80217; Mon,  2 Sep 2024 19:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99369F80152
	for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2024 19:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99369F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A9lAqNa3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C565BA41F2C;
	Mon,  2 Sep 2024 12:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF7BC4CEC2;
	Mon,  2 Sep 2024 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725278803;
	bh=HXcq0ct0LJKRhxG8kNmpnl2gWM6fMSfMQuwc1JsyMUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9lAqNa3tGEHpHNG7BwmgAStINu3l7DFXjNPRREKZXzedU8YSAK/8CfGJFDSRIzU9
	 njz/C1xRQehWS9wHkMUNFvv1t9xXDc5t2q6uxwHg1kN3VDNxhcJevtttHySGdZbBXc
	 jO9akdmx764NRX9AhP8FJLCbUT+MQAVobwkqdm8hdO3bB1pwcnKY2kkgLWP1sce4lp
	 kxfAKjEl35G6CS8fygAGil4RmUE60OpyQUMDBWN/wi+RaEJ//y4/n+Jqa0lKtlRr0L
	 GqjfXMuVeq6CAgVceFmNqAoBca9NB1CjvNjUDaehBLDuX6fIWTALqngKSXC7lYCPsf
	 TQOUSZoZ7RKJQ==
Date: Mon, 2 Sep 2024 13:06:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
Message-ID: <fe428f02-3eca-4dce-9eef-675cf3e56831@sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
 <31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
 <87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2hCQ+uZH4nwrsHRW"
Content-Disposition: inline
In-Reply-To: <87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You are fairminded, just and loving.
Message-ID-Hash: 22PSBRP32ZFMGWD7AEXMELI6QDI4SK2R
X-Message-ID-Hash: 22PSBRP32ZFMGWD7AEXMELI6QDI4SK2R
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22PSBRP32ZFMGWD7AEXMELI6QDI4SK2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2hCQ+uZH4nwrsHRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 02, 2024 at 03:48:27AM +0000, Kuninori Morimoto wrote:

> I think we can learn how Codec2Codec is working, and apply it to DPCM
> somehow. Then, if we can handle above via DPCM, I guess normal Codec2Codec
> also can be handled via DPCM ?

I think that would cause trouble, with DPCM all the CPU drivers know
about each other and it's all horribly fragile.  With two CODECs there's
no CPU involved so the CPU drivers wouldn't know what's going on, I'd
expect that at best the code would end up looking similar and we'd not
gain much.  It's possible I'm not seeing something though.

--2hCQ+uZH4nwrsHRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbVqk8ACgkQJNaLcl1U
h9Curgf/WTXVTAcxtxriURe5REfRquWzYMzmvT/k0ZrcSnSmfNORoztpM72GVk9F
mxoi6rbpjg2Z7NeZvuPdROAHgDUz937nMfT7m97bH1WHDjYXtVuTh95hEyRomT2B
CPIlFwLybe5rtw7P2Rwmy757yXQyDvElKcw+2O0kbHG49oMVwtzx3lncjZi881pO
s4hJ73HMxZbCpygQyeY+Vraj7ILvMmXYu/sQy9uRXtIUu5RpBsUEsWGwRu6qNR1Y
xKomb0UH3x4f9av/HKaxKlNFL3+bb6R8mbx0g5e3pEv5TiDCYH8H3e0i38Zye0S5
Wq2AnY29hwJoU3XEtU52KcQCBfxeZg==
=xQnr
-----END PGP SIGNATURE-----

--2hCQ+uZH4nwrsHRW--
