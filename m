Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EEC87129
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 06:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C30451612;
	Fri,  9 Aug 2019 06:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C30451612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565326687;
	bh=WuvNTr1qSkHloHuOqp9oc2806HR5cGHt9AQmH04+VLs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qg2l2qqm42JVqVNGiXLrEy+7tykSNIDtRkC9jhdwzs2aJnre//PQVQvMGThmOmksc
	 Wp0+4JxmH5bgK4C65S0q78id4NjdPHe5JSKOr0/HVJsrFLfaQwM8KS/jD39stw8Qdk
	 Mqd7mZcjcRU3OFJtvwY6cSxI/vF84u25rMx2BRwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64216F80391;
	Fri,  9 Aug 2019 06:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F20F803F3; Fri,  9 Aug 2019 06:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3315EF800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 06:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3315EF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EoyQqSnr"
Received: from localhost (unknown [122.167.65.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA381214C6;
 Fri,  9 Aug 2019 04:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565326578;
 bh=A5FsRFBnniHu6TuyUAvzx8w6I2VU88+WwPu49KfYdyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EoyQqSnrmea2hOYn2w61l5JiMl9KSvEEq17SQ7eUiUSozzNoesRysI70yB9i0wxF+
 9wRKIgAg8dLsTip+mjdBpVF1FFWzXQmB+GJFOau4cnpfQB7XZD6jjJjP+wi4WDT38E
 4o3Z2r72B8+PL50K6DR2DQvsoyHLdXA+EvVeWxG4=
Date: Fri, 9 Aug 2019 10:24:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190809045459.GG12733@vkoul-mobl.Dlink>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
 <d346b2af-f285-4c53-b706-46a129ab7951@linux.intel.com>
 <cdd2bded-551c-65f5-ca29-d2bb825bdaba@linaro.org>
 <20190808195216.GM3795@sirena.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808195216.GM3795@sirena.co.uk>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
	bindings
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08-08-19, 20:52, Mark Brown wrote:
> On Thu, Aug 08, 2019 at 05:48:56PM +0100, Srinivas Kandagatla wrote:
> > On 08/08/2019 16:58, Pierre-Louis Bossart wrote:
> =

> > > > +- sdw-instance-id: Should be ('Instance ID') from SoundWire
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 Enumeration Address. Instance ID is fo=
r the cases
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 where multiple Devices of the same typ=
e or Class
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 are attached to the bus.
> =

> > > so it is actually required if you have a single Slave device? Or is it
> > > only required when you have more than 1 device of the same type?
> =

> > This is mandatory for any slave device!
> =

> If it's mandatory the wording is a bit unclear.  How about something
> like:
> =

> 	Should be ('Instance ID') from the SoundWire Enumeration
> 	Address.  This must always be provided, if multiple devices
> 	with the same type or class or attached to the bus each
> 	instance must have a distinct value.

That helps to make it clear.

Also the section of properties starts with Mandatory property, it should
be made Mandatory Properties instead, like in other binding docs to make
it clear that properties mentioned in the section are mandatory

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
