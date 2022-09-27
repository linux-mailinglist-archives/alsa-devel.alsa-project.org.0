Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6575EC025
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 12:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6DA3E8;
	Tue, 27 Sep 2022 12:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6DA3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664275962;
	bh=s3Rnr2oz0WCZtyLmIcVB3HRBC6q3h/eK4/EeiQcKSRU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+XtRf7k8jgSNIGY4ltyyyLHqR8wBbKhian/q/UIHr6oYkCWTEs7eUHViRi/a3pO4
	 yAgBCJgSTuqZ3qeAwNKjU2D3bS9Sf7le/4MeLIfG06XCRNnEvEEs/J/YLBG9K0Fqas
	 rS3mTJvTx/Bnx19Llh4Txgx1D+dte5BcIfzeZgQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE9DF804D0;
	Tue, 27 Sep 2022 12:51:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01753F8025E; Tue, 27 Sep 2022 12:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AA9DF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 12:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA9DF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="uOIaUlBT"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D122984A73;
 Tue, 27 Sep 2022 12:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664275900;
 bh=3ewozdLEQlhQmZ3Bns2Zl5WX79hSFw5CgIFBudDQgBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uOIaUlBT3Um1DSnZtgXwlvgjopyw0wuBcbgZ5Na5fXgzQD1telN5jbVxrK+KArzWP
 6+7sIjZHGH7wXpaOungjXmCdvHk8VGdheDIygY57is/ZlJvZJjlgnbvD0MILGt++OO
 ln8up93LLLPoSEQT7n0/ImNKVZ/dL4IDgjCeII6zoiglPkZgbd1+3ed25XMyvWvDFN
 KeXnkuWSkYeN7GQ4BdOFkBAjxMNrbB0BR4ljlnwDopxWRmGRGtkKT4rjDkw5z5wRoU
 XuIqOXdmAoi4iHynZO3Gc1kMIk/mX89R3zpfvYYFhr3c3ZtuGzBz/vzx84C6QqOdJM
 0fvZRZ4CL5qpw==
Message-ID: <336df874-2c22-c2cb-9565-75fe697ca473@denx.de>
Date: Tue, 27 Sep 2022 12:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: sound: st, stm32-sai: Document audio OF graph
 port
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220927002004.685108-1-marex@denx.de>
 <YzLST/bYxqd0S/i4@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YzLST/bYxqd0S/i4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 9/27/22 12:37, Mark Brown wrote:
> On Tue, Sep 27, 2022 at 02:20:04AM +0200, Marek Vasut wrote:
>> It is expected that the SAI subnodes would contain audio OF graph port
>> with endpoint to link it with the other side of audio link. Document
>> the port: property.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Will do, and I updated the patch tags locally in case a V2 is needed anyway.
