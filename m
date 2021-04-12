Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3835D1F9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 22:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0CD1661;
	Mon, 12 Apr 2021 22:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0CD1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618259264;
	bh=VRTKMojKdtuJHFzFHeTyk5iAs1Q1XW/RoReDqe95/PY=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zi06r7v/25U087Ge7gW+3AfycK50o6k2+lOU3VwGzvvz335ci/BSfNQ9FauEVK4mX
	 25DbO83PSA8veTU29PDUAPxyGuxmDoIoZ3F+JOJpaLVHwaV2g12QDFg95/mzO3dfzz
	 GZKiyP1gkVsblfFXKjN+ilTup1FQHajX2oSK9wjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7284EF8027C;
	Mon, 12 Apr 2021 22:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 821D5F80277; Mon, 12 Apr 2021 22:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B719F8025B
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 22:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B719F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a5hbM90j"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5157561287;
 Mon, 12 Apr 2021 20:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618259190;
 bh=VRTKMojKdtuJHFzFHeTyk5iAs1Q1XW/RoReDqe95/PY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=a5hbM90jgeBbZy5DXQZpsyRiT8ZFN1jW7xfWb48fGDSVewu1Nlh7spwJ1qNc09oxa
 hHX439tatktCkD5U2cftaq7MlNQsjkmlAQUGLSICT8JPsEI8GS9lnSaFOhoYN/uzDv
 LglgFeGOp75jkVO8WIvHagn2/P89s3J9i4A/K3N1wKDqO6xACbXbgdVDVNmpF+TnoV
 9yMjah6daCGeGLZBPxnSzqIqNPkrvzgKcelcF6dRyiZWtiX3b22cf9ueltiHwQrFuV
 KJ21DEndDqqbkQPfsm3FhdnQW7X6Z16ip8+0UElLY4GTLuZQoyRT8Sn/LBXT/41nN3
 jv9F/WUoSlPXw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210410111356.467340-3-jbrunet@baylibre.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
 <20210410111356.467340-3-jbrunet@baylibre.com>
Subject: Re: [PATCH 2/5] ASoC: wcd934x: use the clock provider API
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Date: Mon, 12 Apr 2021 13:26:28 -0700
Message-ID: <161825918879.3764895.12600274147776655755@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

Quoting Jerome Brunet (2021-04-10 04:13:53)
> Clock providers should use the clk_hw API

It sort of already is :)

>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
