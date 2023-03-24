Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B046C7466
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 01:15:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF43EC9;
	Fri, 24 Mar 2023 01:14:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF43EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679616936;
	bh=5e5Tzve7Dd79xcTNdzm57g5wRClxIC6OdMpghScFxOk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PQVOJW4sl9I8EnLEQfIoAUIdIQS22djDdImqLeHO9CmrUqjBn5t/zYG1Y5fbhDHIM
	 YWrc5RX7n4CQl4tEIuhLBJkQgSAljw09uZ0TsAImd2bFyKidRqw3fVdzMDWRpJmC3f
	 qE1VBp5OYIQ1b2LWYvmcHJq8+oVOOF/lJ8uLsNY8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA8AF8027B;
	Fri, 24 Mar 2023 01:14:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44E33F802E8; Fri, 24 Mar 2023 01:14:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 462D9F800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 01:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 462D9F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R4K7k18r
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5CC7BB82202;
	Fri, 24 Mar 2023 00:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14184C433EF;
	Fri, 24 Mar 2023 00:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679616877;
	bh=5e5Tzve7Dd79xcTNdzm57g5wRClxIC6OdMpghScFxOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4K7k18r848BLqhpwlEA6Ld7DoDKRrdC6Hn1idP1bo6iEJc1HHk8Qb4EgaFF4lofC
	 NlLv9qe+izxpoVd/t60Fbde51YIjrTxVn6aDerhFATmBp5whR4qs2Rv+y1muClq50J
	 74g1WcjvBb5ppTTghoOnBBoybaZ1us8qoUpcN0mm1cEudenxgGOUIY5O8VdYDaxGuJ
	 ZitVOwScaMxguqXQu03LtHqc4g+UTKso/BxJHZDI9EZvp9n4jcJiQgeHqrgrXsmn3e
	 BaMFTZPljxSHkXbi2i1pl1cBAuWUjKn2F8QQRwACbHVa24ZrsyElOAh6jCXn7BgEde
	 f9VOuEik86naw==
Date: Fri, 24 Mar 2023 00:14:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <101cfc2d-59d7-4f37-9dd1-e83d1b803bc5@sirena.org.uk>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <5dc11c47-bae6-2f4e-4ffd-58c4f462fd68@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qr22+g/wK5Y2DBT5"
Content-Disposition: inline
In-Reply-To: <5dc11c47-bae6-2f4e-4ffd-58c4f462fd68@linux.intel.com>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: 6IBPWOZ3X7ORXY4OTVHYTNE473LMQPLV
X-Message-ID-Hash: 6IBPWOZ3X7ORXY4OTVHYTNE473LMQPLV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IBPWOZ3X7ORXY4OTVHYTNE473LMQPLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Qr22+g/wK5Y2DBT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2023 at 01:11:11PM -0500, Pierre-Louis Bossart wrote:

> > The trigger is run in atomic context, can you really write safely to a
> > SoundWire device there?

> Mark, I've seen that comment from you several times, and I wonder if I
> am missing something: the triggers for SoundWire managers and dailinks
> are typically nonatomic - at least for the Cadence-based solution the
> trigger is based on a bank switch that may happen with a delay and with
> a wait_for_completion(). Sending a command over the SoundWire channel is
> also typically not atomic, there's usually a wait_for_completion() as well.

Ah, you're setting the nonatomic flag on your links to disable the
locking.  The default for trigger operations is to run them with local
interrupts disabled.  It looks like at least some of the Qualcomm stuff
does that too.

--Qr22+g/wK5Y2DBT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQc62cACgkQJNaLcl1U
h9DzHQf/TIS72n0OUMiQng7OQKu/e8P+3/vOqyZs7KgpO4ZAgAj3Fh2LNTDL/ozv
8WNTHCDmF/caNspF1f+3A+4iShLnqEfAjP338hgBKfMakh+2kLZjvquv8uau41xa
Ptq6Syp6qN0kRgdgVpidwj77UwHldZUf333vlsz9zh7cb7jgCmasy76TN1OZfgyP
2eY/Y2j6+BKcAfP1DOSmguTo1h8x/nU5uLddP1bSAdFyjaD3GFgJlPJfQBPjFvFu
fTMiMqpenPGAde/jzDPrKzYBBUeP+C3KAnQy7ivVRjRCx1vjGZ7HAj8WNT0flzHF
a+d504cA5fOV3hcEYjIDjHFd1yIaWg==
=Au5o
-----END PGP SIGNATURE-----

--Qr22+g/wK5Y2DBT5--
