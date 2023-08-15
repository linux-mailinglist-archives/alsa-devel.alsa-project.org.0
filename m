Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D84277CDDC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083B174C;
	Tue, 15 Aug 2023 16:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083B174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692108696;
	bh=n5ZUySZEZiqsQq5qoUoRbN2WfkDeGQmpgZO6gsSVgNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVbHC/m/s3nucblhxWPwmsh/qvou108KBcNwJ7lCluJJT1abSswTa2uI14mJ44gkY
	 gVQpO6hhgdNXHK5oGVS9zgNzQHilMvgfORx+Vk+rkpvXHCEAARBPWMWrs4uJXL0iDa
	 2E/RAfAbiWasKB90dtWIC4HOR941ZMfbPSwFDVNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3621EF801EB; Tue, 15 Aug 2023 16:10:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDBDBF8016A;
	Tue, 15 Aug 2023 16:10:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32905F8016D; Tue, 15 Aug 2023 16:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74C49F80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C49F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pvMT8Jcn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A60AF649F2;
	Tue, 15 Aug 2023 14:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9358C433C7;
	Tue, 15 Aug 2023 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692108632;
	bh=n5ZUySZEZiqsQq5qoUoRbN2WfkDeGQmpgZO6gsSVgNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvMT8JcnQZj7OZmeLN4OT/RqwDIhHXrGoPSW8qC8zzDbSsyIch1Rv8GKkiGY7DkPR
	 cTIoVmCUU/5zjeeHADYvvuuQj08CU4VD2TJzinH8qRNYMwz5N5GURwwZOEEEHZvLAF
	 yhp3rpbsL8tMQsulZwbJ0sENQc81fWY7bx0Akhhru9ySYSuq6ewC9rTw4fc7MN6ba4
	 X2wCXy4KqRNvCDqJib5ufDckzKOScVjVxRqL79YIvbS6bRSYsVkHm0ojoRA8he0zqs
	 r2FeqkPyvPqJ6kl8TLFwdtJJ/1U0z67s6fDCkmZ3ZfchU/GpsrQVzk+pxlx59NNXRx
	 OZAGmxg0PGNqw==
Date: Tue, 15 Aug 2023 15:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, llvm@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of
 aw88261_reg_update()
Message-ID: <7b35b3b6-7eab-4652-9a16-851a060350bd@sirena.org.uk>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vj9n6GWKkaE+J3Ue"
Content-Disposition: inline
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Darth Vader sleeps with a Teddywookie.
Message-ID-Hash: K3QNXWNEHFQYI457HRM6GU5JHE32WRMM
X-Message-ID-Hash: K3QNXWNEHFQYI457HRM6GU5JHE32WRMM
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3QNXWNEHFQYI457HRM6GU5JHE32WRMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vj9n6GWKkaE+J3Ue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 12:47:43PM +0200, Krzysztof Kozlowski wrote:
> There is a branch in if() clause where aw88261_reg_update() could return
> uninitialized value.  Pounted out by W=1 clang build:

This series appears to have two copies of every patch which *look*
similar but I'm not 100% sure if that's the case or in general what's
going on - could you please resend a clean copy, it's probably easier
than figuring it out?

--vj9n6GWKkaE+J3Ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTbh1AACgkQJNaLcl1U
h9Db2wgAhKl6awfKbl76YkckQHA0qEwrCC3ehM9pJoMcPKMh3Sc9f3FMZrk4XmRg
sPzgcu1JgnUD/G3svs82wur5Kocs8gpAxTiBPonVpko0iILOA6IcELf8Rj3sXVOL
jUS4Qz89yi5zhrTcEQwZm+9FfrXwmeeRNef1KnNHEbG+24KUPVWcRxu/mWfvTPk5
WFL5fgeccSniy5L8pWNC464fRdUzoFSLNxR7/SXtiFjoGbXGCDkRsGNAiMWskO6h
MuFOlNeK8dvtwoVNm06CEk1MWftPzkmRQn6WHb1YjsWU4akwwFXyDRLeTVAfmQCU
lGuevRFzUsBb2FxR8FJyuJOpeRpAfQ==
=8N2T
-----END PGP SIGNATURE-----

--vj9n6GWKkaE+J3Ue--
