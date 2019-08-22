Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15D993F2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 14:38:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D27167E;
	Thu, 22 Aug 2019 14:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D27167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566477518;
	bh=30+tRvDjSZLgsr++1EkD0cFdHXOzHX4YHlUNqKA4dtw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikSY8OVGBD8C6G4+akm9LBfOEPaBVhkV0JbdNw1KrUNicIl2s2LaQK0IhFbnIuJTP
	 ZXDVNsQ6UAbMI3koMz0XDTbKZ7RPqCaNBwzv/28CC35EeSXUNg9RyOVL+ZltsqZRMu
	 lisEblcuttl6E4LQiLk1TRPvWYDTxP7oM0J3yPKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE99F8036E;
	Thu, 22 Aug 2019 14:36:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA5EF8036E; Thu, 22 Aug 2019 14:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71775F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 14:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71775F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g2mTxzcL"
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57BF023404
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566477404;
 bh=ga6b31QBXofW14aPOhrj0afNHMcSfr0f4f2qhLAjSZY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g2mTxzcL+6XNgmErJ9kMiY3PPEq2ZMtzru9TPrxdGUohnxDtsE67ZneTZy0eck/yq
 zq1pp4KgfNUEfjwQMBfukukqpXmKK0kpFiXpL5ce206wKBkz0Ni4/t+a2esWyiRcst
 iUUIKkppW4adHUGQ02tZ0ogfNItNFHsOBVSWDgIA=
Received: by mail-qk1-f170.google.com with SMTP id d23so4949002qko.3
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 05:36:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVtKcq5SqFqDTDmUzdKBhgQskZMobg7qAIsYnYMhgiEEHy67hL7
 c4dsKyf+Ar4CVHzcLTEZBh07fTmtRticD4uHmw==
X-Google-Smtp-Source: APXvYqw9D+dMZT14AHbYvh+UEVNMDJoszz23u/BEVj7KMPjMnlla91PDTwHFIvTe4a0csE3FYX96NJVL1APNKz9t2Y4=
X-Received: by 2002:a37:4941:: with SMTP id w62mr3483805qka.119.1566477403498; 
 Thu, 22 Aug 2019 05:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
 <20190821214436.GA13936@bogus>
 <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
In-Reply-To: <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Aug 2019 07:36:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
Message-ID: <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, Aug 22, 2019 at 5:12 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 21/08/2019 22:44, Rob Herring wrote:
> > On Fri, Aug 09, 2019 at 02:34:04PM +0100, Srinivas Kandagatla wrote:
> >> This patch adds bindings for Soundwire Slave devices that includes how
> >> SoundWire enumeration address and Link ID are used to represented in
> >> SoundWire slave device tree nodes.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
> >>   1 file changed, 51 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
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
> Host controller is always parent of these devices which is represented
> in the example.
>
> In my previous patches, i did put this slave bindings in bus.txt, but
> Vinod suggested to move it to slave.txt.
>
> Are you suggesting to add two yamls here, one for slave and one for bus
> Or just document this in one bus bindings?

One. Like I said, see spi-controller.yaml.

> >> diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
> >> new file mode 100644
> >> index 000000000000..201f65d2fafa
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soundwire/slave.txt
> >> @@ -0,0 +1,51 @@
> >> +SoundWire slave device bindings.
> >> +
> >> +SoundWire is a 2-pin multi-drop interface with data and clock line.
> >> +It facilitates development of low cost, efficient, high performance systems.
> >> +
> >> +SoundWire slave devices:
> >> +Every SoundWire controller node can contain zero or more child nodes
> >> +representing slave devices on the bus. Every SoundWire slave device is
> >> +uniquely determined by the enumeration address containing 5 fields:
> >> +SoundWire Version, Instance ID, Manufacturer ID, Part ID
> >> +and Class ID for a device. Addition to below required properties,
> >> +child nodes can have device specific bindings.
> >> +
> >> +Required properties:
> >> +- compatible:        "sdw<LinkID><VersionID><InstanceID><MFD><PID><CID>".
> >> +              Is the textual representation of SoundWire Enumeration
> >> +              address along with Link ID. compatible string should contain
> >> +              SoundWire Link ID, SoundWire Version ID, Instance ID,
> >> +              Manufacturer ID, Part ID and Class ID in order
> >> +              represented as above and shall be in lower-case hexadecimal
> >> +              with leading zeroes. Vaild sizes of these fields are
> >> +              LinkID is 1 nibble,
> >> +              Version ID is 1 nibble
> >> +              Instance ID in 1 nibble
> >> +              MFD in 4 nibbles
> >> +              PID in 4 nibbles
> >> +              CID is 2 nibbles
> >> +
> >> +              Version number '0x1' represents SoundWire 1.0
> >> +              Version number '0x2' represents SoundWire 1.1
> >
> > This can all be a regex.
> >
> >> +              ex: "sdw0110217201000" represents 0 LinkID,
> >> +              SoundWire 1.0 version slave with Instance ID 1.
> >> +              More Information on detail of encoding of these fields can be
> >> +              found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
> >> +
> >> +SoundWire example for Qualcomm's SoundWire controller:
> >> +
> >> +soundwire@c2d0000 {
> >> +    compatible = "qcom,soundwire-v1.5.0"
> >> +    reg = <0x0c2d0000 0x2000>;
> >> +
> >> +    spkr_left:wsa8810-left{
> >> +            compatible = "sdw0110217201000";
> >> +            ...
> >> +    };
> >> +
> >> +    spkr_right:wsa8810-right{
> >> +            compatible = "sdw0120217201000";
> >
> > The normal way to distinguish instances is with 'reg'. So I think you
> > need 'reg' with Instance ID moved there at least. Just guessing, but
> > perhaps Link ID, too? And for 2 different classes of device is that
> > enough?
>
> In previous bindings ( https://lists.gt.net/linux/kernel/3403276 ) we
> did have instance-id as different property, however Pierre had some good
> suggestion to make it align with _ADR encoding as per MIPI DisCo spec.
>
> Do you still think that we should split the instance id to reg property?

Assuming you could have more than 1 of the same device on the bus,
then you need some way to distinguish them and the way that's done for
DT is unit-address/reg. And compatible strings should be constant for
each instance.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
