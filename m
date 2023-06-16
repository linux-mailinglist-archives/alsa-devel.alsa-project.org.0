Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E428673321B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 15:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0C0839;
	Fri, 16 Jun 2023 15:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0C0839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686921830;
	bh=2YM6Yn45MV8Q3a1zk5q75fdT6Arak16MBaYduFOqFXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ObknwHxzIk1sVf9wj+AW7iiBddu/NBGQEU61jnRXYJzQIk68BfihhH1eLBTtlT2oP
	 Dc4IqACdbeT03sLFkHs9uZBbrdwx/VzvaNmgOcLhVluUdMN6fW0iPkXWM/G70icmUR
	 HWGK1C5iUm/umz0q8YRWQtAlFNuiJ1XstUkISj9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C667AF80130; Fri, 16 Jun 2023 15:22:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63ED8F80132;
	Fri, 16 Jun 2023 15:22:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AEC1F80149; Fri, 16 Jun 2023 15:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 075D5F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 15:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 075D5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=a7gZ3LxY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686921752; x=1718457752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sbeuSvNzTeuAvC0tm1PTQHyfToyF+kegdC+YV/li46I=;
  b=a7gZ3LxYzq/zG1sn8cs/nZEQ08gm+IRjqcAusQ5exOvk2qYPCro01dux
   YqRiwzQkuOMZDamh2w7iEm3XhpTp6mLhhWkXQcJ5R3Yc2wj0iQWsjR/Zp
   DySmad2cLyvnP6QMB31v/TCU5lnoVPz/vc0ljxkAz+0gcyVfosBUZhP8u
   83HvOgAUgbFfAMaAK5xcao56c0aKSC2Gbx2PDz9qPZlg7g8iAr6R3otqp
   3vr3piLQT3q4Gjs0vsOAnuKM0ZCL0M108bPG1FzwqOZiNXKqWkEvVRY9I
   uKxB46jeHUt9F8gnKKbDY8934/WByelfmI31tIiSwP5U0/og2Yh8pEECF
   A==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681164000";
   d="scan'208";a="31466833"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jun 2023 15:22:30 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0D8DE280082;
	Fri, 16 Jun 2023 15:22:30 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Date: Fri, 16 Jun 2023 15:22:31 +0200
Message-ID: <3660939.Mh6RI2rZIc@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <993767ab-d7eb-440a-9f13-026821fd1f61@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
 <24617723.6Emhk5qWAg@steina-w>
 <993767ab-d7eb-440a-9f13-026821fd1f61@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: 7YFVNC6MUI77HD2C47KPZTKJPKWP6OUF
X-Message-ID-Hash: 7YFVNC6MUI77HD2C47KPZTKJPKWP6OUF
X-MailFrom: alexander.stein@ew.tq-group.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YFVNC6MUI77HD2C47KPZTKJPKWP6OUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Freitag, 16. Juni 2023, 14:30:37 CEST schrieb Mark Brown:
> On Fri, Jun 16, 2023 at 02:24:17PM +0200, Alexander Stein wrote:
> > Am Freitag, 16. Juni 2023, 14:21:29 CEST schrieb Mark Brown:
> > > That'll be the issue, yes.
> >=20
> > Ok, there is nothing I can do, right?
>=20
> You could check for dependencies and tell me about them.  For example in
> this case it turns out the issue is that there's a fix to add supply
> names that went in which is only on my fixes branch.

You are referring to [1]? That's part of next-branch since next-20230523. S=
o=20
this patch should apply on top without conflicts., e.g. today's https://
git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next.

Best regards,
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commi=
t/?
id=3D3a2e3fa795052b42da013931bc2e451bcecf4f0c
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


