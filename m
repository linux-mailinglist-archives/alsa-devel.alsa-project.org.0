Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D636EA4B0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 09:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4145FE7C;
	Fri, 21 Apr 2023 09:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4145FE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682062073;
	bh=trsQQsEmYFHY/iqOGhC7yk59ZqL8L7utQv2lQHcIT6w=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=HgJPlZNet4PthilSowIGTMB2o6sx4kGkQsAf2hrOwswDusu0EEmakY5/Lvs9slpie
	 Tao7gQWSxkcZtU5vrSZva5iXyBiruA90SZJDa8zpVUm3+r18wnqPBbAxNprEfnFjPG
	 YY3wka2+sIKNl47VMZ0taYe91JVTW3XlgHIR6Xms=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B578DF80149;
	Fri, 21 Apr 2023 09:27:02 +0200 (CEST)
Date: Fri, 21 Apr 2023 09:26:45 +0200
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <20230420134703.GC996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
	<20230417171601.74656-4-herve.codina@bootlin.com>
	<20230420123946.GB996918@google.com>
	<20230420151551.78c1288b@bootlin.com>
	<20230420134703.GC996918@google.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7EKH2XQCSYI7NJTJARROZTW33BXSALN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168206202126.26.2183994442767449652@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57DF8F80155; Fri, 21 Apr 2023 09:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91E1AF800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 09:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E1AF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WIxsnrcB
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A6C22000F;
	Fri, 21 Apr 2023 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682062007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rg7mAqWYm80zziSBLUX+QJbAH6dTgm61KDeO9JG0CbU=;
	b=WIxsnrcBlhc9LsM3u1yFOmR9oM19m7i3CMb6shmBvGggsaVHgJnCVF8YbOfNLJs4Drj7dI
	Gnk4+aexGNF6tVsushn80roLXBUgjed/c4CQRPqkNYNY1tz7emmr9KyuJGq1XaIg34OMoG
	CigzyYfobZpKMu//UHsn/R7MgA6hlwrtdLY6Ns2VfxK+kP8pN5N0a7knbl3aCDkMEy+afA
	BbmDPWjJ6u88w+4xtx+ztmKh/sx88ytClv9s4IiBhB6Y0NmiscKObKuQ8oyEfpr8nl0rUJ
	o7Wle9mu+0sEEs2FmyRmRPbD1rN14crmFQbc9rgRxn5dDIAhkzjkBk9o5SqfXQ==
Date: Fri, 21 Apr 2023 09:26:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230421092645.56127f11@bootlin.com>
In-Reply-To: <20230420134703.GC996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
	<20230417171601.74656-4-herve.codina@bootlin.com>
	<20230420123946.GB996918@google.com>
	<20230420151551.78c1288b@bootlin.com>
	<20230420134703.GC996918@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K7EKH2XQCSYI7NJTJARROZTW33BXSALN
X-Message-ID-Hash: K7EKH2XQCSYI7NJTJARROZTW33BXSALN
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7EKH2XQCSYI7NJTJARROZTW33BXSALN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lee, Krzysztof,

On Thu, 20 Apr 2023 14:47:03 +0100
Lee Jones <lee@kernel.org> wrote:

> On Thu, 20 Apr 2023, Herve Codina wrote:
> 
> > On Thu, 20 Apr 2023 13:39:46 +0100
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > On Mon, 17 Apr 2023, Herve Codina wrote:
> > >   
> > > > The Lantiq PEF2256 is a framer and line interface component designed to
> > > > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > > > digital PCM system highway/H.100 bus.
> > > > 
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > ---
> > > >  drivers/mfd/Kconfig         |  16 +
> > > >  drivers/mfd/Makefile        |   1 +
> > > >  drivers/mfd/pef2256-regs.h  | 250 ++++++++++
> > > >  drivers/mfd/pef2256.c       | 950 ++++++++++++++++++++++++++++++++++++    
> > > 
> > > 95% of this driver needs to be moved somewhere else.
> > > 
> > > What is a Framer?  Perhaps sound/ is a good candidate?  
> > 
> > The pef2256 framer is a device that transfers data to/from a TDM (time-slots
> > data) from/to quite old telecommunication lines (E1 in my case).
> > Several subsystem can set/get data to/from the TDM. Each device using their
> > own time-slots set.
> > 
> > On my use-case, I have some audio consumer and a not yet upstreamed HDLC
> > consumer. Both of them uses the framer to know the E1 link state.
> > The framer needs to be initialized 'globally' and not by a specific consumer
> > as several consumers can use the framer.  
> 
> I can't think of a good place for this.
> 
> If all else fails, it's drivers/misc
> 
> > > >  include/linux/mfd/pef2256.h |  52 ++
> > > >  5 files changed, 1269 insertions(+)
> > > >  create mode 100644 drivers/mfd/pef2256-regs.h
> > > >  create mode 100644 drivers/mfd/pef2256.c
> > > >  create mode 100644 include/linux/mfd/pef2256.h    
> > > 
> > > [...]
> > >   
> > > > +static int pef2256_add_audio_devices(struct pef2256 *pef2256)
> > > > +{
> > > > +	const char *compatible = "lantiq,pef2256-codec";
> > > > +	struct mfd_cell *audio_devs;
> > > > +	struct device_node *np;
> > > > +	unsigned int count = 0;
> > > > +	unsigned int i;
> > > > +	int ret;
> > > > +
> > > > +	for_each_available_child_of_node(pef2256->dev->of_node, np) {
> > > > +		if (of_device_is_compatible(np, compatible))
> > > > +			count++;
> > > > +	}    
> > > 
> > > Converting Device Tree nodes into MFD cells to register with the
> > > Platform Device API is not a reasonable use-case of MFD.
> > > 
> > > Have the CODEC driver match on "lantiq,pef2256-codec" and let it
> > > instantiate itself.  
> > 
> > As the framer is going to used by several subsystem, I cannot instantiate
> > it in the specific ASoC subsystem.
> >   
> > > 
> > > Your first version using of_platform_populate() was closer to the mark.  
> > 
> > The issue was that I need MFD cells for the pinctrl part.  
> 
> Why can't it be represented in DT?

The pinctrl part has no specific compatible string.
Not sure that a compatible string for pinctrl can be accepted
as there is only one pinctrl subnode and no specific reg for this
subnode.

The DT looks like this:
    framer@2000000 {
      compatible = "lantiq,pef2256";
      reg = <0x2000000 0x100>;
      ...
      pinctrl {
        pef2256_rpa_sypr: rpa-pins {
          pins = "RPA";
          function = "SYPR";
        };
      };

      pef2256_codec0: codec-0 {
        compatible = "lantiq,pef2256-codec";
        #sound-dai-cells = <0>;
        sound-name-prefix = "PEF2256_0";
      };
    };

Krzysztof, is it acceptable to have a compatible string in the pinctrl node ?
In this case, it will looks like this:
    framer@2000000 {
      compatible = "lantiq,pef2256";
      reg = <0x2000000 0x100>;
      ...
      pinctrl {
        compatible = "lantiq,pef2256-pinctrl";
        pef2256_rpa_sypr: rpa-pins {
          pins = "RPA";
          function = "SYPR";
        };
      };

      pef2256_codec0: codec-0 {
        compatible = "lantiq,pef2256-codec";
        #sound-dai-cells = <0>;
        sound-name-prefix = "PEF2256_0";
      };
    };

Best regards,
Hervé
