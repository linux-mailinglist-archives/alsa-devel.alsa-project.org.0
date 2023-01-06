Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CAC6601AF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 15:00:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C423212973;
	Fri,  6 Jan 2023 14:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C423212973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673013630;
	bh=Esqf6WfRusE6N5q7EOYK75AMvHYKOnQq3yC+0vsf5Zk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IqU5SkyDtvSmjrTa8XxvekbegyDtBNJHgMR8yz/5YVzR8nWh9mxAh4EDjFJMASIus
	 vKvz99N3cTOvfJvmuyY0KcOezdNTqKT842/igQY42apF5V5dw0RCXf4VL0ziZR9keE
	 lrJe7sjLiA67ViV+f5VFgtlGAyGNRKvwX2lk4nnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F788F800C0;
	Fri,  6 Jan 2023 14:59:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E34AF8024D; Fri,  6 Jan 2023 14:59:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09977F80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 14:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09977F80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CqUoHXMZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA4D0B81C52;
 Fri,  6 Jan 2023 13:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA55CC433D2;
 Fri,  6 Jan 2023 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673013572;
 bh=Esqf6WfRusE6N5q7EOYK75AMvHYKOnQq3yC+0vsf5Zk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CqUoHXMZShGtVN0jDQw8SfHL5ylyMVQ1DLQzQzcsxAEVx+ARa+UCB5FeZkY+9trCk
 qaIeLQybZbUGAAEVaa+P0p7L3fbX2N4I9SqeaGl9k3TM0Iw/RCYn9gGe4lOMso+o3e
 zOa/oA+X2Lnd9U5F1wrJ0cE3Ys24n6jimhGehi8VYFsfd1qNtq4g6/wdDY1b6mpdtT
 w8Bj3R+IQtgCzR/Izi8zFZKbRb4O+FrW8E5bbuYO026z5ZqZ1nOguxrLvlxC4mkprK
 SU14TQ/3XvmX4QDa19RAbd8Due8cTLm+OO5/TmToowa3BI9bw6ES+huErkdJ1RD652
 cSjLYOZZena6Q==
Date: Fri, 6 Jan 2023 13:59:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 04/14] Removed the usage control and add the power switch
 on DAPM route.
Message-ID: <Y7gpQPuVLmDj/S95@sirena.org.uk>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-5-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rmRBjBl1G5DrFYI4"
Content-Disposition: inline
In-Reply-To: <20230106091543.2440-5-kiseok.jo@irondevice.com>
X-Cookie: Do not fold, spindle or mutilate.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--rmRBjBl1G5DrFYI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 06, 2023 at 06:15:33PM +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> Reported-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/sma1303.c | 79 ++++----------------------------------
>  1 file changed, 8 insertions(+), 71 deletions(-)

This and most of your other followup patches should be part of patch 1 -
normally you shouldn't introduce problems then fix them as part of the
same patch series, this makes it very hard to review things since people
will see the problems earlier on and perhaps not get as far as seeing
the fix.  Once the code is merged changes need to be incremental but
until then you should fix the patch itself.

--rmRBjBl1G5DrFYI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO4KT8ACgkQJNaLcl1U
h9AjLAf8CckNy/svY1ZR3Zjpe4DjYbqQ3d+wqRnO02rlxPDtYj3z9G4ejZKZsuXR
G36nnR9+SYnGl3erEFYI/vLZ7OHsOY8N+UTChFrucuxVXftRyP4xZms87rGyk8j9
EQT8Oy/MErA20ixQyCK5MSGSa78hWLCCegvu1f5D8OLx1QS6tdomANx7ucY0RfGi
S3WPmqgFTRDGgec6jFtLUhc3vzxdRxnVz3z3mIctToFCtkn+WRTE6NiE55JdWq+M
spXfdHbF+sWXGj1SsLY846sJnVBTH69NYfP5eeuhJXLrN7mB3Cr87KOfGW/KCn1f
AGZa9hPSle+OsLFOY7JNmZdQe2x8nQ==
=9LXv
-----END PGP SIGNATURE-----

--rmRBjBl1G5DrFYI4--
