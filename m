Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A799453
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 14:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B761167D;
	Thu, 22 Aug 2019 14:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B761167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566478499;
	bh=405SqGl4OnVImxWKVt2488LEhW3umRTZusGjQzoPq1U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeBHAFT3OcZfvBfpPkuCDCjEUfdnJOfmvUsxGXfej65mOIt49hxCenHadTOtGEhMF
	 6J8MWqE+GpJtwKY5hthCWFJOqg1rhBnWBDwwjFU49gVwU0aWFb8BzZrxjXHyLVzxjA
	 Zi76ywrJ01x2i8Q2cw31xCRytYCH0EGrMehO/NFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3812EF805F8;
	Thu, 22 Aug 2019 14:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 176A2F805F5; Thu, 22 Aug 2019 14:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 189C1F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 14:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 189C1F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ExFlLSbY"
Received: from localhost (unknown [171.61.89.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2891C2089E;
 Thu, 22 Aug 2019 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566478378;
 bh=+LmgaaxC2q4cxo4sEZL7ZYhCTTPgbmk76IWMitzQV7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ExFlLSbYtm/2Llz1BRoI92FThaGkZH2k+tlxLgAIVzZKvlRuovRg8nUyOkBREh5Oi
 dl1qW/GikXIQJenVO6JiXLZq90qVM/NhwFK/GYaTIzM8zOAKH/vBekoIi7G8wITIe7
 3h/zMO1pb4zF7dtYSqo2+lMDJYzjLUDSqFbb9s+E=
Date: Thu, 22 Aug 2019 18:21:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20190822125145.GO12733@vkoul-mobl.Dlink>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
 <20190821214436.GA13936@bogus>
 <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
 <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 22-08-19, 07:36, Rob Herring wrote:
> On Thu, Aug 22, 2019 at 5:12 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> >
> >
> >
> > On 21/08/2019 22:44, Rob Herring wrote:
> > > On Fri, Aug 09, 2019 at 02:34:04PM +0100, Srinivas Kandagatla wrote:
> > >> This patch adds bindings for Soundwire Slave devices that includes how
> > >> SoundWire enumeration address and Link ID are used to represented in
> > >> SoundWire slave device tree nodes.
> > >>
> > >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > >> ---
> > >>   .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
> > >>   1 file changed, 51 insertions(+)
> > >>   create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
> > >
> > > Can you convert this to DT schema given it is a common binding.
> > >
> >
> > I will give that a go in next version!
> >
> > > What does the host controller look like? You need to define the node
> > > hierarchy. Bus controller schemas should then include the bus schema.
> > > See spi-controller.yaml.
> >
> > Host controller is always parent of these devices which is represented
> > in the example.
> >
> > In my previous patches, i did put this slave bindings in bus.txt, but
> > Vinod suggested to move it to slave.txt.
> >
> > Are you suggesting to add two yamls here, one for slave and one for bus
> > Or just document this in one bus bindings?
> 
> One. Like I said, see spi-controller.yaml.
> 
> > >> diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
> > >> new file mode 100644
> > >> index 000000000000..201f65d2fafa
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/soundwire/slave.txt
> > >> @@ -0,0 +1,51 @@
> > >> +SoundWire slave device bindings.
> > >> +
> > >> +SoundWire is a 2-pin multi-drop interface with data and clock line.
> > >> +It facilitates development of low cost, efficient, high performance systems.
> > >> +
> > >> +SoundWire slave devices:
> > >> +Every SoundWire controller node can contain zero or more child nodes
> > >> +representing slave devices on the bus. Every SoundWire slave device is
> > >> +uniquely determined by the enumeration address containing 5 fields:
> > >> +SoundWire Version, Instance ID, Manufacturer ID, Part ID
> > >> +and Class ID for a device. Addition to below required properties,
> > >> +child nodes can have device specific bindings.
> > >> +
> > >> +Required properties:
> > >> +- compatible:        "sdw<LinkID><VersionID><InstanceID><MFD><PID><CID>".
> > >> +              Is the textual representation of SoundWire Enumeration
> > >> +              address along with Link ID. compatible string should contain
> > >> +              SoundWire Link ID, SoundWire Version ID, Instance ID,
> > >> +              Manufacturer ID, Part ID and Class ID in order
> > >> +              represented as above and shall be in lower-case hexadecimal
> > >> +              with leading zeroes. Vaild sizes of these fields are
> > >> +              LinkID is 1 nibble,
> > >> +              Version ID is 1 nibble
> > >> +              Instance ID in 1 nibble
> > >> +              MFD in 4 nibbles
> > >> +              PID in 4 nibbles
> > >> +              CID is 2 nibbles
> > >> +
> > >> +              Version number '0x1' represents SoundWire 1.0
> > >> +              Version number '0x2' represents SoundWire 1.1
> > >
> > > This can all be a regex.
> > >
> > >> +              ex: "sdw0110217201000" represents 0 LinkID,
> > >> +              SoundWire 1.0 version slave with Instance ID 1.
> > >> +              More Information on detail of encoding of these fields can be
> > >> +              found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
> > >> +
> > >> +SoundWire example for Qualcomm's SoundWire controller:
> > >> +
> > >> +soundwire@c2d0000 {
> > >> +    compatible = "qcom,soundwire-v1.5.0"
> > >> +    reg = <0x0c2d0000 0x2000>;
> > >> +
> > >> +    spkr_left:wsa8810-left{
> > >> +            compatible = "sdw0110217201000";
> > >> +            ...
> > >> +    };
> > >> +
> > >> +    spkr_right:wsa8810-right{
> > >> +            compatible = "sdw0120217201000";
> > >
> > > The normal way to distinguish instances is with 'reg'. So I think you
> > > need 'reg' with Instance ID moved there at least. Just guessing, but
> > > perhaps Link ID, too? And for 2 different classes of device is that
> > > enough?
> >
> > In previous bindings ( https://lists.gt.net/linux/kernel/3403276 ) we
> > did have instance-id as different property, however Pierre had some good
> > suggestion to make it align with _ADR encoding as per MIPI DisCo spec.
> >
> > Do you still think that we should split the instance id to reg property?
> 
> Assuming you could have more than 1 of the same device on the bus,
> then you need some way to distinguish them and the way that's done for
> DT is unit-address/reg. And compatible strings should be constant for
> each instance.

That does make sense, we can use unit-address/reg as instance id.

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
