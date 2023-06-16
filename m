Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810F733122
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 14:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70AA82A;
	Fri, 16 Jun 2023 14:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70AA82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686918312;
	bh=moqr/ES15lNuEX11Pc5H3g2wE3xXbAAM8Kc9YsxOkgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=trbCiE3ULuYXUsNrO5XLhOAXOQ/lGIHlTmj/2TgA8XeQfGn5qbCZ197185ckl/Iok
	 6D+GdIbAjOeBpVx7HzeCrIvKyeTqsvt8dw8U/YnSlFOwbzQupb+6xJsMVzkBTB/w6n
	 ZL3Fyb5QlbHHfQQ1LAKKAt0mFE5UPaWt6uprmP1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 606E6F80533; Fri, 16 Jun 2023 14:24:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA0CF800BA;
	Fri, 16 Jun 2023 14:24:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B313F80155; Fri, 16 Jun 2023 14:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DABFF80132
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 14:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DABFF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=OeawgwdQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686918257; x=1718454257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TntxgH50+AsaLwkL2M6URwHtw/vlX2hwx9IGEkWwFKw=;
  b=OeawgwdQucEKN/4bn7bT8FOJ9LF4y+2HpU4q/cVlR4gxkyKiwH97D12p
   G8pEYXNbRoi/2jqtLq5EMMS6pmDIEIFWW/gC9ZR8nujL94pvtMXUNzfOk
   GigDoJV4ED1ZIXs13uL2qjrUrrq2AMJeOpgw6Ks4i6+EqiBQnpcAuSyeb
   EihhTMmNqbY5oq2cPxOBHbnfxzclfoUIUXWngwphLFdrMNswzu3XWbOif
   KsM4/zQgcoh8SXYiHy+i9ex+9MdLKLOvTfSDZrwtZcEwUflki3nkoImAe
   01V0XXOxf63ZEoeDh3QJjHId+W1gxQ4UlAQ0mSU6L3UpO8jxd+UBff/f4
   A==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681164000";
   d="scan'208";a="31465682"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jun 2023 14:24:15 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B570D280082;
	Fri, 16 Jun 2023 14:24:15 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Date: Fri, 16 Jun 2023 14:24:17 +0200
Message-ID: <24617723.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <3ddb3d09-2a9b-4a25-8108-a79ea83a9dd5@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
 <4930994.QJadu78ljV@steina-w>
 <3ddb3d09-2a9b-4a25-8108-a79ea83a9dd5@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: N5HDPJ3NB3CEHBTJ7KVGR6VCXEE2U5DU
X-Message-ID-Hash: N5HDPJ3NB3CEHBTJ7KVGR6VCXEE2U5DU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5HDPJ3NB3CEHBTJ7KVGR6VCXEE2U5DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

Am Freitag, 16. Juni 2023, 14:21:29 CEST schrieb Mark Brown:
> On Fri, Jun 16, 2023 at 02:17:40PM +0200, Alexander Stein wrote:
> > Am Freitag, 16. Juni 2023, 13:54:49 CEST schrieb Mark Brown:
> > > This doesn't apply against current code, please check and resend.  Th=
is
> > > should be an incremental patch perhaps?
> >=20
> > Is there any change to original .txt file I am not aware of? The to be
> > created .yaml file is new, so there is no increment.
>=20
> That'll be the issue, yes.

Ok, there is nothing I can do, right?

> > To which base/branch/tag should I rebase this?
>=20
> As ever
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> for-next

As mentioned in the changelog, that's already the case.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


