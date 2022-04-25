Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CA50E27C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D090175C;
	Mon, 25 Apr 2022 15:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D090175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650894999;
	bh=TSKQeYQJgNHIZ87JODquIdPB0s0Qm2y5Y2jXnDIEYnU=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nV1GP6bZBZx48YxXNf+TfGKkmUsQuTpzaqcxoO0QgAd4wMD5vOE3YnP03PmDl+ye0
	 QdN2jmKRfpLXaOAdzQJ6+tX0tKJKbFA7F+mZ2/HP7UNNBQefCmqWmcZdVJS+mWNgvz
	 kLOx4IhMOC3rZ8zsAtK7ij+seHKtuB+hMibcJaDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE254F8016B;
	Mon, 25 Apr 2022 15:55:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 380EEF8016A; Mon, 25 Apr 2022 15:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 932DBF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 15:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932DBF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="ZhKh5Zpv"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650894932; bh=Mp3nuT0PzmWhzqqEzvPIZpiHN6vPDTUyd5pO9HIeeQE=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=ZhKh5Zpv/e7gcY9lFUXrmj4qBfrN5wGHNLlS0qLvcK7ucxitGfOZj2+edVgt61Qkv
 QtJC2BWkOb6nJy2iL8Bg5jwW1Nx9Xvawuw8/NMFuVNbeSuANWERn39FQoX1v4xTRTv
 PQGWAj7ofOlRGmNiePsij2NrYN+2qIs5TGD91Vgg=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 3/5] HACK: ASoC: Tolerate N-cpus-to-M-codecs links
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmamSZKNtNai7KyM@sirena.org.uk>
Date: Mon, 25 Apr 2022 15:55:32 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C42BB2F-EED6-4F6E-A29E-B43768760244@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-4-povik+lin@cutebit.org>
 <YkrkbBNYULLgeS5w@sirena.org.uk>
 <904EB8A1-5561-4555-8030-B85703E24F2E@cutebit.org>
 <YmaTHTKWAfM7FCcY@sirena.org.uk>
 <9F8BCBA8-5EE3-4F87-9518-91CB7AB4E077@cutebit.org>
 <YmaaPa8A03rWV7HE@sirena.org.uk>
 <4CF6B0A7-F218-4798-BB21-18D563309D5C@cutebit.org>
 <YmamSZKNtNai7KyM@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


> On 25. 4. 2022, at 15:46, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Apr 25, 2022 at 03:11:14PM +0200, Martin Povi=C5=A1er wrote:
>>> On 25. 4. 2022, at 14:55, Mark Brown <broonie@kernel.org> wrote:
>=20
>>> I am surprised that doesn't otherwise explode TBH - at the very =
least
>>> I'd expect it to show two PCMs to userspace which if I'm =
understanding
>>> your description correctly isn't really what's going on.
>=20
>> I fill in a single snd_soc_dai_link, it exposes a single PCM and =
works
>> like a charm. That is as long as I patch the playback/capture check =
in
>> question.
>=20
>> I read that to be the clear intention of ASoC code: a DAI link =
becomes
>> one snd_soc_pcm_runtime.
>=20
> Yes, so long as you boil it down to a single link it works fine but =
the
> bit on top of the binding where you tie the two CPU DAIs to what is
> actually exposed is all in code.  The reason this stuff isn't filled =
in
> is that connecting the thing that applications see to the physical =
links
> isn't at all obvious and needs at least some driver sitting in the
> middle to make the links - I'd imagine there's a DSP sitting there =
which
> probably has quite a bit of flexability about how the various hardware
> components available are actually related.  This makes figuring out =
what
> to do with the relationship between the multiple CPU DAIs hard.

I get the gist. Anyway unless you tell me otherwise I will assume I need
to move to DPCM with the platform/machine driver.

