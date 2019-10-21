Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 544BDDED3D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 15:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D0615E0;
	Mon, 21 Oct 2019 15:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D0615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571663683;
	bh=0C8HlX4gI7yRNRjxoUj7yi6EmrnT9g5FF+0Yq4oUrY0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b6lpC249mESXYGFoqSUXOX0qJfziQRH4NHKX4cQmCCX6SqZPcHbyaKqsr1h2EHh7W
	 XI1HsKFHiBFpHUihLZErKaB31rmSaZsd+8t13Ak0REZ51+eMcJyWl1nAiZ+dMFHfRR
	 4Xp+QANXuJ+/MMMrmOmCQqNdhfLvtK5ooX9jh7hY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC53AF80393;
	Mon, 21 Oct 2019 15:12:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40FBDF80368; Mon, 21 Oct 2019 15:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148CEF800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 15:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148CEF800C0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 65F8728A8BD
To: Mark Brown <broonie@kernel.org>
References: <20191019070254.23870-1-tzungbi@google.com>
 <20191019143504.1.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <659a3d1f-a8e1-268d-5e95-b328aeed601b@collabora.com>
 <20191021114303.GC4691@sirena.co.uk>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <a4e1530a-b706-2a73-e0b3-ad56cf9085bc@collabora.com>
Date: Mon, 21 Oct 2019 15:12:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021114303.GC4691@sirena.co.uk>
Content-Language: en-GB
Cc: gwendal@google.com, drinkcat@google.com, alsa-devel@alsa-project.org,
 cychiang@google.com, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, robh+dt@kernel.org, bleung@google.com,
 dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v5 1/4] ASoC: cros_ec_codec: support WoV
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 21/10/19 13:43, Mark Brown wrote:
> On Mon, Oct 21, 2019 at 01:26:04PM +0200, Enric Balletbo i Serra wrote:
> 
>> Mark, once applied, could we get an immutable branch from you containing the
>> following already applied patches + this series? We need as we have patches that
>> could conflict on platform/chrome.
> 
> Ugh.  You should have mentioned this before the patches were applied,
> they're on the development branch that has everything in it like I
> normally do which I don't want to rebase (and I think I did a merge up
> of the fixes branch since then anyway).  Hopefully Linus will be able to
> figure out any conflicts that occur.
> 

Ok, I was off the latest two weeks so I didn't catch it :-(. I'll try to figure
out the better way to avoid conflicts knowing that these are already queued.

Thanks,
 Enric.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
