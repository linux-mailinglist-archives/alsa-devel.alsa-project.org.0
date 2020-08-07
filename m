Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04223F3AB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 22:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31D31660;
	Fri,  7 Aug 2020 22:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31D31660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596831541;
	bh=FTGX8V3BOAmBXKLEXLdqfDBeFt3UQfICsLUdU64xJiE=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hM5lSECMVHHHuMTYJOQqYlhva+rwL1jFpdgUyqE+QLf3h0gWnRVwk8BCdl6VYs9yn
	 FcL2nUwIBw8FhQQy9g7O1+SurB9JLqw5Rd6x51HjQ+07JZDVyFQsklszMd8cNeotzA
	 hzML3oAfr4qOfvMe59dbBPGhbUcS9A6U1o+2mVKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB0D7F80234;
	Fri,  7 Aug 2020 22:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 123BFF801F7; Fri,  7 Aug 2020 22:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4287EF801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 22:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4287EF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TKFpExx2"
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A66C12075A;
 Fri,  7 Aug 2020 20:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596831430;
 bh=FTGX8V3BOAmBXKLEXLdqfDBeFt3UQfICsLUdU64xJiE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TKFpExx251qL5pZuFJCespYGYMaO91U5zGyMF51r/UcvnqdQ2cu4NxBi6+9zjiCGf
 lmcvOhlGpRNU36TuvI3XAqLhDBjrcVHwrZS9+IsIfeeMR3reH68iZAasoSq+1g2tBH
 VusTYqJ1btk2P+wMSfIVfmFwXYmkU1ME6O/jKw20=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <989f1d99-3cd0-e725-3f6d-43facf1ec04d@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org>
 <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com>
 <989f1d99-3cd0-e725-3f6d-43facf1ec04d@codeaurora.org>
Subject: Re: [PATCH v4 01/12] ASoC: qcom: Add common array to initialize soc
 based core clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Date: Fri, 07 Aug 2020 13:17:09 -0700
Message-ID: <159683142954.1360974.1307064087263696126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Ajit Pandey <ajitp@codeaurora.org>
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

Quoting Rohit Kumar (2020-08-05 20:59:48)
> Thanks Stephen for reviewing.
>=20
> On 8/6/2020 6:01 AM, Stephen Boyd wrote:
> > Quoting Rohit kumar (2020-07-22 03:31:44)
> >> From: Ajit Pandey <ajitp@codeaurora.org>
> >>
> >> LPASS variants have their own soc specific clocks that needs to be
> >> enabled for MI2S audio support. Added a common variable in drvdata to
> >> initialize such clocks using bulk clk api. Such clock names is
> >> defined in variants specific data and needs to fetched during init.
> > Why not just get all the clks and not even care about the names of them?
> > Use devm_clk_bulk_get_all() for that, unless some clks need to change
> > rates?
>=20
> There is ahbix clk which needs clk rate to be set. Please check below=20
> patch in
>=20
> the series for reference
>=20
> [PATCH v5 02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform=20
> specific function
>=20

Alright. I wonder if we could make the API better or the binding better
and always have the rate settable clk first and then
devm_clk_bulk_get_all() could be used along with clk_set_rate() on some=20
array element 0 or something. Anyway, don't mind me, I'm just thinking
how to make this simpler.
