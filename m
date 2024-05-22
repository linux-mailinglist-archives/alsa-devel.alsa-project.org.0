Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E78CC02F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 13:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3139828;
	Wed, 22 May 2024 13:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3139828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716377062;
	bh=XoXUWVXyz0Rmx/CPuiRBeLNAvxQGtHJx3BaC6+uReE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LGdOk6ELfutjpD78WNLo+woWFrQsVd7C2S302Avm+HimmCc0RTONr9EmAYJ1kAzRh
	 36A8aor914ziOpvT0qGHNic4Q9DVunIquu9M4OrJGw96mwV0IHYB3morNZ6ehOK9Fb
	 k+WbdWVnyzg1Wq2B4q9oUgvPwZEd6Vjwpnc3CwWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E087F805B0; Wed, 22 May 2024 13:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A63EFF80579;
	Wed, 22 May 2024 13:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC628F8026A; Wed, 22 May 2024 13:22:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 341EAF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 13:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341EAF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JZHR0Qit
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0565B627E4;
	Wed, 22 May 2024 11:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367CDC2BD11;
	Wed, 22 May 2024 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716376957;
	bh=XoXUWVXyz0Rmx/CPuiRBeLNAvxQGtHJx3BaC6+uReE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZHR0Qitw07H7122vpe02wbYXfQz1adMBbp2SMha8JZhaAujg/tNRTRTs3dUEOf5f
	 1BO20QlIGB4C2VZdZAqqvyDIa9VDJzGeTZuBzDnrKmnOEBEHmW1R8pKyIEKwIFn5cT
	 Pq3K5rsipiuwsjKiB/rRRmZDtynIJ03d8qTINXhsyv9GuvRMCJdYwSkPLgK2hbOEq7
	 zR258ls5yuMEbVB2c3XgVFLXdKnCiQFgT2aoZPRYzi1//wNGD0x+7H+fydA0lv/pd3
	 u0eDY5jzslNMLKf/FX0Otx6PY9Dk3G858U48ynQgAfi/prEiseW/huT48J1w1cqzzv
	 n7rNmOw7iSAqw==
Date: Wed, 22 May 2024 12:22:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
Message-ID: <297b2034-4e2e-47a7-97bf-53991a102db7@sirena.org.uk>
References: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
 <20240423083405.263912-3-xingyu.wu@starfivetech.com>
 <NTZPR01MB0956BAFCBF0EA32824C3350A9FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2qrOv5Bk3BqeYH74"
Content-Disposition: inline
In-Reply-To: 
 <NTZPR01MB0956BAFCBF0EA32824C3350A9FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-Cookie: Bridge ahead.  Pay troll.
Message-ID-Hash: QCEB54XNNELKMF5CSSD23CQ5SF7QKK6K
X-Message-ID-Hash: QCEB54XNNELKMF5CSSD23CQ5SF7QKK6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCEB54XNNELKMF5CSSD23CQ5SF7QKK6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2qrOv5Bk3BqeYH74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 02:11:55AM +0000, Xingyu Wu wrote:

> Could you please help to review and give your comment about this PDM driv=
er?

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

--2qrOv5Bk3BqeYH74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZN1XcACgkQJNaLcl1U
h9D5Pwf8DExjzr2HmtHrdZqAUJL20nH1D6ECtNx5ETkMKbJg38xD6/SHbymeBLCX
/tisDgYjHzgrKiQn+hs40G/6DL8jqjARtzSrQipr0I9m4enVnoKngiPVcQ+Xfbs8
wFJr8kv1+Kb4QM8vCdpaWNpH1OQ7lhmBUHzqy7N9C0FIz7YonN6LMFGiWHEai/zr
UPUI2jX2Hd/VXl1RPYmJqaFMlRM3cA9NG5v5/+4JZ3yDj6ukB8UlPTLGpAWvnIX2
LyjFR6K/31R8ZbIN4qsUeXCH7Lv8LMIxWVJDjyUO/c6McyTTpSfBpLTdR57RYgHO
9kFqVLynQfx5t2KTeaeUdzb+4pEksA==
=Au8Z
-----END PGP SIGNATURE-----

--2qrOv5Bk3BqeYH74--
