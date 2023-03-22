Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9C6C4B54
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 14:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BDCBE84;
	Wed, 22 Mar 2023 14:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BDCBE84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679490628;
	bh=TBdGtQ54byUD9JnpnLF1IHWZzgwVmaaUiTmEaB17BNY=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FDf64ZXoGXPN4qgdM+A21blQI9ZODb+IAxrkaHZ+QyoMCh2jKvI39iEE4ax79xwTT
	 v0DHNNc5kCykkmSpf0ewXXUZVfNq4djbyHKF812KtTHC5kbwuw+PxeJKIPDHTLwtAM
	 ccH8cuZOX4/gSIIWfQeNZ1PoUhaqsHxsWeiJ+BoA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E4AF80482;
	Wed, 22 Mar 2023 14:09:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2534F8027B; Wed, 22 Mar 2023 14:09:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF057F80105;
	Wed, 22 Mar 2023 14:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF057F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GSMN++aL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C33B620F5;
	Wed, 22 Mar 2023 13:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082D5C433A4;
	Wed, 22 Mar 2023 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679490567;
	bh=TBdGtQ54byUD9JnpnLF1IHWZzgwVmaaUiTmEaB17BNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GSMN++aLmdcyrK2u1+dw3CaK/7KYUnyl+TnsA5Ie3Ho3bJ5LzwUFD+QY74PVbc8Do
	 aQBr8wgQz1ODhmEnIIjcccHJU9XpWqGrFOez2DfE/UuySeZJtaNGqoIFC6njWt7ukQ
	 tbkKwrYHQLOxV9GEkg8rIhT6ev4FNJ7u5jc6eI6gABSoRU9R+LsonyBZsD+Ms2qtzd
	 ULVusf9VwukWXXTZdxo5OmUWjED5ypHYty17lmpXmX14I11x16wYyKv8zU96dQIVOF
	 8Wx+TCN8VV8C1G5oCHz6aKS+xSVBqy01jT4kqht/qh254RJ0FjKejWr0dz/A/o5MvA
	 2G/+x3H7Y2LQw==
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5419d4c340aso337168817b3.11;
        Wed, 22 Mar 2023 06:09:26 -0700 (PDT)
X-Gm-Message-State: AAQBX9c72cXujSL8H9L9vd/UqRwv9DKHwzEqqxqzHElhs2XYEFX2X6yP
	plvTJTsTl2JOGU1PEqy8nKvanSynX0v/ENY/jQ==
X-Google-Smtp-Source: 
 AKy350Y7Te5CDRYMafjYeQhsKhCMmgull6VM9Zg3abMGLl1BV+ZjwcQhB/MCo7DW7c1AwmhZchmiOeZYp/sMRLkWwsg=
X-Received: by 2002:a81:7e4a:0:b0:533:99bb:c296 with SMTP id
 p10-20020a817e4a000000b0053399bbc296mr3060086ywn.5.1679490565967; Wed, 22 Mar
 2023 06:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-2-herve.codina@bootlin.com>
 <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
 <167930560089.26.8624952010101991814@mailman-core.alsa-project.org>
 <20230320185127.GA2233912-robh@kernel.org>
 <20230322112056.7ffcd503@bootlin.com>
 <CAL_JsqK-=9BJEbEUji0ac=cXqBz3ijD5m33MBPyms-9O44gvag@mail.gmail.com>
In-Reply-To: 
 <CAL_JsqK-=9BJEbEUji0ac=cXqBz3ijD5m33MBPyms-9O44gvag@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Mar 2023 08:09:15 -0500
X-Gmail-Original-Message-ID: 
 <CAL_JsqJD+sCFG_QeBo5xP7+K608=GmpJu+qbEaaZPKwMin99ng@mail.gmail.com>
Message-ID: 
 <CAL_JsqJD+sCFG_QeBo5xP7+K608=GmpJu+qbEaaZPKwMin99ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq PEF2466 E1/T1/J1
 framer
To: Herve Codina <herve.codina@bootlin.com>, alsa-devel-owner@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: U5SVN4O3R3ZQECSD6EPMXU66E53776UL
X-Message-ID-Hash: U5SVN4O3R3ZQECSD6EPMXU66E53776UL
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5SVN4O3R3ZQECSD6EPMXU66E53776UL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 22, 2023 at 7:56=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Mar 22, 2023 at 5:21=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > Hi Rob,
> >
> > On Mon, 20 Mar 2023 13:51:27 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >
> > > On Mon, Mar 20, 2023 at 10:46:19AM +0100, Herve Codina via Alsa-devel=
 wrote:
