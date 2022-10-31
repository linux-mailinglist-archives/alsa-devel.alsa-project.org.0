Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E592B613E67
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:39:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81FD11671;
	Mon, 31 Oct 2022 20:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81FD11671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667245158;
	bh=HcD3iJFYh/LzQMrdgMl5U6VmxC4NvEgAIzxRfRabqx8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpmhIJBPxlDHR63Cbgzp681iGta6K4GbOofebr70d+JGiTS0soQpMhFCMJX1HAImS
	 49QX88MnRXPROFzTHYV+BATPf3ipcfrqW8S2zgaKXLVDKAOf/68ITBpYuEwBdel35P
	 3uIsPBdeRA3VQJMGHwRi8HKYh6c8tk4wZOdOktyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7338BF8021D;
	Mon, 31 Oct 2022 20:38:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D84F80163; Mon, 31 Oct 2022 20:38:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4FCAF800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 20:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4FCAF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="AU07LhC3"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 11F536602846;
 Mon, 31 Oct 2022 19:38:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667245097;
 bh=HcD3iJFYh/LzQMrdgMl5U6VmxC4NvEgAIzxRfRabqx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AU07LhC3To/nN2H7HgWZUnTq5RGaVWJqMPuM/9+0MEfFjKnt5nhmKvxH6gP7SQYNO
 h1WsKY/8z58bnXIGcqNb8d8XocaFgR9vEKFS8L1/Vzr8YdK3dYd9qSf29nFKhLimOb
 +hyRjQ0WPXlMS9bB7cAS00TPJux0y2MCGORmlUKC1BXtuwZVGRVKKv9C9rQThjYt4n
 J7jbIeeo04yV3ol17UUFVwJj2TVXCMjm0e+Vw5qO6eXyUVx7Kuq+TUcw/tUxsNg5nL
 pYq3dAIsG8E7VZMvFm08LjzdCt6HxlAr5JAK+Jt1/vx8s7l9rZzCR5qRgt/c8BLvbl
 05YYDUoi2Amrw==
Date: Mon, 31 Oct 2022 15:38:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Message-ID: <20221031193810.vdsdndr4ltvhrfel@notapiano>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-7-nfraprado@collabora.com>
 <Y1/JCN+mtlT0r/rw@sirena.org.uk>
 <20221031163140.h63kjpivwg7xpvs3@notapiano>
 <20221031190938.GA3264845-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031190938.GA3264845-robh@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Mon, Oct 31, 2022 at 02:09:38PM -0500, Rob Herring wrote:
> On Mon, Oct 31, 2022 at 12:31:40PM -0400, Nícolas F. R. A. Prado wrote:
> > On Mon, Oct 31, 2022 at 01:09:28PM +0000, Mark Brown wrote:
> > > On Fri, Oct 28, 2022 at 04:55:38PM -0400, Nícolas F. R. A. Prado wrote:
> > > 
> > > > @@ -35,6 +35,8 @@ const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
> > > >  	"AVDD",
> > > >  	"MICVDD",
> > > >  	"VBAT",
> > > > +	"dbvdd",
> > > > +	"ldo1-in",
> > > 
> > > Why are we making these inconsistent in style with the other supplies?
> > 
> > In short because the other supplies already have users while these are new ones.
> > My understanding was that new supplies should have lowercase names, following DT
> > convention. But I do see the argument on having them all be consistent for a
> > single driver/binding. If there are no remarks from Rob or Krzysztof I can
> > change it in the next version.
> 
> We want lowercase and consistency... Between the 2, I pick consistency.

We could have both if we converted the existing ones to lowercase first, but as
I mentioned in [1] this requires using devm_regulator_get_optional() before
falling back, which seemed like an abuse of that API and to unnecessarily
complicate the code.

So leaving the existing ones as they are and just keeping the consistency for
the new ones seems like the way forward.

[1] https://lore.kernel.org/all/20221028211224.iiphmwrpqqs27jr4@notapiano/

Thanks,
Nícolas
