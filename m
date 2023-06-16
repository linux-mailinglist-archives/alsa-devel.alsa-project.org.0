Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E2733101
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 14:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0937F82A;
	Fri, 16 Jun 2023 14:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0937F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686917916;
	bh=Qm0aTkulOFw3589Uh4I8MzyVn/uDeAVPO5EBfC8Lwyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AVw6tF6LnvTz9ABVVqHC4Fsc3jW4a7phQlRLSGBJp+9YJrcp3gokgXbkFwThba9KJ
	 vLAqyGbxzWEpNH6te19JfpBMfGJ9OD+1aZd0nI+7JSctSuyriTnJrthSuh+xWnqJuo
	 iiQT75kJ4z3jUtVBFeeJZxUOUm2txgFGeimHz56M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84EDAF800BA; Fri, 16 Jun 2023 14:17:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B81EF80132;
	Fri, 16 Jun 2023 14:17:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1EC3F80149; Fri, 16 Jun 2023 14:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 594D2F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 14:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594D2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=japFXX3X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686917860; x=1718453860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j/FDQPtAx2vpdEuoefb7LUT3uVAbfYql6lVE1xQQFsw=;
  b=japFXX3XxNRmfh1RVI6pK30+Xs2RtvWVcFVCv2UKz1qm/KxgIGRdMYEo
   9cSEI+ua0ZqsUUOH6X/oTnyER0JeHyYhA9u2JNW+d/nKMfP9ANLBTX2rf
   7lof4NeR8aBlitXuYYjLdKS1FrMluOxK1z6sBszBl4L2cLhPUd/jJKnIH
   36VQeuCoIOh1B6qCVhEe6FrQjggYWV5EV8mU51uIJhqQ+TrIqydBQXuQv
   0tVlcbrdE8QjOVvoibHyOfcway0LiAf/IFe+xzEctNnAsMfdODYhyd+oA
   z4wvBM4rP35CWperfmZWHDXjkrxHLPoPhv/tuKiX4E9R6qz03ueIiOqFu
   A==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681164000";
   d="scan'208";a="31465543"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jun 2023 14:17:38 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9C14F280082;
	Fri, 16 Jun 2023 14:17:38 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Date: Fri, 16 Jun 2023 14:17:40 +0200
Message-ID: <4930994.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5a562bbc-9bba-4829-8998-af12041a434c@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
 <5a562bbc-9bba-4829-8998-af12041a434c@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: EVQ3NDQVICSONAU6HWJE7QBGYIDET53I
X-Message-ID-Hash: EVQ3NDQVICSONAU6HWJE7QBGYIDET53I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVQ3NDQVICSONAU6HWJE7QBGYIDET53I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

Am Freitag, 16. Juni 2023, 13:54:49 CEST schrieb Mark Brown:
> On Fri, Jun 16, 2023 at 10:35:49AM +0200, Alexander Stein wrote:
> > Convert the binding to DT schema format.
> > Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> > clocks & clock-names =3D "mclk" is mandatory, it has been added to requ=
ired
> > properties as well. '#sound-dai-cells' is added for reference from
> > simple-audio-card.
>=20
> This doesn't apply against current code, please check and resend.  This
> should be an incremental patch perhaps?

Is there any change to original .txt file I am not aware of? The to be crea=
ted=20
=2Eyaml file is new, so there is no increment.
To which base/branch/tag should I rebase this?

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


