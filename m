Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D134F3C99F4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 09:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8471670;
	Thu, 15 Jul 2021 09:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8471670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626335502;
	bh=U29kzEGbfUM6Z8XvuEF2py4Ztxj0+cmZ1D2H3aHU1Rk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrjtGS+bo4mFJ11JLkYZSMooNjpuUfp4njDKtwQKS4MrdM9CCwG9VQIoAmSGwzEpq
	 EgrXDHjoDvTUmgLwdH3oe81YkGTFbNyOmD7d/R8f6r8pxF0ZwcpQAuZ1FS87b+cIXa
	 eD7eS1T7aHJuuwM4POcQDhep7ZFszS01x9MRdbG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5DFDF800D3;
	Thu, 15 Jul 2021 09:50:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01EF6F80217; Thu, 15 Jul 2021 09:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 939A1F800D3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 939A1F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="P/zZfzMQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kIE7Kfv+"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id AC6A22B01189;
 Thu, 15 Jul 2021 03:50:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 15 Jul 2021 03:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=U
 29kzEGbfUM6Z8XvuEF2py4Ztxj0+cmZ1D2H3aHU1Rk=; b=P/zZfzMQ3jBhkBgtZ
 TBXCgMzWuy3/yttcjD6D6HmiAKv8so5lCut6KHhcZjI5DyGXb5Wj2T0z+PJnkZ0+
 vUlvr1m+e/jNqDNZLT5pIXgVbADLVM0k+VBGQKawTl+hp8E4TEvlgoF2NKYSlTIo
 Zw/COeP2p8kI9El0SC2PiTTQJBkkLTHai8FNeuIk5B/ILf84dIWGmJL4kmpUl601
 aX311EMl08JxE3pynjmXzcuwSiuKyNxIghO3XAMemo825OD3AINCxOneSlBIMfQA
 JQH3LHaaS5mb8vCJ3NN2TQC0qF8h5ox+xKPGL0txcvWN5md/2NFg1/AnGv5PB6B6
 MLpOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=U29kzEGbfUM6Z8XvuEF2py4Ztxj0+cmZ1D2H3aHU1
 Rk=; b=kIE7Kfv+i+lwi3GdUglJydCo6srdsKxhjEVKAz85cKLp13nombLw6jgxb
 rHK5ylbJfS0M4DXTO17zpu/4oonqs0Exmcktf5JzurrHT3AtcaewM2KO7n9D52WK
 pYY1Cv+xdZQScjmjrLVYM5lZ61nsvHfLWBX4XIIGS6lLOdIuQnGq5QFwUCMbc6eX
 D9aLt2C8DQ6S9l0k7unWU++CHqZ5/KqYjzoYYxotEKthVWhIhM5a1XOuZgCBJeNE
 PlUK+AE4ig1OqmVwpy0cJ0m8iRuSP+jBpYcnwt0YHOhUbrjwZVoOjVuWznIaefCv
 QldBWa496rXqx084tqjvRgzdc4ehw==
X-ME-Sender: <xms:qejvYBTU5O-BDYHWIvv5zYYhcZNfdT0shVzU6GG9Wpi8jY49T08G6g>
 <xme:qejvYKxgXt3ANkAlTQsNH5jMZiuBxv0EZVF8ujRtQTSPUvsjsJn-osnIKdDtqFjDl
 78RMZMn8FLqdLNPyus>
X-ME-Received: <xmr:qejvYG0J-klDNHInXJ1vTpaEGyN0Tl9Tt7bO_0B8iocAKnV-zD4WHnqGqDnDtRM02E6APeAmtS-T92THxVRSRSo23EwCAMLZW_cv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelgddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggugfgjsehtqh
 ertddttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegt
 vghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepgfejtedtjefggfffvdetuedthe
 dtheegheeuteekfeeghfdtteejkeeludegvddunecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qejvYJBdTZ-uy74WMfOHpf9yGBOFCt9PR00A58yZUdRpOxRuWMj2YQ>
 <xmx:qejvYKj6A7POSj7xPU1a4kgskh3qVuwq7G21x7YLvZFf36ZXVw8N0A>
 <xmx:qejvYNpFqw8gMyB_lT4aeFu58JX5AvG0yzq2UJrCgtf-msAQMtU2Ag>
 <xmx:qujvYFMCtY_0qzASHVQ2b8MW28OCO5d9EraZrt9QM6ywd83Rj9HsL2HK92o>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jul 2021 03:50:01 -0400 (EDT)
Date: Thu, 15 Jul 2021 09:49:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: fengzheng923@gmail.com
Subject: Re: [PATCH v6 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Message-ID: <20210715074959.lepsaiyl3ihthy4s@gilmour>
References: <20210711124826.5376-1-fengzheng923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210711124826.5376-1-fengzheng923@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, wens@csie.org, broonie@kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Sun, Jul 11, 2021 at 08:48:26AM -0400, fengzheng923@gmail.com wrote:
> From: Ban Tao <fengzheng923@gmail.com>
>=20
> DT binding documentation for this new ASoC driver.
>=20
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

> ---
> v1->v2:
> 1.Fix some build errors.
> ---
> v2->v3:
> 1.Fix some build errors.
> ---
> v3->v4:
> 1.None.
> ---
> v4->v5:
> 1.Add interrupt.
> 2.Keep clock and reset index.
> ---
> v5->v6:
> 1.None.
> ---

Just as a general comment, you don't need to duplicate the --- all the
time, here something like the following would have been fine

---

v1->v2:
1.Fix some build errors.

v2->v3:
1.Fix some build errors.

v3->v4:
1.None

etc.

git will ignore anything after ---, so it doesn't matter whether there's
one or multiple.

Maxime
