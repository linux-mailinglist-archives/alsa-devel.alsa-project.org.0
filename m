Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4D5CCEA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 11:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F77168C;
	Tue,  2 Jul 2019 11:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F77168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562061011;
	bh=bEu4wyJyN/jAX+ndYSnXGO1lLkYHfpJdioJow15JdJw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FyivSyuoaPzLBsgZ8I7K7aekV+IoqeP+XUwxPpnGEgtMZJdVnqF6+HtHeIKWDSVok
	 hnqeqGDlrabGTz8l3DT1nFoN4+ZYcko7sNi5+m61WYgVSqzvceCwofMaSqm2vnRMHo
	 AWDOJIxfQhycFhBnlATac/BpSXLHts4AtfJDrK50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C985F800C7;
	Tue,  2 Jul 2019 11:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 713FAF800C9; Tue,  2 Jul 2019 11:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B70F9F800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 11:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B70F9F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zmvf+OAf"
Received: from localhost (unknown [49.207.58.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B151B206A2;
 Tue,  2 Jul 2019 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562060899;
 bh=1oN3fEDcJOO5WpXrtBAr0DvSdkhuKsbY+w9ryKcRLn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zmvf+OAfp3I0frwxgqCBlrfZzDVexs63/Uqe49HhJX70Bk7JuVZ3AxTGrKAAWNeU9
 1sn66P+Cyd3A5i0tUo3QmGPiA5tEKJuIPjIvrIluHZ99OBdDsHH+nhK70q/jS3p8yy
 v4BABf0TJvVWysjG8FGsUlWWproq+PylMFlvkDJw=
Date: Tue, 2 Jul 2019 15:15:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190702094510.GO2911@vkoul-mobl>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
 <20190611104043.22181-2-srinivas.kandagatla@linaro.org>
 <20190701061155.GJ2911@vkoul-mobl>
 <ce1e445e-3254-1308-8752-2cb56a7e0cc6@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce1e445e-3254-1308-8752-2cb56a7e0cc6@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bgoswami@quicinc.com
Subject: Re: [alsa-devel] [RFC PATCH 1/5] dt-bindings: soundwire: add slave
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

On 02-07-19, 09:22, Srinivas Kandagatla wrote:
> Thanks Vinod for taking time to review,
> 
> On 01/07/2019 07:11, Vinod Koul wrote:
> > On 11-06-19, 11:40, Srinivas Kandagatla wrote:
> > > This patch adds bindings for Soundwire Slave devices which includes how
> > > SoundWire enumeration address is represented in SoundWire slave device
> > > tree nodes.
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > >   .../devicetree/bindings/soundwire/bus.txt     | 48 +++++++++++++++++++
> > >   1 file changed, 48 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/soundwire/bus.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soundwire/bus.txt b/Documentation/devicetree/bindings/soundwire/bus.txt
> > > new file mode 100644
> > > index 000000000000..19a672b0d528
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soundwire/bus.txt
> > 
> > The bindings are for slave right and the file is bus.txt?
> 
> I tried to follow what I have done for SLIMBus.
> Do you prefer them to be documented in slave.txt?

Would that not be better :) We should have a master.txt for bus things

> > > @@ -0,0 +1,48 @@
> > > +SoundWire bus bindings.
> > > +
> > > +SoundWire is a 2-pin multi-drop interface with data and clock line.
> > > +It facilitates development of low cost, efficient, high performance systems.
> > > +
> > > +SoundWire controller bindings are very much specific to vendor.
> > > +
> > > +Child nodes(SLAVE devices):
> > > +Every SoundWire controller node can contain zero or more child nodes
> > > +representing slave devices on the bus. Every SoundWire slave device is
> > > +uniquely determined by the enumeration address containing 5 fields:
> > > +SoundWire Version, Instance ID, Manufacturer ID, Part ID and Class ID
> > > +for a device. Addition to below required properties, child nodes can
> > > +have device specific bindings.
> > > +
> > > +Required property for SoundWire child node if it is present:
> > > +- compatible:	 "sdwVER,MFD,PID,CID". The textual representation of
> > > +		  SoundWire Enumeration address comprising SoundWire
> > > +		  Version, Manufacturer ID, Part ID and Class ID,
> > > +		  shall be in lower-case hexadecimal with leading
> > > +		  zeroes suppressed.
> > > +		  Version number '0x10' represents SoundWire 1.0
> > > +		  Version number '0x11' represents SoundWire 1.1
> > > +		  ex: "sdw10,0217,2010,0"
> > 
> > any reason why we want to code version number and not say sdw,1.0,...
> > and so on?
> 
> For consistency reasons, as other info in hex.
> 
> > 
> > > +
> > > +- sdw-instance-id: Should be ('Instance ID') from SoundWire
> > > +		  Enumeration Address. Instance ID is for the cases
> > > +		  where multiple Devices of the same type or Class
> > > +		  are attached to the bus.
> > 
> > instance id is part of the 48bit device id, so wont it make sense to add
> > that to compatible as well?
> > 
> So we could have multiple instance of same IP, so adding this to compatible
> string does not make sense! As driver has to list all the possible
> compatible strings.

Yes that makes sense.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
