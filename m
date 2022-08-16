Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC615960A2
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 18:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D5E5165D;
	Tue, 16 Aug 2022 18:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D5E5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660668926;
	bh=g3VBk915lJLxJZ35VMsXzfqciAe4qfC3c6nm834wyg8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzcOjjf6+FfpdlYRbH+qOWc4td2A8iRyWoEtNhGldJvAMrAO4xcpOGyvTGhksSubN
	 AgHa9iOcWeEvjwdjRHyTxJY5GNNwYbZcr3rgVBaqflBLgidz5mrurWUH6yCEp9daRg
	 tATFTJbrirCWUPOH9OzFuh4jf2TwlKRHrASxl9HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E5D3F80095;
	Tue, 16 Aug 2022 18:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C89F8032D; Tue, 16 Aug 2022 18:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA460F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 18:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA460F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qXCLytLM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CEB65612E3;
 Tue, 16 Aug 2022 16:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FC5C433D6;
 Tue, 16 Aug 2022 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660668858;
 bh=g3VBk915lJLxJZ35VMsXzfqciAe4qfC3c6nm834wyg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qXCLytLMI283wyCeqkigwRzEa4lo1AhH9bUi3s7sgv1jUMYy7UVlFzwYrIJ01rh5F
 H9iWePyOfSfw7T5u/qEF4MvoJZvsqDqIfaGqCCai4tsrUsMixMmHjKVdpx4f/KkQTW
 Dc1we6KuSu2ucpGXU5iHDtKyxeKPdAuWH1xXJ3jjeLM/AhiF3ZffUQOk2qf/b13iur
 rA8aNfF1PF+c3WPEufWsZ6iRpvtMH2Vq1yB4dj6MPh/yQ7Y5/GpLUBcnl9MtscJL+K
 DBd2uKNE+T6NOR9gbZkCME/CWa84uDIvmb1zOr53ElyMiWKknY6yWgDaecu98siO0w
 5NeogqPxzQKxw==
Date: Tue, 16 Aug 2022 17:54:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: ASoC: snd_soc_info_volsw and platfrom_max
Message-ID: <YvvLtsFKnCirRwsd@sirena.org.uk>
References: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
 <YvuXeJ+/TnB0kojz@sirena.org.uk>
 <dac14248-39d5-d629-dd4a-92e9c22ea096@linaro.org>
 <Yvu+JiGg+1dLemo8@sirena.org.uk>
 <14f04003-7300-7d49-be51-e8341f699cda@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uadDY6vG9qOERt2J"
Content-Disposition: inline
In-Reply-To: <14f04003-7300-7d49-be51-e8341f699cda@linaro.org>
X-Cookie: A bachelor is an unaltared male.
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


--uadDY6vG9qOERt2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 05:20:12PM +0100, Srinivas Kandagatla wrote:
> On 16/08/2022 16:56, Mark Brown wrote:

> > Those macros just shouldn't be setting platform_max at all, the whole > goal with platform_max is that it overrides what the driver is doing for
> > platform specific reasons.  This is supposed to be overridable by the

> Do you think we should remove setting platform_max from these macros.

> Am hoping that this should also fix the issues that am seeing.

Yes, we should do that regardless of what's going on with your issues.

--uadDY6vG9qOERt2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7y7UACgkQJNaLcl1U
h9Docwf/aeluzb0O8p0NdpS70KeUO84ljRdZSf9vsAv+6DpKXm2QSUsSZAXcfsmm
rUhdW/274n6xglXTw8eb/awCzbnD0Bkl/4oB6F3gYc2OD5ncIllcUDKwwgbaqVb6
AHwxAVEuclaWudz/rJBJ2luYMc2boxO2Dxc0sW8lkbGzUereGRaW8RhskJXkfeF5
Sq6Wr6v/QMEZH7g2i0GuF91myNmPeNaEiCPtMH7Cx1YVgfNo830DEtO4kQa7zaVw
+d9AXwuy7CSTRf4nVnZAFHgjjuxrhXJlPN5DqYjzHgnsoX1hoenumjs3wBIiwJDX
kwpemgrDBEi9mDyUNsJ48ccyyQhEJQ==
=AoMq
-----END PGP SIGNATURE-----

--uadDY6vG9qOERt2J--
