Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B88611E47
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Oct 2022 01:48:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D3FB84B;
	Sat, 29 Oct 2022 01:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D3FB84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667000881;
	bh=hB5fE6S2HQ2dHPl7HVJSxxHZcSmMmavYRsA3XNFzfwM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvozKaJV/JswALtX2eFuMy2n2tKN2bnqK/6GvxGteUlI1HhN7Da6g2jcslmnS82Ca
	 xOy35uOdU3VfPOf+/izYLNuDoGGOxUxdvJ+Y8uYsVY+mYjANpROLE7Vf3QSE2rtv/i
	 barsACpZrC56L3HS49idlf1EIRndl3YyvmeoX3GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 890DFF804BD;
	Sat, 29 Oct 2022 01:47:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE03FF8025A; Sat, 29 Oct 2022 01:47:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F41CF8016A
 for <alsa-devel@alsa-project.org>; Sat, 29 Oct 2022 01:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F41CF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c+IMnUh0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33E9962AE5;
 Fri, 28 Oct 2022 23:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16871C433D6;
 Fri, 28 Oct 2022 23:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667000819;
 bh=hB5fE6S2HQ2dHPl7HVJSxxHZcSmMmavYRsA3XNFzfwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c+IMnUh0cw/5I9OwpiVH/87RYGhRzQcEY3LqtjiL4TOTD/mWeymZWRyBuQhoFftq4
 SjAHCsDgyk0WIlHpVUZ4nvg44DzjbYR7iRq/t+1oNpSyDbD104TZ3O1HLnEJ2fAGC1
 +Sj3j/EbDe/kJLer2o+/9kfm9BvS9V8yuCScICsdAWBac9MgrfzjHbXqnvuLs9sbVJ
 OdZhjO0oMDHvnOhqrS+HFTFD+yONBWYSSSkYRRhOHPr/xY0hXLmOAG7kznEuNmWj6k
 O0jDOMiNfIreJW3/wo7WTSlRliOUEGYknlJvHW5xZx9yezMPuyNoY5jYk0BFCRfn4o
 w7szPXFkQdumg==
Message-ID: <d5bb33db-5c26-fbfa-0d12-46ca41d80785@kernel.org>
Date: Fri, 28 Oct 2022 19:46:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-11-trevor.wu@mediatek.com>
 <166457526101.1112313.13428811477972046652.robh@kernel.org>
 <ac5d872ac8dfa40bd5238589f85d78ad6ba6d706.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ac5d872ac8dfa40bd5238589f85d78ad6ba6d706.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On 04/10/2022 23:57, Trevor Wu (吳文良) wrote:
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
>>
> 
> After upgrading dtschema, I can see the problem.
> I will correct it in V2.

Correct also cc list.


Best regards,
Krzysztof

