Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE07A93B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 15:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46961798;
	Tue, 30 Jul 2019 15:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46961798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564492500;
	bh=KQJVAnr1Vp2KsudRoF+BjjQNxY046xIEpL9aamx5gEk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Df3aTtZy+mSfkJKGmJR+bhywjGYotBjhMsPR/EJq3mA404B0+quYXKjqddmmVTEm4
	 YYK/cwsQaTxX1wGeqn5FzJcGH8f8El5CH+QbyQ7TEIIlA0aqmR1GVQNDtyNQYAenqd
	 5QfPHEcEXRB605aFUnKqcKZ6+YyA4p+XsJucHPzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D203BF80214;
	Tue, 30 Jul 2019 15:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A074BF804CA; Tue, 30 Jul 2019 15:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EE8DF800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 15:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE8DF800AB
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1hsRvP-0000zD-03; Tue, 30 Jul 2019 15:12:19 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1hsRvF-0002oJ-SH; Tue, 30 Jul 2019 15:12:09 +0200
Date: Tue, 30 Jul 2019 15:12:09 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190730131209.rdv2kdlrpfeouh66@pengutronix.de>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-2-thomas.preston@codethink.co.uk>
 <20190730122748.GF54126@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730122748.GF54126@ediswmail.ad.cirrus.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:06:48 up 73 days, 19:24, 49 users,  load average: 0.10, 0.03, 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Duncan <rduncan@tesla.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Annaliese McDermond <nh6z@nh6z.net>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Nate Case <ncase@tesla.com>, Thomas Preston <thomas.preston@codethink.co.uk>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Glaser <pglaser@tesla.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 1/3] dt-bindings: ASoC: Add TDA7802
	amplifier
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

Hi Charles,

sorry for jumping in..

On 19-07-30 13:27, Charles Keepax wrote:
> On Tue, Jul 30, 2019 at 01:09:35PM +0100, Thomas Preston wrote:
> > Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> > Cc: Patrick Glaser <pglaser@tesla.com>
> > Cc: Rob Duncan <rduncan@tesla.com>
> > Cc: Nate Case <ncase@tesla.com>
> > ---
> >  .../devicetree/bindings/sound/tda7802.txt     | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/tda7802.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/tda7802.txt b/Documentation/devicetree/bindings/sound/tda7802.txt
> > new file mode 100644
> > index 000000000000..f80aaf4f1ba0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/tda7802.txt
> > @@ -0,0 +1,26 @@
> > +ST TDA7802 audio processor
> > +
> > +This device supports I2C only.
> > +
> > +Required properties:
> > +
> > +- compatible : "st,tda7802"
> > +- reg : the I2C address of the device
> > +- enable-supply : a regulator spec for the PLLen pin

Shouldn't that be a pin called 'pllen-gpios'? IMHO I would not use a
regulator for that.

Regards,
  Marco

> > +
> > +Optional properties:
> > +
> > +- st,gain-ch13 : gain for channels 1 and 3 (range: 1-4)
> > +- st,gain-ch24 : gain for channels 2 and 3 (range: 1-4)
> 
> I wouldn't have expected the gains to be available as a device
> tree setting.
> 
> > +- st,diagnostic-mode-ch13 : diagnotic mode for channels 1 and 3
> > +                            values: "Speaker" (default), "Booster"
> > +- st,diagnostic-mode-ch24 : diagnotic mode for channels 2 and 4
> > +                            values: "Speaker" (default), "Booster"
> > +
> > +Example:
> > +
> > +amp: tda7802@6c {
> > +	compatible = "st,tda7802";
> > +	reg = <0x6c>;
> > +	enable-supply = <&amp_enable_reg>;
> > +};
> > -- 
> > 2.21.0
> > 
> 
> Thanks,
> Charles
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
