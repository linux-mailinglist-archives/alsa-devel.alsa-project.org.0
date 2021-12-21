Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9C47C09C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 14:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57AB416CE;
	Tue, 21 Dec 2021 14:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57AB416CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640092626;
	bh=sk0Q9IPjJ44wyQeKhwyoUIo8aDfFP9mAvviunqg2RJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=it3B3gouBZw2Mqmx/ehsUpeX05ve7YHG5W74eoaQRbzjlcPcCOjijLMGYvzi0vnXw
	 qkTmJ6j/5bXxSiguVBUr7XR9jaLca6ZTPO+JPkOfRScyUQyr/KNgBnn2LG1+YwBKgv
	 o1nb4wnQ/kR1qFVDRvlCHuJ9mPjAsa66x5sYXMXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B336DF800E3;
	Tue, 21 Dec 2021 14:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FE6F80118; Tue, 21 Dec 2021 14:15:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 956D8F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 14:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 956D8F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m6Ru1qA/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AFA2B816AA;
 Tue, 21 Dec 2021 13:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2517C36AE8;
 Tue, 21 Dec 2021 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640092549;
 bh=sk0Q9IPjJ44wyQeKhwyoUIo8aDfFP9mAvviunqg2RJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m6Ru1qA/BwMNoRmlG3JT9QXGR7mNlPURyEPBPgg7O2UVh+qO6kgbt5FD21wOiX+Bn
 NZ7W2z6fpqKzcBDwnmLpsgGey4EyfMeELoFvvqROKvH7klb6kMzwg3OxYtArZaKZP1
 RxWpgLvHHpiiPsoh+vaQOIRDhZ9CO0v2iL0aNqYVxpwJtb4TZUnPK7+TbM4SV7kfS6
 HyNbs6hoJotoxtg0Ln/agVd71oHIvWggsl3yIIgH9YEPIFuHIoZjvGbdmFePG9aDaN
 EWPywZM1HhIcAcar0Fl6PppzJSR96PwF+t/cqynz7rjo0UiUeb9mi26QjVlU7KF89J
 LmbcUT7+cUE9Q==
Date: Tue, 21 Dec 2021 13:15:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v10 1/10] ASoC: qcom: SC7280: Update config for building
 codec dma drivers
Message-ID: <YcHTfh8ojUc1wB7W@sirena.org.uk>
References: <1639503391-10715-1-git-send-email-quic_srivasam@quicinc.com>
 <1639503391-10715-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9LTqFLt7kVn5dSDb"
Content-Disposition: inline
In-Reply-To: <1639503391-10715-2-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: Use only as directed.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--9LTqFLt7kVn5dSDb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 14, 2021 at 11:06:22PM +0530, Srinivasa Rao Mandadapu wrote:

> This patch set depends on:
>     -- sc7280 machine driver patch
>        (https://patchwork.kernel.org/project/alsa-devel/list/?series=590035&state=%2A&archive=both)

Can you please just either submit a single patch set or hold off on
submitting this until you've got the machine driver merged?  Both are
going through huge numbers of revisions so there seem to be substantial
difficulties here and having to follow web links to figure out what
patch sets you're talking about when you talk about dependencies is just
making things more complicated to manage.

--9LTqFLt7kVn5dSDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHB034ACgkQJNaLcl1U
h9DKsgf+KSR5/R77djrkp5CPROoyS7NGtEZZ1o4SzjI1cl1P6waYki8BHEN7K1ZE
uibXZZSeqbxRzSxb/1gn86KWUP/arKBmZRBZy7VESp1jIp7sGmaI9FQaDHe3i/CQ
QnqU7nBbQvxuh2uquOOOpidfAoZ3t3bT220ZNvjT53Ck4mkqqGet7/CrigdmJkxL
cjGMHM8Ps/vDSSNCJ/2pcYotf8+FqT9sPlss4vyNFtdzgzSGVfGSyAuDl47l0QCW
VSiDU/AslHMLFcpESz9GnvKxYZW9q8YdTLgYCoQWiYUEWyXeBTKfxSEcU+N8akU6
i7C4mlIOtcD4DP8NHGgnvPLXBa/+zg==
=5IV1
-----END PGP SIGNATURE-----

--9LTqFLt7kVn5dSDb--