> > > > Received: by alsa1.perex.cz (Postfix, from userid 50401) id 16494F8=
027B;
> > > >  Mon, 20 Mar 2023 10:46:37 +0100 (CET)
> > > > X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.pe=
rex.cz
> > > > X-Spam-Level:
> > > > X-Spam-Status: No, score=3D-5.2 required=3D5.0 tests=3DDKIM_SIGNED,=
DKIM_VALID,
> > > >  DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PAS=
S,
> > > >  URIBL_BLOCKED shortcircuit=3Dno autolearn=3Dham autolearn_force=3D=
no
> > > >  version=3D3.4.6
> > > > Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
> > > >  [217.70.183.198]) (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384
> > > >  (256/256 bits)) (No client certificate requested) by alsa1.perex.c=
z
> > > >  (Postfix) with ESMTPS id 3FF5FF80105 for <alsa-devel@alsa-project.=
org>;
> > > >  Mon, 20 Mar 2023 10:46:22 +0100 (CET)
> > > > DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF5FF80105
> > > > Authentication-Results: alsa1.perex.cz; dkim=3Dpass (2048-bit key,
> > > >  unprotected) header.d=3Dbootlin.com header.i=3D@bootlin.com
> > > >  header.a=3Drsa-sha256 header.s=3Dgm1 header.b=3Dm4O7nLC1
> > > > Received: (Authenticated sender: herve.codina@bootlin.com) by
> > > >  mail.gandi.net (Postfix) with ESMTPSA id 40453C0009; Mon, 20 Mar 2=
023
> > > >  09:46:20 +0000 (UTC)
> > > > DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dboo=
tlin.com; s=3Dgm1;
> > > >  t=3D1679305582;
> > > >  h=3Dfrom:from:reply-to:subject:subject:date:date:message-id:messag=
e-id:
> > > >   to:to:cc:cc:mime-version:mime-version:content-type:content-type:
> > > >   content-transfer-encoding:content-transfer-encoding:
> > > >   in-reply-to:in-reply-to:references:references;
> > > >  bh=3DIeu9Fv38se4lD4z/BVXUHLrVJL9Tx5iKWZgvO8X+VoY=3D;
> > > >  b=3Dm4O7nLC1LPZDOI5eM/hmgqouxdkin2veA6CvJhT9kU9rGQALB3ya2fuybMfDvr=
kTqqBjEd
> > > >  j6DAxXMgOKgwuUfEsZsp3BFJpoii00hSaf0r2uIbnnGcUrDGVQqUQVEqv51O6VBqnr=
ViQk
> > > >  PstlJM0lcE9R/AFASd5D/HQGoYYyRY+NKT7xt8g1Ax23Yk/tUG59LXku/skn/4faSL=
odnU
> > > >  vV2ng3VMUcoLuvSMJtdYY3hrXEWqUrW1ZogxAFHJNiKuyOELmqZGmNo4B4yAFOEcqq=
yano
> > > >  /f4m/7BtT7X1wwPvGu29gg+0aOFrGQq5kb4UNrMoriSQyKnxPRha8zL3J2Jckw=3D=
=3D
> > > > Date: Mon, 20 Mar 2023 10:46:19 +0100
> > > > From: Herve Codina <herve.codina@bootlin.com>
> > > > To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Subject: Re: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq PEF24=
66
> > > >  E1/T1/J1 framer
> > > > Message-ID: <20230320104619.468a304b@bootlin.com>
> > > > In-Reply-To: <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
> > > > References: <20230316122741.577663-1-herve.codina@bootlin.com>
> > > >  <20230316122741.577663-2-herve.codina@bootlin.com>
> > > >  <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
> > > > Organization: Bootlin
> > > > X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
> > > > MIME-Version: 1.0
> > > > Content-Type: text/plain; charset=3DUTF-8
> > > > Content-Transfer-Encoding: quoted-printable
> > > > Message-ID-Hash: AJZF4VHU24ASVVBCPRMLJCDG4ZDX55LB
> > > > X-Message-ID-Hash: AJZF4VHU24ASVVBCPRMLJCDG4ZDX55LB
> > > > X-MailFrom: herve.codina@bootlin.com
> > > > X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emer=
gency;
> > > >  loop; banned-address; member-moderation;
> > > >  header-match-alsa-devel.alsa-project.org-0;
> > > >  header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
> > > >  administrivia; implicit-dest; max-recipients; max-size; news-moder=
ation;
> > > >  no-subject; digests; suspicious-header
> > > > CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
> > > >  <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmai=
l.com>,
> > > >  Mark Brown <broonie@kernel.org>, Derek Kiernan <derek.kiernan@xili=
nx.com>,
> > > >  Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arnd=
b.de>,
> > > >  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai
> > > >  <tiwai@suse.com>, linux-kernel@vger.kernel.org,
> > > >  devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Christoph=
e Leroy
> > > >  <christophe.leroy@csgroup.eu>, Thomas Petazzoni
> > > >  <thomas.petazzoni@bootlin.com>
> > > > X-Mailman-Version: 3.3.8
> > > > Precedence: list
> > > > List-Id: "Alsa-devel mailing list for ALSA developers -
> > > >  http://www.alsa-project.org" <alsa-devel.alsa-project.org>
> > > > Archived-At: <https://mailman.alsa-project.org/hyperkitty/list/alsa=
-devel@alsa-project.org/message/AJZF4VHU24ASVVBCPRMLJCDG4ZDX55LB/>
> > > > List-Archive: <https://mailman.alsa-project.org/hyperkitty/list/als=
a-devel@alsa-project.org/>
> > > > List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=3Dhe=
lp>
> > > > List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
> > > > List-Post: <mailto:alsa-devel@alsa-project.org>
> > > > List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
> > > > List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
> > >
> > > The alsa-devel list doesn't seem to like your emails. The archives
> > > (lore) has 2 copies with the 2nd having the original headers in the
> > > body. I'm seeing this recently on other senders too. Best I can tell =
is
> > > you sent this as quoted-printable.
> > >
> > > Rob
> >
> > I don't known what happened with alsa-devel list.
> >
> > For this answer, I tried to force '8bit' encoding instead of quoted-pri=
ntable.
> > Let me know if it is better.
>
> Nope, still the same issue:
>
> https://lore.kernel.org/all/167948048307.26.16805930109507404147@mailman-=
core.alsa-project.org/
>
> I added the alsa-devel owner. Maybe they know what's happening.

Here's the answer:

https://lore.kernel.org/alsa-devel/6f003598-4cae-a521-233f-2c19eb439359@per=
ex.cz/

Something about DMARC and your domain. But some reason git-send-email
doesn't have the issue sending.

Rob
