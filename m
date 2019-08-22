Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBD991B2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 13:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91EBE166F;
	Thu, 22 Aug 2019 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91EBE166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566472182;
	bh=Idcc9nFlmZ3YZ5ql7czRRgKA3QaSqd/l+ry0U/5kxP0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHk5JXvfiky+MKgp32O1hyyZTrGDlRBp69LwhPD7ym6i6EDeSMG6NSgG8AI+ayRkg
	 Tea5DhANikO2VjZHmcoSYXcRoOsG3p7KOXnYouoQNUg4wzevtbuZWp04aheuYjl+pf
	 Nv1PrmbC3qxWpsTy9lvzrrl2zqTNuMdIHuyV71mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65712F8036E;
	Thu, 22 Aug 2019 13:07:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21588F80112; Thu, 22 Aug 2019 13:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A90F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 13:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A90F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RM0QTu0F"
Received: from localhost (unknown [171.61.89.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2878421726;
 Thu, 22 Aug 2019 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566472070;
 bh=yzTK0bS+fTQtz08FxFYZwoHZNh3a4lSv/tpMsgpUflI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RM0QTu0F9I1bGbF0v+794jVOiZp7mrpCh06MtkW5GfMcmY5A81gRf/dTJlakro08/
 0hC0RA5bpOE1uLerHeS+MIzX/W6MgK4qHNkIMEVcR/t9Ue31fPufZNOnwxDFYVpd7V
 JsVqE7PI00uhU5y43L1pyrMZVsu46MJRWYXVBJgE=
Date: Thu, 22 Aug 2019 16:36:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190822110638.GN12733@vkoul-mobl.Dlink>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
 <20190821214436.GA13936@bogus>
 <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 1/4] dt-bindings: soundwire: add slave
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22-08-19, 11:12, Srinivas Kandagatla wrote:
> 
> 
> On 21/08/2019 22:44, Rob Herring wrote:
> > On Fri, Aug 09, 2019 at 02:34:04PM +0100, Srinivas Kandagatla wrote:
> > > This patch adds bindings for Soundwire Slave devices that includes how
> > > SoundWire enumeration address and Link ID are used to represented in
> > > SoundWire slave device tree nodes.
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > >   .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
> > >   1 file changed, 51 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
> > 
> > Can you convert this to DT schema given it is a common binding.
> > 
> 
> I will give that a go in next version!
> 
> > What does the host controller look like? You need to define the node
> > hierarchy. Bus controller schemas should then include the bus schema.
> > See spi-controller.yaml.
> 
> Host controller is always parent of these devices which is represented in
> the example.
> 
> In my previous patches, i did put this slave bindings in bus.txt, but Vinod
> suggested to move it to slave.txt.
> 
> Are you suggesting to add two yamls here, one for slave and one for bus
> Or just document this in one bus bindings?

That would be fine by me :-)

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
