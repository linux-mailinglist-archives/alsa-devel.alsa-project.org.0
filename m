Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0062595D1C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8693A1657;
	Tue, 16 Aug 2022 15:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8693A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660656060;
	bh=P2r9JBc9HBQY/wUStI8UlO5ltmSxbVGZrSKaai4+Nbo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7Ewaaiqw6PMEUg8XylDfi53mKXDm9sXZqB6i7kP+MVpfHk5+GxjYHhF2Qs4kxQVp
	 AAkP6+otP90RLGg3ac42Z5Hv64Z8Z/5ZSuRXSGDivLl6bE8wZrejWbepmqldu3sbhg
	 r4KSBET8djVrV3Und5PHEgzo2EKpiO5N0nPdUGWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0097F8032D;
	Tue, 16 Aug 2022 15:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C67AEF8032D; Tue, 16 Aug 2022 15:20:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D7D6F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7D6F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pFkN9dkl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE54A61321;
 Tue, 16 Aug 2022 13:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94240C433D6;
 Tue, 16 Aug 2022 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660655987;
 bh=P2r9JBc9HBQY/wUStI8UlO5ltmSxbVGZrSKaai4+Nbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFkN9dklr49qs8xhsGFKwsHSBGjM5tuFAUIsV+at1ebiwm/EFd0pk8Tc6y8aCCg17
 GyLiHkFmYMxUE7PDdayfqayCzqsUCbT5awKTHzZzerA8peGPuTacY2frfCbKMrA7en
 9dWbnM7XYhX9b7Nqdtcwdfo1sWyKr7swwIWDgPocy2S0ZZ93OBvuGHoAT7UEk1Y4Do
 SBrebNgbfQRgAIZFfr2ynOA+v6asXd40kLdAlRtC+DbFmfgkerr25asHo8hVX1037n
 eO9KhxEhV4aEdekm8rh/7C8pBlAEIHRr/y43GWfLSiyt9OmLi0GJXELrI2shu8jq9W
 x0jMPBbRM03RQ==
Date: Tue, 16 Aug 2022 14:19:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: Rockchip I2S commit possibly ignored
Message-ID: <YvuZbrBWzRjHYQZj@sirena.org.uk>
References: <YvuYZE0biiAn/sxQ@geday>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wlmdBkEB7J9ZL05a"
Content-Disposition: inline
In-Reply-To: <YvuYZE0biiAn/sxQ@geday>
X-Cookie: A bachelor is an unaltared male.
Cc: ALSA-devel <alsa-devel@alsa-project.org>
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


--wlmdBkEB7J9ZL05a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 10:15:16AM -0300, Geraldo Nascimento wrote:

> I was looking at Rockchip I2S commits and it seems "ASoC: rockchip: i2s:
> Reset the controller if soft reset failed" was supposed to have been
> merged to your sound.git but never was. I don't know if this was
> intentional or a real miss but in any case I'm letting you know.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

> However in the alsa-devel archives,
> https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189050.=
html
> I see there was no commit info for the unmerged patch. Perhaps this
> caused it to be black-holed?

If there was no commit info that means it wasn't applied.

--wlmdBkEB7J9ZL05a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7mW4ACgkQJNaLcl1U
h9CfTwf7B3XGeiNNqEFy3rqmQHMi7SV/Ok1Ym0ST+mE4Vaz2VMl9QjijM47QFRBk
cDFb7LeoQjp8NtOw7gP3sjX2EFC9dxn+B8PZk+J1cUa1RaoRMc++kOIju3VmUyUB
5KXNrnfpBtLNIaMheQccpa+Ujsr5nsU1tI5qJQc8c0cfw7/mRs/ElpDHl3agmqJv
lOHX/9RAQp1o80NyVTxHV9Y0VGvRvqq4rrCCxaIiXCG24pgykHN251hNTeRIqyod
gMegLavy5jBSvqiPu0ZbxC2ZCrRGSCIX/cw5dvFZgAIPnG/zzghmiOlVLKOTlqgn
bXwuPfo74YAuj6g53saNdfQR4radwQ==
=GIf1
-----END PGP SIGNATURE-----

--wlmdBkEB7J9ZL05a--
