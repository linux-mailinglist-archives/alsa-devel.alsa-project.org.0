Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345C6CDB69
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 16:02:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8606B1F1;
	Wed, 29 Mar 2023 16:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8606B1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680098567;
	bh=1JDbhnlCXp+QXLo5gNdlSiUGxdit8Xpa1A249X+r5nM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nVmYtcl0KmvolYkckX4yY9iL9FOPZrVaAHZA8SJL8OBHPULEr2EAYNiDu0A+XOGo+
	 2lsDOgILRW9V9VCo2oeuxw50jzKVHIi+VIb2JR7oG5OYrhvXibIwW5PJQsx/foMZOw
	 pjCXqjoP8JBytbDsV33WDj2Ki/Rk4P5olHmXqX50=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF840F8024E;
	Wed, 29 Mar 2023 16:01:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 878E9F80272; Wed, 29 Mar 2023 16:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23C21F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 16:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C21F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yb2f4ey8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90CAA61D43;
	Wed, 29 Mar 2023 14:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68062C4339B;
	Wed, 29 Mar 2023 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680098503;
	bh=1JDbhnlCXp+QXLo5gNdlSiUGxdit8Xpa1A249X+r5nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yb2f4ey82U54YWrWHMhRSO0+xhD3rKO+L0dJds7/mUT6EJmcKsg/pg09cL3+X5yqt
	 gFuMyYAqbDZY3cEDnM6llKeqjmH9by/n8O2qI6wtTy6hRWxe7iYezwbla/8b25zhJ9
	 WNJ364D7fx+R6QVth+7HrL7hXm/yzTFQpFxjXTtnm5XnlIjgDpMnWqeYu9lT8id1kz
	 qcNdtUweOdwD8Ad3f7LSwkUkwfG6kmHjPMuLXYqIuODnuMvqXeCZymI+sCYmdkiadQ
	 lvKLZfewORTWAwD6ewoFa8F4S45ir/3ctqPG/Atxn7uQou0Rb17xPVGkhvGS3/ZyJI
	 rlKZgmjOReilA==
Date: Wed, 29 Mar 2023 15:01:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <ZCREw+j8W0Uo+Fvy@sirena.org.uk>
References: 
 <CANPLYpBv82p-Fve-JgM=WDwUFp-VnKfG2yFvcGv8AT2roPEifw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XYlcBw+sQgu2A6wr"
Content-Disposition: inline
In-Reply-To: 
 <CANPLYpBv82p-Fve-JgM=WDwUFp-VnKfG2yFvcGv8AT2roPEifw@mail.gmail.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: IOHRZBZG3T75A3YEYRQ3TX2N6KXTWHSG
X-Message-ID-Hash: IOHRZBZG3T75A3YEYRQ3TX2N6KXTWHSG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, posteuca@mutex.one, tiwai@suse.com,
 yangxiaohua <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOHRZBZG3T75A3YEYRQ3TX2N6KXTWHSG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XYlcBw+sQgu2A6wr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 24, 2023 at 09:54:41AM +0800, Zhu Ning wrote:

> > There being two different GPIOs sounds like it just allows the headphone
> > and speaker to be controlled separately - that seems more flexible, not
> > a problem?

> Yes it's called multi stream in Windows. However, extra GPIO causes
> more confusion
> in the driver.

That might be true on Windows, however with these being
representable as DAPM widgets on Linux I would be surprised if
there were much burden on Linux.

> +       SND_SOC_DAPM_SUPPLY("Headphone Power", SND_SOC_NOPM, 0, 0,
> +                           acp3x_es83xx_headphone_power_event,
> +                           SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
>         SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
>                             acp3x_es83xx_speaker_power_event,
>                             SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),

Note that both of these would be much better represented as
events on the actual headphone or speaker widget, these have
event callbacks.  This will ensure that they are sequenced after
the CODEC minimising pops and clicks.

--XYlcBw+sQgu2A6wr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQkRMIACgkQJNaLcl1U
h9Dergf2LoQ4OhmixCubBqEKo5pEd7TxQ2no3/OnZjDm9Y71fYE510O+go7U1WdF
8Sp3iC1O8S9jCMm1hZVdYZaEQvcjZIvgDsVk3K2i6bcjo7B6bwY+v1JmzI8g2uMq
lbeZL/S2fLefpchh43LU1KWSSkPUm85XOk9Yv5kebnvz9cb5EqNGtypU5bC7+nQY
Szn7OUiWEbGbQE8hE64lm2HevlovU/v0IsNO31ocHSjGIUFZt/PpHUJCErbh8X8k
UOhWzu3UCudV4+RV75vRD8jL+zchU1Z+lAiBqJUPrbHqvTEx8IVUzVt0ppOdF/VZ
Q1la9dgWj9LbBnWZYh7eqVnpKcLQ
=2zek
-----END PGP SIGNATURE-----

--XYlcBw+sQgu2A6wr--
